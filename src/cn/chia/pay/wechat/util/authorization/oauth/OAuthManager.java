package cn.chia.pay.wechat.util.authorization.oauth;

import java.lang.reflect.Field;
import java.util.ArrayList;
import java.util.List;

import org.apache.http.Consts;
import org.apache.http.HttpEntity;
import org.apache.http.NameValuePair;
import org.apache.http.client.fluent.Request;
import org.apache.http.message.BasicNameValuePair;
import org.apache.http.util.EntityUtils;
import org.apache.log4j.Logger;

import cn.chia.pay.wechat.util.authorization.oauth.protool.get_access_token.GetOauthAccessTokenResponse;
import cn.chia.pay.wechat.util.authorization.oauth.protool.get_userinfo.GetUserinfoRequest;
import cn.chia.pay.wechat.util.authorization.oauth.protool.get_userinfo.GetUserinfoResponse;
import cn.chia.pay.wechat.util.authorization.oauth.protool.refresh_access_token.RefreshAccessTokenRequest;
import cn.chia.pay.wechat.util.authorization.oauth.protool.refresh_access_token.RefreshAccessTokenResponse;
import cn.chia.pay.wechat.util.authorization.oauth.protool.valid_access_token.ValidAccessTokenRequest;
import cn.chia.pay.wechat.util.authorization.oauth.protool.valid_access_token.ValidAccessTokenResponse;
import cn.chia.pay.wechat.util.authorization.token.protool.get_access_token.GetAccessTokenRequest;
import cn.chia.pay.wechat.util.authorization.token.protool.get_access_token.GetAccessTokenResponse;
import cn.chia.pay.wechat.util.common.Charsets;
import cn.chia.pay.wechat.util.common.Configure;
import cn.chia.pay.wechat.util.common.RequestCheck;

import com.alibaba.fastjson.JSONObject;

/**
 * 网页授权获取用户基本信息
 * <p>参考<a href="http://mp.weixin.qq.com/wiki/17/c0f37d5704f0b64713d5d2c37b468d75.html">开发文档</a></p>
 * 
 */
public class OAuthManager {

    private static Logger logger = Logger.getLogger(OAuthManager.class);
    
    /*
     * @descrption snsapi_base （不弹出授权页面，直接跳转，只能获取用户openid）
     */
    public static final String SCOPE_SNSAPI_BASE = "snsapi_base";
    /*
     * @description snsapi_userinfo （弹出授权页面，可通过openid拿到昵称、性别、所在地。并且，即使在未关注的情况下，只要用户授权，也能获取其信息）
     */
    public static final String SCOPE_SNSAPI_USERINFO = "snsapi_userinfo";

    /*生成OAuth重定向URI（用户同意授权，获取code）*/
    private static final String HTTPS_OPEN_WEIXIN_QQ_COM_CONNECT_OAUTH2_AUTHORIZE = "https://open.weixin.qq.com/connect/oauth2/authorize";
    /*通过code换取网页授权access_token*/
    private static final String HTTPS_API_WEIXIN_QQ_COM_SNS_OAUTH2_ACCESS_TOKEN = "https://api.weixin.qq.com/sns/oauth2/access_token";
    /*刷新access_token（如果需要）*/
    private static final String HTTPS_API_WEIXIN_QQ_COM_SNS_OAUTH2_REFRESH_TOKEN = "https://api.weixin.qq.com/sns/oauth2/refresh_token";
    /*拉取用户信息(需scope为 snsapi_userinfo)*/
    private static final String HTTPS_API_WEIXIN_QQ_COM_SNS_USERINFO = "https://api.weixin.qq.com/sns/userinfo";
    /*检验授权凭证（access_token）是否有效*/
    private static final String HTTPS_API_WEIXIN_QQ_COM_SNS_AUTH = "https://api.weixin.qq.com/sns/auth";

    /**
     * 生成OAuth重定向URI（用户同意授权，获取code）
     * <p>参考<a href="http://mp.weixin.qq.com/wiki/17/c0f37d5704f0b64713d5d2c37b468d75.html#.E7.AC.AC.E4.B8.80.E6.AD.A5.EF.BC.9A.E7.94.A8.E6.88.B7.E5.90.8C.E6.84.8F.E6.8E.88.E6.9D.83.EF.BC.8C.E8.8E.B7.E5.8F.96code">开发文档</a></p>
     *
     * @param redirectURI
     * @param scope
     * @param state
     * @return
     */
    public static String generateRedirectURI(String redirectURI, String scope, String state) {
        StringBuffer url = new StringBuffer();
        url.append(HTTPS_OPEN_WEIXIN_QQ_COM_CONNECT_OAUTH2_AUTHORIZE);
        url.append("?appid=").append(Charsets.urlEncode(Configure.getInstance().getAppId()));
        url.append("&redirect_uri=").append(Charsets.urlEncode(redirectURI));
        url.append("&response_type=code");
        url.append("&scope=").append(Charsets.urlEncode(scope));
        url.append("&state=").append(Charsets.urlEncode(state));
        url.append("#wechat_redirect");
        return url.toString();
    }

    /**
     * 通过code换取网页授权access_token
     * <p>参考<a href="http://mp.weixin.qq.com/wiki/17/c0f37d5704f0b64713d5d2c37b468d75.html#.E7.AC.AC.E4.BA.8C.E6.AD.A5.EF.BC.9A.E9.80.9A.E8.BF.87code.E6.8D.A2.E5.8F.96.E7.BD.91.E9.A1.B5.E6.8E.88.E6.9D.83access_token">开发文档</a></p>
     *
     * @param request
     * @return
     */
    public static GetOauthAccessTokenResponse getOauthAccessToken(cn.chia.pay.wechat.util.authorization.oauth.protool.get_access_token.GetOauthAccessTokenRequest request) {
        String response = post(HTTPS_API_WEIXIN_QQ_COM_SNS_OAUTH2_ACCESS_TOKEN, request);
        RequestCheck.isSuccess(response,GetAccessTokenResponse.class,"GetOauthAccessTokenResponse()");
        return JSONObject.parseObject(response, GetOauthAccessTokenResponse.class);
    }

    /**
     * 刷新access_token（如果需要）
     * <p>参考<a href="http://mp.weixin.qq.com/wiki/17/c0f37d5704f0b64713d5d2c37b468d75.html#.E7.AC.AC.E4.B8.89.E6.AD.A5.EF.BC.9A.E5.88.B7.E6.96.B0access_token.EF.BC.88.E5.A6.82.E6.9E.9C.E9.9C.80.E8.A6.81.EF.BC.89">开发文档</a></p>
     *
     * @param request
     * @return
     */
    public static RefreshAccessTokenResponse refreshAccessToken(RefreshAccessTokenRequest request) {
        String response = post(HTTPS_API_WEIXIN_QQ_COM_SNS_OAUTH2_REFRESH_TOKEN, request);
        RequestCheck.isSuccess(response,RefreshAccessTokenResponse.class,"RereshAccessTokenResponse()");
        return JSONObject.parseObject(response, RefreshAccessTokenResponse.class);
    }

    /**
     * 拉取用户信息(需scope为 snsapi_userinfo)
     * <p>参考<a href="http://mp.weixin.qq.com/wiki/17/c0f37d5704f0b64713d5d2c37b468d75.html#.E7.AC.AC.E5.9B.9B.E6.AD.A5.EF.BC.9A.E6.8B.89.E5.8F.96.E7.94.A8.E6.88.B7.E4.BF.A1.E6.81.AF.28.E9.9C.80scope.E4.B8.BA_snsapi_userinfo.29">开发文档</a></p>
     *
     * @param request
     * @return
     */
    public static GetUserinfoResponse getUserinfo(GetUserinfoRequest request) {
        String response = post(HTTPS_API_WEIXIN_QQ_COM_SNS_USERINFO, request);
        RequestCheck.isSuccess(response,GetUserinfoResponse.class,"GetUserinfoResponse()");
        return JSONObject.parseObject(response, GetUserinfoResponse.class);
    }


    /**
     * 检验授权凭证（access_token）是否有效
     * <p>参考<a href="http://mp.weixin.qq.com/wiki/17/c0f37d5704f0b64713d5d2c37b468d75.html#.E9.99.84.EF.BC.9A.E6.A3.80.E9.AA.8C.E6.8E.88.E6.9D.83.E5.87.AD.E8.AF.81.EF.BC.88access_token.EF.BC.89.E6.98.AF.E5.90.A6.E6.9C.89.E6.95.88">开发文档</a></p>
     *
     * @param request
     * @return
     */
    public static ValidAccessTokenResponse validAccessToken(ValidAccessTokenRequest request){
        String response = post(HTTPS_API_WEIXIN_QQ_COM_SNS_AUTH, request);
        RequestCheck.isSuccess(response,ValidAccessTokenResponse.class,"ValidAccessTokenResponse()");
        return JSONObject.parseObject(response, ValidAccessTokenResponse.class);
    }


    /**
     * post 请求
     * 应该用get请求，要测试一下
     * @param url
     * @param data
     * @return
     */
    private static String post(String url, Object data) {
        List<NameValuePair> params = new ArrayList<NameValuePair>();
        if (data != null) {
            Field[] fields = data.getClass().getDeclaredFields();
            for (Field field : fields) {
                field.setAccessible(true);
                Object value = null;
                try {
                    value = field.get(data);
                } catch (IllegalAccessException e) {
                    // never throws
                }
                if (value != null) {
                    params.add(new BasicNameValuePair(field.getName(), value.toString()));
                }
            }
        }
        try {
            HttpEntity entity = Request.Post(url)
                    .bodyForm(params.toArray(new NameValuePair[params.size()]))
                    .execute().returnResponse().getEntity();
            return entity != null ? EntityUtils.toString(entity, Consts.UTF_8) : null;
        } catch (Exception e) {
            logger.error("post请求异常，" + e.getMessage() + "\n post url:" + url);
            e.printStackTrace();
        }
        return null;
    }

}
