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
 	<script>
 		function onload(){
 			if(${cstixing}){
 				alert("该订单已有其他客服处理!");
 			}
 			
 		}
 	</script>
  </head>
  <body onload="onload()">
  	<div class="top">&nbsp;订单列表</div>
  	<div class="main">
  	<center><a href="pages/back/storekeeper-findordersbystateuszdtime?flagg=1"><font color="red">立即发货订单</font></a></center>
  	<table width="90%" height="69" align="center" border="0" cellpadding="2" cellspacing="2">
       <tr align="center">
   <th>选中</th>
   <th>订单编号</th>
   <th>用户名</th>
   <th>下单时间</th>
   <th>期望发送时间</th>
   <th>订单状态</th>
   <th>仓管员</th>
   <th>操作</th>
   </tr>
   
   <s:iterator value="list">
   <tr align="center">
   <td>
   <c:choose>
   <c:when test="${state eq '已付款' and inmanage eq 0}">
   	<a href="pages/back/storekeeper_updateInmanage?id=${oid}&inmanage=${inmanage}&flag=${flagg}"><img src="source/back/images/weixuanzhong.png"></img></a>
   </c:when>
   <c:when test="${state eq '已付款' and inmanage eq 1 and sessionScope.onstorekeeper.userName eq storekeeper.userName }">
   	<a href="pages/back/storekeeper_updateInmanage?id=${oid}&inmanage=${inmanage}&flag=${flagg}"><img src="source/back/images/yixuanzhong.png"></img></a>
   </c:when>
   <c:otherwise>-</c:otherwise>
   </c:choose>
   </td>
   
   <td><a href="pages/back/storekeeper_vieworderbyid1?id=${oid}">${orderNumber}</a></td>
   <td>${user.tname}</td>
   <td>${ordertime.buildtime}</td>
   <td>${uszdday}${uszdtime}</td>
   <td>${state}</td>
   <td>${storekeeper.userName}</td>
   <c:choose>
   <c:when test="${state eq '已付款' and inmanage eq 1 and sessionScope.onstorekeeper.userName eq storekeeper.userName}"><td><a href="pages/back/storekeeper_vieworderbyid?id=${oid}">发货</a></td></c:when>
   <c:otherwise><td>-</td></c:otherwise>
   </c:choose>
   </tr>
   </s:iterator>
  	</table>
  	<%--<jsp:include page="/split_page_plugin.jsp">
				<jsp:param value="${pageNo}" name="pageNo"/>
				<jsp:param value="${pageSize}" name="pageSize"/>
				<jsp:param value="${column}" name="column"/>
				<jsp:param value="${keyword}" name="keyword"/>
				<jsp:param value="${count}" name="count"/>
				<jsp:param value="order_list!orderList.action" name="URL"/>
				<jsp:param value="orderNumber:订单编号|phone:手机号码" name="columnData"/>
				<jsp:param value="1" name="pageStyle"/>
			</jsp:include>
  	</div>
  	<br/>
  	<jsp:include page="/split_page_plugin.jsp">
				<jsp:param value="${pageNo}" name="pageNo"/>
				<jsp:param value="${pageSize}" name="pageSize"/>
				<jsp:param value="${column}" name="column"/>
				<jsp:param value="${keyword}" name="keyword"/>
				<jsp:param value="${count}" name="count"/>
				<jsp:param value="order_list!orderList.action" name="URL"/>
				<jsp:param value="orderNumber:订单编号|phone:手机号码" name="columnData"/>
				<jsp:param value="1" name="pageStyle"/>
			</jsp:include>
  	--%><div class="footer"><jsp:include page="/pages/back/copyright.jsp"/></div>
  </body>
</html>
