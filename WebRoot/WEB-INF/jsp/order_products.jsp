<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<jsp:include page="../../inc.jsp" ></jsp:include>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html>
<head>
	<title>新订订单 - 物流管理系统</title>
	<meta http-equiv="content-type" content="text/html; charset=UTF-8" />
	<style media="all" type="text/css">@import "style/all.css";</style>
	
</head>
<body style="background: none" style="height:600px;">
	<div class="top-bar">
				<!--a href="#" class="button">ADD NEW </a-->
				<h1>新订订单</h1>
				<div class="breadcrumbs"><a href="index.html" target="_top">首页</a> / <a href="user_index.html">客户服务中心</a></div>
				
			</div>
			
			<div class="select-bar"/>
			<div class="table" style="width:100%">				
				<table id="tt" class=easyui-datagrid style="width:100%" >					
				</table>
				<div align="center" style="width:100%;">
					<input type="button" class="button" onclick="javascript:window.history.go(-1);" value="上一步"/>&nbsp;
					<input type="button" class="onclick" onclick="javascript:window.location.href='order_putOrder.html'" value="下一步"/>
				</div>
			</div>
</body>
</html>
<script>
var total;
$(function(){
	var p=$("#tt").datagrid('getPager');
	$(p).pagination({
		pageSize:10,
		pageList:[5,10,15]
	});
	var userid=${param.userid};
	$.ajax({
		url:"getAll.html",
		data:{upper:10,lower:1,userid:userid},
		type:"post",
		success:function(json){
			total=json.total;
			json=json.list;
			$("#tt").datagrid('loadData',{"total":total,"rows":json});
		}
	});
	});
	$("#tt").datagrid({ 
		width:'100%',    //对datagrid表格设置属性
		nowrap : true,//显示数据
				striped : true,//是否显示斑马效果
				rownumbers : true,//行号列
				fitColumns : true,//允许表格自动缩放，以适应父容器
				remoteSort : false,//服务器对数据进行排序
				singleSelect : true,//单选
				checkbox : true,//复选
				pagination : true,//显示分页
		columns :[[{
			field:'proid',
			width:'10%',
			align:'center',
			title:'商品编号' 
	},{
			field:'proname',
			width:'10%',
			align:'center',
			title:'商品名'    
	},{
			field:'buynum',
			width:'10%',
			align:'center',
			title:'数量' 
	},{
			field:'punit',
			width:'10%',
			align:'center',
			title:'单位'     												
	},{
			field:'proprice',
			width:'10%',
			align:'center',
			title:'单价' 
	},{
			field:'cost',
			width:'10%',
			align:'center',
			title:'金额(元)' 
	},{
			field:'proinfo',
			width:'10%',
			align:'center',
			title:'商品说明' 
	},{
			field:'pmodel',
			width:'10%',
			align:'center',
			title:'备注' 
	},{
			field:'t1',
			width:'10%',
			align:'center',
			title:'编辑' ,
			formatter:function(value,row,index){
				var btn="";
				if(row.isdefault!=0){
					btn=$.formatString(
						'<a class="aa" onclick="aa(\'{0}\')"></a>&nbsp;<a class="del" onclick="del(\'{1}\')"></a>',				
						row.ordid,row.ordid);	
				}
				return btn;
			} 
	}]],
		onLoadSuccess : function(data) {
						$('.aa').linkbutton({
							text:"修改"
						}), $('.aa').linkbutton('resize', { //设置按钮的高度
							height : 20
						});
						$('.del').linkbutton({
							text:"删除"
						}), $('.del').linkbutton('resize', { //设置按钮的高度
							height : 20
						});						
						}
	});
	
	function aa(ordid){//修改	
		window.location.href="order_update.html?ordid="+ordid;
	}
	
	$(".onclick").click(function(){
		window.location="order_putOrder.html?ordid="+ordid;
	});
	
	function del(ordid){//删除
			$.ajax({
			url:"delOrders.html",
			data:{upper:10,lower:1,ordid:ordid},
			type:"post",
			success:function(json){
				total=json.total;
				json=json.list;
				$("#tt").datagrid('loadData',{"total":total,"rows":json});
			}
			
		});
			$.ajax({
				url:"getAll.html",
				data:{upper:10,lower:1,userid:userid},
				type:"post",
				success:function(json){
					total=json.total;
					json=json.list;
					$("#tt").datagrid('loadData',{"total":total,"rows":json});
				}
			});
	}
		var userid=${param.userid};
		$.ajax({
			url:"getAll.html",
			data:{upper:10,lower:1,userid:userid},
			type:"post",
			success:function(json){
				total=json.total;
				json=json.list;
				$("#tt").datagrid('loadData',{"total":total,"rows":json});
			}
		});	
	var p = $("#tt").datagrid('getPager'); //返回页面对象
		var opts = $("#tt").datagrid('options');
		$(p).pagination({//分页
			onSelectPage : function(pageNumber, pageSize) {
			var userid =${param.userid};
				var opts = $("#tt").datagrid('options');
				opts.pageNumber = pageNumber;
				opts.pageSize = pageSize;
				$(this).pagination('loading');
				$.ajax({
					url : "getAll.html",
					type : "post",
					data : {
						upper : pageNumber * pageSize,
						lower : (pageNumber - 1) * pageSize + 1,
						userid:userid
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
	
</script>
	

