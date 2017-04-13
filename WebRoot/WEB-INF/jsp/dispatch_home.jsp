<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"
			+ request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<base href="<%=basePath%>">
<title>My JSP 'MyJsp.jsp' starting page</title>

<meta http-equiv="pragma" content="no-cache">
<meta http-equiv="cache-control" content="no-cache">
<meta http-equiv="expires" content="0">
<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
<meta http-equiv="description" content="This is my page">
</head>
<body style="background: none;margin: 0;padding: 0;border 0;">
	<img src="img/sch_hub.gif" border="0" usemap="#Map"
		style="margin: 0;padding: 0;border: 0;position:absolute;left:350px" />
	<map name="Map" id="Map">
		<area title="手动调度" shape="rect" coords="148,236,298,263" href="dispatch_hand_make.html" />
		<area title="自动调度" shape="rect" coords="148,278,298,305" href="dispatch_self_make.html" />
		<area title="订单状态修改" shape="rect" coords="461,278,611,305" href="dispatch_update_orders.html" />
		<area title="任务单查询" shape="rect" coords="461,237,611,263" href="dispatch_task_manage.html" />
	</map>
</body>
</html>


