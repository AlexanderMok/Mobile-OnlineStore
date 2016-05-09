<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
	<head>
		<base href="<%=basePath%>">

		<meta name="viewport"
			content="width=device-width, initial-scale=1.0, user-scalable=0, minimum-scale=1.0, maximum-scale=1.0">
		<meta name="apple-mobile-web-app-capable" content="yes">
		<meta name="apple-mobile-web-app-status-bar-style" content="black">
		<link href="source/css/buju.css" type="text/css" rel="stylesheet" />
		<title>吃啊超市</title>

		<meta http-equiv="pragma" content="no-cache">
		<meta http-equiv="cache-control" content="no-cache">
		<meta http-equiv="expires" content="0">
		<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
		<meta http-equiv="description" content="This is my page">
		<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->

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

.middle_contacts {
	height: 125px;
	width: 95%;
	background-color: #fff;
	margin: 30px auto 0 auto;
}

.name {
	height: 60px;
	width: 95%;
	background-color: #fff;
	margin: 0px auto;
	border-bottom: 1px solid #d1d1d1;
}

.number {
	height: 60px;
	width: 95%;
	background-color: #fff;
	margin: 0px auto;
}

.name_wenzi {
	height: 60px;
	width: 15%;
	line-height: 60px;
	float: left;
	text-indent: 3px;
}

.name_shouji {
	height: 60px;
	width: 15%;
	line-height: 60px;
	float: left;
	text-indent: 3px;
}

.form {
	height: 60px;
	width: 83%;
	float: right;
}

.btn span {
	font-size: 20px;
	color: #fff;
}

.btn {
	background: #E82E2E;
	height: 40px;
	text-align: center;
	line-height: 40px;
	font-size: 20px;
	margin-top: 30px;
	border-radius: 5px;
	width: 90%;
	margin-left: 5%;
	margin-bottom: 20px;
}

#tip {
	position: relative;
	top: 20px;
	left: 4%;
	font-size: 1em;
	color: #666;
	width: 90%;
}

input {
	height: 50px;
	font-size: 18px;
	color: #8E8C8C;
	width: 80%;
	outline: none;
}

input::-webkit-input-placeholder {
	color: #ccc;
}

.item {
	background-color: #fff;
	border: 0px solid #B1AFB0;
	position: relative;
	padding-left: 10px;
	margin: 5px 10px;
}
</style>
<script type="text/javascript">
	function  check() {
			document.getElementById('table').submit();
	}
	</script>
	</head>
	<body style="background-color: #EFEFEF">
		<div class="header">
			<a href="javascript:history.go(-1)" class="logo"> <img
					src="source/images/market_left.png" class="logoleft">
			</a>
			<div class="hezi">
				<span class="title">修改个人信息</span>
			</div>

		</div>

		<div id="tip">
			<p>
				请设置并记住您的用户信息
			</p>
		</div>
		<form action="pages/front/user_update.action" id ="table" method="post">
		<div class="middle_contacts">
			<div class="name">
				<div class="name_wenzi">
					姓名: 
				</div>
				<div class="form">
					<div class="item email">
						<input type="text" name="tname"/>
					</div>
				</div>
			</div>
			<div class="number">
				<div class="name_shouji">
					手机: 
				</div>
				<div class="form">
					<div class="item email">
						<input type="text" name="mob"/>
					</div>
				</div>
			</div>
		</div>

		<div class="btn" onclick="check()" tapmode="submit-hover">
			<span>提交 </span>
		</div>
		<div class="qb_quick_tip qb_none" id="pdbubble" onClick="pdfunc()"></div>
		</form>
	</body>
	
</html>