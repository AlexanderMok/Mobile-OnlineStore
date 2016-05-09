<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib prefix="s" uri="/struts-tags" %>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>My JSP 'photo_update.jsp' starting page</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->
	<script type="text/javascript">
		function checkForm(){
			var photo = document.getElementById("phtot").value;
			if(photo == null){
				alert("您还没有选择新的照片");
				return flase;
			}
		}
	</script>

  </head>
  
  <body>
  	<center>
  		
  		<s:form action="user_updatePhoto.action" onsubmit="return checkForm();" method="post" theme="simple" namespace="/pages/front" enctype="multipart/form-data">
  			<img src="${ pageContext.request.contextPath }/upload/${user.photo}"  width="20%" height="40%"><br/><br/>
  			<s:actionerror/>
  			<s:file name="photo" id="photo"></s:file><br/><br/>
  			<s:hidden name="user.userid"></s:hidden>
  			<input type="button" value="返回上一页" onclick="javascript:history.back(-1);"/>"
  			<s:submit value="提交"></s:submit>
  		</s:form>
  	</center>
  </body>
</html>
