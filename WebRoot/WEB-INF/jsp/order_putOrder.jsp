<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html>
<head>
	<title>新订订单 - 物流管理系统</title>
	<meta http-equiv="content-type" content="text/html; charset=UTF-8" />
	<style media="all" type="text/css">
		@import "style/all.css";
		@import "style/jquery/ui.all.css";
	</style>
	
</head>
<body style="background: none" onload="createTime()">
	<div class="top-bar">
		<!--a href="#" class="button">取 消</a><a href="#" class="button">保 存</a-->
		<h1>新订订单</h1>
		<div class="breadcrumbs">
			<a href="index.jsp" target="_top">首页</a> /
			<a href="user_index.jsp" target="_top">客户服务中心</a>
		</div>
	</div>
	<div class="select-bar"/>
	<div class="table">
		<img src="style/img/bg-th-left.gif" width="8" height="7" alt="" class="left" />
		<img src="style/img/bg-th-right.gif" width="7" height="7" alt="" class="right" />
<form name="frm3" method="post">
		<table class="listing form" cellpadding="0" cellspacing="0">
			<tr>
				<th class="full" colspan="4">新订订单(*号为必填项)</th>
			</tr>
			<tr>
				<td class="first" style="white-space:nowrap">订单生成日期(*)</td>
				<td><input name="orderformGenerateDate" type='text' class="date-six text" value="${requestScope.list3.createdate }"/></td>
				<td>要求完成日期(*)</td>
				<td class="last" style="white-space:nowrap"><input name="expectDeliverDate" type='text' class="date-six text" name='' readonly/></td>
			</tr>
			<tr>
				<td class="first">订单类型</td>
				<td>
					<select style="width:134px">
					<c:forEach items="${requestScope.list}" var="list">
						<option>${list.pttype}</option>						
					</c:forEach>	
					</select>
				</td>
				<td>送货地址(*)</td>
				<td class="last"><input name="deliverAddress" type="text" class="text" value=""/></td>
			</tr>
			<tr>
				<td class="first">收货人(*)</td>
				<td><input type="text" name="receivedBy" class="text" value="${requestScope.pt.name}"/></td>
				<td>收货人电话(*)</td>
				<td class="last"><input type="text" name="phoneNumber" class="text" value="${requestScope.pt.tel }"/></td>
			</tr>
			<tr>
				<td class="first">收货人邮编</td>
				<td><input type="text"  class="text" value="${requestScope.pt.code }"/></td>
				<td>是否要发票</td>
				<td class="last"><input type="checkbox" /></td>
			</tr>
			<tr>
				<td class="first" >付款人</td>
				<td colspan="3" class="last">
					&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
					&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
					<input type="text"  class="text" value="${requestScope.pt.name }"/>(只有订单类型为异地收费时需要填写该信息)
				</td>
			</tr>
			<tr>
				<td class="first" >付款人地址</td>
				<td colspan="3" class="last">
					&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
					&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
					<input type="text"  class="text" value="${requestScope.pt.workspace }"/>(同上)
				</td>
			</tr>
			<tr>
				<td class="first" >付款人电话</td>
				<td colspan="3" class="last">
					&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
					&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
					<input type="text"  class="text" value="${requestScope.pt.tel }"/>(同上)
				</td>
			</tr>
			<tr>
				<td class="first" >付款人邮编</td>
				<td colspan="3" class="last">
					&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
					&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
					<input type="text"  class="text" value="${requestScope.pt.code }"/>(同上)
				</td>
			</tr>
			<tr>
				<td class="first">货物投递分站</td>
				<td class="last">
					&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
					&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
					<input type="text" class="text" value="${requestScope.pt.sub_name }" />
				</td>
				<td>操作员(*)</td>
				<td class="last"><input name="operatorId" type="text"  class="text" /></td>
			</tr>
		</table>
		<br/>
		<div align="center" style="width:100%;">
			<input type="button" class="button" onclick="javascript:window.history.go(-1)" value="上一步"/>&nbsp;
			<input type="button" class="button" onclick="check()" value="生成订单"/>
		</div>
</form>
	</div>
</body>
</html>
