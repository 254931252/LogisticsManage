<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<c:set var="ctx" value="${pageContext.request.contextPath}"/>
<jsp:include page="../../inc.jsp" />
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html>
<head>

	<title>客户信息查询 - 物流管理系统</title>	
	<meta http-equiv="content-type" content="text/html; charset=UTF-8" />
	<style media="all" type="text/css">@import "style/all.css";</style>	
	<script type="text/javascript">
		function del(url){
			if(window.confirm("确认删除吗？")){
				window.location.href=url;
			}
		}
	</script>
</head>
<body style="background: none">
	<div class="top-bar">
		<h1>客户信息查询</h1>
		<div class="breadcrumbs">
			<div class="button-bar">
				<input type="button" name="Submit" value="帮助" class="button"/>
				<input type="button" name="Submit" onclick="javascript:window.location.href='user_add.html'" value="新增客户" />
				<input type="button" name="Submit" value="查询" id="button"/>
			</div>
			<a href="login.html" target="_top">首页</a> / <a href="user_index.html" target="_top">客户服务中心</a>
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
				<table id="tt" class="easyui-datagrid" style="width:100%,height:80%">
									
				</table>				
			</div>
</body>
</html>
<script type="text/javascript">
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
		sortName: 'userid',//根据userid排序号
		sortOrder:'asc',
		remoteSort:false,
		columns :[[{
			field:'userid',
			width:'12%',
			align:'center',
			title:'客户编号' 
		},{
			field:'name',
			width:'12%',
			align:'center',
			title:'客户姓名' 
		},{
			field:'idcard',
			width:'12%',
			align:'center',
			title:'身份证编号' 
		},{
			field:'tel',
			width:'13%',
			align:'center',
			title:'移动电话' 
		},{
			field:'address',
			width:'12%',
			align:'center',
			title:'联系地址' 
		},{
			field:'t1',
			width:'13%',
			align:'center',
			title:'编辑',
			formatter:function(value,row,index){
				var btn="";
				if(row.isdefault!=0){
					btn=$.formatString(
						'<a class="detailed"  onclick="update(\'{0}\')">&nbsp;<a class="aa"  onclick="del(\'{1}\')"></a>',
						row.userid,row.userid);		
				}
				return btn;
			} 
		},{
			field:'t2',
			width:'14%',
			align:'center',
			title:'订单',
			formatter:function(value,row,index){
				var btn="";
				if(row.isdefault!=0){
					btn=$.formatString(
						'<a class="button1"  onclick="save(\'{0}\')"></a>&nbsp;<a class="bb" onclick="add(\'{1}\')"></a>',
						row.userid,row.userid);		
				}
				return btn;
			}
		},{
			field:'t3',
			width:'12%',
			align:'center',
			title:'查看' ,
			formatter:function(value,row,index){
				var btn="";
				if(row.isdefault!=0){
					btn=$.formatString(
						'<a class="cc" onclick="query(\'{0}\')"></a>',
						row.userid);	
				}
				return btn;
			}
		}]],		
		onLoadSuccess : function(data) {
						$('.detailed').linkbutton({
							text:"编辑"
						}), $('.detailed').linkbutton('resize', { //设置按钮的高度
							height : 20
						});
						$('.aa').linkbutton({
							text:"删除"
						}), $('#aa').linkbutton('resize', { //设置按钮的高度
							height : 20
						});
						$('.button1').linkbutton({
							text:"订单查询"
						}), $('.button1').linkbutton('resize', { //设置按钮的高度
							height : 20
						});
						$('.bb').linkbutton({
							text:"添加"
						}), $('.bb').linkbutton('resize', { //设置按钮的高度
							height : 20
						});
						$('.cc').linkbutton({
							text:"详情"
						}),$('.cc').linkbutton('resize',{
							height : 20
						});
					},
			
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
		function update(userid){//根据userid修改客户信息
			
			window.location.href="user_update.html?userid="+userid;
		}
		function del(userid){//根据userid删除客户信息		
			$.ajax({
				url:"delUserByUserid.html",
				data:{userid:userid},
				success:function(json){
				total=json.total;
				json=json.list;
				$("#tt").datagrid('loadData',{"total":total,"rows":json});
		
			}
			});
			
		}
		function save(userid){//根据userid 查询历史订单
			window.location.href="user_orderforms.html?userid="+userid;
		}
		function add(userid){//添加订单
			window.location.href="order_add.html?userid="+userid;
		}
		function query(userid){//根据userid查询客户详情
			
			window.location.href="user_detail.html?userid="+userid;
		}
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
