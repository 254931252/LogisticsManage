<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<c:set var="ctx" value="${pageContext.request.contextPath}"/>
<jsp:include page="../../inc.jsp" />
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html>
<head>
	
	<title>操作员工作查询 - 物流管理系统</title>
	<meta http-equiv="content-type" content="text/html; charset=UTF-8" />
	<style media="all" type="text/css">
		@import "style/all.css";
		@import "style/jquery/ui.all.css";
	</style>
	
</head>
<script>
$(function(){
	$("#tt").datagrid({ 
		width:'100%',    //对datagrid表格设置属性
		nowrap: true,//表示禁止单元格中的文字自动换行
		striped: true,//是否显示斑马线效果
		collapsible: true,//定义是否显示可折叠按钮。
		loadMsg: '数据加载中.....',    //在数据表格加载远程数据的时候显示消息。
		fitColumns: true ,     //真正的自动展开/收缩列的大小，以适应网格的宽度，防止水平滚动。
		sortName: 't',
		sortOrder:'asc',
		remoteSort:false,
		columns :[[{
			field:'t',
			width:'100',
			align:'center',
			title:'商品名称' 
	},{
			field:'t',
			width:'100',
			align:'center',
			title:'新订情况'    
	},{
			field:'t',
			width:'100',
			align:'center',
			title:'退货情况' 
	},{
			field:'t',
			width:'100',
			align:'center',
			title:'换货情况'     												
	},{
			field:'t',
			width:'100',
			align:'center',
			title:'退订情况' 
	},{
			field:'t',
			width:'100',
			align:'center',
			title:'净收入' 
	}]],
		pagination:true,//可分页
		rownumbers:true,  //行号不累加
		onLoadSuccess : function(data) {
						$('.detailed').linkbutton({
							text : '查看'
						}), $('.detailed').linkbutton('resize', { //设置按钮的高度
							height : 20
						})
					}
				});
		var p = $("#tt").datagrid('getPager'); //返回页面对象
		var opts = $("#tt").datagrid('options');

		$(p).pagination({
			pageSize : 10,
			pageList : [ 10, 15, 20 ],
			displayMsg : '当前显示{from}-{to}条记录   共{total}条记录',
		});
	});
	
</script>
<body style="background: none">
	<div class="top-bar">
				<!--a href="#" class="button">ADD NEW </a-->
				<h1>操作员工作查询</h1>
				<div class="breadcrumbs">
					<div class="button-bar">
						<input type="button" name="Submit" value="帮助" class="button"/>
						<input type="button" name="Submit" onclick="javascript:window.location.href='emp.html'" value="查询" class="button"/>
					</div>
					<a href="index.html" target="_top">首页</a> / <a href="index.html">客户服务中心</a>
				</div>
			</div>
	<form>
		  <div class="select-bar">
			<table class="select-table">
				<tr>
					<th>操作员</th>
					<td colspan="3"><input type="text" name="textfield11" class="text"/></td>
				</tr>
				<tr>
					<th>订单类型</th>
					<td>
						<select style="width:130px">
							<option>全部</option>
							<option>新订</option>
							<option>换货</option>
							<option>退货</option>
							<option>退订</option>
							<option>异地收费</option>
						</select>
					</td>
					<th>商品名称</th>
					<td><input type="text" name="textfield3" class="text"/></td>
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
			<div class="table" style="width:650px">				
				<table id="tt" class=easyui-datagrid >					
				</table>
				
			</div>
</body>
</html>
