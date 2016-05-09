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
    
    <title>添加活动</title>
    
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
	
	<script src="jquery-1.11.1.min.js"></script>
	<script type="text/javascript">
	function a(){
		var discount = document.getElementById("discount").value;
		if(discount>1 || discount<0){
			alert("请输入0~1之间的折扣数！");
			document.getElementById("discount").value="";
		}
		
	}
	</script>
	
	<script type="text/javascript">
	function f(){
		var discount = document.getElementById("full").value;
		if(discount<0){
			alert("你输入的数值不符合规定！");
			document.getElementById("full").value="";
		}
	}
	</script>
	
	<script type="text/javascript">
	function p(){
		var price = document.getElementById("price").value;
		var full = document.getElementById("full").value;
		if(!(full-price>0) || price<0){
			alert("你输入的数值不符合规定！");
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
  </head>
  
  <body>
  	<div class="top">添加新活动</div>
  	<div class="main">
  	
  	
  	
  	
 	 <form action="pages/back/operation!addActivity.action" method="post">  	
 	 	<table width="77%" height="69" align="center" border="0" cellpadding="2" cellspacing="2">
 	 	
        
        <tr>
          <th>活动名称：</th>
          <td><input name="tblActivity.activityName"/></td>
        </tr>
        <tr>
          <th>开始时间：</th>
          <td><input name="tblActivity.startTime" id="starttime"  type="datetime-local"/></td>
        </tr>
        <tr>
          <th>结束时间：</th>
          <td><input name="tblActivity.endTime" id="endtime" onblur="biaojiao()" type="datetime-local"/></td>
        </tr>
        <tr>
          <th>折&nbsp;&nbsp;扣：</th>
          <td><input name="tblActivity.discount" id="discount" onblur="a()" type="text"/></td>
        </tr>
         <tr>
          <th>满减总价：</th>
          <td><input name="tblActivity.fullCount" id="full" type="text" onblur="f()"/></td>
        </tr>
         <tr>
          <th>满减价格：</th>
          <td><input name="tblActivity.substractCount" id="price" type="text" onblur="p()"/></td>
        </tr>
         <tr>
          <th>活动类型：</th>
          <td>
          	<select name="tblActivity.tblActivityType.typeId">
	  				<option >--请选择--</option>
	  				<s:iterator value="typeList">
	  					<option value=<s:property value="typeId"/>><s:property value="typeName"/></option>
	  				</s:iterator>
	  			</select>
          </td>
        </tr>
 	 	</table>
 	 	<center><input type="submit" value="添加" onclick="javascript:return confirm('您确定要添加吗？')"/></center>
  	
    </form>
    </div>
    <div class="footer"><jsp:include page="/pages/back/copyright.jsp"/></div>
  </body>
</html>
