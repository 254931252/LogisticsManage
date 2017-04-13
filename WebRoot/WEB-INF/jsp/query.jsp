<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>

<jsp:include page="../../inc.jsp"></jsp:include>
  <head>
  
    <title>任务单查询与分配</title>
    

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
  <div id="p" class="easyui-panel" title="任务查询" style="width:100%;height:477px;padding:10px;text-align: right;">

		<a id="btn2" class="easyui-linkbutton" onclick="get_condition()">查询条件切换</a>
	
	<div class="easyui-panel" id="orderNum" style="width:100%;padding:10px;margin:5px 0;font-size:14px">
		任务单号:<input name="taskId" id="taskId" class="easyui-textbox" style="width:200px"/>
		<a id="btn1" onclick="select()" class="easyui-linkbutton" data-options="iconCls:'icon-search'"> 查询</a>
	</div>
	<div id="tiaojian" class="easyui-panel" style="display:none;width:100%;padding:10px;margin:5px 0;font-size:14px">
		生成日期：<input id="createDate" class="easyui-datebox" style="width:200px"/>&nbsp;
		派送员：<select  id="send" class="easyui-combobox" style="width:145px">
			<option value="">--请选择--</option>
			<c:forEach var="send" items="${senders }">
				<option value="${send.senId }">${send.senName }</option>
			</c:forEach>
		</select>&nbsp;&nbsp;
		<a id="btn" onclick="select()" class="easyui-linkbutton" data-options="iconCls:'icon-search'">查询</a>
	</div>
	
		<table id="table"  style="width:100%;height:277px">
			
		</table>
	
	</div>
  </body>
</html>
<script type="text/javascript">
var total;
 var i=0;
		 function get_condition(){
		       if(i%2==1){
		       		$("#taskId").textbox("setValue","");
			        document.getElementById('tiaojian').style.display="none";
					document.getElementById('orderNum').style.display="block";
					
					i=0;
			   }
			   else{
			   		
					var createDate=$("#createDate").textbox("setValue","");
					var sender = $("#send").combobox("setValue","");
					var orderState=$("#osid").combobox("setValue","");	
			        document.getElementById('tiaojian').style.display="block";
					document.getElementById('orderNum').style.display="none";
					
			        i=1;
			   }
		 }
$(function(){
	 
	var p = $("#table").datagrid('getPager');
	$(p).pagination({
		pageSize:10,
		pageList:[ 5, 10, 15]
	});
		show();
});
	function select(){
		show();
	}
	function show(){	
		var taskId=$("#taskId").textbox("getValue");
		var createDate=$("#createDate").textbox("getValue");
		var sender = $("#send").combobox("getValue");
		var orderState="";	
		$.ajax({
			url:'queryList.html',
			type:'post',
			data:{top:10,down:1,taskId:taskId,createDate:createDate,sender:sender,orderState:orderState},
			success:function(result){
				var array = eval("("+result+")");
				total=array[0]; 
				array.shift();
				$("#table").datagrid('loadData',{"total":total,"rows":array});
			}
		});
	}
	
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
			title : '操作（详细信息|回执录入）',
			formatter:function(value,row,index){  
				var btn="";
				if(row.isdefault!=0){
            		btn =$.formatString( '<a class="look" id="look" onclick="dolook(\'{0}\');"></a><a class="delete" id="delete" onclick="doDelete(\'{1}\',\'{2}\');"></a>',row.taskId,row.taskId,row.osname)
            	return btn; 
			}
        }  
		}]],
		onLoadSuccess:function(data){  
	        $('.delete').linkbutton({text:'回执录入（打印）'}), 
	        $('.delete').linkbutton('resize',{        		//设置按钮的高度
	        	height:30
	        });
	        
			$('.look').linkbutton({text:'查看详情'}), 
	        $('.look').linkbutton('resize',{        		//设置按钮的高度
	        	height:30
	        });
	
	       
   		 } 
	});
	
	function dolook(id){							//查看
		
			location.href="query_single_task2.html?id="+id;
			
		
	};
	 function doDelete(id){
		location.href="query_add_info.html?id="+id;
	};
		var p = $("#table").datagrid('getPager'); //返回页面对象
		var opts = $("#table").datagrid('options');
		$(p).pagination({											//分页
			onSelectPage : function(pageNumber, pageSize) {
				
				var opts = $("#table").datagrid('options');
				opts.pageNumber = pageNumber;
				opts.pageSize = pageSize;
				var taskId=$("#taskId").textbox("getValue");
				var createDate=$("#createDate").textbox("getValue");
				var sender = $("#send").combobox("getValue");
				var orderState=$("#osid").combobox("getValue");	
					
				$.ajax({
					url:'queryList.html',
					type:'post',
					data:{top : pageNumber * pageSize,down : (pageNumber - 1) * pageSize + 1,taskId:taskId,createDate:createDate,sender:sender,orderState:orderState},
					success:function(result){
						var array = eval("("+result+")");
						
						var total=array[0]; 
						array.shift();
						$("#table").datagrid('loadData',{"total":total,"rows":array});
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
