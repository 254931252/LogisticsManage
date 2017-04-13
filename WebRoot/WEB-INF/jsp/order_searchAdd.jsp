<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<jsp:include page="../../inc.jsp" ></jsp:include>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html>
<head>
	<title>新订订单 - 物流管理系统</title>
	<meta http-equiv="content-type" content="text/html; charset=UTF-8" />
	<style media="all" type="text/css">@import "style/all.css";</style>
	
</head>
<body style="background: none">
			<div class="top-bar">
				<h1>新订订单</h1>
				<div class="breadcrumbs">
					<div class="button-bar">
						<input type="button" name="Submit" value="帮助" class="button"/>
						<input type="button" name="Submit" value="查询" id="button"/>
					</div>
					<a href="index.html" target="_top">首页</a> / <a href="index.html" target="_top">客户服务中心</a>
				</div>
			</div>
<form>
		  <div class="select-bar">
			<table class="select-table">
				<tr>
					<th>身份证号</th>
					<td><input type="text" name="idcard" class="text"/></td>
					<th>姓名</th>
					<td><input type="text" name="name" class="text"/></td>
				</tr>
				<tr>
					<th>电话号码</th>
					<td><input type="text" name="tel" class="text"/></td>
					<th></th>
					<td></td>
				</tr>
			</table>
			</div>
	</form>
			<div class="table" style="width:100%">				
				<table id="tt" class=easyui-datagrid style="width:100%"></table>				
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
		url:"selectUser.html",
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
		width:'100%',    //对datagrid表格设置属性
		nowrap: true,//表示禁止单元格中的文字自动换行
		striped: true,//是否显示斑马线效果
		collapsible: true,//定义是否显示可折叠按钮。
		loadMsg: '数据加载中.....',    //在数据表格加载远程数据的时候显示消息。
		fitColumns: true ,     //真正的自动展开/收缩列的大小，以适应网格的宽度，防止水平滚动。
		pagination : true,//显示分页
		sortName: 'userid',
		sortOrder:'asc',
		remoteSort:false,
		columns :[[{
			field:'userid',
			width:'15%',
			align:'center',
			title:'客户编号' 
		},{
			field:'name',
			width:'15%',
			align:'center',
			title:'客户姓名' 
		},{
			field:'idcard',
			width:'15%',
			align:'center',
			title:'身份证编号' 
		},{
			field:'tel',
			width:'15%',
			align:'center',
			title:'移动电话' 
		},{
			field:'adress',
			width:'15%',
			align:'center',
			title:'联系地址' 
		},{
			field:'a',
			width:'25%',
			align:'center',
			title:'操作' ,
			formatter:function(value,row,index){
				var btn="";
				if(row.isdefault!=0){
					btn=$.formatString(
						'<a class="cc" onclick="query(\'{0}\')"></a>',
						row.userid);	
				}
				return btn;
			}
		}
		]],		
		onLoadSuccess : function(data) {
						$('.cc').linkbutton({
							text:"新订"
						}), $('.cc').linkbutton('resize', { //设置按钮的高度
							height : 20
						});
						
					},
			
				});
				
		function query(userid){
			window.location.href="order_add.html?userid="+userid;
		}
		var p = $("#tt").datagrid('getPager'); //返回页面对象
		var opts = $("#tt").datagrid('options');

		$(p).pagination({
			onSelectPage : function(pageNumber,pageSize){
				var opts = $("#tt").datagrid('options');
				opts.pageNumber = pageNumber;
				opts.pageSize = pageSize;
				$(this).pagination('loading');
				$.ajax({
					url:"selectUser.html",
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
		var p = $("#tt").datagrid('getPager'); //返回页面对象
		var opts = $("#tt").datagrid('options');
		$(p).pagination({											//分页
			onSelectPage : function(pageNumber, pageSize) {
				var opts = $("#tt").datagrid('options');
				opts.pageNumber = pageNumber;
				opts.pageSize = pageSize;
				$(this).pagination('loading');
				$.ajax({
					url : "selectUser.html",
					type : "post",
					data : {
						upper : pageNumber * pageSize,
						lower : (pageNumber - 1) * pageSize + 1
					},
					success : function(json) {
						
						total = json.total;
						json=json.list;
						$("#tt").datagrid('loadData', {
							"total" : total,
							"rows" : json
						});
					}
				});
				$(this).pagination('loaded');
			},
		});
		$(p).pagination({
			pageSize : 10,
			pageList : [ 5, 10, 15 ],
			displayMsg : '当前显示{from}-{to}条记录   共{total}条记录',
		});
		
</script>
