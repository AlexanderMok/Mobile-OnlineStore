<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib uri="/struts-tags" prefix="s"%>

<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>My JSP 'addgoods.jsp' starting page</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->
	<link rel="stylesheet" type="text/css" href="source/back/css/general.css" />
	<script src="source/back/js/jquery-1.10.2.js"></script>
	<script src="source/back/js/ajaxfileupload.js"></script>
	<script type="text/javascript" src="source/back/js/ajaxupload.js"></script>
	<script type="text/javascript" src="source/back/js/upload.js"></script>
  </head>
  <body>
  	<div class="top">修改配送人</div>
  	<div class="main">
  	<form action="pages/back/sender-update" method="post">
  	<table width="77%" height="69" align="center" border="0" cellpadding="2" cellspacing="2">
        <tr>
          <th>配送人名：</th>
          <td>${peisongren.psrname}</td>
        </tr>
        <tr>
          <th>配送人联系方式：</th>
          <td><input name="peisongren.psrtel" value="${peisongren.psrtel}"/></td>
        </tr>
       </table>
        <center><input type="submit" value="修改" onclick="javascript:return confirm('您确定修改好了吗？')"/></center>
  	</form>
  	</div>
  	<div class="footer"><jsp:include page="/pages/back/copyright.jsp"/></div>
  </body>
</html>
