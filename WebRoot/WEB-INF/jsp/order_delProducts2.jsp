<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html>
<head>
	<title>退货 - 物流管理系统</title>
	<meta http-equiv="content-type" content="text/html; charset=UTF-8" />
	<style media="all" type="text/css">
		@import "style/all.css";
		@import "style/jquery/ui.all.css";
	</style>
	<script type="text/javascript" src="script/jquery-1.3.2.min.js"></script>
	<script type="text/javascript" src="script/jquery-ui-personalized-1.6rc6.min.js"></script>
	<script type="text/javascript" src="script/date.js"></script>
	<script type="text/javascript" src='script/common.js'></script>
	<script type="text/javascript">
		$(function(){
			datepicker('.date-six');
		});

		function check(){
			var remark = document.frm8.remark.value;
			var orderformGenerateDate = document.frm8.orderformGenerateDate.value;
			var operatorId = document.frm8.operatorId.value;
			if(remark==null||remark==""){
				alert("退货原因不能为空！");
				document.frm8.remark.focus();
				return false;
			}
			if(orderformGenerateDate==null||orderformGenerateDate==""){
				alert("要求退货时间不能为空！");
				document.frm8.orderformGenerateDate.focus();
				return false;
			}
			if(operatorId==null||operatorId==""){
				alert("操作员不能为空！");
				document.frm8.operatorId.focus();
				return false;
			}
			window.location='search.html';
		}
	</script>
</head>
<body style="background: none" >
	<div class="top-bar">
		<!--a href="#" class="button">取 消</a><a href="#" class="button">保 存</a-->
		<h1>退货</h1>
		<div class="breadcrumbs">
			<a href="index.html" target="_top">首页</a> /
			<a href="index.html" target="_top">客户服务中心</a>
		</div>
	</div>
	<div class="select-bar"/>
<form name="frm8" method="post">
	<div class="table">
		<img src="style/img/bg-th-left.gif" width="8" height="7" alt="" class="left" />
		<img src="style/img/bg-th-right.gif" width="7" height="7" alt="" class="right" />
		<table class="listing form" cellpadding="0" cellspacing="0">
			<tr>
				<th class="full" colspan="4">退货</th>
			</tr>
			<tr>
				<td class="first">原订单编号</td>
				<td>DDxxxxx001</td>
				<td>客户编号</td>
				<td class="last">LBxxxxx001</td>
			</tr>
			<tr>
				<td class="first">退货原因(*)</td>
				<td><input name="remark" type="text" class="text" value="尺码不合"/></td>
				<td>要求退货日期(*)</td>
				<td class="last"><input name="orderformGenerateDate" type='text' class="date-six text" readonly/></td>
			</tr>
			<tr>
				<td class="first">操作员(*)</td>
				<td><input name="operatorId" type="text" class="text" value="001"/></td>
				<td></td>
				<td class="last"></td>
			</tr>

		</table>
		<div align="center" style="width:100%;">
			<input type="button" class="button" onclick="javascript:window.history.go(-1);" value="上一步"/>&nbsp;
			<input type="button" class="button" onclick="check()" value=" 退 货 "/>
		</div>
	</div>
</form>
</body>
</html>
