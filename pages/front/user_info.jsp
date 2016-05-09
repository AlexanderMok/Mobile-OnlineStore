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
    
    <title>查看用户信息</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->

  </head>
  
  <body>
  <center>
  	<s:form action="user!updatePre.action" method="post" theme="simple" namespace="/pages/back" enctype="multipart/form-data">
  		<table border="1">
  			<tr>
  				<td>姓名</td>
  				<td>用户ID</td>
  				<td>联系方式</td>
  				<td>默认地址</td>
  				<td>邮箱</td>
  				<td>图片</td>
  			</tr>
  			<tr>
  				<td><s:property value="user.tname"/></td>
  				<td><s:property value="user.userid"/></td>
  				<td><s:property value="user.mob"/></td>
  				<td>
  					<%--<s:select list="allAddress" name="user.address.addrId" listKey="addrId" listValue="addr">
  					</s:select>	--%>
  					<s:property value="address.addr"/>
  				</td>
  				<td><s:property value="user.userEmail"/></td>
  				<td>
  					<img src="${ pageContext.request.contextPath }/upload/${user.photo}" width="100" height="75"/>
  				</td>
  			</tr>
  		</table>
  		<s:hidden name="user.userid"></s:hidden><br/>
  		<s:hidden name="address.user.userid"></s:hidden>
  		<s:hidden name="address.flag"></s:hidden>
  		<s:submit value="编辑"></s:submit>	
 	</s:form>
  </center>
  </body>
</html>
