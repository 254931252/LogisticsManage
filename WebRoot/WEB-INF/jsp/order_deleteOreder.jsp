<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<jsp:include page="../../inc.jsp" ></jsp:include>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html>
<jsp:include page="../../inc.jsp" ></jsp:include>
<head>
	<title>退订 - 物流管理系统</title>
	<meta http-equiv="content-type" content="text/html; charset=UTF-8" />
	<style media="all" type="text/css">
		@import "../../style/all.css";
		@import "../../style/jquery/ui.all.css";
	</style>
	
</head>
<body style="background: none" >
	<div class="top-bar">
		<!--a href="#" class="button">取 消</a><a href="#" class="button">保 存</a-->
		<h1>退订</h1>
		<div class="breadcrumbs">
			<a href="order_index.html" target="_top">首页</a> /
			<a href="..order_index.html" target="_top">客户服务中心</a>
		</div>
	</div>
	<div class="select-bar"/>
<form name="frm5" method="post">
	<div class="table">
		<img src="style/img/bg-th-left.gif" width="8" height="7" alt="" class="left" />
		<img src="style/img/bg-th-right.gif" width="7" height="7" alt="" class="right" />
		<table class="listing form" cellpadding="0" cellspacing="0">
			<tr>
				<th class="full" colspan="4">退订</th>
			</tr>
			<tr>
				<td class="first">订单编号</td>
				<td>DDxxxxx001</td>
				<td>客户编号</td>
				<td class="last">LBxxxxx001</td>
			</tr>
			<tr>
				<td class="first">退订原因(*)</td>
				<td><input type="text" name="remark" class="text" value="尺码不合"/></td>
				<td>退订时间(*)</td>
				<td class="last" style="white-space:nowrap"><input type='text' class="date-six text" name="orderformGenerateDate" readonly/></td>
			</tr>
			<tr>
				<td class="first">操作员(*)</td>
				<td colspan="3" class="last">
					&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
					&nbsp;&nbsp;&nbsp;&nbsp;
					<input name="operatorId" type="text" class="text" value="001"/>
				</td>
			</tr>

		</table>
		<div align="center" style="width:100%;">
			<input type="button" class="button" onclick="javascript:window.history.go(-1);" value=" 返 回 "/>&nbsp;
			<input type="button" class="button" onclick="check()" value=" 退 订 "/>
		</div>
	</div>
</form>
</body>
</html>
<script>
var total;
	$(function(){	
		var p=$("#tt").datagrid('getPager');	
		$(p).pagination({
			pageSize:10,
			pageList:[5,10,15]
		});	
		$.ajax({
			url:"orderUser.html",
			data:{upper:10,lower:1},
			type:"post",
			success:function(json){
				total=json.total;
				json=json.list;
				$("#tt").datagrid('loadData',{"total":total,"rows":json});
			}
		});
	});
		$("#button").bind('click',function(){			
			var userid=$("[name=userid]").val();			
			var osname=$("[name=osname]").val();			
			var proname=$("[name=proname]").val();		
			var createdate=$("[name=createdate]").val();			
			$.ajax({
				url:"orderUser.html",
				data:{upper:10,lower:1,userid:userid,osname:osname,proname:proname,createdate:createdate},
				type:"post",
				success:function(json){
					total=json.total;
					json=json.list;
					$("#tt").datagrid('loadData',{"total":total,"rows":json});
					
				}
			});
		});
		$("#button").linkbutton({
			iconCls:'icon-search'
		});

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
			field:'ordid',
			title:'订单号',
			width:'205px',
			align:'center'
		},{
			field:'proname',
			title:'商品名称',
			width:'205px',
			align:'center'
		},{
			field:'buynum',
			title:'数量',
			width:'205px',
			align:'center'
		},{
			field:'proprice',
			title:'单价(元)',
			width:'205px',
			align:'center'
		},{
			field:'cost',
			title:'总额(元)',
			width:'205px',
			align:'center'
		},{
			field:'osname',
			title:'订单状态',
			width:'205px',
			align:'center'
		}]],
		
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
			onSelectPage : function(pageNumber,pageSize){
				var opts = $("#tt").datagrid('options');
				opts.pageNumber = pageNumber;
				opts.pageSize = pageSize;
				$(this).pagination('loading');
				$.ajax({
					url:"orderUser.html",
					data:{
					uppe:pageNumber * pageSize,
					lower:(pageNumber-1)*pageSize+1},
					success:function(json){
						total = json.total;
						josn=json.list;
						$("#tt").datagrid('loadData',{
							"total" : total,
							"rows" : json
						});
					}
				});
				$(this).pagination('loaded');
			},
		});
		$(p).pagination({
			pageSize:10,
			pageList:[5,10,15],
			displayMsg:'当前显示{from}-{to}条记录  共{total}条记录',			
		});
	
</script>

