<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html>

<head>
		<jsp:include page="../../inc.jsp"></jsp:include>
	<title>退货管理 - 物流管理系统</title>
	<meta http-equiv="content-type" content="text/html; charset=UTF-8" />
</head>
 <body>

    <div id="p" class="easyui-panel" title="分站库房退货出库"     
        style="width:100%;height:457px;padding:10px;background:#fafafa;">   
   
开始日期<input id="cc" type="text" class="easyui-datebox"/> &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;结束日期<input id="dd" type="text" class="easyui-datebox" />
			<div style="position:absolute;left:500px;top:45px;"><a id="btn"/>查询</div>
			
	<div style="position:absolute;top:78px;left:9px;width:98.7%;"> <table id="tt"></table> </div>
</div> 
</body>
</html>
<script language="javascript"> 
	$(function() {
		$('#btn').bind('click', function() {
			alert('easyui');
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
								field : 'b',
								title : '商品编号',
								width : '130',
								align : 'center'
							},
							{
								field : 'c',
								title : '商品名称',
								width : '100',
								align : 'center'
							},
							{
								field : 'd',
								title : '型号',
								width : '100',
								align : 'center'
							},
							{
								field : 'e',
								title : '厂商',
								width : '120',
								align : 'center'
							},
							{
								field : 'e',
								title : '售价',
								width : '120',
								align : 'center'
							},
							{
								field : 'f',
								title : '退货数量',
								width : '100',
								align : 'center'
							},
							{
								field : 'g',
								title : '计量单位',
								width : '100',
								align : 'center'
							},
							{
								field : 'g',
								title : '退货日期',
								width : '100',
								align : 'center'
							},
							{
								field : 'h',
								title : '操作',
								width : '100',
								align : 'center',
								formatter : function(value, row, index) {
									var btn = "";
									if (row.isdefault != 0) {
										btn = $.formatString(
												'<a class="detailed" id="detailed" onclick="dodetailed(\'{0}\')"></a>',
												row.messageId);
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

		$(p).pagination({
			pageSize : 10,
			pageList : [ 10, 15, 20 ],
			displayMsg : '当前显示{from}-{to}条记录   共{total}条记录',
		});
	});
</script> 