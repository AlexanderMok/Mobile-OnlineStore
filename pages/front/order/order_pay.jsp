<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ taglib uri="/struts-tags" prefix="s"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta name="viewport"
	content="width=device-width, initial-scale=1.0, user-scalable=0, minimum-scale=1.0, maximum-scale=1.0">
<meta name="apple-mobile-web-app-capable" content="yes">
<meta name="apple-mobile-web-app-status-bar-style" content="black">
<link href="buju.css" type="text/css" rel="stylesheet" />
<style>
a {
	text-decerotion:none;
}
html {
	height: 100%;
}

body {
	height: 100%;
}

.header {
	position: relative;
	height: 40px;
	line-height: 40px;
	background-color: #fff;
	box-shadow: 3px 3px 3px rgba(0, 0, 0, .3);
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
	position: absolute;
	top: 8px;
	right: 10px;
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

.title {
	color: #f25f9d;
	width: 100%;
	text-align: center;
	vertical-align: middle;
	white-space: nowrap;
	text-overflow: ellipsis;
	overflow: hidden;
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

.zhuangtai {
	height: 80px;
	width: 100%;
	border-bottom: 1px solid #d1d1d1;
	line-height: 35px;
}

.zhuangtai1 {
	color: red;
	font-size: 20px;
	margin-left: 20px;
	margin-top: 10px;
}

.zhuangtai1 span {
	color: red;
}

.dingdanhao {
	font-size: 16px;
	margin-left: 20px;
}

.tiaomu {
	height: 50px;
	border-bottom-width: 1px;
	border-bottom-style: solid;
	border-bottom-color: #d1d1d1;
	font-size: 16px;
	color: black;
	line-height: 50px;
	text-indent: 1.5em;
}

.shangping {
	height: auto;
	font-size: 16px;
	color: black;
	line-height: 30px;
	width: 95%;
	margin-left: 5%;
}

.tiaomu1 {
	height: auto;
	border-bottom-width: 1px;
	border-bottom-style: solid;
	border-bottom-color: #d1d1d1;
	width: 100%;
}

.z_shuzi {
	float: right;
	height: 50px;
	line-height: 50px;
	font-size: 20px;
	margin-right: 5%;
}

.tiaomu span {
	color: red;
}

.btn {
	background: #E82E2E;
	height: 50px;
	text-align: center;
	line-height: 50px;
	font-size: 36px;
	margin-top: 15px;
	border-radius: 10px;
	width: 80%;
	margin-right: auto;
	margin-left: auto;
	cursor:pointer;
}

.btn span {
	color: #fff;
	font-size: 45px;
}

.btn span {
	font-size: 20px;
}
</style>
<title>您的预定单</title>
</head>
<body style="background-color: #EFEFEF">
	<div class="header">
		<a href="javascript:history.go(-1)" class="logo"> <img
			src="source/images/market_left.png" class="logoleft"></a>
		<div class="hezi">
			<span class="title">订单确认</span>
		</div>
		<a href="../first_catagorgy.jsp" class="logo"> <img
			src="source/images/home-2.png" width="20" height="39"
			class="logoright"></a>
	</div>
	<s:form id="preorderFrom">
		<s:token/>
		<div class="zhuangtai">
			<p class="zhuangtai1">
				正在生成订单..... <span>【未支付】</span>
			</p>
			<p class="dingdanhao">
				订单号:<s:hidden value=""/>
				：${order.orderNumber}</p>
		</div>
		<div class="tiaomu">收货人：<%if(session.getAttribute("address") == null){ %>${sessionScope.user.tname}<%}else { %>${sessionScope.address.receiverName}<%} %></div>
		<div class="tiaomu">手机：<%if(session.getAttribute("address") == null){ %>${sessionScope.user.mob}<%}else { %>${sessionScope.address.receiverPhone}<%} %></div>
		<div class="tiaomu1">
			<div class="shangping">订购产品：
			<s:iterator value="set">${itemname}&nbsp;&nbsp;</s:iterator>
			</div>
		</div>
		<div class="tiaomu">支付方式：<s:hidden name="payMethod" value=""/>${order.paystate}</div>
		<div class="tiaomu">是否支付：<s:hidden name="" value=""/>未支付</div>
		<div class="tiaomu">
			<div class="z_shuzi">
				总额:<s:hidden name="" value=""/><span>${order.total}</span>
			</div>
		</div>
	</s:form>
	
	<div class="btn" onclick="" tapmode="submit-hover">
		<span type="submit">确认支付</span>
	</div>
	
	<div class="btn" onclick="javascript:history.go(-1);" tapmode="submit-hover">
		<span type="submit">返回首页</span>
	</div>
	
	<div class="btn" tapmode="submit-hover">
	${order.oid}
		<a href="/ChiA/pages/front/order_updatestate?id=${order.oid}&orderStatus=2">付款成功</a>
	</div>
	
	<script>
	    function payDispatcher(){
	    	var payMethod = document.getElementByName("payMethod")[0];
	    	
	    	switch(payMethod){
	    	    case 1:
	    	        pay("");
	    	        break;
	    	    case 2:
	    	        pay("");
	    	        break;
	    	    case 3:
	    	        pay("");
	    	        break;        
	    	}
	    }
	    
	    function pay(actionUrl){
	    	var form = document.getElementById("preorderFrom");
	    	form.setAttribute("action", actionUrl);
	    	form.setAttribute("method", "post");
	    	form.submit();
	    }
	    
	    payDispatcher();
	</script>
</body>
</html>