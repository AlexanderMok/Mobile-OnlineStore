<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="s" uri="/struts-tags"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"
			+ request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
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

		<meta name="viewport"
			content="width=device-width, initial-scale=1.0, user-scalable=0, minimum-scale=1.0, maximum-scale=1.0">
		<meta name="apple-mobile-web-app-capable" content="yes">
		<meta name="apple-mobile-web-app-status-bar-style" content="black">
		<title>吃啊超市</title>
		<link href="source/css/buju.css" type="text/css" rel="stylesheet" />
		<style type="text/css">
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

.add_dz {
	height: 60px;
	width: 95%;
	margin: 5px auto;
	background-color: #fff;
	display: block;
	position: relative;
}

.add_dz:LINK {
	color: red;
}

.add_dz:VISITED {
	color: red;
}

.red_tubiao {
	display: block;
	position: absolute;
	margin: 18px 15px;
}

.hongzi {
	display: block;
	position: absolute;
	margin: 21px 50px;
}

.sjdz {
	height: 75px;
	width: 95%;
	margin: 15px auto;
	background-color: #fff;
}

.kj_right {
	float: left;
	width: 97%;
	height: 100%;
	margin-left: 5px;
	position: relative;
}

.shang_wenzi {
	height: 50%;
	width: 100%;
	font-size: 14px;
}

.lianxi {
	width: 30%;
	/* line-height: 20px; */
	margin-top:10px;
	white-space: nowrap;
	text-overflow: ellipsis;
	overflow: hidden;
}

.haoma {
	width: 30%;
	/* line-height: 20px; */
	height: 50%;
	border: 0px solid red;
	margin-top:5px;
	margin-left: 4%;
}

.xia_wenzi {
	margin-top: 10px;
	height: 50%;
	width: 200px;
	line-height: 20px;
	font-size: 14px;
	left: 0;
	text-indent: 3px;
	white-space: nowrap;
	text-overflow: ellipsis;
	overflow: hidden;
}

div.sdmenu {
	width: 74px;
	font-family: Arial, sans-serif;
	font-size: 12px;
	padding-bottom: 10px;
	background-color: #fff;
	margin: -70px 75%;
	color: #fff;
	position: absolute;
}

div.sdmenu div {
	overflow: hidden;
}

div.sdmenu div.collapsed {
	height: 40px;
}

div.sdmenu div span {
	display: block;
	padding: 5px 25px;
	font-weight: bold;
	color: white;
	background: url(source/images/collapsed.png) no-repeat right center;
	cursor: default;
	border-bottom: 0px solid #ddd;
}

div.sdmenu div.collapsed span {
	background-image: url(source/images/expanded.png);
}

div.sdmenu div a {
	padding: 15px 10px;
	background: #fff;
	display: block;
	border-bottom: 1px solid #ddd;
	color: #9e9e9e;
	text-decoration: none;
}

div.sdmenu div a.current {
	background: #fff;
}

div.sdmenu div a:hover {
	color: #d1d1d1;
	text-decoration: none;
}

.edit {
	position: relative;
	right: 80px;
	width: 10%;
	color: #777;
	font-size: 0.8em;
	top: -50px;
	
}

.moren_address {
	color: red;
	margin-top: -40px;
	height: 50%;
	width: 20%;
	line-height: 20px;
	font-size: 14px;
	margin-left: 90%;
}
#test{
	border-left:1px;
	border-reght:1px;
	border-top:1px;
	border-bottom:1px;
	border:1px solid #000;
}
</style>

	</head>

	<body style="background-color: #EFEFEF">
		<div class="header">
			<a href="javascript:history.go(-1)" class="logo"> <img
					src="source/images/market_left.png" class="logoleft">
			</a>
			<div class="hezi">
				<span class="title">我的收货地址</span>
			</div>
			<a href="../first_catagorgy.jsp" class="logo"> <img
					src="source/images/home-2.png" width="20" height="39"
					class="logoright">
			</a>
		</div>

		<a class="add_dz" href="pages/front/user/address_add.jsp"> <img
				alt="" src="source/images/hongjia.png" width="25" height="25"
				class="red_tubiao" /> <span class="hongzi">新增收货地址</span> </a>

		<s:iterator value="allAddress">
				<div class="sjdz" >
					<div class="shang_wenzi" onclick="checkPath(${user.flag}, ${addrId});">
									<span class="lianxi">联系人: ${receiverName } </span>
									<span class="haoma">手机: ${receiverPhone } </span>
								</div>

								<div class="xia_wenzi">
									配送地址: ${addr }
								</div>
								<c:choose>
  				<c:when test="${flag eq 0}">
  					<div class="edit" style="float: right" onclick="javascript:window.location.href='pages/front/user_updatePreAddress.action?address.addrId=${addrId }'">
								<div>
									<img alt="" src="source/images/edit.png" width="35" height="35">
								</div>
							</div>
  				</c:when>
  				<c:otherwise>
  				<div class="edit" style="float: right"
  				 onclick="javascript:window.location.href='pages/front/user_updatePreAddress.action?address.addrId=${addrId}'">
								<div>
									<img alt="" src="source/images/edit.png" width="35" height="35">
								</div>
							</div>
								<div class="moren_address">
									[默认]
								</div>
				</c:otherwise>
  				</c:choose>
							</div>
							
		</s:iterator>
	</body>
	<script type="text/javascript">
		function checkPath(path, addrId){
			if(path==1){
				window.location.href='pages/front/user_selectAddress.action?address.addrId='+addrId;
			}else if(path==2){
				window.location.href=href='pages/front/user_selectPinAddress.action?address.addrId='+addrId;
			}else{
				return false;
			}
			
		}
	</script>
</html>