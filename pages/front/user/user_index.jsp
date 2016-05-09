<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
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
	<meta name="viewport"
	content="width=device-width, initial-scale=1.0, user-scalable=0, minimum-scale=1.0, maximum-scale=1.0" />
	<meta name="apple-mobile-web-app-capable" content="yes" />
	<meta name="apple-mobile-web-app-status-bar-style" content="black" />
	<link rel="stylesheet" href="source/css/style.css">
	<link rel="stylesheet" href="source/css/market-footer.css">
	<link href="source/css/user-index.css" rel="stylesheet" type="text/css" />

<style>
    html {height: 100%;}
	body {height: 100%;background: #ffffff;}
	

.zhongbu {
	height: 93px;
	width: 100%;
	background-color: #E5E5E5;
}
.zb_box1 {
	float: left;
	height: 90px;
	width: 33%;
	border-right-width: 2px;
	border-right-style: solid;
	background-color: #FFF;
	border-right-color: #E5E5E5;
	text-align: center;
	line-height: 20px;
	
	
}
.zhongbu .zb_box2 {
	float: left;
	height: 90px;
	width: 33%;
	border-right-width: 2px;
	border-right-style: solid;
	border-right-color: #E5E5E5;
	background-color: #FFF;
	text-align: center;
	line-height: 20px;
}
.zhongbu .zb_box3 {
	height: 90px;
	background-color: #FFF;
	line-height: 20px;
	text-align: center;
}
.header_middle {
	background:url("source/images/fense1.png") repeat-x 0 0;
	height: 160px;
	width:100%;
	position:relative;
	
	position: relative;
}
.header_middle .middle_zhanghao p {
	font-family: Arial, Helvetica, sans-serif;
	font-size: 20px;
	color: #FFF;
}
.middle_zhanghao {
	float: left;
	height：100px;
	width: 70%;
	text-align: center;
	font-size: 20px;
	line-height: 50px;
	margin-top: 35px;
	
}
.middle_logo {
	float: left;
	margin-left: 20px;
	height: 160px;
	width: 20%;
	text-align: center;
	
}
.rt{
    height:100px;
    margin-top:30px;
}

.size{
    font-size: 16px;
    margin-top: 5px;
}
.jiage{
    font-size: 16px;
    color: red;
    margin-top: 20px;
}
.item {
	height: 60px;
	width: 100%;
	border-right-width: 1px;
	border-bottom-width: 1px;
	border-left-width: 1px;
	border-right-style: solid;
	border-bottom-style: solid;
	border-left-style: solid;
	border-right-color: #e5e5e5;
	border-bottom-color: #e5e5e5;
	border-left-color: #e5e5e5;
	line-height: 60px;
	font-size: 14px;
}
.item img {
	
	margin-top: 17px;
	margin-left: 10px;
	margin-right: 10px;
	vertical-align: top;
	
}

.youlogo {
	display: inline;
}
.wkf{
    color: #D1D2D2;
    font-size: 10px;
}
.btn span {
	font-size: 20px;
	color:#fff;
}

.btn {
    background: #82BF25;
    height: 40px;
    text-align: center; 
    line-height: 40px; 
    font-size: 20px;
    margin-top: 30px;
    border-radius: 5px;
    width:90%;
    margin-left:5%;
    margin-bottom:20px;
    }
 .null{
 position:relative;
 top:0px;
 height:60px;
 background-color:#fff;
 
 }
	
.edit{
   position: absolute;
   margin-left: 90%;
   margin-top: 10px;
   
}
</style>

  </head>
  
  <body>
    <div class="header_middle">
			<div class="middle_logo">
				<div class="rt">
					<a href="pages/front/user_updatePhotoPre.action?user.userid=${user.userid}">
						
						<img src="${ pageContext.request.contextPath }/upload/${user.photo}" width="100" height="100"/>
					</a>
				</div>
			</div>
			<div class="middle_zhanghao">
				<div class="shuzi">
					<p>${sessionScope.user.tname}</p>
				</div>
				<div class="shuzi2">
					 <p>${sessionScope.user.mob} </p>
				</div>
			</div>
			<div class="edit" onclick="javascript:modify()">
			   <a href="pages/front/user_updatePre.action?user.wid=${user.wid}"><img src="source/images/edit2.png" width="30" height="30" /></a>
			</div>

		</div>
		
		<div class="zhongbu">
		<div class="zb_box1">
			<div>
				<span class="jiage">10元</span><br />
				<p class="size">我的余额</p>
			</div>
		</div>
	<div class="zb_box2"><div><span class="jiage">&nbsp; 0个</span><br /><p class="size">我的红包</p><p class="wkf">(敬请期待)</p></div></div>
		<div class="zb_box3"><div><span class="jiage">&nbsp; 0个</span><br /><p class="size">我的萝卜丁</p></div></div>
   
</div>
<a href="pages/front/user_myAddress.action?user.userid=${user.userid }&flag=0"  class="youlogo" ><div class="item"><img src="source/images/gldz.png" width="20" height="20" />我的收货地址</div></a> 
<a href="pages/front/order_list" class="youlogo"> <div class="item"><img src="source/images/wddd1.png" width="20" height="20" />我的订单</div></a>
<a href="javascript:void()" class="youlogo" onclick="javascript:location.href='/IShangLifeWebSite/user!historybill'"><div class="item"><img src="source/images/zdcx1.png" width="20" height="20" />余额流水账</div></a>
<a href="javascript:void()" class="youlogo" onclick="javascript:location.href='/IShangLifeWebSite/user!accountRecharge'"><div class="item"><img src="source/images/zhcz1.png" width="20" height="20" />我要充值</div></a>

  </body>
</html>
