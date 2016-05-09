<%@ page language="java" import="java.util.*,java.text.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>My JSP 'top.jsp' starting page</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->
	<link href="source/back/css/top.css" type="text/css" rel="stylesheet" />
	<script type="text/javascript">
		function startTime()
		{
		var today=new Date()
		var h=today.getHours()
		var m=today.getMinutes()
		var s=today.getSeconds()
		m=checkTime(m)
		s=checkTime(s)
		document.getElementById('txt').innerHTML=h+":"+m+":"+s
		t=setTimeout('startTime()',500)
		}
		
		function checkTime(i)
		{
		if (i<10) 
		  {i="0" + i}
		  return i
		}
	</script>
  </head>
  <body onload="startTime()">
	<div class="main">
	<div class="top_left"><img src="source/back/images/header_left.jpg"/></div>
	<div class="center">
	<span style="color:#FFFFFF;">
	<font color="red" size="3">${sessionScope.oncustomerservice.csname}</font>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<font color="red" size="3">客服</span>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
	当前日期:<font size="3" color="red"><%=new SimpleDateFormat("yyyy-MM-dd").format(new Date())%></font>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;当前时间:<font size="3" color="red"><span id="txt"></span></font>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
	<a href="pages/back/customer-logout" onclick="javascript:return confirm('您确定已送货到家了吗？')" target="_parent">退出系统</a>	 
	</div>
	<div class="top_right"><img src="source/back/images/header_right.jpg"/></div>
	</div>
</body>
</html>