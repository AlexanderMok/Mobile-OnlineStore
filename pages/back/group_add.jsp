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
	<script>
	function assignment(id,name)  
{  
	document.getElementById("goodsid").value = id;//赋值 
    document.getElementById("goodsname").value = name;//赋值  
   
}  
function openwindow(url,name,iWidth,iHeight)  
{  
    var url; //转向网页的地址;  
    var name; //网页名称，可为空;  
    var iWidth; //弹出窗口的宽度;  
    var iHeight; //弹出窗口的高度;  
    var iTop = (window.screen.availHeight-30-iHeight)/2; //获得窗口的垂直位置;  
    var iLeft = (window.screen.availWidth-10-iWidth)/2; //获得窗口的水平位置;  
    window.open(url,name,'height='+iHeight+',,innerHeight='+iHeight+',width='+iWidth+',innerWidth='+iWidth+',top='+iTop+',left='+iLeft+',toolbar=no,menubar=no,scrollbars=auto,resizeable=no,location=no,status=no');  
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
	
	<script type="text/javascript">
	function n(){
		var discount = document.getElementById("person").value;
		if(discount<0 || !(discount%1)==0){
			alert("你输入的数值不符合规定！");
			document.getElementById("person").value="";
		}
	}
	</script>
	
  </head>
  
  <body>
   	<div class="top">添加新团购</div>
  	<div class="main">
  			
  	
  	
 	 <form action="pages/front/grouppur!addGroup.action" method="post">  	
 	 	<table width="77%" height="69" align="center" border="0" cellpadding="2" cellspacing="2">
 	 	
        
        <tr>
          <th>商品名称：</th>
          <td>
          <input type="text" readonly="readonly" name="goodsname" id="goodsname" onclick="openwindow('pages/back/findgoods.jsp','',500,400)"/>  
			<input type="hidden" name="itemId" id="goodsid"/>
          </td>
        </tr>
        <tr>
          <th>开始时间：</th>
          <td><input name="tblGroupPurchase.startTime" id="starttime" type="datetime-local"/></td>
        </tr>
        <tr>
          <th>结束时间：</th>
          <td>
          
           <input type="datetime-local"  id="endtime" onblur="biaojiao()" name="tblGroupPurchase.endTime"/>
          </td>
        </tr>
        <tr>
          <th>原&nbsp;&nbsp;价：</th>
          <td><input name="tblGroupPurchase.prePrice" id="full" onblur="f()" type="text"/></td>
        </tr>
         <tr>
          <th>现&nbsp;&nbsp;价：</th>
          <td><input name="tblGroupPurchase.nowPrice" id="price" onblur="p()" type="text"/></td>
        </tr>
         <tr>
          <th>团购人数</th>
          <td><input name="tblGroupPurchase.totalCount" type="text" id="person" onblur="n()"/></td>
        </tr>
         <tr>
         
        </tr>
 	 	</table>
 	 	<center><input type="submit" value="添加" onclick="javascript:return confirm('您确定要添加吗？')"/></center>
  	
    </form>
  	</div>
  </body>
</html>
