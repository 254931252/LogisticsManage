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
<title>与分站结算 - 物流管理系统</title>
<meta http-equiv="content-type" content="text/html; charset=UTF-8" />
<script type="text/javascript" src="js/fixdiv.js"></script>
<script type="text/javascript" src="js/address.js"></script>

</head>
<body>
	<style type="text/css">
* {
	margin: 0;
	padding: 0;
	list-style-type: none;
}

a, img {
	border: 0;
}

body {
	font: 12px/180% Arial, Helvetica, sans-serif, "新宋体";
}

.demo {
	width: 480px;
	margin: 40px auto 0 auto;
}

.demo div {
	height: 40px;
	float: left;
	width: 240px;
}
</style>
	<div style="width:100%;position:relative;">
		<div id="p" class="easyui-panel" title="与分站结算"
			style="width:100%;height:490px;padding:10px;background:#fafafa;">
				<div style="position:absolute;top:55px;left:300px;">
					出发地：&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
					<input type="text" value="" size="15" id="homecity_name" name="homecity_name"
						mod="address|notice" mod_address_source="hotel" mod_address_suggest=""
						mod_address_reference="cityid" mod_notice_tip="中文/拼音" />
					<input id="cityid" name="cityid" type="hidden" value="{$cityid}" />
				</div>
		</div>
	</div>
	<div style="position:absolute;top:55px;left:700px;">
				配送的商品：&nbsp;&nbsp;
				<input id="proName" size="13px" />
			</div>
			<div style="position:absolute;top:100px;left:300px;">
				结算状态：  &nbsp;&nbsp;&nbsp;&nbsp;
				<select id="osname"  name="dept" style="width:120px;" panelHeight="80">
					<option value="--请选择--">--请选择--</option>
					<option value="已签收">未结算</option>
					<option value="已完成">已结算</option>
				</select>
			</div>
			
			<div style="position:absolute;top:100px;left:700px;">
				<a id="btn" />
				查询
			</div>
			
			<div style="width:100%;position:absolute;top:160px;">
				<table id="tt" style="width:99%;"></table>
			</div>
	<script type="text/javascript" src="js/fixdiv.js"></script>
	<script type="text/javascript" src="js/address.js"></script>
</body>
</html>
<script language="javascript">
var total;
var upper;
var lower;
var rows;
var subName;
var proName;
var osname;
	$(function() {
		
		
		$("#osname").combobox({
			onChange:function(){
				search();
			}
		});
		$("#proName").textbox({
			inputEvents:$.extend({},$.fn.textbox.defaults.inputEvents,{
				keyup:function(event){
					if(event.keyCode==13){
						search();
					}
				}
			})
		})
		var p = $("#tt").datagrid('getPager');
		$(p).pagination({
			pageSize : 10,
			pageList : [ 5, 10, 15 ]
		});
		subName=$("#homecity_name").val();
		proName=$("#proName").val();
		osname=$("#osname").combobox("getValue");
		 $.ajax({
			url:'getOderPageList.html',
			data:{upper:10,lower:1,subName:subName,proName:proName,osname:osname},
			type:'post',
			success:function(result){
				total=result.total;
				rows=result.list;
				$("#tt").datagrid('loadData',{"total":total,"rows":rows});
			}
		}); 
		
		$('#btn').bind('click', function() {
			search();
		});
		$('#btn').linkbutton({
			iconCls : 'icon-search'
		});
		
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
							field : 'ordid',
							title : '订单号',
							width : '10%',
							align : 'center'
						},
						{
							field : 'proid',
							title : '商品编号',
							width : '15%',
							align : 'center'
						},
						{
							field : 'proname',
							title : '商品名称',
							width : '15%',
							align : 'center'
						},
						{
							field : 'subName',
							title : '分站名称',
							width : '10%',
							align : 'center'
						},
						{
							field : 'proprice',
							title : '单价',
							width : '15%',
							align : 'center'
						},
						{
							field : 'buynum',
							title : '送货数量',
							width : '10%',
							align : 'center'
						},
						{
							field : 'cost',
							title : '应缴额',
							width : '10%',
							align : 'center'
						},
						{
							field : 'h',
							title : '操作',
							width : '8%',
							align : 'center',
							formatter : function(value, row, index) {
								var btn = "";
								if (row.isdefault != 0) {
									btn = $.formatString(
											'<a class="detailed" id="detailed" onclick="dodetailed(\'{0}\')"></a>',
											row.ordid);
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
			subName=$("#homecity_name").val();
			proName=$("#proName").val();
			osname=$("#osname").combobox("getValue");
			$(this).pagination('loading');
			$.ajax({
				url : "getOderPageList.html",
				type : "post",
				data : {upper : pageNumber * pageSize,lower : (pageNumber - 1) * pageSize + 1,proName:proName,osname:osname,subName:subName},
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
		pageList : [ 10, 15, 20 ],
		displayMsg : '当前显示{from}-{to}条记录   共{total}条记录',
	});
	function search(){
		subName=$("#homecity_name").val();
		proName=$("#proName").val();
		osname=$("#osname").combobox("getValue");
		 $.ajax({
			url:'getOderPageList.html',
			data:{upper:10,lower:1,subName:subName,proName:proName,osname:osname},
			type:'post',
			success:function(result){
				total=result.total;
				rows=result.list;
				$("#tt").datagrid('loadData',{"total":total,"rows":rows});
			}
		}); 
	}
	function dodetailed(ordid){
		location.href="form-validation-look.html?ordid="+ordid;
	}
</script>