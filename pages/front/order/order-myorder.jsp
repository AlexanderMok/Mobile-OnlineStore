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
    
    <title>My JSP 'order-myorder.jsp' starting page</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->
	<link href="source/css/myorder.css" rel="stylesheet" type="text/css" />
<link href="source/js/confirm/stylenew.css" rel="stylesheet" />
<link href="source/js/confirm/confirm.css" rel="stylesheet" />
<link rel="stylesheet" href="source/css/market-footer.css"> 
<title>吃啊超市</title>
<style type="text/css">
/* search */
.search {
	border: 0px solid #f58400;
	height: 35px;
	margin: -45px 0 0 68%;
	width: 100px;
	position: absolute;
}

.search select {
	display: none;
}

.search .select_box {
	font-size: 14px;
	color: #000;
	width: 100px;
	line-height: 35px;
	float: left;
	position: relative;
}

.search .select_showbox {
	height: 35px;
	background: url(source/images/sjt-1.png) no-repeat 62px center;
	text-indent: 1.5em;
}

.search .select_showbox.active {
	background: url(source/images/sjt1-1.png) no-repeat 62px center;
}

.search .select_option {
	border: 0px solid #f58400;
	border-top: none;
	display: none;
	left: -2px;
	top: 35px;
	position: absolute;
	z-index: 99;
	background: #e1e1e1;
}

.search .select_option li {
	text-indent: 1.5em;
	width: 100px;
	cursor: pointer;
}

.search .select_option li.selected {
	background-color: #161616;
	color: #fff;
}

.search .select_option li.hover {
	background: #161616;
	color: #fff;
}
.quxiao{
    visibility:hidden;
}
.qb_quick_tip {
	position: fixed;
	line-height: 23px;
	padding: 3px 5px;
	background: rgba(0,0,0,.8);
	color: #FFF;
	border-radius: 5px;
	text-align: center;
	z-index: 202;
	top: 50px;
	left: 10px;
	right: 10px
}
.qb_none {
	display: none;
}
</style>
  </head>
  <body>
  
  <div class="body">
		<div class="top">
			<div class="header">
			 <a  href="javascript:history.go(-1)" class="logo"> <img
				src="source/images/market_left.png"
				class="logoleft"></a>
			<div class="zhongwenzi">
				<span>我的订单</span>
			</div>
			<a  href="../first_catagorgy.jsp" class="logo"> <img
				src="source/images/seller-index/home-1.png" width="20" height="39"
				class="logoright"></a>
		</div>
			<div class="search radius6">						
				<form name="searchform" method="post" action="#">
		<input name='ecmsfrom' type='hidden' value='9'>
		<input type="hidden" name="show" value="title,newstext">
		<select name="classid" id="choose">
			<option value="0">全部</option>
			<option value="1">未付款</option>
			<option value="2">已付款</option>
			<option value="3">申请退款</option>
            <option value="4">已退款</option>
            <option value="5">配送中</option>
            <option value="6">交易完成</option>
            <option value="7">已取消</option>
		</select> 
		
	</form>
			</div>
		</div>
		
		<!-- 商品展示 -->
		<s:iterator value="list">
		<div id="dingdan" class="xiangmu"  onclick="toinfo(this)">
				
				<div class="mingcheng"><p>
				<c:choose>
				<c:when test="${flag eq 1}">
					<s:iterator value="orderitemses">
					${itemname}&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<img style="height:60px;weight:60px" src="${itempic}"></img>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;${tblItems.tblSuppliers.suppName}<br/>
					</s:iterator>
				</c:when>
				<c:when test="${flag eq 2}">
				拼单商品:&nbsp;
				${pinId.tblItems.itemName}&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<image style="height:60px;weight:60px" src="${pinId.tblItems.itemPic}"/>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;${pinId.tblItems.tblSuppliers.suppName}
				</c:when>
				</c:choose>
				
				</div>
			<div class="shuju">
				<div class="dingdanhao"  onclick="toinfo(this)">
					<p>订单号：${orderNumber}</p>
					<p>下单时间：${ordertime.buildtime}</p>
				</div>
				
				<div class="zhuangtai">${state}<br/><a href="pages/front/order_viewbyid?id=${oid}">订单详情</a></div>
			</div>
			
			<%--<div class="xuanze">
				<div class='xuanze_tupian'>
				<img src="source/images/n_quxiao.png" width="45%" height="33" 
				> <img
					src="source/images/n_zailaiyifen.png" width="45%" height="33" 
					>
				</div>
			</div>
			--%></s:iterator>
		<!-- 底部浮动的3个导航-->
 <div class="page">
			<a href="pages/back/user!findById.action?user.userid=${user.userid}"
				target="_blank" class="link1"><img
				src="source/images/seller-index/user.png" width="100%"> </a>
			<a href="pages/front/queryShopcar" target="_blank" class="link2">
				<div style="position:relative;">
				<img
					src="source/images/seller-index/gouwuche.png" width="100%"> 
					<div style="position:absolute; right: 1px;top: 1px;">
　　　						<div id="count">${requestScope.count}</div>
　					　</div>
					</div>
			</a>
			<a 	onclick="javascript:location.href='pages/front/item_search.jsp'"
				class="link3"    ><img
				src="source/images/seller-index/search.png" width="100%"> </a>
</div>
			
	</div>
	<script src="source/js/confirm/jquery.js"></script>
	<script type="text/javascript"
		src="source/js/search-page/jquery-1.8.3.min.js"></script>
	<script src="source/js/confirm/jquery.confirm.js"></script>
	<script type="text/javascript"
		src="source/js/myorder.js"></script>
  </body>
</html>
