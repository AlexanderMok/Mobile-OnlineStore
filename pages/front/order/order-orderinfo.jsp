<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ taglib uri="/struts-tags" prefix="s"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>My JSP 'order-orderinfo.jsp' starting page</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->
	<title>吃啊超市</title>
	<script src="jquery-1.11.1.min.js"></script>
<link href="source/css/buju.css" rel="stylesheet" type="text/css" />
<script>
function tiaozhuan(){
	window.location.href="pages/front/order_list";
}
</script>
<style type="text/css">
     .header {
	      position: relative;
          height: 40px;
          line-height: 40px;
          background-color: #fff;
          box-shadow:3px 3px 3px rgba(0,0,0,.3);
          width: 100%;  
}

.header .logoleft {
	height: 25px;
	vertical-align: top;
	margin-top: 8px;
	margin-left: 20px;	
	float: left;
}
.header .logoright {
    position:absolute;
    top:8px;
    right:10px;
	height: 25px;
	vertical-align: top;
	width: 25px;
	
}

.logo {
	display: inline
}

.header .hezi {
	color: #f25f9d;
}
.title{

    color:#f25f9d;

    width:100%;

    text-align:center;

    vertical-align:middle;

    white-space:nowrap;

    text-overflow:ellipsis;

    overflow:hidden;

}
.hezi {
	font-size: 20px;
	color: #f25f9d;
	margin-top: 0px;
	margin-bottom: 0px;
	text-align: center;
	float: none;
	height: 50px;
	width: 150px;
	margin-right: auto;
	margin-left: auto;
}
.zongji {
	border-top:1px solid #d1d1d1;
	height: 60px;
	background-color: #fff;
	margin: 0 auto;
	width: 95%;
}

.z_shuzi {
	float: right;
	height: 60px;
	line-height: 60px;
	font-size: 16px;
	margin-right: 5%;
}

.tiaomu {
	height: 30px;
	width:95%;
	font-size: 14px;
	color: #999999;
	line-height: 30px;
	text-indent: 1em;
	margin: 0 auto;
	
	background-color: #fff;
}

.tiaomu_none {
	height: 30px;
	width:95%;
	font-size: 14px;
	color: #999999;
	line-height: 30px;
	text-indent: 1em;
	margin: 0 auto;
	background-color: #fff;
}

.zongji .z_shuzi span {
	color: #F00;
}
.sjdz {
	height: 80px;
	width: 95%;
	margin: 0 auto;
	background-color: #fff;
	margin-top: 10px;
	
}
.tp_left {
	width: 100%;
	height: 100x;
}

.kj_right {
	float: right;
	width: 90%;
	height: 100px;
}

.kj_left {
	float: left;
	width: 10%;
	height: 100px;
	margin-left: -10px;
}

.shang_wenzi {
	height: 20px;
	width: 100%;
	font-size: 14px;
	margin-top: 10px;
}

.lianxi {
	width: 50%;
	float: left;
	line-height: 20px;
	height: 20px;
}

.haoma {
	float: left;
	width: 50%;
	line-height: 20px;
	height: 20px;
}

.xia_wenzi {
	height: 50px;
	width: 100%;
	line-height: 50px;
	font-size: 14px;
}

.shangjia {
	height: 50px;
	width: 95%;
	border-bottom:1px solid #d1d1d1;
	margin: 0 auto;
	background-color: #fff;
	margin-top: 5px;
	position: relative;
}



.shangjia a {
	position: relative;
	width: 90%;
	height: 50px;
	margin-left: 3%;
	
}
.shangjia_ming{
    height: 50px;
    width: 80%;
    float: left;
    line-height: 50px;
    
    position: absolute;
    margin-top: -15px;
}
.shangjia a img{
    margin-left: 85%;
    position: absolute;   
    
 }
.spxq {
	height: 120px;
	width: 95%;
	background-color: #fff;
	margin: 0 auto;
	
}

.tp_left_1 {
	float: left;
	height: 120px;
	width: 23%;
	margin-left: 5px;
	
}

.tp_left_11 {
	height: 50px;
	width: 100%;
	margin-top: 20px;
}

.tp_left_shuxing {
	height: 80px;
	width: 100%;
}

.kj_right_1 {
	float: left;
	width: 70%;
	height: 120px;
	margin-left: 3%;
	
}

.sp_ming {
	height: 75px;
	line-height: 30px;
	width: 100%;
	font-size: 14px;
	text-align: left;
	padding-top: 10px;
}

.shumu_jiamu {
	height: 30px;
	width: 100%;
}

.shumu {
	height: 30px;
	width: 20%;
	float: left;
	text-align: center;
	line-height: 30px;
	font-size: 14px;
	
	
}

.jine {
	float: right;
	height: 30px;
	width: 20%;
	color: #F00;
	font-size: 14px;
	line-height: 30px;
	text-align: center;
	
}

.btn {
	background: #E82E2E;
	height: 40px;
	text-align: center;
	line-height: 40px;
	font-size: 24px;
	
	border-radius: 5px;
	width: 90%;
    margin: 0 auto;
    margin-top: 20px;
}

.btn span {
	color: #fff;
	font-size: 24px;
}

.yue_big2 {
	width: 80%;
	margin-left: 40px;
	margin-top: 50px;
}

.yue_big2 h3 {
	font-size: 30px;
	color: #B1AFB0;
}

.yue_big2 h2 {
	font-size: 36px;
}

.jine_fenlei {
	height: 100px;
	margin-top: 60px;
}

.shurujine {
	height: 100px;
	margin-top: 70px;
}

.xiahuaxian {
	margin-top: 100px;
}

.btn span {
	font-size: 24px;
}
.shangjia a:link{
    color: #000;
}

</style>
  </head>
  
  <script>
  $(document).ready(function(){
	  $("#click").click(function(){
	  	$("#show").show();
	  });
  });
  </script>
  
<body style="background-color: #EFEFEF">
     <div class="header">
			 <a  href="javascript:history.go(-1)" class="logo"> <img
				src="source/images/market_left.png"
				class="logoleft"></a>
			<div class="hezi">
				<span class="title">订单详情</span>
			</div>
			<a  href="../first_catagorgy.jsp" class="logo"> <img
				src="source/images/home-2.png" width="20" height="39"
				class="logoright"></a>
		</div>
		
		<div class="sjdz">
		<div class="kj_left">
			<div class="tp_left">
				<img src="source/images/dh.png" width="50" height="100">
			</div>
		</div>

			<div class="kj_right">
				<div class="shang_wenzi">
					<div class="lianxi">
						联系人：
						<%if(session.getAttribute("address") == null){ %>${sessionScope.user.tname}<%}else { %>${sessionScope.address.receiverName}<%} %>
					</div>
					<div class="haoma">
						手机：
						${order.phone}
					</div>
				</div>
				<div class="xia_wenzi">
					配送地址：
					${order.addr}
				</div>
			</div>
		
	</div>
	
	<div class="shangjia">
		
		<a href="javascript:void()" >
			<span class="shangjia_ming"><%--新鲜水果</span>--%>
			<img src="source/images/hyjt.png" width="10" height="15">
		</a>
		
		
	</div>
	
	<c:choose>
	<c:when test="${order.flag eq 1}">
		<s:iterator value="set">
		<div class="spxq">
				<div class="tp_left_1">
					<div class="tp_left_11">
						<img src='${itempic}' width="269"
							height="200" class="tp_left_shuxing">
					</div>
				</div>
				<div class="kj_right_1">
					<div class="sp_ming">
						${itemname}&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;${tblItems.tblSuppliers.suppName}
					</div>
					<div class="shumu_jiamu">
						<div class="shumu">
							X${count}
						</div>
						<div class="jine">
							￥${subtotal}
						</div>
					</div>
				</div>
			</div>
			</s:iterator>
			<div class="zongji">
		<div class="z_shuzi"><%--
			数量：
			10
			份&nbsp;&nbsp;--%><span>￥${order.total}</span>
		</div>
	</div>
	</c:when>
	<c:when test="${order.flag eq 2}">
	<div class="spxq">
				<div class="tp_left_1">
					<div class="tp_left_11">
					拼单商品:
						<img src='${itempic}' width="269"
							height="200" class="tp_left_shuxing">
					</div>
				</div>
				<div class="kj_right_1">
					<div class="sp_ming">
						${order.pinId.tblItems.itemName}&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;${order.pinId.tblItems.tblSuppliers.suppName}
					</div>
					<div class="shumu_jiamu">
						<div class="jine">
							<font color="red" size="4">￥${order.pinId.nowPrice}</font>
							<font color="gray" size="2">￥${order.pinId.prePrice}</font>
					</div>
				</div>
			</div>
			<div class="zongji">
		<div class="z_shuzi"><%--
			数量：
			10
			份&nbsp;&nbsp;--%><span>￥${order.pinId.nowPrice}</span>
		</div>
	</div>
	</c:when>
	</c:choose>
	
		
	
	<br/><br/><br/>
	<c:choose>
	<c:when test="${order.flag eq 2}">
	<div class="tiaomu">
		拼单情况：<br/>
		开始时间:${order.pinId.startTime}&nbsp;&nbsp;&nbsp;结束时间：${order.pinId.endTime}&nbsp;&nbsp;&nbsp;原价:${order.pinId.prePrice}&nbsp;&nbsp;&nbsp;拼单价:<font color="red" size="4">${order.pinId.nowPrice}</font>&nbsp;&nbsp;&nbsp;最低拼单人数:${order.pinId.totalCount}&nbsp;&nbsp;&nbsp;现人数:<font color="red" size="4">${order.pinId.nowCount}</font>&nbsp;
	</div>
	</c:when>
	</c:choose>
	<br/>
	<div class="tiaomu">
		下单时间：
		${order.ordertime.buildtime}
	</div>
	
	<c:if test="${order.state eq '已发货' or order.state eq '交易完成'}">
	<div class="tiaomu">
		发货时间：
		${order.ordertime.sendtime}
	</div>
	</c:if>
	<c:if test="${!empty order.paystate}">
		<div class="tiaomu">
		支付方式：
		${order.paystate}
	</div>
	</c:if>
	
	<div class="tiaomu">
		订单状态：
		${order.state}
	</div>
	
	<div class="tiaomu">
		买家留言：
		${order.words}
	</div>
	
	<c:if test="${!empty order.refundreason}">
	<div class="tiaomu_none">
		退款原因:
		${order.refundreason}
	</div>
	</c:if>
	<c:if test="${!empty order.yingfureason}">
	<div class="tiaomu_none">
		实际退款金额：
		${order.yingfumoney}&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
		部分退款原因:
		${order.yingfureason}
	</div>
	</c:if>
	<c:if test="${order.state eq '已发货' or order.state eq '交易完成'}">
	<div class="tiaomu_none">
		配送人姓名：
		${order.peisongren.psrname}
	</div>
	
	<div class="tiaomu_none">
		配送人联系方式：
		${order.peisongren.psrtel}
	</div>
	</c:if>
	<div class="tiaomu_none">
	订单流程:<br/>
<c:choose>
<c:when test="${order.state eq '未付款'}">
	下单时间:${order.ordertime.buildtime}&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
</c:when>
<c:when test="${order.state eq '已付款'}">
	下单时间:${order.ordertime.buildtime}&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
	付款时间:${order.ordertime.paytime}&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
</c:when>
<c:when test="${order.state eq '申请退款'}">
	下单时间:${order.ordertime.buildtime}&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
	付款时间:${order.ordertime.paytime}&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
	取消订单时间:${order.ordertime.quxiaotime}&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
	申请退款时间:${order.ordertime.refundtime}&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
</c:when>
<c:when test="${order.state eq '已退款'}">
	下单时间:${order.ordertime.buildtime}&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
	付款时间:${order.ordertime.paytime}&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
	取消订单时间:${order.ordertime.quxiaotime}&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
	申请退款时间:${order.ordertime.refundtime}&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
	退款完成时间:${order.ordertime.refundedtime}&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
</c:when>
<c:when test="${order.state eq '配送中'}">
	下单时间:${order.ordertime.buildtime}&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
	付款时间:${order.ordertime.paytime}&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
	发货时间:${order.ordertime.sendtime}&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
</c:when>
<c:when test="${order.state eq '交易完成'}">
	下单时间:${order.ordertime.buildtime}&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
	付款时间:${order.ordertime.paytime}&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
	发货时间:${order.ordertime.sendtime}&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
	交易完成时间:${order.ordertime.finishtime}&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
</c:when>
<c:when test="${empty order.ordertime.paytime and order.state eq '已取消'}">
	下单时间:${order.ordertime.buildtime}&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
	取消订单时间:${order.ordertime.quxiaotime}&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
</c:when>
<c:when test="${!empty order.ordertime.paytime and order.state eq '已取消'}">
	下单时间:${order.ordertime.buildtime}&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
	付款时间:${order.ordertime.paytime}&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
	取消订单时间:${order.ordertime.quxiaotime}&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
</c:when>
</c:choose>
	</div>
	<br/><br/>
	<div class="tiaomu_none">
	<div style="margin-left:600px">
	
	 
	<c:choose>
	<c:when test="${order.state eq '未付款'}"><a href="pages/front/order_pay?id=${order.oid}"><font color="red" size="4">立即付款</font></a>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<a href="pages/front/order_updatestate?id=${oid}&orderStatus=7"  onclick="javascript:return confirm('亲~您确定要取消订单吗？')"><font color="gray" size="2">取消订单</font></a></c:when>
	<c:when test="${order.state eq '已付款' and order.flag eq 1}"><a href="pages/front/order_updatestate?id=${oid}&orderStatus=7" onclick="javascript:return confirm('亲~您确定要取消订单吗？')">取消订单</a></c:when>
	<c:when test="${!empty order.ordertime.paytime and order.state eq '已取消'}">
	<button id="click">申请退款</button><br/>
	<form action="pages/front/order_updatestate?id=${oid}&orderStatus=3" method="post">
	<textarea id="show" name="reason" style="width:200px;height:50px;">退款原因</textarea><br/>
	<input type="submit" value="提交"/>
	</form>
	</c:when>
	</c:choose>
	</div>
	</div>
	
	<br/><br/><br/>
	<div class="btn" ">
		<a  href="javascript:history.go(-1)" class="logo"><span>返&nbsp;回</span></a>
	</div>
</body>
</html>
