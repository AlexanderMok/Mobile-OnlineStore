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
	
	<li class="title"><a href="javascript:;" target="mainFrame"><b>商品活动管理</b></a>
	<ul class="menuhide">
		<li><img src="source/back/images/menu_arrow.gif" />&nbsp;<a
			href="pages/back/activity!findAllActivity.action" target="mainFrame">查看全部商品活动</a></li>
			<li><img src="source/back/images/menu_arrow.gif" />&nbsp;<a
			href="pages/back/operation!preAddActivity.action" target="mainFrame">添加新活动</a></li>
	</ul>
	</li>
	
	<li class="title"><a href="javascript:;" target="mainFrame"><b>拼团购管理</b></a>
	<ul class="menuhide">
		<li><img src="source/back/images/menu_arrow.gif" />&nbsp;<a
			href="pages/front/grouppur!findAllGroup.action" target="mainFrame">查看全部团购活动</a></li>
			<li><img src="source/back/images/menu_arrow.gif" />&nbsp;<a
			href="pages/back/group_add.jsp" target="mainFrame">添加新团购</a></li>
	</ul>
	</li>
	
	<li class="title"><a href="javascript:;" target="mainFrame"><b>订单管理</b></a>
	<ul class="menuhide">
		<li><img src="source/back/images/menu_arrow.gif" />&nbsp;<a
			href="pages/back/order_list?flagg=0" target="mainFrame">订单列表</a></li>
	</ul>
	</li>
	
	<li class="title"><a href="javascript:;" target="mainFrame"><b>配送人管理</b></a>
	<ul class="menuhide">
		<li><img src="source/back/images/menu_arrow.gif" />&nbsp;<a
			href="pages/back/sender-list" target="mainFrame">查询所有配送人</a></li>
		<li><img src="source/back/images/menu_arrow.gif" />&nbsp;<a
			href="pages/back/customer/sender/sender-addsender.jsp" target="mainFrame">添加配送人</a></li>
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
