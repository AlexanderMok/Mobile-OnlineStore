package cn.chia.pay.wechat.util.authorization.oauth.protool.get_userinfo;

import java.util.Arrays;

/**
 * 响应：拉取用户信息(需scope为 snsapi_userinfo)
 * 
 */
public class GetUserinfoResponse {

    private String openid;
    private String nickname;
    private String sex;
    private String province;
    private String city;
    private String country;
    private String headimgurl;
    private String[] privilege;
    private String unionid;

    public String getOpenid() {
        return openid;
    }

    public void setOpenid(String openid) {
        this.openid = openid;
    }

    public String getNickname() {
        return nickname;
    }

    public void setNickname(String nickname) {
        this.nickname = nickname;
    }

    public String getSex() {
        return sex;
    }

    public void setSex(String sex) {
        this.sex = sex;
    }

    public String getProvince() {
        return province;
    }

    public void setProvince(String province) {
        this.province = province;
    }

    public String getCity() {
        return city;
    }

    public void setCity(String city) {
        this.city = city;
    }

    public String getCountry() {
        return country;
    }

    public void setCountry(String country) {
        this.country = country;
    }

    public String getHeadimgurl() {
        return headimgurl;
    }

    public void setHeadimgurl(String headimgurl) {
        this.headimgurl = headimgurl;
    }

    public String[] getPrivilege() {
        return privilege;
    }

    public void setPrivilege(String[] privilege) {
        this.privilege = privilege;
    }

    public String getUnionid() {
        return unionid;
    }

    public void setUnionid(String unionid) {
        this.unionid = unionid;
    }

    @Override
    public String toString() {
    	StringBuffer sb = new StringBuffer();
		sb.append("{");
		sb.append("\"openid\"").append(":\"").append(openid).append("\",");
		sb.append("\"nickname\"").append(":\"").append(nickname).append("\",");
		sb.append("\"sex\"").append(":\"").append(sex).append("\",");
		sb.append("\"province\"").append(":\"").append(province).append("\",");
		sb.append("\"city\"").append(":\"").append(city).append("\",");
		sb.append("\"headimgurl\"").append(":\"").append(headimgurl).append("\",");
		sb.append("\"privilege\"").append(":\"").append(Arrays.toString(privilege)).append("\",");
		sb.append("\"unionid\"").append(":\"").append(unionid);
		sb.append("}");
        return sb.toString();
    }
}

