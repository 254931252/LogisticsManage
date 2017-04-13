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
		<div id="p" class="easyui-panel" title="商品管理"
			style="width:100%;height:659px;padding:10px;background:#fafafa;">
			<div style="position:absolute;top:55px;left:80px;">
				货物类型&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
				<select id="cb" class="easyui-textbox" editable="false" name="dept" style="width:200px;" panelHeight="60">
					<option value=0>所有分类</option>
					<c:forEach var="type" items="${typeList }">
       					<option value=${type.ptid } >${type.pttype }</option>
    				</c:forEach>
				</select>&nbsp;&nbsp;&nbsp;&nbsp;
				<a class="easyui-linkbutton" data-options="iconCls:'icon-add'" onclick="$('#dess').css('display','block');">新增分类</a>
			</div>

			<div style="position:absolute;top:55px;left:500px;">
				货物名称 &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
				<input type="text" class="easyui-textbox" id="keyword" />
				&nbsp;&nbsp;&nbsp;&nbsp;
				<a class="easyui-linkbutton" data-options="iconCls:'icon-add'" onclick="enter=3;$('#diss').css('display','block');$('#dissptid').css('display','none');">新品上架</a>
			</div>
			<div style="float:right;margin-right: 30px;margin-top: 15px;">
				<a id="btn" onclick="close()" />
				查询
			</div>

			<div style="width:100%;position:absolute;top:100px;left:0px;">
				<table id="tt" style="width:100%;height:558px;">
					
				</table>
			</div>
			<div id="diss" style="line-height:26px; padding:10px 40px;position: relative;width: 420px;border:1px #95b8e7 solid;height: 228px;margin: auto;top:88px;display: none;opacity:0.9;background-color:#e7f0ff; border-radius:3px;">
				<span style="font-size: 18px;">商品详情</span><br>
				<div id="dissptid" style="display: inline;">商品编号 <input id="dissid" type="text" class="easyui-textbox" data-options="readonly:false" /></div><br>
				商品名称 <input id="dissname" type="text" class="easyui-textbox" />&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
				商品种类 <select editable="false"  id="disstype" style="width:128px;" class="easyui-combobox" editable="false" name="dept" panelHeight="60">
						<c:forEach var="type" items="${typeList }">
	       					<option value=${type.ptid } >${type.pttype }</option>
	    				</c:forEach>
					  </select><br>
				单&nbsp;&nbsp;&nbsp;&nbsp;价 <input id="dissprice" type="text" class="easyui-textbox" />&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;成&nbsp;&nbsp;&nbsp;&nbsp;本 <input id="disscost" type="text" class="easyui-textbox" /><br>
				厂&nbsp;&nbsp;&nbsp;&nbsp;商 <input id="disssup" type="text" class="easyui-textbox" />&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;型&nbsp;&nbsp;&nbsp;&nbsp;号 <input id="disspmodel" type="text" class="easyui-textbox" /><br>
				<div style="height: 5px;"></div>
				<span style="vertical-align: top;">商品信息 </span><input id="dissinfo" class="easyui-textbox" data-options="multiline:true" style="width:355px;height:50px;" /><br>
				<p>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<a id="subm" class="easyui-linkbutton">&nbsp;&nbsp;确&nbsp;&nbsp;定&nbsp;&nbsp;</a>
				&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<a id="cancel" class="easyui-linkbutton">&nbsp;&nbsp;取&nbsp;&nbsp;消&nbsp;&nbsp;</a></p>
			</div>
			<div id="dess" style="line-height:26px; padding:10px 40px;position:absolute;width: 220px;border:1px #95b8e7 solid;height: 180px;margin: auto;top:148px;left:460px;display: none;opacity:0.9;background-color:#e7f0ff; border-radius:3px;">
				<p style="font-size: 20px;">新增分类</p>
				<div style="margin: 0px 20px;">
					商品类型 <input id="newType" type="text" class="easyui-textbox" />
					<p><a class="easyui-linkbutton" id="addType">&nbsp;&nbsp;确&nbsp;&nbsp;定&nbsp;&nbsp;</a>&nbsp;&nbsp;
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
	function block(flag,proId){
		enter = 2;
		$("#diss").css("display","block");
		$("#dissptid").css("display","inline");
		$("#dissid,#disstype,#disssup,#disspmodel,#dissname").textbox('readonly',true);
		if(flag){
			enter = 1;
			$("#dissprice,#disscost,#dissinfo").textbox('readonly',true);
		}
		$.ajax({
			data:{proId:proId},
			datatype:'post',
			url:'getAnProInfo.html',
			type:'post',
			success:function(result){
				$("#dissid").textbox('setValue',result.proId);
				$("#disstype").textbox('setValue',result.ptType);
				$("#disssup").textbox('setValue',result.subname);
				$("#disspmodel").textbox('setValue',result.pmodel);
				$("#dissname").textbox('setValue',result.proName);
				$("#dissprice").textbox('setValue',result.proPrice);
				$("#dissinfo").textbox('setValue',result.proInfo);
				$("#disscost").textbox('setValue',result.costPrice);
			},
			error:function(){
				alert("error");
			}
		});
	}
	$(function() {
		changeTable();
		$("#addType").click(function(){
			var typeName = $("#newType").val();
			$.ajax({
				type:'post',
				data:{typeName:typeName},
				datatype:'text',
				url:"addNewType.html",
				success:function(result){
					if(result == "success"){
						alert("添加成功");
						window.location.href="";
					}else{
						alert("该分类已存在，不可重复添加");
					}
				},
				error:function(){
					alert("error");
				}
			});
		});
		$("#subm").click(function(){
			var proId = $("#dissid").val();
			var proType = $("#disstype").combobox('getValue');
			var proSub = $("#disssup").val();
			var proName = $("#dissname").val();
			var proModel = $("#disspmodel").val();
			var proPrice = $("#dissprice").val();
			var proInfo = $("#dissinfo").val();
			var proCost = $("#disscost").val();
			if(enter == 3){
				if(proType != "" && proSub != "" && proName != "" && proPrice != "" && proInfo != "" && proCost != ""){
					$.ajax({
						data:{proType:proType,proSub:proSub,proName:proName,proModel:proModel,proPrice:proPrice,proInfo:proInfo,proCost:proCost},
						datatype:'text',
						url:'addNewProduct.html',
						type:'post',
						success:function(result){
							if(result == "success"){
								alert("添加成功");
								$("#diss").css("display","none");
								changeTable();
							}else{
								alert("该商品已存在，不可重复添加");
							}
						},
						error:function(){
							alert("error");
						}
					});
				}else{
					alert("请填写完整信息");
				}
			}else if(enter == 2){
				$.ajax({
					data:{proId:proId,proPrice:proPrice,proCost:proCost},
					datatype:'text',
					url:'updateProduct.html',
					type:'post',
					success:function(result){
						if("success" == result){
							alert("修改成功");
							$("#diss").css("display","none");
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
				$("#diss").css("display","none");
			}
			$("#dissid,#disssup,#disspmodel,#dissname,#dissprice,#disscost,#dissinfo").textbox('setValue',"");
			$("#dissid,#disstype,#disssup,#disspmodel,#dissname,#dissprice,#disscost,#dissinfo").textbox('readonly',false);
		});
		$("#cancel").click(function(){
			$("#diss").css("display","none");
			$("#dissid,#disssup,#disspmodel,#dissname,#dissprice,#disscost,#dissinfo").textbox('setValue',"");
			$("#dissid,#disstype,#disssup,#disspmodel,#dissname,#dissprice,#disscost,#dissinfo").textbox('readonly',false);
		});
		$('#cb').combobox({
    		onSelect : function(){
    			type = $("#cb").combobox('getValue');
    			changeTable();
    		}  
		});
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
					rownumbers : false,//行号列
					fitColumns : true,//允许表格自动缩放，以适应父容器
					remoteSort : false,//服务器对数据进行排序
					singleSelect : true,//单选
					checkbox : true,//复选
					pagination : true,//显示分页
					columns : [ [
							{
								field : 'proId',
								title : '商品编号',
								width : '10%',
								align : 'center'
							},
							{
								field : 'proName',
								title : '商品名称',
								width : '15%',
								align : 'center'
							},
							{
								field : 'ptType',
								title : '商品分类',
								width : '15%',
								align : 'center'
							},
							{
								field : 'proPrice',
								title : '单价',
								width : '15%',
								align : 'center'
							},
							{
								field : 'proInfo',
								title : '商品信息',
								width : '30%',
								align : 'center'
							},
							{
								field : 'way',
								title : '操作',
								width : '16%',
								align : 'center',
								formatter : function(value, row, index) {
									var btn = "";
									if (row.isdefault != 0) {
										btn = $.formatString(
												'<a title="点击查看" class="detailed" id="detailed" onclick="block(true,\'{0}\')"></a>' + 
												'&nbsp;&nbsp;<a title="进入设置" class="update" id="update" onclick="block(false,\'{1}\')"></a>' + 
												'&nbsp;&nbsp;<a title="商品下架" class="delete" id="delete" onclick="deleteAnPro(\'{2}\')"></a>',row.proId,row.proId,row.proId);
									}
									return btn;
								}
							} ] ],
					onLoadSuccess : function(data) {
						$('.detailed').linkbutton({
							iconCls: 'icon-search',
						}), $('.detailed').linkbutton('resize', { //设置按钮的高度
							height : 20
						});
						$('.update').linkbutton({
							iconCls: 'icon-back',
						}), $('.update').linkbutton('resize', { //设置按钮的高度
							height : 20
						});
						$('.delete').linkbutton({
							iconCls: 'icon-cancel',
						}), $('.delete').linkbutton('resize', { //设置按钮的高度
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
	function deleteAnPro(proId){
		if(confirm("是否下架该商品？")){
			$.ajax({
				data:{proId:proId},
				datatype:'text',
				type:'post',
				url:'deleteAnPro.html',
				success:function(result){
					if(result == "success"){
						alert("下架成功");
						if(listLength == 1 && page != 1){
							upper -= size;
							lower -= size;
						}
						changeTable();
					}else{
						alert("检测到该商品尚有其他信息，请联系库房管理员先做清仓处理");
					}
				},
				error:function(){
					alert("error");
				}
			});
		}
	}
</script>
