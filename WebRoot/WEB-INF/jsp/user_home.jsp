<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>My JSP 'user_home.jsp' starting page</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->

  </head>
  <body style="background: none;margin: 0;padding: 0;border 0;"><img src="style/img/cus_server.gif" usemap="#Map" 
  style="margin: 0;padding: 0;border: 0;position:absolute;left:240px"/>
	<map name="Map" id="Map">
		  <area title="登记新客户" shape="rect" coords="147,219,298,245" href="cus/add.jsp" />
		  <area title="客户信息查询" shape="rect" coords="148,259,298,285" href="cus/search.jsp" />
		  <area title="客户订单处理" shape="rect" coords="148,297,298,323" href="order/search.jsp" />
		  <area title="订单退订" shape="rect" coords="461,220,611,246" href="order/deleteOrder.jsp" />
		  <area title="换货处理" shape="rect" coords="461,259,610,284" href="order/updateProduct.jsp" />
		  <area title="退货处理" shape="rect" coords="461,296,611,322" href="order/deleteProduct.jsp" />
		  <area title="客户" shape="rect" coords="352,246,405,298" href="cus/search.jsp" />
	</map>
</body>
  <body>
  	 
  </body>
</html>
