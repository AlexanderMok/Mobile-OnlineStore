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
    
    <title>商品列表</title>
    
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
  		<th>商品编号</th>
  		<th>商品名称</th>
  		<th>商品种类</th>
  		<th>商品价格</th>
  		<th>活动名称</th>
  		<th>参加该活动</th>
  	</tr>
     <s:iterator value="itemsList" status="p">
			<tr>
				  <td><s:property value="itemId"/></td>
				  <td><s:property value="itemName"/></td>
				  <td><s:property value="tblCatagorgy.catagorgyName"/></td>
				  <td><s:property value="retailPrice"/></td>
				  <td><s:property value="tblActivity.activityName"/></td>
				  <td>
					  <a href="pages/back/addActivity!addActivityInItems.action?tblItems.itemId=<s:property value="itemId"/>">确定参加</a>
					  <a href="pages/back/addActivity!removeActivityInItems.action?tblItems.itemId=<s:property value="itemId"/>">取消该活动</a>
				  </td>
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
				<jsp:param value="pages/back/modifyActivity!findAllItems.action" name="URL"/>
				<jsp:param value="itemName:商品名称|tblCatagorgy.catagorgyName:商品种类" name="columnData"/>
				<jsp:param value="1" name="pageStyle"/>
			</jsp:include>
		</center>
    
	</div>
		<div class="footer"><jsp:include page="/pages/back/copyright.jsp"/></div>
  </body>
  
</html>
