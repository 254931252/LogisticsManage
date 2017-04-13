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
		<div id="p" class="easyui-panel" title="进货安排"
			style="width:100%;height:659px;padding:10px;background:#fafafa;">
			<div style="position:absolute;top:55px;left:80px;">
				货物类型&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
				<select id="cb" class="easyui-textbox" editable="false" name="dept" style="width:200px;" panelHeight="60">
					<option value=0>所有分类</option>
					<c:forEach var="type" items="${typeList }">
       					<option value=${type.ptid } >${type.pttype }</option>
    				</c:forEach>
				</select>
			</div>

			<div style="position:absolute;top:55px;left:500px;">
				货物名称 &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
				<input id="proName" type="text" class="easyui-textbox" />
				<label style="display: inline-block;width: 100px;"></label>
				<a class="easyui-linkbutton" id="enterBuyList" data-options="iconCls:'icon-redo'">提交购货单</a>
			</div>
			<div style="float:right;margin-right: 30px;margin-top: 15px;">
				<a id="btn" >查询</a>
				
			</div>
			<div style="width:100%;position:absolute;top:100px;left:0px;">
				<table id="tt" style="width:100%;height:558px;">
					
				</table>
			</div>
			<div id="dess" style="line-height:26px; padding:10px 40px;position:absolute;width: 220px;border:1px #95b8e7 solid;height: 200px;margin: auto;top:148px;left:460px;display: none;opacity:0.9;background-color:#e7f0ff; border-radius:3px;">
				<p style="font-size: 20px;"><strong>进购商品</strong></p>
				<div style="margin: 0px;">
					<div style="font-size: 14px;">商品名称：<span><strong id="productName"></strong></span></div>
					<input type="hidden" id="proId" />
					进货单价：<label style="display: inline-block;width: 50px;" id="costPrice"></label>元<br>
					进购数量 <input id="amount" type="text" class="easyui-textbox" />
					<p><a class="easyui-linkbutton" id="addBuy">&nbsp;&nbsp;确&nbsp;&nbsp;定&nbsp;&nbsp;</a>&nbsp;&nbsp;
					<a id="cancel" class="easyui-linkbutton" onclick="$('#dess').css('display','none');">&nbsp;&nbsp;取&nbsp;&nbsp;消&nbsp;&nbsp;</a></p>
				</div>
			</div>
			<div id="submitList" style="line-height:26px; padding:0px 40px; padding-bottom:10px; paposition:absolute;width: 400px;border:1px #95b8e7 solid;overflow:hidden; margin: auto;top:125px;left:460px;display: none;opacity:0.9;background-color:#e7f0ff; border-radius:3px;">
				<p style="font-size: 18px;"><strong>购货清单</strong></p>
				<table id="currBuyList" style="text-align: center;font-size: 14px;">
					
				</table>
				<p>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<a class="easyui-linkbutton" id="submitTheList">&nbsp;&nbsp;确&nbsp;&nbsp;定&nbsp;&nbsp;</a>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
				<a class="easyui-linkbutton" onclick="$('#submitList').css('display','none');">&nbsp;&nbsp;取&nbsp;&nbsp;消&nbsp;&nbsp;</a></p>
			</div>
		</div>

	</div>
</body>
</html>
<script language="javascript">
	var type = 0;
	var key = "";
	var upper = 20;
	var lower = 1;
	var total;
	var listLength;
	var size = 0;
	var page = 1;
	var finallyList = "";
	function changeTable(){
		$.ajax({
			data:{ptId:type, proName:key,upper:upper,lower:lower},
			datatype:'text',
			url:'seleceBuyProView.html',
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
	function addAll(){
		var names = "";
		var checkedItems = $('#tt').datagrid('getChecked');
		$.each(checkedItems, function(index, item){
			names += item.bpId + ",";
		});
		$.ajax({
			data:{bpId:names},
			datatype:'text',
			type:'post',
			url:'addToList.html',
			success:function(result){
				if("success" == result){
					alert("已加入购货单");
					changeTable();
				}else{
					alert("有误");
				}
			},
			error:function(){
				alert("error");
			}
		});
	}
	function block(bpId){
		$("#dess").css("display","block");
		$("#proId").val(bpId);
		$.ajax({
			data:{bpId:bpId,upper:upper,lower:lower},
			datatype:'post',
			url:'getABView.html',
			type:'post',
			success:function(result){
				$("#productName").html(result.proName);
				$("#costPrice").html(result.costPrice);
				$("#amount").textbox('setValue',result.proAmount);
			},
			error:function(){
				alert("error");
			}
		});
	}
	function deleteAll(){
		var names = "";
		if(confirm("是否删除所选?")){
			var checkedItems = $('#tt').datagrid('getChecked');
			$.each(checkedItems, function(index, item){
				names += item.bpId + ",";
			});
			if(names != ""){
				$.ajax({
					data:{bpId:names},
					datatype:'text',
					type:'post',
					url:'deleteABuyPro.html',
					success:function(result){
						if("success" == result){
							alert("已取消");
							changeTable();
						}else{
							alert("有误");
						}
					},
					error:function(){
						alert("error");
					}
				});
			}
		}
	}
	function deleteBP(id){
		var list = id + ",";
		if(confirm("是否删除？")){
			$.ajax({
				type:'post',
				data:{bpId:list},
				datatype:'text',
				url:'deleteABuyPro.html',
				success:function(result){
					if("success" == result){
						alert("已取消");
						changeTable();
					}else{
						alert("有误");
					}
				},
				error:function(){
					alert("error");
				}
			});
		}
	}
	function returnToList(bpId){
		if(confirm("取消该项？")){
			$.ajax({
				url:'returnToList.html',
				data:{bpId:bpId},
				datatype:'text',
				type:'post',
				success:function(result){
					if("success" == result){
					alert("已取消");
					changeTable();
					getCurrList();
				}else{
					alert("有误");
				}
				},
				error:function(){
					alert("error");
				}
			});
		}
	}
	function getCurrList(){
		$.ajax({
			type:'post',
			url:'getCurrList.html',
			success:function(result){
				var table = "<tr><td width='160px'>商品名称</td><td width='80px'>进购数量</td><td width='60px'>&nbsp;</td></tr>";
				list = "";
				$.each(result,function(index,value){
					table += "<tr>" + 
					"<td>" + value.proName + "</td><td>" + value.proAmount + "</td><td>" + 
					"<a class='deleteThis' onclick='returnToList(" + value.bpId + ")'></a>" +
					"</tr>";
					list += value.bpId + ",";
				});
				$("#currBuyList").html(table);
				$('.deleteThis').linkbutton({
					iconCls : 'icon-undo'
				});
			},
			error:function(){
				alert("error");
			}
		});
	};
	$(function() {
		$("#submitTheList").click(function(){
			$.ajax({
				type:'post',
				url:'doSubmit.html',
				success:function(result){
					if("success" == result){
						alert("已提交购货单");
						$("#submitList").css("display","none");
						changeTable();
					}else{
						alert("有误");
					}
				},
				error:function(){
					alert("error");
				}
			});
		});
		$("#enterBuyList").click(function(){
			$("#submitList").css("display","block");
			getCurrList();
		});
		$("#addBuy").click(function(){
			var id = $("#proId").val();
			var amount = $("#amount").val();
			if(amount != ""){
				$.ajax({
					type:'post',
					data:{bpId:id,proAmount:amount},
					datatype:'text',
					url:'updateAmount.html',
					success:function(result){
						if("success" == result){
							alert("已更新信息");
							$("#dess").css("display","none");
							changeTable();
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
		$('#cb').combobox({
    		onSelect : function(){
    			type = $("#cb").combobox('getValue');
    			changeTable();
    		}  
		});
		$('#btn').bind('click', function() {
			key = $("#proName").val();
			changeTable();
		});
		$('#btn').linkbutton({
			iconCls : 'icon-search'
		});
		$('#tt').datagrid(
				{
					nowrap : true,//显示数据
					striped : true,//是否显示斑马效果
					rownumbers : false,//行号列
					fitColumns : true,//允许表格自动缩放，以适应父容器
					remoteSort : false,//服务器对数据进行排序
					singleSelect : false,//单选
					checkbox : true,//复选
					pagination : true,//显示分页
					columns : [ [
							{
								field : 'bpId',
								checkbox : true
							},
							{
								field : 'proId',
								title : '商品编号',
								width : '15%',
								align : 'center'
							},
							{
								field : 'proName',
								title : '商品名称',
								width : '20%',
								align : 'center'
							},
							{
								field : 'costPrice',
								title : '进货单价',
								width : '21%',
								align : 'center'
							},
							{
								field : 'proAmount',
								title : '进货数量',
								width : '21%',
								align : 'center'
							},{
								field : 'add',
								title : '<a class="add" onclick="addAll()">',
								width : '12%',
								align : 'center',
								formatter : function(value, row, index) {
									var btn = "";
									if (row.isdefault != 0) {
										btn = $.formatString(
												'<a class="detailed" onclick="block(\'{0}\')"></a>',
												row.bpId,row.bpId);
									}
									return btn;
								}
							},
							{
								field : 'delete',
								title : '<a class="update" onclick="deleteAll()"></a>',
								width : '10%',
								align : 'center',
								formatter : function(value, row, index) {
									var btn = "";
									if (row.isdefault != 0) {
										btn = $.formatString(
												'&nbsp;&nbsp;<a class="update" onclick="deleteBP(\'{1}\')"></a>',
												row.bpId,row.bpId);
									}
									return btn;
								}
							} ] ],
					onLoadSuccess : function(data) {
						$('.detailed').linkbutton({
							text : '更改',
							iconCls:'icon-reload'
						}), $('.detailed').linkbutton('resize', { //设置按钮的高度
							height : 20
						});
						$('.update').linkbutton({
							text : '取消',
							iconCls:'icon-clear'
						}), $('.update').linkbutton('resize', { //设置按钮的高度
							height : 20
						});
						$('.add').linkbutton({
							text : '加入购货单',
							iconCls:'icon-add'
						}), $('.add').linkbutton('resize', { //设置按钮的高度
							height : 20
						});
					},
					onClickRow: function (rowIndex, rowData) { 
                    	$(this).datagrid('unselectRow', rowIndex); 
                    },
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
