<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib uri="/struts-tags" prefix="s"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>My JSP 'findgoods.jsp' starting page</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->
	<script>  
		function set(id,name){  
		    var data1 = window.opener.assignment(id,name);//给父类赋值  
		    window.close();  
		}  
	</script>  
  </head>
  
  <body>
    <form action="pages/back/searchItemByGroup!findByKeyWords.action" method="post">
    <input name="keyWords"/>
    <input type="submit" value="搜索"/><font color="red" size="2">请输入关键字搜索商品</font>
    </form>
    
    <c:choose>
    <c:when test="${keyWords eq null}"></c:when>
    <c:otherwise>
    <form action=""  method="post">
    <table border="1">
    <tr align="center">
    <th>编号</th>
    <th>商品名</th>
    <th>操作</th>
    </tr>
    <s:iterator value="findByNameList">
    <tr align="center">
    	<td width="10%">${itemId }</td>
    	<td width="20%">${itemName}</td>
    	<td width="10%">
<input type="button" name="btn" value="选中" onclick="set(${itemId},'${itemName}')"/>   
    	</td>
    	
    </tr>
    </s:iterator>
    </table>
    </form>
    </c:otherwise>
   	</c:choose>
  </body>
</html>
