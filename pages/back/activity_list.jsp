<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="s" uri="/struts-tags" %>

<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>活动列表</title>
    
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
  
  <body>
<div class="top">查看全部活动</div>
  	<div class="main">

<table width="90%" height="69" align="center" border="0" cellpadding="2" cellspacing="2">
       <tr align="center">
   <th>活动编号</th>
   <th>活动名称</th>
   <th>开始时间</th>
   <th>结束时间</th>
   <th>折扣</th>
   <th>满减数量</th>
   <th>满减价格</th>
   <th>活动类型</th>
   <th>操作</th>
   </tr>
   
   
   
    <s:iterator value="activityList">
     	   
			<tr>
				  <td><s:property value="activityId"/></td>
				  <td><s:property value="activityName"/></td>
				  <td><s:property value="startTime"/></td>
				  <td><s:property value="endTime"/></td>
				  <td><s:property value="discount"/></td>
				  <td><s:property value="fullCount"/></td>
				  <td><s:property value="substractCount"/></td>
				  <td><s:property value="tblActivityType.typeName"/></td>
				  <td><a href="pages/back/operation!preModify.action?tblActivity.activityId=<s:property value="activityId"/>">修改</a>&nbsp;&nbsp;&nbsp;&nbsp;
				  	  <a href="pages/back/modifyActivity!findAllItems.action?activId=<s:property value="activityId"/>">添加商品</a>&nbsp;&nbsp;&nbsp;&nbsp;
				  </td>
			</tr>   
	</s:iterator> 
  	</table>
  
  	<br/>
  	 <center>
    	<jsp:include page="/split_page_plugin.jsp">
				<jsp:param value="${pageNo}" name="pageNo"/>
				<jsp:param value="${pageSize}" name="pageSize"/>
				<jsp:param value="${column}" name="column"/>
				<jsp:param value="${keyword}" name="keyword"/>
				<jsp:param value="${count}" name="count"/>
				<jsp:param value="pages/back/activity!findAllActivity.action" name="URL"/>
				<jsp:param value="activityName:活动名称|tblActivityType.typeName:活动类型" name="columnData"/>
				<jsp:param value="1" name="pageStyle"/>
			</jsp:include>
		</center>
		
  </div>
  	<div class="footer"><jsp:include page="/pages/back/copyright.jsp"/></div>

  
	</body>
</html>
