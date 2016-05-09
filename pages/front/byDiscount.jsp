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
	<!-- 苹果菜单栏显示为黑色 -->
<link href="source/css/buju.css" type="text/css" rel="stylesheet"/>
<link rel="stylesheet" href="source/css/seller.css">
<link rel="stylesheet" href="source/css/market-footer.css"> 
<link href="source/css/NewFile.css" type="text/css" rel="stylesheet"/>
<script type="text/javascript" src="source/js/jquery-1.10.2.js"></script>
<link rel="stylesheet" href="source/bootstrap-3.3.4-dist/css/bootstrap.min.css">
<style type="text/css">
#top {
	position: fixed;
	left: 0;
	top: 0;
	width: 100%;
	height: 20%;
}
.tip{
    position:absolute;
    top:19%;
    left:28%;
    width:75%;
    height:4%;
    color:#bebebe;
    font-size:0.8em;
}

.right {
	position: fixed;
	top: 22%;
	margin-top: 1%;
	left: 25%;
	width: 75%;
	height: 79%;
	-webkit-overflow-scrolling: touch;
	overflow: auto;
}

.left {
	position: fixed;
	top: 18%;	
	left: 0;
	width: 25%;
	height: 79%;
	backgroundcolor: #f8f8f8;
	float: left;
	-webkit-overflow-scrolling: touch;
	overflow: auto;
	border-right: 1px solid #e1e1e1;
	border-top: 1px solid #e1e1e1;
}

#jz1 {
	position: relative;
	top: 0;
	z-index: 99;
}

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
.nav ul li a {
	line-height: 47px;
	padding: 0 10px;
	display: block;
	height: 55%;
	color: black;
	text-align: center;
}

.nav {
	height: 55%;
	width: 100%;
	font-size: 1.1em;
	vertical-align: bottom;
}

.nav ul li {
	float: left;
	width: 33.3%;
}

#a1 {
	border-bottom: 1px solid #f48931;
	color: #f48931;
}

#a2 {
	border-bottom: 1px solid #d1d1d1;
	color: black;
}

#a3 {
	border-bottom: 1px solid #d1d1d1;
	color: black;
}

.bottom {
	position: fixed;
	top: 85%;
	height: 15%;
	width: 100%;
	background: rgba(32, 32, 32, 0.95);
	margin-left: 0%;
	line-height: 30px;
	font-size: 20px;
	z-index: 99;
}

#car {
	position: relative;
	margin-top: 6%;
	left: 3%;
	width: 36px;
	height: 35px;
}

.bottom-num {
	position: relative;
	top: -5px;
	left: 3.5%;
	z-index: 100;
	color: #fff;
	font-size: 1em;
}
.bottom-num-1 {
	position: relative;
	top: -5px;
	left: 2%;
	z-index: 100;
	color: #fff;
	font-size: 1em;
}

.bottom-price {
	position: relative;
	top: -5px;
	left: 2%;
	z-index: 100;
	color: #fff;
	font-size: 1em;
}
.bottom-price-1 {
	position: relative;
	top: -5px;
	left: 0%;
	z-index: 100;
	color: #fff;
	font-size: 1em;
}

/* #pay {
	position: relative;
	top: -45px;
	left:70%;
	height: 40px;
	width: 78px;
	z-index: 100;
} */


#leftbar {
	position: relative;
	top: 0px;
	left: 0;
	background-color: #f8f8f8;
	width: 100%;
	text-align: center;
	color: #777;
	font-size: 0.9em;
	margin-top: -6px;
	padding-bottom:150px;
   
}

#null {
	position: relative;
	top: 0px;
	left: 0;
	background-color: #f8f8f8;
	width: 100%;
	height: 20%;
}
#main {
    margin-bottom:150px;
}
.aaa {
	background: #fff;
	border-left: 3px solid #f48931;
	border-right: 0;
	padding: 20px ;
	color: #777;
	text-align:center;
}

.bbb {
	border-bottom: 1px solid #c5c5c5;
	border-right: 1px solid #c5c5c5;
	padding: 20px ;
	color: #777;
}

.product-pic {
	width: 80%;
	position: relative;
	left: 6%;
	top: 5px;
	vertical-align: top;
	border: solid 1px #ebebeb;
	margin-top: 5px;
}

.product-name {
	line-height: 18px;
	margin-top: 0px;
	font-family: Verdana, Geneva, sans-serif;
	font-size: 1rem;
	height: auto;
	color: #000;
	position: relative;
	top: 0px;
}

.product-infro {
	position: relative;
	top: 5px;
	line-height: 20px;
	font-family: Verdana, Geneva, sans-serif;
	font-size: 0.7rem;
	color: #999;
}

.product-price {
	position: relative;
	top: 5px;
	line-height: 20px;
	font-family: Verdana, Geneva, sans-serif;
	font-size: 1rem;
	color: #f00;
}

.product-yuanjia {
	position: relative;
	top: 5px;
	left: 8px;
	line-height: 20px;
	font-family: Verdana, Geneva, sans-serif;
	font-size: 0.8rem;
	color: #999;
}

.jiahao {
	position: relative;
	top: 5px;
	left: 70%;
	width: 30px;
	height: 30px;
	margin-top: 6px;
	margin-bottom: 6px;
}

.liebiao {
	height: 20px;
	width: 30%;
	float: left;
	margin-left: 5%;
}

.liebiao ul li {
	float: left;
	width: 33%;
	text-align: center;
}

.bmw {
	height: 50px;
	width: 100%;
	line-height: 30px;
	margin-top: 10px;
}

.liebiao_1 {
	width: 80%;
	height: 30px;
	float: right;
	position: relative;
	margin-right: 10%;
	margin-top: 5px;
}

.liebiao_1 ul li {
	float: right;
	width: 33%;
	text-align: center;
}

hr {
	position: relative;
	top: 0px;
}

.zongshu {
	position: relative;
	top: 40px;
	width: 100%;
	height: 80px;
}

.zongshu_1 {
	height: 80px;
	width: 80%;
	margin-left: 20%;
	line-height: 30px;
	font-size: 20px;
}

.zongshu_1 p span {
	color: red;
}

.count-input {
	width: 100%;
	text-align: center;
}

.hide {
	display: none;
}
.yin{
visibility: hidden;
}
.add {
	width: 25px;
	height: 25px;
}

.reduce {
	width: 25px;
	height: 25px;
}
.snum{
  position:relative;
  line-height:20px;
  left:20px;
  width:50%;
  height:80%;
  background:#f00;
  color:#fff;
  border-radius:10px;
  vertical-align:middle;
}
.xiadan{
  border: 0px solid red;
  background-color: #88c602;
  text-align: center;
  height: 35px;
  width: 34%;
  line-height: 35px;
  float:right;
  color: #fff;
  margin-top:18px;
  margin-right:3%;
  border-radius:3px; 
}
.font-order{
 font-size: 10px;
 background-color: #aaa;
}
.caidan{
   height: 60px;
   width: 100%;
   line-height: 60px;
   border-bottom: 1px solid #e1e1e1;
   text-align: center;
}
</style>
<script type="text/javascript">
//添加购物车
function addshopcar(id){
	$.ajax({
		url:"pages/front/addShopcar.action?tid="+id,
		success:function(msg){document.getElementById("count").innerHTML = msg}
		
	})
}
</script>
  </head>
  
  <body>
     <div id="top">
		<div class="header">
			 <a  href="javascript:history.go(-1)" class="logo"> <img
				src="source/images/market_left.png"
				class="logoleft"></a>
			<div class="hezi">
				<span class="title">打折商品</span>
			</div>
			<a  href="first_catagorgy.jsp" class="logo"> <img
				src="source/images/seller-index/home-1.png" width="20" height="39"
				class="logoright"></a>
		</div>
	
	</div>
	
	<div class="tip">
	 <p> 图片仅供参考哟</p>
	</div>
	<div class="right">
		<div id="main">			
				<table width="100%">
				
				
				  <s:iterator value="findByDiscountList" status="p">
					
					
					<tr height="auto">
						<td width="40%" style="vertical-align: top"><img
							src='<s:property value="itemPic"/>'
							alt='' class="product-pic"></td>
						<td>
							<div class="bmw">
								<div height="auto" class="product-name">
									<span><s:property value="itemName"/></span>
								</div>
								<div>
									<p class="product-infro">
										商品活动：<s:property value="activityName"/>
										活动类型：<s:property value="typeName"/><br/>
										活动情况：<s:property value="discount"/>折优惠，满<s:property value="fullCount"/>减<s:property value="substractCount"/><br/>
										剩余库存：<s:property value="stocks"/><br/>
									</p>
									<span class="product-price"><s:property value="retailPrice"/></span> <span class="product-yuanjia">￥<del>
											20
										</del></span>
								</div>
								<div class="liebiao_1">
									<ul>
										<li><img alt=""
											src="source/images/seller-details/jiahao.png" class="add" onclick="var id=<s:property value="id.itemId"/>;addshopcar(id);"></li>
										<li><input type="text" value="0" class="count-input hide" /></li>
										<li>&gt;<img alt=""
											src="source/images/seller-details/jianhao.png"
											class="reduce hide"></li>
									</ul>
								</div>
							</div>
						</td>
					</tr>
				  </s:iterator>	
				</table>
				<hr color="#e0e0e0" size="1px">
			
			
		</div>
		
	</div>
	<!-- 底部浮动的3个导航-->
 <div class="page">
			<a href="pages/back/user!findById.action?user.userid=${user.userid}"
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
</html>
