<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<jsp:include page="../../inc.jsp"></jsp:include>
<title>调度中心 - 物流管理系统</title>
<meta http-equiv="content-type" content="text/html; charset=UTF-8" />
</head>
<body>
	<div style="width:100%;position:relative;" >
		<div id="p" class="easyui-panel" title="任务查询" style="width:100%;height:477px;padding:10px;text-align: right;">

		<a id="btn2" class="easyui-linkbutton" onclick="get_condition()">查询条件切换</a>
	
	<div class="easyui-panel" id="orderNum" style="width:100%;padding:10px;margin:5px 0;font-size:14px">
		任务单号:<input name="taskId" id="taskId" class="easyui-textbox" style="width:200px"/>
		<a id="btn1" onclick="select()" class="easyui-linkbutton" data-options="iconCls:'icon-search'"> 查询</a>
	</div>
	<div id="tiaojian" class="easyui-panel" style="display:none;width:100%;padding:10px;margin:5px 0;font-size:14px">
		生成日期：<input id="createDate" class="easyui-datebox" style="width:200px"/>&nbsp;
		中转分站：<select  id="substation" class="easyui-combobox" style="width:145px">
			<option value="">--请选择--</option>
			<c:forEach var="sub" items="${substation }">
				<option value="${sub.subId }">${sub.subName }</option>
			</c:forEach>
		</select>&nbsp;任务状态：<select id="osid" class="easyui-combobox" style="width:145px">
			<option value="">--请选择--</option>
			<c:forEach var="state" items="${orderState }">
				<option value="${state.osid }">${state.osname }</option>
			</c:forEach>
		</select>&nbsp;
		<a id="btn" onclick="select()" class="easyui-linkbutton" data-options="iconCls:'icon-search'">查询</a>
	</div>
			

			<div style="width:100%;position:absolute;top:130px;">
				<table id="tt" style="width:99%;"></table>
			</div>
		</div>

	</div>
</body>
</html>
<script language="javascript">
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
		var p = $("#tt").datagrid('getPager');
		$(p).pagination({
			pageSize:10,
			pageList:[5,10,15]
		});
		var taskId=$("#taskId").textbox("getValue");
		var createDate=$("#createDate").datebox("getValue");
		var subId=$("#substation").combobox("getValue");
		var osid=$("#osid").combobox("getValue");
		$.ajax({
			url:'doTaskManage.html',
			type:'post',
			data:{top:10,down:1,taskId:taskId,createDate:createDate,subId:subId,osid:osid},
			success:function(json){
				total=json.total;
				json=json.order;
				$("#tt").datagrid('loadData',{"total":total,"rows":json});
			}
		});
	});
	function select(){
		var taskId=$("#taskId").textbox("getValue");
		var createDate=$("#createDate").datebox("getValue");
		var subId=$("#substation").combobox("getValue");
		var osid=$("#osid").combobox("getValue");
		$.ajax({
			url:'doTaskManage.html',
			type:'post',
			data:{top:10,down:1,taskId:taskId,createDate:createDate,subId:subId,osid:osid},
			success:function(json){
				total=json.total;
				json=json.order;
				$("#tt").datagrid('loadData',{"total":total,"rows":json});
			}
		});
	};
	$('#tt').datagrid(
			{
				nowrap : true,//显示数据
				striped : true,//是否显示斑马效果
				rownumbers : true,//行号列
				fitColumns : true,//允许表格自动缩放，以适应父容器
				remoteSort : false,//服务器对数据进行排序
				singleSelect : true,//单选
				checkbox : true,//复选
				pagination : true,//显示分页
				columns : [ [
						{
							field : 'taskId',
							title : '任务单号',
							width : '12.5%',
							align : 'center'
						},
						{
							field : 'ordid',
							title : '订单号',
							width : '12.5%',
							align : 'center'
						},{
							field : 'name',
							title : '客户姓名',
							width : '10%',
							align : 'center'
						},{
							field : 'tel',
							title : '联系电话',
							width : '12.5%',
							align : 'center'
						},
						{
							field : 'createdate',
							title : '订单生成日期',
							width : '12.5%',
							align : 'center'
						},
						{
							field : 'osname',
							title : '订单状态',
							width : '12.5%',
							align : 'center'
						},
						
						{
							field : 'subName',
							title : '中转到站',
							width : '12.5%',
							align : 'center'
						},
						{
							field : 'h',
							title : '操作',
							width : '12.5%',
							align : 'center',
							formatter : function(value, row, index) {
								var btn = "";
								if (row.isdefault != 0) {
									btn = $.formatString(
											'<a class="detailed" id="detailed" onclick="dodetailed(\'{0}\')"></a>&nbsp;<a class="delete" id="delete" onclick="dodelete(\'{1}\',\'{2}\')"></a>',
											row.taskId,row.taskId,row.osname);
								}
								return btn;
							}
						} ] ],
				onLoadSuccess : function(data) {
					$('.detailed').linkbutton({
						text : '查看详情'
					}), $('.detailed').linkbutton('resize', { //设置按钮的高度
						height : 20
					}),
					$('.delete').linkbutton({
						text : '删除'
					}), $('.delete').linkbutton('resize', { //设置按钮的高度
						height : 20
					})
				}
			});
		
		function dodetailed(id){
			location.href="dispatch_task_detail.html?id="+id;
		}
		function dodelete(id,osname){
			if(osname=='已完成'){
				parent.$.messager.confirm( '询问','确定作删除该任务单？',function(b){
					if(b){
						$.ajax({
							url:'doDeleteTask.html',
							type:'post',
							data:{id:id},
							success:function(result){
								alert("给任务单已删除");
								var taskId=$("#taskId").textbox("getValue");
								var createDate=$("#createDate").datebox("getValue");
								var subId=$("#substation").combobox("getValue");
								var osid=$("#osid").combobox("getValue");
								$.ajax({
									url:'doTaskManage.html',
									type:'post',
									data:{top:10,down:1,taskId:taskId,createDate:createDate,subId:subId,osid:osid},
									success:function(json){
										total=json.total;
										json=json.order;
										$("#tt").datagrid('loadData',{"total":total,"rows":json});
									}
								});
							}
						});
					}
				})
			}else{
				alert("该任务单未完成，不能删除");
				var taskId=$("#taskId").textbox("getValue");
				var createDate=$("#createDate").datebox("getValue");
				var subId=$("#substation").combobox("getValue");
				var osid=$("#osid").combobox("getValue");
				$.ajax({
					url:'doTaskManage.html',
					type:'post',
					data:{top:10,down:1,taskId:taskId,createDate:createDate,subId:subId,osid:osid},
					success:function(json){
						total=json.total;
						json=json.order;
						$("#tt").datagrid('loadData',{"total":total,"rows":json});
					}
				});
			}
		}
	var p = $("#tt").datagrid('getPager'); //返回页面对象
	var opts = $("#tt").datagrid('options');
	$(p).pagination({
		onSelectPage:function(pageNumber,pageSize){
			opts.pageNumber=pageNumber;
			opts.pageSize=pageSize;
			var taskId=$("#taskId").textbox("getValue");
			var createDate=$("#createDate").datebox("getValue");
			var subId=$("#substation").combobox("getValue");
			var osid=$("#osid").combobox("getValue");
			$.ajax({
				url:'doTaskManage.html',
			type:'post',
			data:{top:opts.pageNumber*opts.pageSize,down:(opts.pageNumber-1)*opts.pageSize,taskId:taskId,createDate:createDate,subId:subId,osid:osid},
			success:function(json){
				total=json.total;
				json=json.order;
				$("#tt").datagrid('loadData',{"total":total,"rows":json});
			}
			});
		}
	});
	$(p).pagination({
		pageSize : 10,
		pageList : [ 10, 15, 20 ],
		displayMsg : '当前显示{from}-{to}条记录   共{total}条记录',
	});

</script>
