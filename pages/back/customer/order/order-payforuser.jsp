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
 	<SCRIPT type="text/javascript">
 	function xiugai(){
 		var price = prompt("请输入需要退款的金额","");
 		var yy = prompt("请输入退款原因？","");
 		var ytprice = document.getElementById("ytprice").innerText;
 		var yuanyin = document.getElementById("yuanyin");
 		if(price - ytprice >0){
 			alert("退款金额不得大于订单总价");
 		}else{
 			if(confirm("你确定退款金额吗")){
 				document.getElementById("ytprice").innerHTML = price;
 				yuanyin.type="text";
 				yuanyin.value = yy;
 				var yfje = document.getElementById("yfje");
 				yfje.value = price;
 				var yuanyin1 = document.getElementById("yuanyin1");
 				yuanyin1.value = yy;
 			}
 		}
 	}
 	function tuikuan(){
 		
 		
 		if(confirm("您确定已经退款了吗？")){
 			
 			document.getElementById("form1").submit();
 			Window.location.href="";
 			}
 	}
 	</SCRIPT>
  </head>
  <body>
  	<div class="top">&nbsp;退款页面</div>
  	<div class="main">
  	
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
          <td width="37%">用户电话：</td>
          <td width="63%">${order.phone}</td>
    </tr>
  	<tr>
          <td width="37%">支付方式：</td>
          <td width="63%">${order.paystate}</td>
    </tr>
    <c:if test="${!empty order.refundreason}">
    <tr>
          <td width="37%">退款原因：</td>
          <td width="63%">${order.refundreason}</td>
    </tr>
    </c:if>
    <c:choose>
    <c:when test="${order.flag eq 1}">
	    <tr>
	          <td width="37%">订单总额:</td>
	          <td width="63%">￥${order.total}</td>
	    </tr>
	    <tr>
	          <td width="37%">应退总额:</td>
	        <td width="63%">￥<div id="ytprice">${order.total}</div>&nbsp;&nbsp;&nbsp;&nbsp;<input type = "button" value="修改 " onclick="xiugai()"/><input type="hidden" id="yuanyin" name="yingfuyuanyin"/></td>
	    </tr>
    </c:when>
    <c:when test="${order.flag eq 2}">
     	<tr>
	          <td width="37%">订单总额:</td>
	          <td width="63%">￥${order.pinId.nowPrice}</td>
	    </tr>
	    <tr>
	          <td width="37%">应退总额:</td>
	          <td width="63%">￥<div id="ytprice">${order.pinId.nowPrice}</div>&nbsp;&nbsp;&nbsp;&nbsp;<input type = "button" value="修改 " onclick="xiugai()"/><input type="hidden" id="yuanyin" name="yingfuyuanyin"/></td>
	    </tr>
    </c:when>
    </c:choose>
    
 	</table>
 	<br/><br/>
    
    <center>  
    <form action="pages/back/order_updatestate?state=4" method="post" id="form1">
    <input type="hidden"  id="yfje" name="yingfumoney"/>
    <input type="hidden"  id="yuanyin1" name="yingfureason"/>
    <input type="hidden" name="id" value="${order.oid}"/>
    <input type="submit" value="退款成功"/>
    </form>
    
  </center>
 
  </div>
  	<div class="footer"><jsp:include page="/pages/back/copyright.jsp"/></div>
  </body>
</html>
