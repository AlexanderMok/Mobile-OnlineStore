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
    
    <title></title>
    
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
   <th>团购编号</th>
   <th>团购名称</th>
   <th>开始时间</th>
   <th>结束时间</th>
   <th>原价</th>
   <th>现价</th>
   <th>团购数量</th>
   <th>目前数量</th>
   <th>目前状态</th>
   <th>操作</th>
   </tr>
   
   
   
    <s:iterator value="findAllGroupList">
     	   
			<tr>
				  <td><s:property value="id"/></td>
				  <td><s:property value="tblItems.itemName"/></td>
				  <td><s:property value="startTime"/></td>
				  <td><s:property value="endTime"/></td>
				  <td><s:property value="prePrice"/></td>
				  <td><s:property value="nowPrice"/></td>
				  <td><s:property value="totalCount"/></td>
				  <td><s:property value="nowCount"/></td>
				  <td>
				  <c:choose>
				  <c:when test="${state eq 1}">未进行</c:when>
				  <c:when test="${state eq 0}">进行中</c:when>
				  </c:choose>
				  </td>
				  <td>
				 <a href="pages/front/grouppur!cancelGroup.action?tblGroupPurchase.tblItems.itemId=<s:property value="tblItems.itemId"/>" onclick="javascript:return confirm('您确定要取消吗？')">取消</a>
			 	 <a href="pages/front/grouppur!preModifyGroup.action?tblGroupPurchase.id=<s:property value="id"/>">修改</a>
				 </td>
			</tr>   
	</s:iterator> 
  	</table>
  
  	<br/>
 </div>
 <div class="footer"><jsp:include page="/pages/back/copyright.jsp"/></div>
  </body>
</html>
