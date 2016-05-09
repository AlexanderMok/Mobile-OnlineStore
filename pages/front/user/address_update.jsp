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

.top_contacts {
	height: 40px;
	width: 95%;
	background-color: #fff;
	margin: 10px auto;
	line-height: 40px;
	text-indent: 1em;
}

.middle_contacts {
	height: 130px;
	width: 95%;
	background-color: #fff;
	margin: 10px auto 0 auto;
	position: relative;
}

.middle_contacts_2 {
	height: 165px;
	width: 95%;
	background-color: #fff;
	margin: 10px auto 0 auto;
	position: relative;
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

.number2 {
	height: 40px;
	width: 95%;
	background-color: #fff;
	margin-top: 10px;
	margin-left: 2%;
	position: absolute;
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

.ziti {
	margin-top: -27px;
	display: block;
	margin-left: 25%;
	position: absolute;
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

.morendizhi {
	margin-top: 5px;
}

.chk_1,.chk_2,.chk_3,.chk_4 {
	display: none;
}

/*******STYLE 3*******/
.chk_3+label {
	background-color: #fafbfa;
	padding: 9px;
	border-radius: 50px;
	display: inline-block;
	position: relative;
	margin-right: 30px;
	-webkit-transition: all 0.1s ease-in;
	transition: all 0.1s ease-in;
	width: 40px;
	height: 15px;
}

.chk_3+label:after {
	content: ' ';
	position: absolute;
	top: 0;
	-webkit-transition: box-shadow 0.1s ease-in;
	transition: box-shadow 0.1s ease-in;
	left: 0;
	width: 100%;
	height: 100%;
	border-radius: 100px;
	box-shadow: inset 0 0 0 0 #eee, 0 0 1px rgba(0, 0, 0, 0.4);
}

.chk_3+label:before {
	content: ' ';
	position: absolute;
	background: white;
	top: 1px;
	left: 1px;
	z-index: 999999;
	width: 31px;
	-webkit-transition: all 0.1s ease-in;
	transition: all 0.1s ease-in;
	height: 31px;
	border-radius: 100px;
	box-shadow: 0 3px 1px rgba(0, 0, 0, 0.05), 0 0px 1px rgba(0, 0, 0, 0.3);
}

.chk_3:active+label:after {
	box-shadow: inset 0 0 0 20px #eee, 0 0 1px #eee;
}

.chk_3:active+label:before {
	width: 37px;
}

.chk_3:checked:active+label:before {
	width: 37px;
	left: 20px;
}

.chk_3+label:active {
	box-shadow: 0 1px 2px rgba(0, 0, 0, 0.05), inset 0px 1px 3px
		rgba(0, 0, 0, 0.1);
}

.chk_3:checked+label:before {
	content: ' ';
	position: absolute;
	left: 26px;
	border-radius: 100px;
}

.chk_3:checked+label:after {
	content: ' ';
	font-size: 1.5em;
	position: absolute;
	background: #4cda60;
	box-shadow: 0 0 1px #4cda60;
}
</style>
	</head>
	<body style="background-color: #EFEFEF">
		<div class="header">
			<a href="javascript:history.go(-1)" class="logo"> <img
					src="source/images/market_left.png" class="logoleft">
			</a>
			<div class="hezi">
				<span class="title">编辑收货地址</span>
			</div>
			<a href="../first_catagorgy.jsp" class="logo"> <img
					src="source/images/home-2.png" width="20" height="39"
					class="logoright">
			</a>
		</div>
		<s:form action="user_updateAddress.action" id ="table" namespace="/pages/front" method="post" theme="simple">
		<div class="middle_contacts">
			<div class="name">
				<div class="name_wenzi">
					姓名
				</div>
				<div class="form">
					<div class="item email">
						<s:textfield name="address.receiverName" placeholder="请填写收货人姓名"
							id="email"></s:textfield>
					</div>
				</div>
			</div>
			<div class="number">
				<div class="name_shouji">
					手机
				</div>
				<div class="form">
					<div class="item email">
						<s:textfield name="address.receiverPhone"
							placeholder="请填写收货人的手机号码" id="email">
						</s:textfield>
					</div>
				</div>

			</div>
		</div>

		<div class="middle_contacts_2">
			<div class="number2">

				<input type="hidden" value='0' name="dtype" id="dtype" />
				<div class="morendizhi" style="width: 80%; height: 80%">
					<input type="checkbox" id="checkbox_c2" class="chk_3"
							name="flag" value=0 onclick="this.value=(this.value==0)?1:0" />
					<label for="checkbox_c2"></label>
				</div>
				<span class="ziti">设为默认地址</span>
				<div class="name">
					<div class="name_wenzi">
						地址
					</div>
					<div class="form">
						<div class="item email">
							<s:textfield name="address.addr" placeholder="请填写收货地址" id="email">
							</s:textfield>
							<input type="hidden" placeholder="请填写收货地址" id="oldshouhuodizhi"
								name="oldshouhuodizhi" value='' />
						</div>
					</div>
				</div>

			</div>
		</div>
		<div class="btn" onclick="check()" tapmode="submit-hover">
			<span type="submit">完&nbsp;&nbsp;成</span>
		</div>
		
		<s:hidden name="address.addrId"></s:hidden>
		<%--<center><s:submit  value="提交"></s:submit><br/>--%>
		<br/></center>
	</s:form>
	
	<div class="btn" onclick="check()" tapmode="submit-hover">
		<a href="pages/front/user_deleteAddress.action?address.addrId=${address.addrId}">
			<span type="submit">删&nbsp;&nbsp;除</span>
		</a>
	</div>
	${addrId}
	</body>
	<script type="text/javascript">
	function  check() {
			document.getElementById('table').submit();
	}
	</script>
</html>
