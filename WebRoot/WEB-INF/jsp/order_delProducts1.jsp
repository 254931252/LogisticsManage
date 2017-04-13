<%@ page language="java" import="java.util.*" pageEncoding="GBK"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<jsp:include page="../../inc.jsp" ></jsp:include>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html>
<head>
	<title>退货详单 - 物流管理系统</title>
	<meta http-equiv="content-type" content="text/html; charset=gb2312" />
	<style media="all" type="text/css">@import "style/all.css";</style>
	
</head>
<body style="background: none">
	<div class="top-bar">
				<!--a href="#" class="button">ADD NEW </a-->
				<h1>退货详单</h1>
				<div class="breadcrumbs"><a href="user_index.html" target="_top">首页</a>  <a href="user_index.html">客户服务中心</a></div>
			</div>
			<div class="select-bar"/>
			<div class="table">
				
				<table id="tt" class=easyui-datagrid style="width:700" >
					
					<tr>
						<td class="first style1" style="width:150px">总额</td>
						<td colspan="9" style="width:50px">88888元</td>
					</tr>
				</table>
				
				<div align="center" style="width:100%;">
					
				</div>
			</div>
</body>
</html>
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
			title:'商品编号' 
	},{
			field:'t',
			width:'100',
			align:'center',
			title:'商品名称'    
	},{
			field:'t',
			width:'100',
			align:'center',
			title:'数量' 
	},{
			field:'t',
			width:'100',
			align:'center',
			title:'单位'     												
	},{
			field:'t',
			width:'100',
			align:'center',
			title:'单价' 
	},{
			field:'t',
			width:'100',
			align:'center',
			title:'金额' 
	},{
			field:'t',
			width:'100',
			align:'center',
			title:'商品说明' 
	}]],
		pagination:true,//可分页
		rownumbers:true  //行号不累加
	});
	});
</script>
