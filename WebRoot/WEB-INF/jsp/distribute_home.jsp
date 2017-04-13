<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html>
<head>
	<title>配送中心 - 物流管理系统</title>
	<meta http-equiv="content-type" content="text/html; charset=UTF-8" />
</head>

<body style="background: none;margin: 0;padding: 0;border 0;">
	<div style="margin: auto;width: 850px;margin-top: 100px;">
	<img src="img/dist_hub.gif" usemap="#Map" style="margin: 0;padding: 0;border: 0;"/>
	</div>
	<map name="Map" id="Map" style="index-z:99">
  <area title="进货安排" shape="rect" coords="147,219,299,245" href="buy_product.html" />
  <area title="退货安排" shape="rect" coords="148,258,298,285" href="##" />
  <area title="商品管理" shape="rect" coords="148,298,299,324" href="product_manage.html" />
  <area title="库房管理" shape="rect" coords="460,218,611,244" href="waerhouse_manage.html" />
  <area title="供应商管理" shape="rect" coords="460,259,611,285" href="#" />
  <area title="业务统计查询" shape="rect" coords="461,298,612,324" href="statisticalRequirement.html" />
</map>
</body>
</html>