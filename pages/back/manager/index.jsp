<%@ page language="java" import="java.util.*" pageEncoding="GBK"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>��ϫ-�ֿ����ϵͳ</title>
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->
  </head>
  <frameset rows="60,*" cols="*" frameborder="no" border="0" framespacing="0">
  <frame src="pages/back/manager/top.jsp" name="topFrame" scrolling="No" noresize="noresize" id="topFrame" title="topFrame" />
  <frameset cols="170,*" frameborder="no" border="0" framespacing="0">
    <frame src="pages/back/manager/left.jsp" name="leftFrame" scrolling="yes" noresize="noresize" id="leftFrame" title="leftFrame" />
    <frame src="pages/back/manager/main.jsp" name="mainFrame" id="mainFrame" title="mainFrame" />
  </frameset>
</frameset>
<noframes>
  <body>
  </body>
</html>
