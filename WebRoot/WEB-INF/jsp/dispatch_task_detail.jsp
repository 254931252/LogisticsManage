<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<jsp:include page="../../inc.jsp"></jsp:include>
<link href="css/all.css" rel="stylesheet" type="text/css"/>
<title>调度中心 - 物流管理系统</title>
<meta http-equiv="content-type" content="text/html; charset=UTF-8" />
</head>
<body>
	<div style="width:100%;position:relative;" >
		<div id="p" class="easyui-panel" title="详细订单与调度"
			style="width:100%;height:457px;padding:10px;background:#fafafa;">
				
			<a href="dispatch_task_manage.html" class="easyui-linkbutton" style="margin-left:850px;">&nbsp;返回&nbsp; </a>
			<div style="width:100%;position:absolute;top:80px;">
				<table class="select-table" style="border:1px solid #333;width:900px">
				<tr>
					<th width="24%" >订单号：</th>
					<td width="26%">${order.ordid }</td>
					<th width="24%">订单状态：</th>
					<td width="26%">${order.osname}</td>
				</tr>
				<tr>
					<th >投递分站：</th>
					<td>${order.subId }</td>
				  	<th>订单生成日期：</th>
				  	<td>${order.createdate }</td>
				</tr>
			    </table>
				<br/>
				<table class="select-table" style="border:1px solid #333;width:900px">
				<tr>
				    <th>客户编号：</th>
					<td >${order.userid }</td>
					<th>客户名称：</th>
					<td>${order.name }</td>
				</tr>
				<tr>
				    <th>客户所在区域：</th>
					<td >${order.address }</td>
					<th>投递地址：</th>
					<td>${order.proadress }</td>
				</tr>
				<tr>
				  <th>接收人：</th>
				  <td>${order.name }</td>
					<th>电话：</th>
					<td>${order.tel }</td>
				</tr>
				<tr>
				    <th>邮编：</th>
					<td colspan="3" >${order.code }</td>
				</tr>
				</table>
				<br/>
                <table class="select-table" style="border:1px solid #333;width:900px">
				<tr>
				    <th>操作员编号：</th>
					<td id="id">${order.doTaskId }</td>
					<th>操作员名称：</th>
					<td id="name">${doTaskName }</td>
				</tr>
				<tr>
				    <th>价值总额：</th>
					<td>${sum }</td>
				    <th>备注：</th>
					<td>这个宝贝很脆弱的，快递小哥轻点哦！</td>
				</tr>
			</table>

			</div>
		</div>

	</div>
</body>
</html>

