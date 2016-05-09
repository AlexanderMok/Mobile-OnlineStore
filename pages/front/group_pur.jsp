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
    
    <title></title>
    
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
<script type="text/javascript" src="source/js/jquery-1.10.2.js"></script>
<link href="source/css/buju.css" type="text/css" rel="stylesheet"/>
<link href="source/css/NewFile.css" type="text/css" rel="stylesheet"/>
<script type="text/javascript" src="source/js/jquery-1.10.2.js"></script>
<link href="source/css/buju.css" type="text/css" rel="stylesheet"/>
<style>
html {height: 100%;} 
body {height: 100%;background: #EFEFEF;}
   .header {
          position: relative;
          height: 40px;
          line-height: 40px;
          background-color: #fff;
          box-shadow:3px 3px 3px rgba(0,0,0,.3);
          width: 100%;          
 }
 
 .title{
   margin: 0 auto;
   color: #000;
   height: 40px;
   line-height: 40px;
   width: 120px;
   text-align: center;
   font-size: 18px;
}
.content{
    width: 95%;
    height: 330px;
    margin: 10px auto;
    background-color: #fff;
    position: relative;
    display: block;
}
.picture{
    width: 100%;
    height: 180px;
     background-color: #fff;      
    margin: 10px auto;    
}
.wenzi{
    width: 95%;
    height: 60px;
    background-color: #fff;
    line-height:20px;
    margin: 10px auto;    
    color: #000;
    font-size: 20px;
}
.dibu_content{
    height: 60px;
    width: 95%;
    margin: 10px auto;
    
}
.jiage{
   float: left;
   width: 30%;
   height: 60px;
   line-height: 60px;
   color:#787578;
   
}
.jiage span{
   font-size: 24px;
   color: red;
}
.goumai{
  float: right;
  height:40px;
  width: 40%;
  background-color:red;
  margin-top: 10px;
}
.goumai span{
  display: inline-block;
  background-color: red;
  height: 40px;
  width: 48%;
  color: #fff;
  text-align: center;
  line-height: 40px;
  border-radius:3px;
}
</style>
  </head>
   
  <body>
   <div id="top">
		<div class="header">
			 <a  href="javascript:history.go(-1)" class="logo"> <img
				src="source/images/market_left.png"
				class="logoleft"></a>
			<div class="hezi">
				<span class="title">团购列表</span>
			</div>
			<a  href="first_catagorgy.jsp" class="logo"> <img
				src="source/images/seller-index/home-1.png" width="20" height="39"
				class="logoright"></a>
		</div>
	
	</div>
<s:iterator value="fingByIngList">
  <a class="content" href="pages/front/grouppur!findGroupById.action?tblGroupPurchase.id=<s:property value="id"/>" >
	    	<div class="picture">
	        	<img alt='' src='<s:property value="tblItems.itemPic"/>' height="180px" width="100%">
	    	</div>
	   		<div class="wenzi">
	        	<p><s:property value="tblItems.itemName"/></p>
	        	<p style="color:#787578;font-size: 16px;margin-top: 10px;"><s:property value="startTime"/>开拼</p>
	        	<br/>
	    	</div>
	     <div class="dibu_content">
	          <div class="jiage"><span><s:property value="nowPrice"/></span>/<s><s:property value="prePrice"/></s></div>
	          <div class="goumai">
	             <span><s:property value="totalCount"/>人团,立即去拼购</span>
	             <span>去拼购</span>
	          </div>
	    </div>
 </a>
 </s:iterator>
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
