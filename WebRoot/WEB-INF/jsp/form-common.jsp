<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
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
<title>与供应商结算 - 物流管理系统</title>
<meta http-equiv="content-type" content="text/html; charset=UTF-8" />
</head>
<body>
	<div style="width:100%;position:relative;" >
		<div id="p" class="easyui-panel" title="与供应商结算"
			style="width:100%;height:477px;padding:10px;background:#fafafa;">
			<div style="position:absolute;top:55px;left:170px;">
				供应商 &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
				<select id="cb" class="easyui-combobox" name="dept" style="width:200px;" panelHeight="80">
					 <option selected="selected" >--请选择--</option>
					 <c:forEach items="${requestScope.list }" var="supplier">
					 	<option>${supplier.supname }</option>
					 </c:forEach>
				</select>
			</div>

			<div style="position:absolute;top:55px;left:720px;">
				供应的商品 &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
				<input id=proname class="easyui-textbox"  style="width:150px"> 
			</div>
			<div style="position:absolute;top:100px;left:170px;">
				结算状态 &nbsp;&nbsp;&nbsp;&nbsp;
				<select id="bpstate" class="easyui-combobox" name="dept" style="width:200px;" panelHeight="80">
					<option selected="selected" >--请选择--</option>
					<option>未结算</option>
					<option>已结算</option>
				</select>
			</div>
			<div style="position:absolute;left:720px;top:100px;">
				<a id="btn" />
				查询
			</div>
			<div style="position:absolute;left:940px;top:100px;">
				<a id="exp" />
				导出
			</div>

			<div style="width:100%;position:absolute;top:160px;">
				<table id="tt" style="width:99%;"></table>
			</div>
		</div>

	</div>
</body>
</html>
<script language="javascript">
var total;
var supname;
var proname;
var bpstate;
	$(function() {
		
		var p = $("#tt").datagrid('getPager');
		$(p).pagination({
			pageSize : 10,
			pageList : [ 5, 10, 15 ]
		});
		supname=$("#cb").combobox("getValue");
		proname=$("#proname").textbox("getValue");
		bpstate=$("#bpstate").combobox("getValue");
		$.ajax({
			url:"buyProOderList.html",
			type:"post",
			data:{upper:10,lower:1,supname:supname,proname:proname,bpstate:bpstate},
			success:function(json){
				total=json.total;				            
				json=json.list;					
				$("#tt").datagrid('loadData',{"total":total,"rows":json});
			}	
		});	
	});	
		$("#exp").click(function(){
			$.messager.confirm("确认","确认把该搜索结果导出Excel表格？",function(r){
				if(r){
					supname=$("#cb").combobox("getValue");
					proname=$("#proname").textbox("getValue");
					bpstate=$("#bpstate").combobox("getValue");
					$.messager.progress({
						title:'处理中',
						msg:'请稍候'
					});
					setTimeout(function(){
						$.messager.progress("close");
					},3300);
					location.href="exportExcel.html?supname="+supname+"&proname="+proname+"&bpstate="+bpstate;
				}
			});
			
		});
		$('#btn').bind('click', function() {
			supname=$("#cb").combobox("getValue");
			proname=$("#proname").textbox("getValue");
			bpstate=$("#bpstate").combobox("getValue");
			$.ajax({
				url:"buyProOderList.html",
				type:"post",
				data:{upper:10,lower:1,supname:supname,proname:proname,bpstate:bpstate},
				success:function(json){
					total=json.total;				            //获取返回的json对象中第一个数据即表里的数据总数
					json=json.list;					//移除第一个数据
					$("#tt").datagrid('loadData',{"total":total,"rows":json});//遍历json对象中剩下的数据即分页得到的数据list，然后加载到表格中		
				}	
			});	
		});
		$('#btn').linkbutton({
			iconCls : 'icon-search'
		});
		$('#exp').linkbutton({
			iconCls : 'icon-redo'
		});
		$('#tt').datagrid(
				{
					nowrap : true,//显示数据
					striped : true,//是否显示斑马效果
					rownumbers : true,//行号列
					fitColumns : true,//允许表格自动缩放，以适应父容器
					singleSelect : true,//单选
					checkbox : true,//复选
					pagination : true,//显示分页
					columns : [ [
							{
								field : 'proid',
								title : '商品编号',
								width : '20%',
								align : 'center'
							},
							{
								field : 'proname',
								title : '商品名称',
								width : '20%',
								align : 'center'
							},
							{
								field : 'proprice',
								title : '单价',
								width : '15%',
								align : 'center'
							},
							{
								field : 'proamount',
								title : '进货数量',
								width : '15%',
								align : 'center'
							},
							{
								field : 'cost',
								title : '结算金额',
								width : '15%',
								align : 'center'
							},
							{
								field : 'h',
								title : '操作',
								width : '10%',
								align : 'center',
								formatter : function(value, row, index) {
									var btn = "";
									if (row.isdefault != 0) {
										btn = $.formatString(
												'<a class="detailed" id="detailed" onclick="dodetailed(\'{0}\')"></a>',
												row.bpid);
									}
									return btn;
								}
							} ] ],
					onLoadSuccess : function(data) {
						$('.detailed').linkbutton({
							text : '查看'
						}), $('.detailed').linkbutton('resize', { //设置按钮的高度
							height : 20
						})
					}
				});
		var p = $("#tt").datagrid('getPager'); //返回页面对象
		var opts = $("#tt").datagrid('options');
		$(p).pagination({											//分页
			onSelectPage : function(pageNumber, pageSize) {
				var opts = $("#tt").datagrid('options');
				opts.pageNumber = pageNumber;
				opts.pageSize = pageSize;
				
				supname=$("#cb").combobox("getValue");
				proname=$("#proname").textbox("getValue");
				bpstate=$("#bpstate").combobox("getValue");
				$(this).pagination('loading');
				$.ajax({
					url : "buyProOderList.html",
					type : "post",
					data : {
						upper : pageNumber * pageSize,lower : (pageNumber - 1) * pageSize + 1,supname:supname,proname:proname,bpstate:bpstate
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
		
function dodetailed(bpid){
	window.location.href="form_common_look.html?bpid="+bpid;
}
</script>
