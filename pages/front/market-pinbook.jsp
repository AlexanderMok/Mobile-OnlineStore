<%@ page language="java" import="java.util.*,java.lang.String" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="s" uri="/struts-tags" %>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!doctype html>
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>My JSP 'market-book.jsp' starting page</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
<link href="source/css/style.css" rel="stylesheet" />
<link href="source/js/confirm/stylenew.css" rel="stylesheet" />
<link rel="stylesheet" type="text/css"
	href="source/js/confirm/confirm.css" />
<link href="source/css/buju.css" type="text/css" rel="stylesheet"/>
<style>

html {height: 100%;}
body {height: 100%;background: #F9F2EF;}
.header {
	      position: relative;
          height: 40px;
          line-height: 40px;
          background-color: #fff;
          box-shadow:3px 3px 3px rgba(0,0,0,.3);
          width: 100%;  
}

.header .logoleft {
	height:25px;
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
    
    width:95%;
    border-bottom: 0px solid #d1d1d1;
    margin: 5px auto;
    background-color: #fff;
}
.lanmu_top{
    width:100%;
    height:auto;
}
.lanmu_down{
    width: 100%;
    height: 60px;
    clear: both;
}
.spm{
    height: auto;
    width:60%;
    float: left;
    text-indent: 6%;
    margin-top: 13px;
    
}
.jiage{
    height:50px;
    width:20%;
    margin-top:10px;
    line-height: 50px;
    text-align: center;
    color: red;
    float: left;
}
.liebiao{
    height:auto;
    width: 30%;
    float: right;
    margin-right: 5%;
    margin-top: 15px;
    
}
.liebiao ul li{
    float: right;
    width:33%;
    text-align: center;
}
.lajitong{
    float:right;
    height:60px;
    width:13%;
    margin-top: 15px;
    
    
}
.delete{
    height:23px;
    width:23px;
}
.yinliao{
    height: 20px;
    width:100%;
    color:#fff;
    background-color: #f48931;
    margin-top: 5px;
    text-indent: 1em;
}
.yinliao_xiangxi{
    height:65px;
    width:98%;
    
    margin: 5px auto;
    background-color: #fff;
    
    
    
}
.shumu{
    color:red;
}
.yinliao_xiangxi p{
    
}
.liebiao_1{
    width: 30%;
    height: 40px;
    float: right;
    margin-top: 15px;
    margin-right: 2%;
   
    
    
 }
.liebiao_1 ul li{
    float: right;
    width:33%;
    text-align: center;
} 
.hr_1{
    filter:alpha(opacity=50);
-moz-opacity:0.5;
-khtml-opacity: 0.5;
opacity: 0.5;
}

.zongshu{
    width:95%;
    height:40px;
    margin: -10px auto;
    background-color: #fff;
}
.zongshu_1{
    height:40px;
    width:85%;
    margin-left: 10%;
    line-height: 40px;
    font-size: 18px;
    
    text-align: right;
}
.zongshu_1 p span{
    color:red;
}
.count-input{
    width:100%;
    text-align: center;
    
}
.hide{
    display: none;
}
.reduce{
    width: 25px;
    height: 25px;
}
.add{
   width: 25px;
   height: 25px;
}
.flow{
   width:95%;
   height: 175px;
   margin: 0 auto;
   overflow: auto;
}
.yingliao_shuju{
    width:60%;
    height: 65px;
    float: left;
    line-height: 30px;
    margin-left: 5%;
}

*, *:before, *:after {
  -webkit-border-sizing: border-box;
  -moz-border-sizing: border-box;
  border-sizing: border-box;
}

.container {
  width: 95%;
  margin: 0px auto;
}
.container > ul {
  list-style: none;
  padding: 0;
  margin: 0 0 20px 0;
}






btn_submit1 {
	display: block;
	text-align: center;
	height: 26px;
	line-height: 26px;
	cursor: pointer;
	border: none;
	border-radius: 4px;
	font-size: 12px;
	text-shadow: 0 0px 1px rgba(0, 0, 0, 0.6);
	-webkit-box-shadow: 0 1px 0 #DAEFDA inset;
	background: -webkit-gradient(linear, left top, left bottom, from(#39D139),
		to(#0CA80C) );
	color: #FFF;
	width: 26px;
	padding: 0px;
	margin: 0px;
}
.btn span {
	font-size: 20px;
	color:#fff;
}

.btn {
    background: #82BF25;
    height: 40px;
    text-align: center; 
    line-height: 40px; 
    font-size: 20px;
    margin-top: 30px;
    border-radius: 5px;
    width:90%;
    margin-left:5%;
    margin-bottom:20px;
    }
    
    
    .kj_right {
	float: left;
	width: 97%;
	height: 80px;
	margin-left: 5px;
	
	position: relative;
	
}
.shang_wenzi {
	height: 20px;
	width: 100%;
	font-size: 14px;
	margin-top:10px;
}

.lianxi {
	
	width: 150px;
	float: left;
	line-height: 20px;
	height:20px;
	white-space:nowrap;

    text-overflow:ellipsis;

    overflow:hidden;
}
.haoma {
	float: left;
	width: 40%;
	line-height: 20px;
	height:20px;
	border: 0px solid red;
	margin-left: 0%;
}
.xia_wenzi {
	height: 50px;
	width: 250px;
	line-height: 50px;
	font-size: 14px;
	 white-space:nowrap;

    text-overflow:ellipsis;

    overflow:hidden;
}
.sjdz {
	height: 80px;
	width: 95%;
	margin: 15px auto;
	background-color: #fff;
	display: block;
}
.sjdz:LINK,.sjdz:VISITED {
	color: #000;
}
.black_jiantou{
    position: absolute;
    width: 10px;
    height: 20px;
    margin: -55px 95%; 
}
.kj_right{
    background-color: #fff;
    width: 95%;
    height: 80px;
    margin-top: 20px;
    margin-left: 3%;
    text-indent: 1em;
}
.shangjia {
	height: 50px;
	width: 95%;
	border-bottom:1px solid #d1d1d1;
	margin: 0 auto;
	background-color: #fff;
	margin-top: 5px;
	position: relative;
}



.shangjia a {
	color: #000;
}
.shangjia_ming{
    height: 50px;
    width: 70%;
    float: left;
    line-height: 50px;
    margin-left:5PX;
    position: absolute;
    margin-top: -15px;
    text-overflow:ellipsis;
    overflow:hidden;
}
.shangjia a img{
    margin-left: 90%;
    position: absolute;
}

.peisong_img{
   display: inline-block;
   border-radius:3px;
   background-color:#fdb543;
   width: 20px;
   height: 20px;
   font-size: 12px;
   text-align: center;
   margin-left:10px;
   margin-right:5px;
   line-height: 20px;
   color: #fff;   
}
.peisong_jiage{
  position:absolute;
  color: #000;
  margin-left: 65%;
  
}
.activity{
  width: 95%;
  height: auto; 
  margin: 0 auto;
  background-color: #fff;
  border-top: 1px dashed #e1e1e1;
  color: #999;
}
.act_peisong{
  width: 100%;
  height: 20px;  
  margin-top: 5px;
  font-size: 12px;
  position: relative;
}
.act_huodong{
  width: 100%;
 
}
.jian_img{
   display:inline-block;
   border-radius:3px;
   border: 0px solid #f6df1f;
   width: 20px;
   height: 20px;
   font-size: 12px;
   text-align: center;
   background-color:#f67777;
   margin-left:10px;
   line-height: 20px;
   color: #fff;
}
.jian_content{
	color: #999;
	font-size: 12px;
}
.huodong_jian{
	margin-top: 3px;
}
.huodong_shou{
    margin-top: 3px;
}

.shou_img{
   display:inline-block;
   border-radius:3px;
   border: 0px solid #f6df1f;
   width: 20px;
   height: 20px;
   font-size: 12px;
   text-align: center;
   background-color:#1bd253;
    margin-left:10px;
   line-height: 20px;
   color: #fff;
}
.shou_content{
	color: #999;
	font-size: 12px;
}
.jian_price{
   font-size:12px;
   color: #000;
   margin-left: 53%;
   position: absolute;
}
.shou_price{
   font-size:12px;
   color: #000;
   margin-left: 62%;
   position: absolute;
}
.Total{
  border-top:1px dashed #e1e1e1;
  width: 100%;
  margin-top: 5px;
  
}
.zongji{
  margin-left: 74%;
  font-size: 14px;  
}
.shangjia_content{
    width:95%;
    border-bottom: 0px solid red;
    margin: 5px auto;
    background-color: #fff;
}
</style>
<script src="source/js/jquery.js"></script>
<script src="source/js/confirm/jquery-1.4.2.min.js"></script>
<script src="source/js/confirm/jquery.confirm.js"></script>
<script src="source/js/gwc.js"></script>
<script src="source/js/json2.js"></script>
<script src="source/js/jquery.fancybox-1.3.4.js"></script>
<SCRIPT type="text/javascript">

    //自己写的-----
    function tijiao(){
    	//name
    	var name = document.getElementById("shouhuoname");
    	var c = document.getElementById("mingzi").innerText;
    	name.value = c;
    	//地址
    	var addr = document.getElementById("shouhuodizhi");
    	var a = document.getElementById("yemiandizhi").innerText;
    	addr.value = a;
    	//电话
    	var phone = document.getElementById("shoumob");
    	var b = document.getElementById("yemianphone").innerText;
    	phone.value = b;
    	
    		document.getElementById("myform").submit();
    	
    }
   
    </SCRIPT>
</head>
<body>
        <div class="header">
			 <a  href="javascript:history.go(-1)" class="logo"> <img
				src="source/images/market_left.png"
				class="logoleft"></a>
			<div class="hezi">
				<span class="title">拼单确认</span>
			</div>
			<a  href="first_catagorgy.jsp" class="logo"> <img
				src="source/images/seller-index/home-1.png" width="20" height="39"
				class="logoright"></a>
		</div>
		<form name="bookForm" id="myform" action="pages/front/pinOrder.action"
					method="post">

	
	<div class="kj_right" onclick="javascript:window.location.href='pages/front/user_myAddress.action?user.userid=${user.userid}&flag=2'">
     <div class="shang_wenzi" ><div class="lianxi" id="mingzi">
     	<%if(session.getAttribute("address") == null){ %>${sessionScope.user.tname}<%}else { %>${sessionScope.address.receiverName}<%} %>
     </div>
    <div class="haoma" id="yemianphone">
    <%if(session.getAttribute("address") == null){ %>${sessionScope.user.mob}<%}else { %>${sessionScope.address.receiverPhone}<%} %>
    </div>
  </div>
  <div class="xia_wenzi" id="yemiandizhi">配送地址：<%if(session.getAttribute("address") == null){ %>${sessionScope.user.defaultaddress}<%}else { %>${sessionScope.address.addr}<%} %></div>
   <img class="black_jiantou" alt="" src="source/images/hyjt.png">
  
</div>

          <div style="background-color: #fff; width:95%;margin: 110px auto -40px auto;">
				
					<input type="hidden" name="Obj_Bag_Sum" id="Obj_Bag_Sum" value="1" />
					<input type="hidden" name="xtit" id="xtit" value="" /> 
					<input type="hidden" name="zonger" id="zonger" value="" /> 
					<input type="hidden" id="usedbalance" name="usedbalance" value="<s:property value='user.balance'/>" /> 
					
					<%String addrId = request.getParameter("addrId"); %>
					<input type="hidden"  name="gid" value="${sessionScope.gid}" /> 
					<input type="hidden"  name="addrId" value="<%=addrId %>" /> 
					
					<input type="hidden"/>
					<div id="numi"></div>
					<input type="hidden" id="shouhuoname" name="shouhuoname" />
					<input type="hidden" id="shoumob" name="phone" />
					<input type="hidden" id="shouhuodizhi" name="addr" />
					
						
					<div class="qb_mb10 qb_flexx"style="width: 95%; margin: 5px auto;">
						<span class="mod_select qb_mr10 qb_mb10" id="sprovince"> <select
							 id="pstype" name="paystate" style="height: 39px; color: #999999"
							onchange="javascript:changepstype();">
								<!-- <option value="" selected>== 请选择支付方式 ==</option>  -->
								<option value="-1" selected="selected">微信支付</option>
								<option value="0">支付宝</option>
								<option value="2">余额支付</option>
						</select></span>
					</div>
					 
					<!-- <div class="mod_select qb_mr10 qb_mb10"><textarea rows="3" cols="30" name="liuyan" placeholder="备注">
					</textarea></div>  -->
					<div class="qb_mb10 qb_flexx">
						<textarea style="height: 70px; margin: 0 auto; display: block;" class="mod_input flex_box"
							name="words" placeholder="备注留言"></textarea>
					</div>

					<div id="showpayinfos" class="qb_mb10 qb_flexx "></div>
					<div >
						<span class="btn" id="buy-now"
							onClick="tijiao()" ><span>立即预定</span></span>
					</div>
				
				</div></form>
</body>

</html>
