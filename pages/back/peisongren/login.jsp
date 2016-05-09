<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags" %>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
   <link href="source/css/buju.css" type="text/css" rel="stylesheet"/>
	<link href="source/js/confirm/stylenew.css" rel="stylesheet"/>
	<link href="source/js/confirm/confirm.css" rel="stylesheet"/>
	<title>吃啊超市</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->
  </head>
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
		 
		#tip{
		   position:relative;
		   top:20px;
		   left:4%;
		   font-size:1em;
		   color:#666;
		   width:90%;
		}
		.logo{
		    display: block;
		}
		.logo1{
		    float: left;
		    margin-left: 10px;
		    margin-top:6px;
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
		.form{
		    margin-top:10%;
		}
		
		input {height: 50px;font-size: 18px;color: #8E8C8C;width: 80%;outline: none;background-color: #EFEFEF }
		input::-webkit-input-placeholder {color: #ccc;}
		.item {background-color: #EFEFEF; border-bottom: 1px solid #B1AFB0;position: relative;padding-left: 10px;margin: 10px 10px;}
			/*.email, .passwd, .btn {margin:3px 10px;}*/
			.btn {margin:3px 10px;}
			.btn {background: #E82E2E;height: 40px; text-align: center; line-height: 40px; font-size: 20px;margin-top: 40px;border-radius: 5px;}
			.btn span {color: #fff;}
  </style>
  <body>
  <div class="header">      
     <div class="title">验证信息</div>
  </div>
  <div id="tip">
  <p>系统获取不到您的历史信息，请输入您的姓名及手机号登陆:</p>
 </div> 
 <div class="form" >
 <s:actionerror/> <br/>
 <s:form action="pages/back/sender-chklogin" method="post" id ="table" theme="simple">
		<div class="item email">
			<s:textfield name="psrname" placeholder="用户名" id="email" ></s:textfield>
		</div>
		<div class="item passwd">
			<s:textfield name="psrtel" placeholder="手机号码" id="passwd" ></s:textfield>
		</div>
		<center>
		<s:submit value="提交"></s:submit>
		</center>
	</s:form>	
		<div class="btn" onclick="javascrip:check()" ><span></span></div>		
			
</div>
  
  </body>
    <script src="source/js/confirm/jquery.js"></script>
	<script src="source/js/confirm/jquery-1.4.2.min.js"></script>
	<script src="source/js/confirm/jquery.confirm.js"></script>
	<script type="text/javascript">
	function  check() {
		if ($("#email").val() == "") {
			$.confirm({
				'message'	: "请输入用户名",
				'buttons'	: {
					'确定'	: {
						'action': function(){}
						}
					}
			});
			return false;
		}else if ($("#passwd").val() == "") {
			$.confirm({
				'message'	: "请输入手机号",
				'buttons'	: {
					'确定'	: {
						'action': function(){}
						}
					}
			});
			return false;
		}else{
			document.getElementById('table').submit();
		}
	}
	</script>
</html>
