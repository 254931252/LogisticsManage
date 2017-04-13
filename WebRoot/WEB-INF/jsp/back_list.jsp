<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html>
<head>
  <jsp:include page="../../inc.jsp" />
	<title>购货入库 - 物流管理系统</title>
	<meta http-equiv="content-type" content="text/html; charset=UTF-8" />
	<style media="all" type="text/css">@import "../../style/all.css";</style>
	<link href="easyui/themes/icon.css" rel="stylesheet" type="text/css"/>
</head>
<body>
    <div id="p" class="easyui-panel" title="购货入库"     
        style="width:100%;height:70px;padding:10px;background:#fafafa;"   >   
		<div width="100%" border="0" align="center" style="position:absolute">
		  <tr>
		    <td align="right" >购货单号</td>
		    <td><input id="ss" class="easyui-searchbox" style="width:300px" /></td>
		  </tr>
		</div>
 <div style="width:99%"><table id="tt" style="width:100%;"></table></div>  
	</div> 
</body>
</html>
<script language="javascript"> 
 	var total;
 	$(function(){
 		var p=$("#tt").datagrid('getPager');
 		$(p).pagination({
 			pageSize:10,
 			pageList:[5,10,15]
 		});
 	 $.ajax({
 	 	 url:"backList.html",
 	 	 type:"post",
 	 	 data:{upper:10,lower:1},
 	 	 success:function(json){
 	 	
 	 	 	total=json.total;				 //获取返回的json对象中第一个数据即表里的数据总数
 	 	 	json=json.list;						//移除第一个数据
 	 	 	$("#tt").datagrid('loadData',{"total":total,"rows":json}); //遍历json对象中剩下的数据即分页得到的数据list，然后加载到表格中
 	 	 }
 	 });
 	});
 	$('#ss').bind('click',function(){
 		var bpid=$("#ss").textbox("getValue");
 		$.ajax({
 			url:"backList.html",
 			type:"post",
 			data:{upper:10,lower:1,bpid:bpid},
 			success:function(json){
 				total=json.total;
 				json=json.list;
 				$("#tt").datagrid('loadData',{"total":total,"rows":json});
 			}
 		});
 	});
 	/* $('#btn').linkbutton({
 		
 	
 	}) */
 	
	$('#tt').datagrid({
			nowrap:true,//显示数据
			striped:true,//是否显示斑马效果
			rownumbers:true,//行号列
			fitColumns:true,//允许表格自动缩放，以适应父容器
			remoteSort:false,//服务器对数据进行排序
			singleSelect:true,//单选
			checkbox:true,//复选
			pagination:true,//显示分页
			columns:[[{	
				field:'bpid',
				title:'购物单号',
				width:'20%',
				align:'center'
			},{
				field:'proid',
				title:'商品编号',
				width:'20%',
				align:'center'
			},{
				field:'proname',
				title:'商品名称',
				width:'20%',
				align:'center'
			},{	
				field:'proamount',
				title:'应入库数量',
				width:'15%',
				align:'center'
			},{
				field:'ActualPamount',
				title:'实际入库数量',
				width:'15%',
				align:'center',
				formatter:function(value,row,index){  
					var input = "";
					if(row.isdefault != 0){
						 input = $.formatString('<input class="inputt" type ="text" onclick="dodetailed(\'{0}\')"/>',row.messageId);
					}
					return btn;  
	        	}  
			},{
				field:'update',
				title:'操作',
				width:'10%',
				align:'center',
				formatter:function(value,row,index){  
					var btn = "";
					if(row.isdefault != 0){
						 btn = $.formatString('<input  type="text"  id="detailed" onclick="dodetailed(\'{0}\')"></a>',row.messageId);
					}
					return btn;  
	        	}  
			}
			]],
			onLoadSuccess:function(data){
				$('.detailed').linkbutton({text:'查看'}),  
		        $('.detailed').linkbutton('resize',{		//设置按钮的高度
		        	height:20
		        })
			}		
		});
		var p = $("#tt").datagrid('getPager'); //返回页面对象
		var opts=$("#tt").datagrid('options');
		$(p).pagination({
			onSelectPage : function(pageNumber,pageSize) {
				var opts = $("#tt").datagrid('options');
				opts.pageNumber =pageNumber;
				opts.pageSize = pageSize;
				$(this).pagination('loading');
				$.ajax({
					url : "backList.html",
					type : "post",
					data : {
						upper : pageNumber * pageSize,
						lower : (pageNumber - 1 ) * pageSize +1
					},
					success : function(json) {
						total = json.total;
						json = json.list;
						$("#tt").datagrid('loadData',{"total" : total, "rows" : json});	
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