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
<meta name="viewport"
	content="width=device-width, initial-scale=1.0, minimum-scale=1.0, maximum-scale=1.0, user-scalable=0">
<!-- 不允许用户缩放-->
<meta name="apple-mobile-web-app-capable" content="yes">
<!-- 显示苹果菜单栏 -->
<meta name="apple-mobile-web-app-status-bar-style" content="black">
<!-- 苹果菜单栏显示为黑色 -->
<link href="source/css/style.css" rel="stylesheet" />
<link href="source/css/search-page.css" type="text/css" rel="stylesheet" />
<link href="source/css/seller.css" type="text/css" rel="stylesheet" />
<link rel="stylesheet" href="source/css/market-footer.css"> 
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->

  </head>
  
  <body>
    <div id="top">
		<div class="header">
			 <a  href="javascript:history.go(-1)" class="logo"> <img
				src="source/images/market_left.png"
				class="logoleft"></a>
			<div class="hezi">
				<span class="title">搜寻商品</span>
			</div>
			<a  href="first_catagorgy.jsp" class="logo"> <img
				src="source/images/seller-index/home-1.png" width="20" height="39"
				class="logoright"></a>
		</div>
	
	</div>
   <div class="search radius6">
		<form  action="pages/front/search!findByName.action"  name="searchform" id="searchform" method="post" >
			
				
			 <input class="inp_srh" name="tblItems.itemName" id="keyboard" style=''
				value='' /> 
				 
			 	
				<input
				class="btn_srh" type="submit"  name="submit" value="搜索" id="sousuo" />
		</form>
	</div>
	
	<table class="table" width="100%">
				
						<tr style="height: 90px">
							<td width="30%" ><img src=''
								class="seller-logo" /></td>
							<td>
								<div style="height: auto">
									<p class="seller-name-search">
										国内大香蕉
									</p>
								</div>
								<div>
									<p class="seller-price" style="font-size: 12px;">
										￥
										10元
									</p>
									<p class="seller-infro-search">
										国内水果
									</p>
								</div>
							
                     
							</td>
						</tr>
					</table>
	
	<!-- 底部浮动的3个导航-->
 <div class="page">
			<a href="pages/back/user!findById.action?user.userid=${user.userid}"
				target="_blank" class="link1"><img
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
