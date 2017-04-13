<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<jsp:include page="../../inc.jsp" ></jsp:include>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html>
<head>
	<title>退货 - 物流管理系统</title>
	<meta http-equiv="content-type" content="text/html; charset=UTF-8" />
	<style media="all" type="text/css">
		@import "style/all.css";
		@import "style/jquery/ui.all.css";
	</style>
	
</head>
<body style="background: none">
	<div class="top-bar">
				<!--a href="#" class="button">ADD NEW </a-->
				<h1>退货</h1>
				<div class="breadcrumbs">
					<div class="button-bar">
						<input type="button" name="Submit" value="帮助" class="button"/>
						<input type="button" name="Submit" onclick="javascript:window.location.href='deleteProduct.html'" value="查询" class="button"/><input type="text" name="textfield2" class="text" />
					</div>
					<a href="index.html" target="_top">首页</a> / <a href="index.html">客户服务中心</a>
				</div>
			</div>
	<form>
		  <div class="select-bar">
			<table class="select-table">
				<tr>
					<th>订单号</th>
					<td><input type="text" name="textfield11" class="text"/></td>
					<th>身份证</th>
					<td><input type="text" name="textfield12" class="text"/></td>
				</tr>
				<tr>
					<th>客户姓名</th>
					<td><input type="text" name="textfield" class="text"/></td>
					<th>联系电话</th>
					<td></td>
				</tr>
				<tr>
					<th>开始日期</th>
					<td><input type='text' class="date-six text" name='' readonly/></td>
					<th>结束日期</th>
					<td><input type='text' class="date-six text" name='' readonly/></td>
				</tr>
			</table>
		</form>
		    <label></label>
		  </div>
			<div class="table" style="width:100%;">		
				<table id="tt" class="easyui-datagrid" style="width:100%">
					<tr>
						<td class="first style1"><a href="order_Detail.html">DDxxxx001</a></td>
						<td><a href="order_cusDetail.html">LBxxxx001</a></td>
						<td>PPxxxxx001</td>
						<td>hp笔记本</td>
						<td>1000</td>
						<td class="last">
							<a href="order_delProcList.html"><b>退货</a>
						</td>
					</tr>			
				</table>				
			</div>
</body>
</html>
<script>
	$("#tt").datagrid({
		nowrap:true,//显示数据
		striped:true,//是否显示斑马效果
		rownumbers:true,//行号列
		fitColumns:true,//允许表格自动缩放，以适应父容器
		remoteSort:false,//服务器对数据进行排序
		singleSelect:true,//单选
		checkbox:true,//复选
		pagination:true,//显示分页
		columns:[[{
			field:'a',
			title:'订单号',
			width:'185px',
			align:'center'
		},{
			field:'b',
			title:'客户编号',
			width:'185px',
			align:'center'
		},{
			field:'c',
			title:'商品编号',
			width:'185px',
			align:'center'
		},{
			field:'d',
			title:'商品名称',
			width:'185px',
			align:'center'
		},{
			field:'f',
			title:'数量',
			width:'185px',
			align:'center'
		},{
			field:'f',
			title:'处理',
			width:'185px',
			align:'center'
		}]],
		pagination:true,//可分页
		rownumbers:true  //行号不累加
		
	})


</script>
