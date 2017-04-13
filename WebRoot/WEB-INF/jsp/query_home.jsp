<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>分站管理</title>

  </head>
  
  
<body style="background: none;margin: 0;padding: 0;border 0;">
	<img src="img/sub_dept.gif" border="0" usemap="#Map"
		style="margin: 0;padding: 0;border: 0;position:absolute;left:350px" />
	<map name="Map" id="Map">
		<area title="任务单查询" shape="rect" coords="148,236,298,263" href="query.html"/>
		<area title="任务分配" shape="rect" coords="148,278,298,305" href="query.html"/>
		<area title="补发商品签收单" shape="rect" coords="148,316,298,347" href="query_print_task_sign_form.html" />
		<area title="回执录入" shape="rect" coords="461,237,611,263" href="query_add_info.html"/>
		<area title="缴费查询" shape="rect" coords="461,279,611,305" href="query_pay.html" />
		<area title="发票管理" shape="rect" coords="461,321,611,347" href="#" />
	</map>

  </body>
</html>
