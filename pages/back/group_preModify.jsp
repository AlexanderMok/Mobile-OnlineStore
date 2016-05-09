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
	<script src="source/back/js/jquery-1.10.2.js"></script>
	<script src="source/back/js/ajaxfileupload.js"></script>
	<script type="text/javascript" src="source/back/js/ajaxupload.js"></script>
	<script type="text/javascript" src="source/back/js/upload.js"></script>
	
	
	
	<script type="text/javascript">
	function f(){
		var discount = document.getElementById("full").value;
		if(discount<0){
			alert("你修改的数值不符合规定！");
			document.getElementById("full").value="";
		}
	}
	</script>
	
	<script type="text/javascript">
	function p(){
		var price = document.getElementById("price").value;
		var full = document.getElementById("full").value;
		if(!(full-price>0) || price<0){
			alert("你修改的数值不符合规定！");
			document.getElementById("price").value="";
		}
	}
	</script>
	
	<script type="text/javascript">
	function biaojiao(){
		var start = document.getElementById("starttime").value;
		var end = document.getElementById("endtime").value;
		var date1 = new Date(start);
		var date2 = new Date(end);
		var s1 = date1.getTime(),s2 = date2.getTime();
		var total = (s2 - s1)/1000;
		if(!(total>0)){
			alert("结束时间不能早于开始时间！");
		}
	}
	</script>
	
	<script type="text/javascript">
	function n(){
		var discount = document.getElementById("person").value;
		if(discount<0 || !(discount%1)==0){
			alert("你修改的数值不符合规定！");
			document.getElementById("person").value="";
		}
	}
	</script>
	
	<script type="text/javascript">
	function s(){
		var state = document.getElementById("state").value;
		if(!((parseInt(state) == 0)||(parseInt(state)==1))){
			alert("你修改的数值不符合规定！");
			document.getElementById("state").value="";
		}
	}
	</script>
	
  </head>
  
  <body>
   	<div class="top">修改团购</div>
  	<div class="main">
  			
  	
  	
 	 <form action="pages/front/grouppur!modifyGroup.action" method="post">  	
 	 	<table width="77%" height="69" align="center" border="0" cellpadding="2" cellspacing="2">
 	 	
        
        <tr>
          <th>商品名称：</th>
          <td><input disabled="true" value="${tblGroupPurchase.tblItems.itemName}"/></td>
        </tr>
        
        
        <tr>
          <th>开始时间：</th>
          <td><input name="tblGroupPurchase.startTime" id="starttime" value="${tblGroupPurchase.startTime}"/></td>
        </tr>
        <tr>
          <th>结束时间：</th>
          <td>
          <input name="tblGroupPurchase.endTime" id="endtime" onblur="biaojiao()"  value="${tblGroupPurchase.endTime}"/>
          </td>
        </tr>
        <tr>
          <th>原&nbsp;&nbsp;价：</th>
          <td><input name="tblGroupPurchase.prePrice" id="full" onblur="f()" type="text" value="${tblGroupPurchase.prePrice}"/></td>
        </tr>
         <tr>
          <th>现&nbsp;&nbsp;价：</th>
          <td><input name="tblGroupPurchase.nowPrice" id="price" onblur="p()" value="${tblGroupPurchase.nowPrice}"/></td>
        </tr>
         <tr>
          <th>团购人数</th>
          <td><input name="tblGroupPurchase.totalCount" id="person" onblur="n()" type="text" value="${tblGroupPurchase.totalCount}"/></td>
        </tr>
          <tr>
          <th>目前状态</th>
          <td><input name="tblGroupPurchase.state" type="text" id="state" onblur="s()" value="${tblGroupPurchase.state}"/></td>
        </tr>
 	 	</table>
 	 	<center><input type="submit" value="修改" onclick="javascript:return confirm('您确定要修改吗？')"/></center>
  	
    </form>
  	</div>
  </body>
</html>
