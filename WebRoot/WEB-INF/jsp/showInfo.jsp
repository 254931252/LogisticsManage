<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html>
<head>
<jsp:include page="../../inc.jsp"/>
	<title>购货入库 - 物流管理系统</title>
	<meta http-equiv="content-type" content="text/html; charset=UTF-8" />
</head>

<body style="background: none ;width:100% ;font-size:16px;">
	<div class="easyui-panel" title="购货入库" style="width:60%;height:300px;padding:10px;background:#fafafa;">
	  <table class="select-table" style="width:59%;position:absolute;top:70px;">
		<tr>
			<th>购货单号</th>
			<td>${requestScope.BuyProOder.bpid}</td>
			<th>商品编号</th>
			<td>${requestScope.BuyProOder.proid}</td>
		</tr>
		<tr>
			<th>商品名称</th>
			<td>${requestScope.BuyProOder.proname}</td>
			<th>入库数量</th>
			<td>${requestScope.BuyProOder.proamount}</td>
		</tr>
		<tr>
			<th>实际入库日期</th>
			<td>${requestScope.itwdat}</td>
		</tr>
	  </table>
    </div>
</body>
</html>
