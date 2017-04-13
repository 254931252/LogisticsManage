<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<jsp:include page="../../inc.jsp"></jsp:include>
  <head>
  
    <title>任务单查询与分配</title>
    

  </head>

  <body>
 
	<div id="tiaojian" title="任务单查询与分配" class="easyui-panel" style="width:100%;height:457px;padding:10px;margin:5px 0;font-size:14px">
		生成日期：<input id="createDate" class="easyui-datetimebox" style="width:200px"/>&nbsp;
		派送地区：<select id="district" class="easyui-combobox" style="width:210px">
				<option value="">--请选择--</option>
			<c:forEach var="dis" items="${district }">
				<option value="${dis.disid }">${dis.disname }</option>
			</c:forEach>
			
		</select>&nbsp;订单状态：<select id="state" class="easyui-combobox" style="width:210px">
			<option value="">--请选择--</option>
			<c:forEach var="state" items="${orderState }">
				<option value="${state.osid }">${state.osname }</option>	
			</c:forEach>
			
			
		</select>&nbsp;
		<a id="btn" href="#" class="easyui-linkbutton" data-options="iconCls:'icon-search'">查询</a>

	<div region="center",border="false">
		<table id="table" class="easyui-datagrid" style="width:100%;height:357px;">
			
		</table>
	</div>
		</div>
  </body>
</html>
<script type="text/javascript">
var total;
$(function(){
	var p = $("#table").datagrid('getPager');
	$(p).pagination({
		pageSize:10,
		pageList:[ 5, 10, 15]
	});
			var createDate=$("#createDate").textbox("getValue");
			var district=$("#district").combobox("getValue");
			var orderState=$("#state").combobox("getValue");
	$.ajax({
		url:'task_sign_form.html',
		type:'post',
		data:{top:10,down:1,createDate:createDate,district:district,orderState:orderState},
		success:function(json){
			total=json.count;
			json=json.task;
			$("#table").datagrid('loadData',{"total":total,"rows":json});
			
		}
	})
	})
	$("#table").datagrid({
		nowrap:true,//禁止文字自动换行
		striped:true,//是否显示斑马线效果
		//collapsible:true,//定义可折叠按钮
		loadMsg:'数据加载中......',
		fitColumns:true,//真正的自动展开/收缩的大小以适应网格的宽度，防止水平滚动。
		sortName:'taskId',
		sortOder:'asc',
		remoteSort:false,
		pagination:true,//可分页
		yrownumber:true,//行号不累加
		columns:[[{
			field:'taskId',
			width:115,
			align:'center',
			title:'任务单号'
		},{
			field:'ordId',
			width:115,
			algin:'center',
			title:'订单号'
		},{
			field:'createDate',
			width:115,
			algin:'center',
			title:'任务生成日期'
		},{
			field:'subName',
			width:115,
			algin:'center',
			title:'分站名称'
		},{
			field:'senName',
			width:115,
			algin:'center',
			title:'派送员'
		},{
			field:'osname',
			width:115,
			algin:'center',
			title:'任务状态'
		},{
			field : 'delete',
			width : 200,
			align : 'center',
			title : '操作（详细信息|分配）',
			formatter:function(value,row,index){  
				var btn="";
				if(row.isdefault!=0){
            		btn =$.formatString( '<a class="look" id="look" onclick="dolook(\'{0}\');"></a><a class="distribute" id="distribute" onclick="dodistribute(\'{1}\');"></a>',row.taskId,row.taskId)
            	return btn; 
			}
        }  
		}]],
		onLoadSuccess:function(data){  
	        $('.distribute').linkbutton({text:'分配任务'}), 
	        $('.distribute').linkbutton('resize',{        		//设置按钮的高度
	        	height:30
	        });
	        
			$('.look').linkbutton({text:'查看详情'}), 
	        $('.look').linkbutton('resize',{        		//设置按钮的高度
	        	height:30
	        });
	
	       
   		 } 
	});
	
	function dolook(id){
			location.href="query_single_task.html?id="+id;
	};
	function dodistribute(id){
		location.href="query_task_distribut.html?id="+id;
	};
	var p=$("#table").datagrid('getPager');
	var opts=$("#table").datagrid('options');
	$(p).pagination({
		onSelectPage:function(pageNumber,pageSize){
			opts.pageNumber=pageNumber;
			opts.pageSize=pageSize;
			$.ajax({
				url:'task_sign_form.html',
				type:'post',
				data:{top:opts.pageNumber*opts.pageSize,down:(opts.pageNumber-1)*opts.pageSize,createDate:createDate,district:district,orderState:orderState},
				success:function(json){
					total=json.count;
					json=json.task;
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
