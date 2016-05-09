<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib uri="/struts-tags" prefix="s"%>

<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<script src="/js/jquery-1.10.2.js"></script>
<script src="/js/ajaxfileupload.js"></script>
<script type="text/javascript" src="/js/ajaxupload.js"></script>
<script type="text/javascript" src="/js/upload.js"></script>
  <head>
    <base href="<%=basePath%>">
    
    <title>My JSP 'addgoods.jsp' starting page</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->
	<link rel="stylesheet" type="text/css" href="css/general.css" />
	<script src="/js/jquery-1.10.2.js"></script>
	<script src="/js/ajaxfileupload.js"></script>
	<script type="text/javascript" src="/js/ajaxupload.js"></script>
	<script type="text/javascript" src="/js/upload.js"></script>
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
  </head>
  <body>
  	<div class="top">添加出库信息</div>
  	<div class="main">
  	<form action="saveoutstore.action" method="post">
  	<table width="77%" height="69" align="center" border="0" cellpadding="2" cellspacing="2">
        <tr>
          <th>商品名:</th>
          <td>
          	<input type="text" readonly="readonly" name="goodsname" id="goodsname" onclick="openwindow('outstore/findgoods.jsp','',500,400)"/>  
			<input type="hidden" name="goodsid" id="goodsid"/>
          </td>
        </tr>
        <tr>
          <th>出库数量:</th>
          <td><input name="outcount"/></td>
        </tr>
         <tr>
          <th>备注:</th>
          <td><input name="note"/></td>
        </tr>
  	</table>
  	<center><input type="submit" value="添加"/>&nbsp;&nbsp;<input type="reset" value="重置"/></center>
  	</form>
  	</div><%--
  	<div class="footer"><jsp:include page="/copyright.jsp"/></div>
  --%></body>
</html>
