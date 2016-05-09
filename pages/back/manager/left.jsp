<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>My JSP 'left.jsp' starting page</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->
	<link href="source/back/css/left.css" type="text/css" rel="stylesheet" />
	<script src="source/back/js/jquery-1.4.2.min.js"></script>
	<script src="source/back/js/left.js"></script>
  </head>
 <body>
<div class="all"><img src="source/back/images/menu_plus.gif" id="allmenu" /></div>
<div class="main">
<div class="menus">
<ul id="menu">

	<li class="title"><a href="javascript:;" target="mainFrame"><b>用户管理</b></a>
	<ul class="menuhide">
		<li><img src="source/back/images/menu_arrow.gif" />&nbsp;<a
			href="pages/back/manager-findalluser" target="mainFrame">查看用户</a></li>
	</ul>
	</li>
	
	<li class="title"><a href="javascript:;" target="mainFrame"><b>人事管理</b></a>
	<ul class="menuhide">
		<li><img src="source/back/images/menu_arrow.gif" />&nbsp;<a
			href="pages/back/manager-findallsender" target="mainFrame">查询所有配送员</a></li>
		<li><img src="source/back/images/menu_arrow.gif" />&nbsp;<a
			href="pages/back/manager/sender/manager-addsender.jsp" target="mainFrame">添加配送员</a></li>
		<li><img src="source/back/images/menu_arrow.gif" />&nbsp;<a
			href="pages/back/manager-findallcustomerservice" target="mainFrame">查询所有客服</a></li>
		<li><img src="source/back/images/menu_arrow.gif" />&nbsp;<a
			href="pages/back/manager/customerservice/manager-addcustomerservice.jsp" target="mainFrame">添加客服</a></li>
	</ul>
	</li>
	
	<li class="title"><a href="javascript:;" target="mainFrame"><b>系统管理</b></a>
	<ul class="menuhide">
		<li><img src="source/back/images/menu_arrow.gif" />&nbsp;<a
			href="listlog.action" target="mainFrame">查看日志</a></li>
		<li><img src="source/back/images/menu_arrow.gif" />&nbsp;<a
			href="listuser.action" target="mainFrame">查询用户</a></li>
		<li><img src="source/back/images/menu_arrow.gif" />&nbsp;<a
			href="listallrole.action" target="mainFrame">添加用户</a></li>
	</ul>
	</li>
</ul>
</div>
</div>
</body>
</html>
