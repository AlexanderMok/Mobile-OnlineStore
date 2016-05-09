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
<title>错误页面</title>
</head>
<body style="background-color: #EFEFEF">
<% 
	String str1= (String)session.getAttribute("c");
	String str2= (String)session.getAttribute("openid");
	out.print("this is code"+str1);
	out.print("this is openid"+str2);
%>

	<div class="header">
		<a href="javascript:history.go(-1)" class="logo"> <img
			src="source/images/market_left.png" class="logoleft"></a>
		<div class="hezi">
			<span class="title">错误页面</span>
		</div>
		<a href="javascript:;" class="logo"> <img
			src="source/images/home-2.png" width="20" height="39"
			class="logoright"></a>
	</div>
		<div class="zhuangtai">
			<p class="zhuangtai1">
				似乎出了点问题呢！
			</p>
			<p><s:actionerror/></p>
		</div>
		
		
	<div class="btn" onclick="javascript:history.go(-1);" tapmode="submit-hover">
		<span type="submit">返回</span>
	</div>
	
	
	<div class="btn" onclick="window.location.href='../front/first_catagorgy.jsp'" tapmode="submit-hover">
		<span type="submit">返回首页</span>
	</div>
</body>
</html>

