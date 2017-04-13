<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<jsp:include page="../../inc.jsp" ></jsp:include>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html>
<head>
	<title>换货详单 - 物流管理系统</title>
	<meta http-equiv="content-type" content="text/html; charset=UTF-8" />
	<style media="all" type="text/css">@import "style/all.css";</style>
	
</head>
<body style="background: none">
	<div class="top-bar">
				<!--a href="#" class="button">ADD NEW </a-->
				<h1>换回商品详单</h1>
				<div class="breadcrumbs"><a href="index.html" target="_top">首页</a> / <a href="userr_index.html">客户服务中心</a></div>
			</div>
			<div class="select-bar"/>
			<div class="table" style="width:600px">
				<img src="style/img/bg-th-left.gif" width="8" height="7" alt="" class="left" />
				<img src="style/img/bg-th-right.gif" width="7" height="7" alt="" class="right" />
				<table id="tt" class=easyui-datagrid style="width:600px">
					
				</table>
				<div align="center" style="width:100%;">
					<input type="button" class="button" onclick="javascript:window.history.go(-1);" value="上一步"/>&nbsp;
					<input type="button" class="button" onclick="javascript:window.location='order_updateProducts2.html'" value="下一步"/>
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
			title:'客户名称' 
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
