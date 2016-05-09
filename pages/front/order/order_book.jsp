<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib uri="/struts-tags" prefix="s"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>订单完成</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<meta name="viewport"
	content="width=device-width, initial-scale=1.0, user-scalable=0, minimum-scale=1.0, maximum-scale=1.0">
	<meta name="apple-mobile-web-app-capable" content="yes">
	<meta name="apple-mobile-web-app-status-bar-style" content="black">
	<link href="buju.css" type="text/css" rel="stylesheet"/>
	<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->
<style>
html {height: 100%;}
body {height: 100%;}
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
.zhuangtai{
    height: 80px;
    width:100%;
    border-bottom: 1px solid #d1d1d1;
    line-height: 35px;
}
.zhuangtai1{
    color: red;
    font-size: 20px;
    margin-left: 20px;
    margin-top: 10px;
}
.zhuangtai1 span{
     color: red;
}
.dingdanhao{
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
.shangping{
    height: auto;
	
	font-size: 16px;
	color: black;
	line-height:30px;
	
	width:95%;
	margin-left: 5%;
}
.tiaomu1{
    height: auto;
    border-bottom-width: 1px;
	border-bottom-style: solid;
	border-bottom-color: #d1d1d1;
	width:100%;
    
}
.z_shuzi {
	float: right;
	height: 50px;
	line-height: 50px;
	font-size: 20px;
	margin-right: 5%;
}
.tiaomu span{
    color: red;
}
.btn {
	background: #E82E2E;
	height: 50px;
	text-align: center;
	line-height: 50px;
	font-size: 36px;
	margin-top: 50px;
	border-radius: 5px;
	width: 80%;
	margin-right: auto;
	margin-left: auto;
}
	.btn span {
	color: #fff;
	font-size: 45px;
}
.btn span {
	font-size: 20px;
}
</style>
  </head>
 <body style="background-color: #EFEFEF">
 <div id="top">
		<div class="header">
			 <a  href="javascript:history.go(-1)" class="logo"> <img
				src="source/images/market_left.png"
				class="logoleft"></a>
			<div class="hezi">
				<span class="title">预订成功</span>
			</div>
			<a  href="../first_catagorgy.jsp" class="logo"> <img
				src="source/images/seller-index/home-1.png" width="20" height="39"
				class="logoright"></a>
		</div>
	</div>
	
 <div class="zhuangtai">
     <p class="zhuangtai1">您已预定成功！  <span>【未支付】</span></p>
     <p class="dingdanhao">订单号：${order.orderNumber}</p>
 </div>
 <div class="tiaomu">收货人：<%if(session.getAttribute("address") == null){ %>${sessionScope.user.tname}<%}else { %>${sessionScope.address.receiverName}<%} %></div>
 <div class="tiaomu">手机： <%if(session.getAttribute("address") == null){ %>${sessionScope.user.mob}<%}else { %>${sessionScope.address.receiverPhone}<%} %></div>
 <div class="tiaomu1"><div class="shangping">订购产品：
 <c:forEach var="sl" items="${orderItemsList}">
 ${sl.itemname}</c:forEach>
 </div></div>
<div class="tiaomu">支付方式：${order.paystate}</div>
<div class="tiaomu">是否支付：未支付</div>
<div class="tiaomu"><div class="z_shuzi">总额:<span>￥${order.total}</span></div></div>
<div class="btn" onclick="" tapmode="submit-hover"><span type="submit">立即支付</span></div>
</body>
</html>
