<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"
			+ request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<jsp:include page="../../inc.jsp"></jsp:include>
<title>极光物流-货物管理</title>
<meta http-equiv="content-type" content="text/html; charset=UTF-8" />
</head>
<body>
	<div style="width:100%;position:relative;" >
		<div id="p" class="easyui-panel" title="出入库查询"
			style="width:100%;height:659px;padding:10px;background:#fafafa;">
			<div style="position:absolute;top:65px;left:80px;">
				出库/入库&nbsp;&nbsp;&nbsp;&nbsp;
				<select editable="false" id="cb" class="easyui-combobox" name="dept" style="width:200px;" panelHeight="42">
					<option>入库</option>
					<option>出库</option>
				</select>
			</div>
			<div style="position:absolute;top:65px;left:500px;">
				出/入库货物 &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
				<input id="proName" type="text" class="easyui-textbox" />
			</div>
			<div style="float:right;margin-right: 30px;margin-top: 15px;">
				<a id="btn" >查询</a>
			</div>
			<div style="width:100%;position:absolute;top:100px;left:0px;">
				<table id="tt" style="width:100%;height:558px;">
				</table>
			</div>
		</div>
	</div>
</body>
</html>
<script language="javascript">
	var whId = <%=request.getParameter("whId") %>;
	var key = "";
	var proName = "";
	var upper = 20;
	var lower = 1;
	var total;
	var size = 0;
	var page = 1;
	function changeTable(){
		key = $("#cb").combobox('getValue');
		$.ajax({
			data:{key:key,proName:proName,whId:whId,upper:upper,lower:lower},
			datatype:'text',
			url:'ooiList.html',
			type:'post',
			success:function(result){
				total = result.total;
				listLength = result.list.length;
				$("#tt").datagrid("loadData",{"total":total,"rows":result.list});
			},
			error:function(){
				alert("error");
			}
		});
	}
	$(function() {
		changeTable();
		$('#btn').bind('click', function() {
			proName = $("#proName").val();
			changeTable();
		});
		$('#btn').linkbutton({
			iconCls : 'icon-search'
		});
		$('#cb').combobox({
    		onSelect : function(){
    			key = $("#cb").combobox('getValue');
    			changeTable();
    		}  
		});
		$('#tt').datagrid(
				{
					nowrap : true,//显示数据
					striped : true,//是否显示斑马效果
					rownumbers : false,//行号列
					fitColumns : true,//允许表格自动缩放，以适应父容器
					remoteSort : false,//服务器对数据进行排序
					singleSelect : true,//单选
					checkbox : true,//复选
					pagination : true,//显示分页
					columns : [ [
							{
								field : 'whName',
								title : '出库/入库库房',
								width : '20%',
								align : 'center'
							},
							{
								field : 'userName',
								title : '库房管理员',
								width : '15%',
								align : 'center'
							},
							{
								field : 'proName',
								title : '货物名称',
								width : '20%',
								align : 'center'
							},
							{
								field : 'proAmount',
								title : '出/入库数量',
								width : '14%',
								align : 'center'
							},
							{
								field : 'inOrOut',
								title : '出库/入库',
								width : '12%',
								align : 'center'
							},
							{
								field : 'ooidate',
								title : '出库/入库时间',
								width : '18%',
								align : 'center',
							}] ],
					onLoadSuccess : function(data) {
						$('.detailed').linkbutton({
							text : '查看详情',
						}), $('.detailed').linkbutton('resize', { //设置按钮的高度
							height : 20
						});
					}
				});
		var p = $("#tt").datagrid('getPager'); //返回页面对象
		var opts = $("#tt").datagrid('options');
		$(p).pagination({
			pageSize : 20,
			pageList : [20],
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
