<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@taglib uri="/struts-tags" prefix="s"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>My JSP 'list.jsp' starting page</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->
 	<link rel="stylesheet" type="text/css" href="source/back/css/general.css" />
 	<style type="text/css">
 	.td2 {
	text-align: center;
	font-weight: bold;
	color: #1C289F;
	font-size: 18px;
}
    </style>
 	<script>
 		window.onload=function(){
 			var aTr = document.getElementsByTagName("tr");
 			for(i=1;i<aTr.length;i++){
 				if(i%2==0){
 					aTr[i].style.backgroundColor="#ccc";
 				}
 			}
 			for(i=0;i<aTr.length;i++){
 				aTr[i].onmouseover=function(){
 					oColor=this.style.backgroundColor;
 					this.style.backgroundColor="#ff0";
 				}
 				aTr[i].onmouseout=function(){
 					this.style.backgroundColor=oColor;
 				}
 			}
 		}
 	</script>
  </head>
  <body onload="onload()">
  	<div class="top">&nbsp;配送员列表</div>
  	<div class="main">
  	<table width="90%" height="69" align="center" border="0" cellpadding="2" cellspacing="2">
       <tr align="center">
   <th>编号</th>
   <th>用户真实姓名</th>
   <th>用户电话</th>
   <th>注册时间</th>
   </tr>
   
   <s:iterator value="userList">
   <tr align="center">
   <td>${userid}</td>
   <td>${tname}</td>
   <td>${mob}</td>
   <td>${addDate}</td>
   </tr>
   </s:iterator>
  	</table>
  	<center>
  	<jsp:include page="/split_page_plugin.jsp">
				<jsp:param value="${pageNo}" name="pageNo"/>
				<jsp:param value="${pageSize}" name="pageSize"/>
				<jsp:param value="${column}" name="column"/>
				<jsp:param value="${keyword}" name="keyword"/>
				<jsp:param value="${count}" name="count"/>
				<jsp:param value="pages/back/manager-findalluser!findalluser.action" name="URL"/>
				<jsp:param value="mob:手机号码|tname:姓名" name="columnData"/>
				<jsp:param value="1" name="pageStyle"/>
	</jsp:include>
	</center>
  	</div>
  	<br/>
  	<div class="footer"><jsp:include page="/pages/back/copyright.jsp"/></div>
  </body>
</html>
