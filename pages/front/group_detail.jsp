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
	<style type="text/css">
   .header {
	      position: relative;
          height: 40px;
          line-height: 40px;
          background-color: #fff;
          box-shadow:3px 3px 3px rgba(0,0,0,.3);
          width: 100%;  
}

.header .logoleft {
	height: 25px;
	vertical-align: top;
	margin-top: 8px;
	margin-left: 20px;	
	float: left;
}
.header .logoright {
    position:absolute;
    top:8px;
    right:10px;
	height: 25px;
	vertical-align: top;
	width: 25px;
	
}

.logo {
	display: inline
}

.header .hezi {
	color: #f25f9d;
}
.title{

    color:#f25f9d;

    width:100%;

    text-align:center;

    vertical-align:middle;

    white-space:nowrap;

    text-overflow:ellipsis;

    overflow:hidden;

}
.hezi {
	font-size: 20px;
	color: #f25f9d;
	margin-top: 0px;
	margin-bottom: 0px;
	text-align: center;
	float: none;
	height: 50px;
	width: 150px;
	margin-right: auto;
	margin-left: auto;
}

.content{
    width: 95%;
    height: auto;
    margin: 10px auto;
    background-color: #fff;
    position: relative;
    display: block;
}
.picture{
    width: 100%;
    height: 180px;
     background-color: #fff;      
    margin: 10px auto;    
}
.wenzi{
    width: 95%;
    height: 60px;
    background-color: #fff;
    line-height:20px;
    margin: 10px auto;    
    color: #000;
    font-size: 20px;
}
.wenzi p{
   width: 100%;
   text-align: center;
}
.bottom {
	position: fixed;
	top: 89%;
	height: 10%;
	width: 100%;
	
	margin-left: 0%;
	line-height: 30px;
	font-size: 20px;
	z-index: 99;
}
.bottom li{
   text-align: center;
   padding-top:5px;
   color: #fff;
   font-size: 16px;
   line-height: 20px;
   
}
.bottom li:nth-child(1){
  float:left;
  width:50%;
  height: 100%;
  background-color: #FF948E;
}
.bottom li:nth-child(2){
  float:left;
  width:50%;
  height: 100%;
  background-color: #FD4640;
}
.image{
  width: 95%;
  height: auto;
  margin: 10px auto;
}
.image img{
 display: block;
 width: 100%;
 margin: 0 auto;
}
</style>
  </head>
  <body>
    <div class="header">
			 <a  href="javascript:history.go(-1)" class="logo"> <img
				src="source/images/market_left.png"
				class="logoleft"></a>
			<div class="hezi">
				<span class="title">拼团购</span>
			</div>
			<a  href="first_catagorgy.jsp" class="logo"> <img
				src="source/images/home-2.png" width="20" height="39"
				class="logoright"></a>
		</div>
		
		<div class="content">
		    <div class="picture">
	        	<img alt='' src='<s:property value="tblGroupPurchase.tblItems.itemPic"/>' height="180px" width="100%">
	    	</div>
	   		<div class="wenzi">
	   			<input type="hidden" id="time" value="<s:property value="tblGroupPurchase.time"/>"/>
	   			<p style="color:#787578;font-size: 16px;margin-top: 10px;"><s:property value="tblGroupPurchase.tblItems.itemName"/></p>
	        		<p style="color:#787578;font-size: 16px;margin-top: 10px;"><s:property value="tblGroupPurchase.tblItems.note"/></p>
	        	<p id="leftTime">倒计时：</p>
	        	<p style="color:#787578;font-size: 16px;margin-top: 10px;"><s:property value="tblGroupPurchase.startTime"/>开拼</p>
	   
	    	</div>
		</div>
		
		<ul class="bottom">
		   <li>￥<s:property value="tblGroupPurchase.prePrice"/><br>
		                 单独购
		   </li>
		 <a href="pages/front/goPinShopcar.action?gid=<s:property value="tblGroupPurchase.id"/>">   <li>￥<s:property value="tblGroupPurchase.nowPrice"/><br>
		      <s:property value="tblGroupPurchase.totalCount"/>人团
		   </li></a>
		 
		</ul>
  
  
  <script>  
      
  	  var leftTime = document.getElementById("time").value;
  	  function showLeftTime(){  
  		  var leftDay = parseInt(leftTime/(60*60*24));
  		  var leftHour = parseInt((leftTime%(60*60*24))/(60*60)); 
      	  var leftMinutes = parseInt((leftTime%(60*60))/60);  
      	  var leftSeconds = parseInt(leftTime%60);  
          
       	 if(leftTime < 0){  
            clearInterval(timer);  
            document.location.href = document.location.href;  
        }else{  
            document.getElementById('leftTime').innerHTML = '倒计时：'+leftDay+'天'+leftHour+'时'+leftMinutes+'分'+leftSeconds+'秒';  
        }  
        leftTime--;  
    }   
    var timer = setInterval('showLeftTime()',1000);  
      
</script> 
  
  
  </body>
</html>
