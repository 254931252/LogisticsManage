<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<jsp:include page="../../inc.jsp" ></jsp:include>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html>
<head>
	<title>订单详情 - 物流管理系统</title>
	<meta http-equiv="content-type" content="text/html; charset=UTF-8" />
	<style media="all" type="text/css">@import "style/all.css";</style>
	
</head>
<body style="background: none">
	<div class="top-bar">
		<!--a href="#" class="button">取 消</a><a href="#" class="button">保 存</a-->
		<h1>订单详情</h1>
		<div class="breadcrumbs">
			<a href=".index.html" target="_top">首页</a> /
			<a href="index.html" target="_top">客户服务中心</a>
		</div>
	</div>
	<div class="table">
		<img src="style/img/bg-th-left.gif" width="8" height="7" alt="" class="left" />
		<img src="style/img/bg-th-right.gif" width="7" height="7" alt="" class="right" />
<form>
		<table class="listing form" cellpadding="0" cellspacing="0">
			<tr>
				<th class="full" colspan="4" style="font-size:13px">订单详情</th>
			</tr>
			<tr>
				<td class="first">订单编号</td>
				<td ><b>DDxxxx001<b/></td>
				<td>客户编号</td>
				<td class="last">LBxxxxx001</td>
			</tr>
			<tr>
				<td class="first">备注信息</td>
				<td>无</td>
				<td>货物投递分站</td>
				<td class="last">已投递到某某分站</td>
			</tr>
			<tr>
				<td class="first">订单生成日期</td>
				<td>2009年8月4日 16:21:50</td>
				<td>要求完成日期</td>
				<td class="last">2009年8月4日 16:21:50</td>
			</tr>
			<tr>
				<td class="first">订单类型</td>
				<td>新订</td>
				<td>送货地址</td>
				<td class="last">客户联系地址</td>
			</tr>
			<tr>
				<td class="first">收货人</td>
				<td>客户姓名</td>
				<td>收货人电话</td>
				<td class="last">客户移动电话</td>
			</tr>
			<tr>
				<td class="first">收货人邮编</td>
				<td>客户邮编</td>
				<td>是否要发票</td>
				<td class="last">是</td>
			</tr>
			<tr>
				<td class="first" >付款人</td>
				<td>xxxxx</td>
				<td>付款人地址</td>
				<td class="last">xxxxx</td>
			</tr>
			<tr>
				<td class="first" >付款人电话</td>
				<td >xxxxx</td>
				<td >付款人邮编</td>
				<td class="last">xxxxx</td>
			</tr>
			<tr>
				<td class="first" >是否缺货</td>
				<td >缺货</td>
				<td  >操作员</td>
				<td class="last">001</td>
			</tr>
		</table>
		<br/>
		<table id="tt" class="easyui-datagrid" style="width:700px">				
		</table><br/>
		<div align="right" style="width:85%;">
			<input type="button"  width="200" class="button" onclick="javascript:window.location='search.html'" value="返回"/>			
		</div>
</form>
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

