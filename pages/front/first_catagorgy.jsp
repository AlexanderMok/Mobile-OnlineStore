<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="s" uri="/struts-tags" %>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>吃啊超市</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->
	<link rel="stylesheet" href="source/css/header.css">
<link rel="stylesheet" href="source/css/seller.css">
<link rel="stylesheet" href="source/css/market-footer.css"> 
<link rel="stylesheet" href="source/css/style.css">
<link rel="stylesheet" href="source/css/idangerous.swiper.css">
<link rel="stylesheet" href="source/bootstrap-3.3.4-dist/css/bootstrap.min.css">
<link href="source/css/NewFile.css" type="text/css" rel="stylesheet"/>
<script type="text/javascript" src="source/js/jquery-1.10.2.js"></script>
<link href="source/css/buju.css" type="text/css" rel="stylesheet"/>
<style>
body{
    background-color:#fff;
}
.flexslider {
	position: absolute;
	height: 20%;
	overflow: hidden;
	background: url(images/loading.gif) 50% no-repeat;
}

.slides {
	position: relative;
	z-index: 1;
}

.slides li {
	height: 400px;
}

.flex-control-nav {
	position: absolute;
	bottom: 5px;
	z-index: 2;
	width: 100%;
	text-align: center;
}

.flex-control-nav li {
	display: inline-block;
	width: 14px;
	height: 14px;
	margin: 0 5px;
	*display: inline;
	zoom: 1;
}

.flex-control-nav a {
	display: inline-block;
	width: 10px;
	height: 10px;
	line-height: 40px;
	overflow: hidden;
	background: url(source/images/dot.png) right 0 no-repeat;
	cursor: pointer;
}

.flex-control-nav .flex-active {
	background-position: 0 0;
}

.flex-direction-nav {
	position: absolute;
	z-index: 3;
	width: 100%;
	top: 45%;
}

.flex-direction-nav li a {
	display: block;
	width: 50px;
	height: 50px;
	overflow: hidden;
	cursor: pointer;
	position: absolute;
}

.flex-direction-nav li a.flex-prev {
	left: 40px;
	background: url(source/images/prev.png) center center no-repeat;
}

.flex-direction-nav li a.flex-next {
	right: 40px;
	background: url(source/images/next.png) center center no-repeat;
} 

.container{
   width:100%;
   margin-left:0px;
   padding:0;
   position:relative;
   top:20%;
}
.main {
  position:absolute;
  top:20%;
}
.main .user-position{
  padding-top:3px;
  margin-bottom:0px;
}
.main .container .col-xs-3{
  padding-left:0px;
  padding-right:0px;
}
.main .container .line{
  padding-left:0px;
  padding-right:0px;
  background-color:#ebebeb;
  height:5px;
}
.main .container .null{
  padding-left:0px;
  padding-right:0px;
  background-color:#fff;
  height:150px;
  border-top:1px solid #ebebeb;
}

.main .container .col-xs-12{
  padding-left:0px;
  padding-right:0px;
}
.main .container .col-xs-6{
  padding-left:0px;
  padding-right:0px;
  border-right:1px solid #ebebeb;
   border-bottom:1px solid #ebebeb;
}
.main .container .col-xs-6{
  padding-left:0px;
  padding-right:0px;
  border-bottom:1px solid #ebebeb;
}
.main .container .col-sm-12{
  padding-left:0px;
  padding-right:0px;
}
.main .container .col-sm-6{
  padding-left:0px;
  padding-right:0px;
  border-right:1px solid #ebebeb;
   border-bottom:1px solid #ebebeb;
}
.main .container .col-sm-6{
  padding-left:0px;
  padding-right:0px;
  border-bottom:1px solid #ebebeb;
}
.main .container .col-md-12{
  padding-left:0px;
  padding-right:0px;
}
.main .container .col-md-6{
  padding-left:0px;
  padding-right:0px;
  border-right:1px solid #ebebeb;
   border-bottom:1px solid #ebebeb;
}
.main .container .col-md-6{
  padding-left:0px;
  padding-right:0px;
  border-bottom:1px solid #ebebeb;
}
.main .container .col-md-7{
  padding-left:0px;
  padding-right:0px;
  border-bottom:1px solid #ebebeb;
}
.main .container .col-sm-7{
  padding-left:0px;
  padding-right:0px;
  border-right:1px solid #ebebeb;
   border-bottom:1px solid #ebebeb;
}
.main .container .col-xs-7{
  padding-left:0px;
  padding-right:0px;
  border-bottom:1px solid #ebebeb;
}
.main .container .col-xs-5{
  padding-left:0px;
  padding-right:0px;
  border-bottom:1px solid #ebebeb;
}
.main .container .col-sm-5{
  padding-left:0px;
  padding-right:0px;
  border-bottom:1px solid #ebebeb;
}
.main .container .col-md-5{
  padding-left:0px;
  padding-right:0px;
  border-bottom:1px solid #ebebeb;
}
</style>
<script type="text/javascript">
	window.onload=function(){
		var tuangou = document.getElementById("tuangou");
		tuangou.onclick="window.location.href='pages/front/grouppur!findByState.action'"
	}
</script>
  </head>
<body onload="load()">
   <div class="flexslider">
		<ul class="slides">	
   <li><img src="source/images/seller-index/ceshi.jpg" width="100%" height="100px" /></li>
   <li><img src="source/images/seller-index/ydfb.jpg" width="100%" height="100px"/></li>
   <li><img src="source/images/seller-index/fanmian.jpg" width="100%" height="100px" /></li>
		</ul>
  </div> 
  <div class="main">
 <div class="container">
  <p class="user-position">当前位置：南通 经济开发区
  </p>
   <div class="col-xs-3" onclick="javascript:classify(1)">
  	<a href="pages/front/finditems!findByFirstName.action?tblCatagorgy.catagorgyId=1">
  	 	<img src="source/images/seller-index/cookie.png" width="100%"></img>
  	 </a>
  </div>
  <div class="col-xs-3" onclick="javascript:classify(2)">
   <a href="pages/front/finditems!findByFirstName.action?tblCatagorgy.catagorgyId=2">
 	 	 <img src="source/images/seller-index/coffee.png" width="100%"></img>
 	</a>
  </div>
  
  <div class="col-xs-3" onclick="javascript:breakfastBook()">
  	<a href="pages/front/finditems!findByFirstName.action?tblCatagorgy.catagorgyId=3">
   	<img src="source/images/seller-index/fruits.png" width="100%"></img>
   	</a>
  </div>
  
  <div class="col-xs-3" onclick="javascript:classify(4)">
  	<a href="pages/front/finditems!findByFirstName.action?tblCatagorgy.catagorgyId=4">
   <img src="source/images/seller-index/rougan.png" width="100%"></img>
   </a>
  </div>
  
  <div class="col-xs-3" onclick="javascript:classify(5)">
  <a href="pages/front/finditems!findByFirstName.action?tblCatagorgy.catagorgyId=5">
   <img src="source/images/seller-index/xiuxian.png" width="100%"></img>
   </a>
  </div>
  <div class="col-xs-3" onclick="javascript:classify(6)">
<a href="pages/front/finditems!findByFirstName.action?tblCatagorgy.catagorgyId=6">
   <img src="source/images/seller-index/candy.png" width="100%"></img>
   </a>
  </div>
  
  <div class="col-xs-3" onclick="javascript:classify(7)">
 <a href="pages/front/finditems!findByFirstName.action?tblCatagorgy.catagorgyId=7">
   <img src="source/images/seller-index/others.png" width="100%"></img>
   </a>
  </div>
  
  <div class="col-xs-3" onclick="javascript:classify(0)">
    <a href="pages/front/bydiscount!findAll.action">
  <img src="source/images/seller-index/quanbushangping.png" width="100%"></img>
  </a>
  </div> 
  
   <div class="col-xs-12 col-md-12 col-sm-12 line"></div> 
  <div class="col-xs-12 col-md-12 col-sm-12" onclick="javascript:hotseller()"style="border-bottom: none;padding:15px; border-bottom:1px solid #e0e0e0">
   <img src="source/images/seller-index/tuijian.png" width="100%"></img>
  </div>
  <%--<a href="pages/front/grouppur!findByState.action">
  --%><div class="col-xs-12 col-md-12 col-sm-12" onclick="javascript:activityseller()" style="padding:15px; border-bottom:1px solid #e0e0e0;width:100%">
   <img src="source/images/seller-index/tuangou.png" width="100%" id="tuangou"></img>
  </div>
  <%--</a>
  --%><div class="col-xs-12 col-md-12 col-sm-12 null"></div>
 </div>
 </div>
  

 <!-- 底部浮动的3个导航-->
 <div class="page">
			<a href="pages/front/user_findById.action"
				class="link1"><img
				src="source/images/seller-index/user.png" width="100%"> </a>
			<a href="pages/front/queryShopcar"  class="link2">
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
  </body>
  <script type="text/javascript" src="source/js/jquery.js"></script>
<script type="text/javascript" src="source/js/jquery-1.9.1.min.js"></script>
<script type="text/javascript" src="source/js/layer.min.js"></script>
<script src="source/js/jquery.confirm.js"></script>
<script type="text/javascript" src="source/js/slider.js"></script>
<script type="text/javascript" src="source/bootstrap-3.3.4-dist/js/bootstrap.min.js"></script>
<script type="text/javascript">
$(document).ready(function() {
	$('.flexslider').flexslider({

		directionNav : false,
		pauseOnAction : false
	});
});
</script>
</html>
