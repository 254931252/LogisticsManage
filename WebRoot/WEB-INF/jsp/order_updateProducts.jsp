<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<jsp:include page="../../inc.jsp" ></jsp:include>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html>
<head>
	<title>换购商品清单 - 物流管理系统</title>
	<meta http-equiv="content-type" content="text/html; charset=UTF-8" />
	<style media="all" type="text/css">@import "style/all.css";</style>
	
</head>
<body style="background: none">
	<div class="top-bar">
				<!--a href="#" class="button">ADD NEW </a-->
				<h1>换购商品清单</h1>
				<div class="breadcrumbs"><a href="index.html" target="_top">首页</a> / <a href="order_index.html">客户服务中心</a></div>
			</div>
			<div class="select-bar"/>
			<div class="table" style="width:1050px">
				<img src="style/img/bg-th-left.gif" width="8" height="7" alt="" class="left" />
				<img src="style/img/bg-th-right.gif" width="7" height="7" alt="" class="right" />
				<table id="tt" class="easyui-datagrid" style="width:1050px">					
					<tr>
						<td class="first style1">PPxxxxx003</td>
						<td>hp笔记本</td>
						<td>10</td>
						<td>台</td>
						<td>8888元</td>
						<td>无</td>
						<td>88880元</td>
						<td>好货</td>
						<td>无</td>
						<td class="last">
							<img src="style/img/edit-icon.gif" onclick="javascript:window.location='order_update.html'" width="16" height="16" alt="修改" />
							<img src="style/img/hr.gif" width="16" height="16" onclick="javascript:del('order_updateProducts.html')" alt="删除" />
						</td>
					</tr>
				</table>
				<div align="center" style="width:100%;">
					<input type="button" class="button" onclick="javascript:window.history.go(-1)" value="上一步"/>&nbsp;
					<input type="button" class="button" onclick="javascript:window.location='order_updateProcList.html'" value="下一步"/>
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
			title:'单价' 
		},{
			field:'t',
			width:'100',
			align:'center',
			title:'折扣' 
		},{
			field:'t',
			width:'100',
			align:'center',
			title:'总额' 
		},{
			field:'t',
			width:'100',
			align:'center',
			title:'商品说明' 
		},{
			field:'t',
			width:'100',
			align:'center',
			title:'备注' 
		},{
			field:'t',
			width:'100',
			align:'center',
			title:'编辑' 
		}]],		
		onLoadSuccess:function(data){
				$('.detailed').linkbutton({text:'查看'}),  
		        $('.detailed').linkbutton('resize',{		//设置按钮的高度
		        	height:20
		        })
			}		
		});
		var p = $("#tt").datagrid('getPager'); //返回页面对象
		var opts=$("#tt").datagrid('options');
		
		$(p).pagination({
		pageSize : 10,
		pageList : [ 10, 15, 20 ],
		displayMsg : '当前显示{from}-{to}条记录   共{total}条记录',
	});
	});
</script>
