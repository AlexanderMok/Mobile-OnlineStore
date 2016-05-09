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
    
    <title>修改活动</title>
    
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
	
	

  </head>
  
  <body>
  <div class="top">修改活动</div>
  	<div class="main">
 	 <form action="pages/back/operation!modifyActivity.action" method="post"> 
 	 <input type="hidden" name="tblActivity.activityId" value="${tblActivity.activityId}"/> 	
			<table width="77%" height="69" align="center" border="0" cellpadding="2" cellspacing="2">
 	 		<tr>
          <th>活动编号：</th>
          <td><input type="text" value="1" disabled="disabled"/></td>
        </tr>
        <tr>
          <th>活动名称：</th>
          <td><input name="activityName" type="text" value="${tblActivity.activityName}" ></td>
        </tr>
        <tr>
          <th>开始时间：</th>
          <td><input name="tblActivity.startTime" type="text" id="starttime" value="${tblActivity.startTime}"></td>
        </tr>
        <tr>
          <th>结束时间：</th>
          <td><input name="tblActivity.endTime" type="text" id="endtime" onblur="biaojiao()" value="${tblActivity.endTime}"></td>
        </tr>
        <tr>
          <th>折&nbsp;&nbsp;扣：</th>
          <td><input name="tblActivity.discount" id="discount" onblur="a()"  value="${tblActivity.discount}" ></td>
        </tr>
         <tr>
          <th>满减数量：</th>
          <td><input type="text" name="tblActivity.fullCount" id="full" type="text" onblur="f()" value="${tblActivity.fullCount}" ></td>
        </tr>
         <tr>
          <th>满减价格：</th>
          <td><input name="tblActivity.substractCount" id="price" type="text" onblur="p()" value="${tblActivity.substractCount}"></td>
        </tr>
         <tr>
          <th>活动类型：</th>
          <td>
          	<select name="tblActivity.tblActivityType.typeId">
	  				<option value="${tblActivity.tblActivityType.typeId}">${tblActivity.tblActivityType.typeName}</option>
	  				<s:iterator value="typeList">
	  					<option value=<s:property value="typeId"/>><s:property value="typeName"/></option>
	  				</s:iterator>
	  			</select>
          </td>
        </tr>
 	 	</table>
 	 	<center><input type="submit" value="修改" onclick="javascript:return confirm('您确定要修改吗？')"/></center>
 
    </form>
    </div>
      <div class="footer"><jsp:include page="/pages/back/copyright.jsp"/></div>
  </body>
</html>
