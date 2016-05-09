package cn.chia.pay.wechat.protool.unified_order_protool;

import javax.xml.bind.annotation.XmlRootElement;

import cn.chia.pay.wechat.util.common.Configure;

/**
 * @author 莫庆来, 2016年4月14日 下午4:21:16
 * 统一下单请求对象
 * <p>参考<a href="https://pay.weixin.qq.com/wiki/doc/api/jsapi.php?chapter=9_1">开发文档</p>
 * <p/>
 */
@XmlRootElement(name = "xml")
public class UnifiedOrderReqData {
	private final String appid = Configure.getInstance().getAppId();
    private final String mch_id = Configure.getInstance().getMchId();
    //终端设备号(门店号或收银设备ID)，注意：PC网页或公众号内支付请传"WEB"
    private final String device_info = "WEB";
    private String nonce_str;
    private String sign;
    //商品描述
    private String body;
    //商品详情，名称明细列表
    private String detail;
    //附加数据
    private String attach;
    //商品订单号
    private String out_trade_no;
    private final String fee_type = "CNY";
    //订单总金额，单位为分
    private Integer total_fee;
    //终端ip,APP和网页支付提交用户端ip，Native支付填调用微信支付API的机器IP
    private String spbill_create_ip;
    //交易起始时间,订单生成时间，格式为yyyyMMddHHmmss
    private String time_start;
    //交易结束时间,订单失效时间，格式为yyyyMMddHHmmss,注意：最短失效时间间隔必须大于5分钟
    private String time_expire;
    //商品标记,代金券或立减优惠功能的参数
    private String goods_tag;
    // 通知地址
    private String notify_url;
    //交易类型, 取值如下：JSAPI，NATIVE，APP
    private final String trade_type = "JSAPI";
    //商品ID
    private String product_id;
    //指定支付方式
    private String limit_pay;
    //用户标识,trade_type=JSAPI，此参数必传，用户在商户appid下的唯一标识。
    private String openid;
    
    
    
    public UnifiedOrderReqData() {
	}
    
    /**
     * 最少要求数据
     */
	public UnifiedOrderReqData(	String nonce_str, String body, String detail,
			String out_trade_no, Integer total_fee, String spbill_create_ip, String notify_url,
			String openid) {
		
		this.nonce_str = nonce_str;
		this.body = body;
		this.detail = detail;
		this.out_trade_no = out_trade_no;
		this.total_fee = total_fee;
		this.spbill_create_ip = spbill_create_ip;
		this.notify_url = notify_url;
		this.openid = openid;
	}
	
	
	/**
     * 全部数据
     */
	public UnifiedOrderReqData(String nonce_str,
			String sign, String body, String detail, String attach,
			String out_trade_no, Integer total_fee, String spbill_create_ip,
			String time_start, String time_expire, String goods_tag,
			String notify_url, String product_id,
			String limit_pay, String openid) {
		super();
		this.nonce_str = nonce_str;
		this.sign = sign;
		this.body = body;
		this.detail = detail;
		this.attach = attach;
		this.out_trade_no = out_trade_no;
		this.total_fee = total_fee;
		this.spbill_create_ip = spbill_create_ip;
		this.time_start = time_start;
		this.time_expire = time_expire;
		this.goods_tag = goods_tag;
		this.notify_url = notify_url;
		this.product_id = product_id;
		this.limit_pay = limit_pay;
		this.openid = openid;
	}

	public String getAppid() {
        return appid;
    }


    public String getMch_id() {
        return mch_id;
    }


    public String getDevice_info() {
        return device_info;
    }


    public String getNonce_str() {
        return nonce_str;
    }

    public void setNonce_str(String nonce_str) {
        this.nonce_str = nonce_str;
    }

    public String getSign() {
        return sign;
    }

    public void setSign(String sign) {
        this.sign = sign;
    }

    public String getBody() {
        return body;
    }

    public void setBody(String body) {
        this.body = body;
    }

    public String getDetail() {
        return detail;
    }

    public void setDetail(String detail) {
        this.detail = detail;
    }

    public String getAttach() {
        return attach;
    }

    public void setAttach(String attach) {
        this.attach = attach;
    }

    public String getOut_trade_no() {
        return out_trade_no;
    }

    public void setOut_trade_no(String out_trade_no) {
        this.out_trade_no = out_trade_no;
    }

    public String getFee_type() {
        return fee_type;
    }

//    public void setFee_type(String fee_type) {
//        this.fee_type = fee_type;
//    }

    public Integer getTotal_fee() {
        return total_fee;
    }

    public void setTotal_fee(Integer total_fee) {
        this.total_fee = total_fee;
    }

    public String getSpbill_create_ip() {
        return spbill_create_ip;
    }

    public void setSpbill_create_ip(String spbill_create_ip) {
        this.spbill_create_ip = spbill_create_ip;
    }

    public String getTime_start() {
        return time_start;
    }

    public void setTime_start(String time_start) {
        this.time_start = time_start;
    }

    public String getTime_expire() {
        return time_expire;
    }

    public void setTime_expire(String time_expire) {
        this.time_expire = time_expire;
    }

    public String getGoods_tag() {
        return goods_tag;
    }

    public void setGoods_tag(String goods_tag) {
        this.goods_tag = goods_tag;
    }

    public String getNotify_url() {
        return notify_url;
    }

    public void setNotify_url(String notify_url) {
        this.notify_url = notify_url;
    }

    public String getTrade_type() {
        return trade_type;
    }


    public String getProduct_id() {
        return product_id;
    }

    public void setProduct_id(String product_id) {
        this.product_id = product_id;
    }

    public String getLimit_pay() {
        return limit_pay;
    }

    public void setLimit_pay(String limit_pay) {
        this.limit_pay = limit_pay;
    }

    public String getOpenid() {
        return openid;
    }

    public void setOpenid(String openid) {
        this.openid = openid;
    }
}
