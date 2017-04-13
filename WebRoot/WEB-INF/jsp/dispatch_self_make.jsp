<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<jsp:include page="../../inc.jsp"></jsp:include>
<title>调度中心 - 物流管理系统</title>
<meta http-equiv="content-type" content="text/html; charset=UTF-8" />
</head>
<body>
	<div style="width:100%;position:relative;" >
		<div id="p" class="easyui-panel" title="自动调度"
			style="width:100%;height:457px;padding:10px;background:#fafafa;">
		
			<div style="position:absolute;top:60px;left:170px;">
				订单生成日期：&nbsp;
				<input id="createDate" type="text" class="easyui-datebox" size="13px" />
			</div>
			<div style="position:absolute;top:60px;left:560px;">
				应发中转分站： &nbsp; 
				<select id="substation" class="easyui-combobox" name="dept" style="width:200px;" panelHeight="200">
						<option value="">全部</option>
					<c:forEach var="sub" items="${substation }">
						<option value="${sub.subName }">${sub.subName }</option>
						
					</c:forEach>
					
				</select>
				<a id="btn" class="easyui-linkbutton">筛选</a><a id="btn" class="easyui-linkbutton" onclick="selfDispatch()" style="margin-left:500px;color:#F00;font-weight:700">自动调度</a>
			</div>
			

			<div style="width:100%;position:absolute;top:100px;">
				<table id="tt" style="width:99%;height:330px;"></table>
			</div>
		</div>

	</div>
</body>
</html>
<script language="javascript">
var total;
$(function(){

	var p =$("#tt").datagrid('getPager');
	$(p).pagination({
		pageSeze:10,
		pageList:[5,10,15]
	});
	var createDate =$("#createDate").val();
	var substation=$("#substation").combobox("getValue");
	$.ajax({
		url:'hand_make.html',
		type:'post',
		data:{top:10,down:1,createDate:createDate,subName:substation},
		success:function(result){
			total=result.total;
			
			var json = result.list;
			$("#tt").datagrid('loadData',{"total":total,"rows":json});
		}
	});
});

function select(){
	var createDate =$("#createDate").val();
	var substation=$("#substation").combobox("getValue");
	$.ajax({
		url:'hand_make.html',
		type:'post',
		data:{top:10,down:1,createDate:createDate,subName:substation},
		success:function(result){
			tatol=result.total;
			var json = result.list;
			$("#tt").datagrid('loadData',{"total":total,"rows":json});
		}
	});
}
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
					sortName:'ordid',
					sortOder:'asc',
					columns : [ [
							{
								field : 'ordid',
								title : '订单号',
								width : '12.5%',
								align : 'center'
							},
							{
								field : 'proid',
								title : '商品编号',
								width : '12.5%',
								align : 'center'
							},
							{
								field : 'name',
								title : '客户',
								width : '12.5%',
								align : 'center'
							},
							{
								field : 'createdate',
								title : '订单产生日期',
								width : '12.5%',
								align : 'center'
							},
							{
								field : 'buynum',
								title : '购买数量',
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
								field : 'proadress',
								title : '投递地址',
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
											'<input type=checkbox name=dispatch value={0}  />',row.ordid);
									}
									return btn;
								}
							} ] ],
					onLoadSuccess : function(data) {
						$("#input[name=dispatch]").unbind();
						
						
					}
				});
				
				function selfDispatch(){
					var check=[];
					var a;
					$("input[name=dispatch]:checked").each(function(){
							check.push($(this).val());
							a=check.join(",");
						});
					if(check.length==0){
						$("input[name=dispatch]").each(function(){
							$(this).attr("checked","checked");
						});					
						$("input[name=dispatch]:checked").each(function(){
							check.push($(this).val());
							a=check.join(",");
						});
						
					};
					var doTaskId ='${sessionScope.user2.userid}';
					alert(a);
					$.ajax({
						url:'selfDispatch.html',
						type:'post',
						data:{a:a,doTaskId:doTaskId},
						success:function(result){
							alert("自动调度成功");
							var createDate =$("#createDate").val();
							var substation=$("#substation").combobox("getValue");
							$.ajax({
								url:'hand_make.html',
								type:'post',
								data:{top:10,down:1,createDate:createDate,subName:substation},
								success:function(result){
									tatol=result.total;
									var json = result.list;
									$("#tt").datagrid('loadData',{"total":total,"rows":json});
								}
							});
						}
					});
					
					
				};
				
		var p = $("#tt").datagrid('getPager'); //返回页面对象 
		var opts = $("#tt").datagrid('options');
		$(p).pagination({
			onSelectPage:function(pageNumber,pageSize){
				opts.pageNumber=pageNumber;
				opts.pageSize=pageSize;
				var createDate =$("#createDate").val();
				var substation=$("#substation").commbobox("getValue");
				$("#tt").pagination('loading');
				$.ajax({
					url:'hand_make.html',
					type:'post',
					data:{top:pageNumber*pageSize,down:(pageNumber-1)*pageSize,createDate:createDate,subName:substation},
					success:function(json){
						total = json.total;
						
						json=json.list;
						$("#tt").datagrid('loadData',{"total":total,"rows":json});
					}
				
				});
				$("#tt").datagrid('loaded');
			}
		
		});
		$(p).pagination({
			pageSize : 10,
			pageList : [ 10, 15, 20 ],
			displayMsg : '当前显示{from}-{to}条记录   共{total}条记录',
		});

</script>
