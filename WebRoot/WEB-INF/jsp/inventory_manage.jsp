<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<jsp:include page="../../inc.jsp"></jsp:include>
<title>极光物流-配送中心</title>
<meta http-equiv="content-type" content="text/html; charset=UTF-8" />
</head>
<body>
	<div style="width:100%;position:relative;" >
		<div id="p" class="easyui-panel" title="库存查询"
			style="width:100%;height:659px;padding:10px;background:#fafafa;">
			<div style="position:absolute;top:55px;left:80px;">
				货物类型&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
				<select editable="false" id="cb" class="easyui-textbox" name="dept" style="width:200px;" panelHeight="60">
					<option value=0>所有分类</option>
					<c:forEach var="type" items="${typeList }">
       					<option value=${type.ptid } >${type.pttype }</option>
    				</c:forEach>
				</select>
			</div>

			<div style="position:absolute;top:55px;left:500px;">
				货物名称 &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
				<input type="text" class="easyui-textbox" id="keyword" />
			</div>
			<div style="float:right;margin-right: 30px;margin-top: 15px;">
				<a id="btn" />
				查询
			</div>

			<div style="width:100%;position:absolute;top:100px;left:0px;">
				<table id="tt" style="width:100%;height:558px;">
					
				</table>
			</div>
			
			<div id="dess" style="line-height:26px; padding:10px 40px;position:absolute;width: 220px;border:1px #95b8e7 solid;height: 200px;margin: auto;top:148px;left:460px;display: none;opacity:0.9;background-color:#e7f0ff; border-radius:3px;">
				<p style="font-size: 20px;"><strong>进购商品</strong></p>
				<div style="margin: 0px;">
					<div style="font-size: 14px;">商品名称：<span><strong id="proName"></strong></span></div>
					<input type="hidden" id="proId" />
					缺货量：<label style="display: inline-block;width: 60px;" id="lack"></label>进货单价：<label style="display: inline-block;width: 35px;" id="costPrice"></label>元<br>
					进购数量 <input id="amount" type="text" class="easyui-textbox" />
					<p><a class="easyui-linkbutton" id="addBuy">&nbsp;&nbsp;确&nbsp;&nbsp;定&nbsp;&nbsp;</a>&nbsp;&nbsp;
					<a id="cancel" class="easyui-linkbutton" onclick="$('#dess').css('display','none');">&nbsp;&nbsp;取&nbsp;&nbsp;消&nbsp;&nbsp;</a></p>
				</div>
			</div>
		</div>

	</div>
</body>
</html>
<script language="javascript">
	var type = 0;
	var key = "";
	var enter = 1;
	var upper = 20;
	var lower = 1;
	var total;
	var listLength;
	var size = 0;
	var page = 1;
	function changeTable(){
		$.ajax({
			data:{proType:type, keyWord:key,upper:upper,lower:lower},
			datatype:'text',
			url:'changeTable.html',
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
	function addBuyList(id){
		$("#dess").css("display","block");
		$("#proId").val(id);
		$.ajax({
			data:{proId:id},
			datatype:'post',
			url:'getAnProInfo.html',
			type:'post',
			success:function(result){
				$("#proName").html(result.proName);
				$("#costPrice").html(result.costPrice);
				$("#lack").html(result.lackAmount);
			},
			error:function(){
				alert("error");
			}
		});
	}
	$(function() {
		$('#cb').combobox({
    		onSelect : function(){
    			type = $("#cb").combobox('getValue');
    			changeTable();
    		}  
		});
		$("#addBuy").click(function(){
			var id = $("#proId").val();
			var amount = $("#amount").val();
			if(amount != ""){
				$.ajax({
					type:'post',
					data:{amount:amount,proId:id},
					datatype:'text',
					url:'addABuyPro.html',
					success:function(result){
						if("success" == result){
							alert("已加入购货列表");
							$("#amount").textbox('setValue','');
							$("#dess").css("display","none");
						}else{
							alert("有误");
						}
					},
					error:function(){
						alert("error");
					}
				});
			}else{
				$("#dess").css("display","none");
			}
		});
		changeTable();
		$('#btn').bind('click', function() {
			key = $("#keyword").val();
			changeTable();
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
								field : 'proId',
								title : '商品编号',
								width : '12%',
								align : 'center'
							},
							{
								field : 'proName',
								title : '商品名称',
								width : '18%',
								align : 'center'
							},
							{
								field : 'ptType',
								title : '商品分类',
								width : '18%',
								align : 'center'
							},
							{
								field : 'proamount',
								title : '库存数量',
								width : '18%',
								align : 'center'
							},
							{
								field : 'lackAmount',
								title : '预订缺货数量',
								width : '18%',
								align : 'center'
							},
							{
								field : 'way',
								title : '操作',
								width : '15%',
								align : 'center',
								formatter : function(value, row, index) {
									var btn = "";
									if (row.isdefault != 0) {
										btn = $.formatString(
												'<a class="detailed" id="detailed" onclick="addBuyList(\'{0}\')"></a>',
												row.proId);
									}
									return btn;
								}
							} ] ],
					onLoadSuccess : function(data) {
						$('.detailed').linkbutton({
							iconCls : 'icon-add',
							title:'进购商品',
							text : '进货',
						}), $('.detailed').linkbutton('resize', { //设置按钮的高度
							height : 20
						});
					}
				});
		var p = $("#tt").datagrid('getPager'); //返回页面对象
		var opts = $("#tt").datagrid('options');

		$(p).pagination({
			pageSize : 20,
			pageList : [ 20 ],
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
