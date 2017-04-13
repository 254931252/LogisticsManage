<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<jsp:include page="../../inc.jsp"></jsp:include>
<title>极光物流-货物管理</title>
<meta http-equiv="content-type" content="text/html; charset=UTF-8" />
</head>
<body>
	<div style="width:100%;position:relative;" >
		<div id="p" class="easyui-panel" title="库房设置"
			style="width:100%;height:364px;padding:10px;background:#fafafa;">
			<div style="position:absolute;top:55px;left:80px;">
				所属区域&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
				<select id="cb" editable="false" class="easyui-textbox" name="dept" style="width:200px;" panelHeight="60">
					<option value=0>不限</option>
					<c:forEach var="dis" items="${disList }">
       					<option value=${dis.disid } >${dis.disname }</option>
    				</c:forEach>
				</select>
			</div>
			<div style="position:absolute;top:115px;left:80px;">
				库房管理者 &nbsp;&nbsp;
				<input id="username" type="text" class="easyui-textbox" />
			</div>
			<div style="float:right;margin-right: 30px;margin-top: 15px;">
				<a id="btn" >
				查询
				</a>
			</div>
			
			<div style="width:100%;position:absolute;top:180px;left:0px;">
				<table id="tt" style="width:100%;height:183px;">
				</table>
			</div>
		</div>

	</div>
</body>
</html>
<script language="javascript">
	var userName = "";
	var upper = 5;
	var lower = 1;
	var disId = 0;
	var total;
	var size = 0;
	var page = 1;
	function changeTable(){
		$.ajax({
			data:{disId:disId,userName:userName,upper:upper,lower:lower},
			datatype:'text',
			url:'selectWareHouse.html',
			type:'post',
			success:function(result){
				total = result.total;
				$("#tt").datagrid("loadData",{"total":total,"rows":result.list});
			},
			error:function(){
				alert("error");
			}
		});
	}
	function dodetailed(whId){
		window.location.href="outorinto_warehouse.html?whId=" + whId;
	}
	$(function() {
		changeTable();
		$('#btn').bind('click', function() {
			userName = $("#username").val();
			changeTable();
		});
		$('#cb').combobox({
    		onSelect : function(){
    			disId = $("#cb").combobox('getValue');
    			changeTable();
    		}  
		});
		$('#btn').linkbutton({
			iconCls : 'icon-search'
		});
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
								field : 'whId',
								title : '库房编号',
								width : '10%',
								align : 'center'
							},
							{
								field : 'whName',
								title : '库房名称',
								width : '15%',
								align : 'center'
							},
							{
								field : 'whAddress',
								title : '库房地址',
								width : '25%',
								align : 'center'
							},
							{
								field : 'userName',
								title : '库房管理员',
								width : '20%',
								align : 'center'
							},
							{
								field : 'whLevel',
								title : '库房级别',
								width : '10%',
								align : 'center'
							},
							{
								field : 'way',
								title : '操作',
								width : '19%',
								align : 'center',
								formatter : function(value, row, index) {
									var btn = "";
									if (row.isdefault != 0) {
										btn = $.formatString(
												'<a class="detailed" id="detailed" onclick="dodetailed(\'{0}\')"></a>',
												row.whId);
									}
									return btn;
								}
							} ] ],
					onLoadSuccess : function(data) {
						$('.detailed').linkbutton({
							text : '查看出入库记录',
							iconCls : 'icon-search'
						}), $('.detailed').linkbutton('resize', { //设置按钮的高度
							height : 20
						});
					}
				});
		var p = $("#tt").datagrid('getPager'); //返回页面对象
		var opts = $("#tt").datagrid('options');
		$(p).pagination({
			pageSize : 5,
			pageList : [5],
			displayMsg : '当前显示{from}-{to}条记录   共{total}条记录',
		});
		$(p).pagination({//分页
			onSelectPage : function(pageNumber, pageSize) {
				var opts = $("#tt").datagrid('options');
				opts.pageNumber = pageNumber;
				opts.pageSize = pageSize;
				$(this).pagination('loading');
				upper = pageNumber * pageSize;
				lower = (pageNumber - 1) * pageSize + 1;
				size = pageSize;
				page = pageNumber;
				changeTable();
				$(this).pagination('loaded');
			},
		});
	});
</script>
