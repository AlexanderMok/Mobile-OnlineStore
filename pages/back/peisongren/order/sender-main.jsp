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
    
    <title>吃啊超市</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->
	<link rel="stylesheet" href="source/css/market-footer.css"> 
	<link rel="stylesheet" href="source/css/style.css">
	<link rel="stylesheet" href="source/css/idangerous.swiper.css">
	<link rel="stylesheet" href="source/bootstrap-3.3.4-dist/css/bootstrap.min.css">
<style>

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
  <div class="top" style="margin-left:auto;margin-right:auto;margin-top:15px;">&nbsp;订单列表</div>
  <br/>
  	<table width="90%" height="69" align="center" border="0" cellpadding="2" cellspacing="2">
   <tr align="center" style="background-color: #E3EFFB">
   <th>订单编号</th>
   <th>收货人姓名</th>
   <th>配送地址</th>
   <th>收货人电话</th>
   <th>操作</th>
   </tr>
   
   <s:iterator value="list">
   <tr align="center">
   <td><a href="pages/back/sender-vieworderbyid?id=${oid}">${orderNumber}</a></td>
   <td>${receivername}</td>
   <td>${addr}</td>
   <td>${phone}</td>
   <c:choose>
   <c:when test="${state eq '配送中'}"><td><a href="pages/back/sender-vieworderbyid?id=${oid}">去完成</a></td></c:when>
   <c:otherwise><td>-</td></c:otherwise>
   </c:choose> 
   </tr>
   </s:iterator>
  	</table>
  	<br/>
  
 <!-- 底部浮动的2个导航-->
 <div class="page">
			<a href="pages/back/sender-listordersbystate?state=8"
				class="link1">配送中</a>
			<a href="pages/back/sender-listordersbystate?state=7"
				class="link3"    >已完成</a>
</div>
  </body>
  <script type="text/javascript" src="source/js/jquery.js"></script>
<script type="text/javascript" src="source/js/jquery-1.9.1.min.js"></script>
<script type="text/javascript" src="source/js/layer.min.js"></script>
<script src="source/js/jquery.confirm.js"></script>
<script type="text/javascript" src="source/js/slider.js"></script>
<script type="text/javascript" src="source/bootstrap-3.3.4-dist/js/bootstrap.min.js"></script>
<script type="text/javascript">
$(document).ready(function() {
	$('.flexslider').flexslider({

		directionNav : false,
		pauseOnAction : false
	});
});
</script>
</html>
