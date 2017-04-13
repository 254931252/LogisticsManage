<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<jsp:include page="../../inc.jsp" ></jsp:include>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html>
<head>
	<title>换货 - 物流管理系统</title>
	<meta http-equiv="content-type" content="text/html; charset=UTF-8" />
	<style media="all" type="text/css">
		@import "style/all.css";
		@import "style/jquery/ui.all.css";
	</style>
	
</head>
<body style="background: none">
			<div class="top-bar">
				<h1>撤销订单 </h1>
				<div class="breadcrumbs">
					<div class="button-bar">
						<input type="button" name="Submit" value="帮助" class="button"/>
						<input type="button" name="Submit"  value="查询" id="button"/>
					</div>
					<a href="login.html" target="_top">首页</a> / <a href="user_index.jsp" target="_top">客户服务中心</a>
				</div>
			</div>
	<form name="frm2" method="post">
		  <div class="select-bar">
			<table class="select-table">
						<tr>
							<th>客户编号(必填)</th>
							<td><input type="text" name="userid" value="${ sessionScope.user2.userid}" class="text" /></td>
							<th>订单状态</th>							
							<td>
								<select style="width:129px" name="osname">								
									<option>配送中</option>
									<option>未提交</option>
									<option>已接单</option>
									<option>已完成</option>
									<option>已签收</option>																
								</select>
							</td>
							
						</tr>
						<tr>
							<th>订购商品</th>
							<td><input type="text" name="proname" class="text"/></td>
							<th>订单生成日期</th>
							<td style="white-space:nowrap">
								<input type='text' class="easyui-datebox" name="createdate" />
							</td>
						</tr>
			</table>
		  </div>
	</form>
			<div class="table" style="width:100%"	>
				<img src="style/img/bg-th-left.gif" width="8" height="7" alt="" class="left" />
				<img src="style/img/bg-th-right.gif" width="7" height="7" alt="" class="right" />
				<table id="tt" class="easyui-datagrid" style="width:100%" ></table>
				
			</div>
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
		var idcard=$("[name=idcard]").val();			
		var name=$("[name=name]").val();
		var tel=$("[name=tel]").val();			
		$.ajax({
			url:"selectUser.html",
			data:{upper:10,lower:1,idcard:idcard,name:name,tel:tel},
			type:"post",
			success:function(json){
				total=json.total;
				json=json.list;
				$("#tt").datagrid('loadData',{"total":total,"rows":json});			
			}
		});
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
			width:'10%',
			align:'center'
		},{
			field:'proname',
			title:'商品名称',
			width:'13%',
			align:'center'
		},{
			field:'buynum',
			title:'数量',
			width:'13%',
			align:'center'
		},{
			field:'proprice',
			title:'单价(元)',
			width:'13%',
			align:'center'
		},{
			field:'cost',
			title:'总额(元)',
			width:'15%',
			align:'center'
		},{
			field:'osname',
			title:'订单状态',
			width:'13%',
			align:'center'
		},{
			field:'t1',
			width:'10%',
			align:'center',
			title:'换货',
			formatter:function(value,row,index){
				var btn="";
				if(row.isdefault!=0){
					btn=$.formatString(
						'<a class="detailed"  onclick="update(\'{0}\')"></a>',
						row.userid);		
				}
				return btn;
			} 
		}]],
		onLoadSuccess : function(data) {
						$('.detailed').linkbutton({
							text:"换货"
						}), $('.detailed').linkbutton('resize', { //设置按钮的高度
							height : 20
						});
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
						json=json.list;
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
		function update(userid){
			
			window.location.href="userid="+userid;//执行删除订单方法
		}
</script>
