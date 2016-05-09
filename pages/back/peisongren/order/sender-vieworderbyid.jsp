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
 			for(i=0;i<aTr.length;i++){
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
  	<div class="top">&nbsp;订单详情</div>
  	<div class="main">
  	<form action="pages/back/order_update" method="post">
  	<input type="hidden" value="${order.oid}"/>
  	<table width="77%" height="69" align="center" border="0" cellpadding="2" cellspacing="2">
  	<tr>
          <td width="37%">订单编号：</td>
          <td width="63%">${order.orderNumber}</td>
    </tr>
   <tr>
          <td width="37%">购买用户：</td>
          <td width="63%">${order.user.tname}</td>
    </tr>
    <tr>
          <td width="37%">收货人电话：</td>
          <td width="63%">${order.phone}</td>
    </tr>
    <tr>
          <td width="37%">收货人姓名：</td>
          <td width="63%">${order.receivername}</td>
    </tr>
    <tr>
          <td width="37%">配送地址：</td>
          <td width="63%">${order.addr}</td>
    </tr>
    <tr>
          <td width="37%">下单时间：</td>
          <td width="63%">${order.ordertime.buildtime}</td>
    </tr>
  	<tr>
          <td width="37%">订单状态：</td>
          <td width="63%">${order.state}</td>
    </tr>
	<c:if test="${order.state eq '交易完成'}">
    	<tr>
          <td width="37%">交易完成时间：</td>
          <td width="63%">${order.ordertime.finishtime}</td>
    	</tr>
    </c:if>
    <c:if test="${order.state eq '交易完成' or order.state eq '已发货'}">
    	<tr>
          <td width="37%">配送人姓名：</td>
          <td width="63%">${order.peisongren.psrname}</td>
	    </tr>
	    <tr>
	      <td width="37%">配送人联系方式：</td>
	      <td width="63%">${order.peisongren.psrtel}</td>
	    </tr>
    </c:if>
    
  	<c:choose>
    <c:when test="${order.flag eq 1}">
    <tr>
          <td width="37%">订单总额:</td>
          <td width="63%">￥${order.total}</td>
    </tr>
    </c:when>
    <c:when test="${order.flag eq 2}">
    <tr>
          <td width="37%">订单总额:</td>
          <td width="63%">￥${order.pinId.nowPrice}</td>
    </tr>
    </c:when>
    </c:choose>
    <tr>
          <td width="37%">买家留言:</td>
          <td width="63%">${order.words}</td>
    </tr>
    <tr>
          <td width="37%">商品明细:</td>
          <td width="63%"></td>
    </tr>
 	</table>
 	<br/>
 		<table width="77%" height="69" align="center" border="0" cellpadding="2" cellspacing="2">
 		<c:choose>
 		<c:when test="${order.flag eq 1}">
 		<tr align="center">
 			<td>商品名</td>
 			<td>数量</td>
 			<td>小计</td>
 		</tr>
 		<s:iterator value="set">
 		<tr align="center" height="50">
 			<td>${itemname}</td>
 			<td>${count}</td>
 			<td>${subtotal}</td>
 		</tr>
 		</s:iterator>
 		</c:when>
 		<c:otherwise>
 		<tr align="center">
 			<td>商品名</td>
 			<td>原价</td>
 			<td>拼单价</td>
 			<td>要求人数</td>
 			<td>现人数</td>
 		</tr>
 		<tr align="center" height="50">
 			<td>${order.pinId.tblItems.itemName}</td>
 			<td>${order.pinId.prePrice}</td>
 			<td>${order.pinId.nowPrice}</td>
 			<td>${order.pinId.totalCount}</td>
 			<td>${order.pinId.nowCount}</td>
 		</tr>
 		</c:otherwise>
 		</c:choose>
 		</table>
 		<br/>
 		 </form>
    <center>  
 	
   <c:if test="${order.state eq '配送中'}"><td><a href="pages/back/sender-updatestate?id=${order.oid}" onclick="javascript:return confirm('您确定已送货到家了吗？')">已完成</a></td></c:if>
  </center>
 
  </div>
  	<div class="footer"><jsp:include page="/pages/back/copyright.jsp"/></div>
  </body>
</html>
