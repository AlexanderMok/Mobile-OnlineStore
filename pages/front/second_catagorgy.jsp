<%@ page language="java" import="java.util.*" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
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
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8">

	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->
<link href="source/css/buju.css" type="text/css" rel="stylesheet"/>
<link rel="stylesheet" href="source/css/market-footer.css"> 
<link href="source/css/NewFile.css" type="text/css" rel="stylesheet"/>
<link rel="stylesheet" href="source/bootstrap-3.3.4-dist/css/bootstrap.min.css">
  </head>
  
  <body>
    <div id="top">
		<div class="header">
			 <a  href="javascript:history.go(-1)" class="logo"> <img
				src="source/images/market_left.png"
				class="logoleft"></a>
			<%--<div class="hezi">
				<span class="title">分类列表</span>
			</div>
			--%><a  href="first_catagorgy.jsp" class="logo"> <img
				src="source/images/seller-index/home-1.png" width="20" height="39"
				class="logoright"></a>
		</div>
	
	</div>
  
  <div class="container">
  <%--<div class="row">
  
  <s:iterator value="catagorgySecondList" status="p">
  <%--<form action="pages/front/item!findByCatagorgy.action" method="post">
  <input type="hidden" name="tname" value="${catagorgyName}"/>
  <input type="submit" value="<img src=''/>"/>
  </form>
  --%><a href="pages/front/item!findByCatagorgy.action?tblCatagorgy.catagorgyName=<s:property value="catagorgyName"/>">
  <div class="col-sm-6 col-md-6 col-xs-6">
    <div class="thumbnail">
      <img src="source/images/market-details/shuiguo.png" alt="">
      <div class="caption">
        <h4><s:property value="catagorgyName"/></h4>
      </div>
    </div>
  </div>
  </a><%--
 </s:iterator>
 
--%></div>
<div class="col-xs-12 col-md-12 col-sm-12 null"></div>
</div>

 --%><!-- 底部浮动的3个导航-->
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
