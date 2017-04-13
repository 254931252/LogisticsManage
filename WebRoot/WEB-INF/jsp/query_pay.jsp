<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>


<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<jsp:include page="../../inc.jsp"></jsp:include>
  <head>
  
    <title>缴费查询</title>
    

  </head>
  <style>
 	a{
 		text-decoration: none;
 		color:#333;
 		font-size:14px;
 	}
 	a:hover{
 		text-decoration: underline;}
 
 </style>
  <body>

	
	<div id ="p" class="easyui-panel" title="缴费查询" style="width:100%;height:457px;padding:10px;margin:5px 0;font-size:14px">

		商品名称：<input id="proname" class="easyui-textbox" style="width:180px"/>&nbsp;
		<a id="btn"  class="easyui-linkbutton" data-options="iconCls:'icon-search'">查询</a>
	
		<table id="table" class="easyui-datagrid" style="height:357px;">
			
		</table>
	</div>
	
	
  </body>
</html>
<script type="text/javascript">
var total;
$(function(){
	var proname=$("#proname").val();
	var p = $("#table").datagrid('getPager');
	$(p).pagination({
		pageSize:10,
		pageList:[5,10,15]
	});
	$.ajax({
		url:'payList.html',
		type:'post',
		data:{top:10,down:1,proname:proname},
		success:function(result){
			total=result.total;
			var json = result.list;
		$("#table").datagrid('loadData',{"total":total,"rows":json});
		}
	});
	});
	$("#btn").click(function(){
		var proname=$("#proname").val();
		$.ajax({
		url:'payList.html',
		type:'post',
		data:{top:10,down:1,proname:proname},
		success:function(result){
			total=result.total;
			var json = result.list;
		$("#table").datagrid('loadData',{"total":total,"rows":json});
		}
	});
	});
	$("#table").datagrid({
		
		nowrap:true,//禁止文字自动换行
		striped:true,//是否显示斑马线效果
		collapsible:true,//定义可折叠按钮
		loadMsg:'数据加载中......',
		fitColumns:true,//真正的自动展开/收缩的大小以适应网格的宽度，防止水平滚动。
		
		remoteSort:false,
		columns:[[{
			field:'proid',
			width:'25%',
			align:'center',
			title:'商品编号'
		},{
			field:'proname',
			width:'25%',
			align:'center',
			title:'商品名称'
		},{
			field:'buynum',
			width:'25%',
			algin:'center',
			title:'送货数量'
		},{
			field:'cost',
			width:'25%',
			algin:'center',
			title:'实收金额'
		}]],
		
		pagination:true,//可分页
		rownumber:true//行号不累加
	});
	var p=$("#table").datagrid('getPager');//返回页面对象
	var opts=$("#table").datagrid('options');//获取datagrid表格的属性控件
	
	$(p).pagination({
		onSelectPage:function(pageNumber,pageSize){
			opts.pageNumber=pageNumber;
			opts.pageSize=pageSize;
			var proname=$("#proname").val();
			$.ajax({
				url:"payList.html",
				type:"post",
				data:{top:opts.pageNumber*opts.pageSize,down:(opts.pageNumber-1)*opts.pageSize,proname:proname},
				success:function(result){
					
					total=result.total;
					var json=result.list;
					$("#table").datagrid('loadData',{"total":total,"rows":json});
				}
			});
			$(this).pagination('loaded');
		}
	});
	$(p).pagination({
		pageSize:10,
		pageList:[10,15,20],
		displayMsg:'当前显示{from}--{to}条记录  共{total}条记录',
	}); 
</script>
