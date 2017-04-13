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
	<img src="img/finance_manage.gif" border="0" usemap="#Map"
		style="margin: 0;padding: 0;border: 0;position:absolute;left:260px" />
	<map name="Map" id="Map">
		<area title="与供应商结算" shape="rect" coords="148,236,298,263" href="form-common.html" />
		<area title="与分站结算" shape="rect" coords="148,278,298,305" href="form-validation.html" />
		<area title="发票登记" shape="rect" coords="461,237,611,263" href="invoice/edit_invoice.html" />
		<area title="发票查询" shape="rect" coords="461,279,611,305" href="invoice/select_invoice.html" />
	</map>
</body>
</html>


