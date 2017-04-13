<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>


<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<link href="../../easyui/themes/icon.css" rel="stylesheet" type="text/css"/>
<jsp:include page="../../inc.jsp"></jsp:include>
  <head>
  
    <title>任务单查询</title>
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
  	<div style="width:100%;position:relative;" >
		<div id="p" class="easyui-panel" title="订单查询"
			style="width:100%;height:457px;padding:10px;background:#fafafa;">

	
		<div region="center",border="false">
			<table id="table" class="easyui-datagrid" style="width:100%;">
				
			</table>
		</div>
	</div>
	</div>
  </body>
</html>
<script type="text/javascript">
$(function(){
		$("#table").datagrid('loadData',{"total":total,"rows":json});
	})
	$("#table").datagrid({
		
		nowrap:true,//禁止文字自动换行
		striped:true,//是否显示斑马线效果
		collapsible:true,//定义可折叠按钮
		loadMsg:'数据加载中......',
		fitColumns:true,//真正的自动展开/收缩的大小以适应网格的宽度，防止水平滚动。
		sortName:'destory',//表名
		remoteSort:false,
		columns:[[{
			field:'orderNumber',
			width:115,
			align:'center',
			title:'任务单号'
		},{
			field:'a',
			width:115,
			algin:'center',
			title:'订单号'
		},{
			field:'b',
			width:115,
			algin:'center',
			title:'任务生成日期'
		},{
			field:'c',
			width:115,
			algin:'center',
			title:'要求完成日期'
		},{
			field:'d',
			width:115,
			algin:'center',
			title:'任务类型'
		},{
			field:'e',
			width:115,
			algin:'center',
			title:'任务状态'
		},{
			field:'f',
			width:160,
			algin:'center',
			title:'操作（详细信息|分配任务）',
			farmatter:function(value,row,index){
				var btn="";
				btn=$.formatString('<a class="delete" id="delete" onclick="doDelete(\'{0}\');"></a>',row.noticeId);
			}
		}]],
		onLoadSuccess:function(data){
			$('.delete').linkbutton({text:'作废'}),
			$('.delete').linkbutton('resize',{height:15});
		},
		pagination:true,//可分页
		rownumber:true//行号不累加
	});
	var p=$("#table").datagrid('getPager');//返回页面对象
	var opts=$("#table").datagrid('options');//获取datagrid表格的属性控件
	 function doDelete(id){
		parent.$.messager.confirm('询问','确定作废该菜单？',function(b){
			if(b){
				$.ajax({
					url:"",
					type:"post",
					data:{},
					success:function(result){
						var json=eval("("+result+")");
						total=json[0].total;
						json.shift();//移除Json第一个数据
						$("#table").datagrid('loadData',{
							"total":total,
							"rows":json//将rows转为json格式
						})
					}
				})
			}
		})
	}
	var total=0;
	$(p).pagination({
		onSelectPage:function(pageNumber,pageSize){
			opts.pageNumber=pageNumber;
			opts.pageSize=pageSize;
			$(this).pagination("loading");
			$.ajax({
				url:"",
				type:"post",
				data:{},
				success:function(result){
					var json =eval("("+result+")");
					total=json[0].total;
					json.shift();
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
