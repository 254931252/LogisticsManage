<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
  <jsp:include page="../../inc.jsp"/>
    <base href="<%=basePath%>">
    
    <title>商品入库登记 - 物流管理系统</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
  </head>
  
   <body>
    <div id="p" class="easyui-panel" title="商品入库登记"     
        style="width:100%;height:200px;padding:10px;background:#fafafa;">   
	<div style="position:absolute;">
	<table style="width:100%;font-size:12px;">
 	 <tr>
    <td align="right" >购货单号</td>
    <td><input id="ss" class="easyui-searchbox" searcher="doSearch" prompt="请输入购货单号"  style="width:300px" />
	</td>
  	</tr>
  	</table>
</div>
<div style="width:98.7%;position:absolute;left:9px;top:78px;"><table id="tt"></table></div>  
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
 	 	url:"wareHouseRegister.html",
 	 	type:"post",
 	 	data:{upper:10,lower:1},
 	 	success:function(json){
 	 		total=json.total;
 	 		json=json.show_list;
 	 		$("#tt").datagrid('loadData',{"total":total,"rows":json}); 	
 	 	}
 	 });
 });
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
				title:'购货编号',
				width:'100',
				align:'center'
			},{
				field:'proid',
				title:'商品编号',
				width:'130',
				align:'center'
			},{
				field:'proname',
				title:'商品名称',
				width:'160',
				align:'center'
			},{	
				field:'pmodel',
				title:'型号',
				width:'120',
				align:'center'
			},{
				field:'supname',
				title:'供应商',
				width:'150',
				align:'center'
			},{
				field:'proamount',
				title:'入库数量',
				width:'80',
				align:'center'
			},{
				field:'itwdate',
				title:'实际入库时间',
				width:'190',
				align:'center'
			},{
				field:'h',
				title:'查看',
				width:'20',
				align:'center',
				formatter:function(value,row,index){  
					var btn = "";
					if(row.isdefault != 0){
						 btn = $.formatString('<a class="detailed" id="detailed" onclick="dodetailed(\'{0}\',\'{1}\')"></a>',row.bpid,row.itwdate);
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
		 function dodetailed(bpid,itwdate){
		 alert(bpid+"***"+itwdate);
		 	window.location.href="showInfo.html?bpid="+bpid+"&itwdate="+itwdate;
		 }
		$(p).pagination({
			onSelectPage :function(pageNumber,pageSize){
			
					var opts = $("#tt").datagrid('options');
					
					opts.pageNumber = pageNumber;
					
					opts.pageSize = pageSize;
					
					$(this).pagination('loading');
					$.ajax({
						url : "wareHouseRegister.html",
						type : "post",
						data : {
							upper : pageNumber * pageSize,
							lower : (pageNumber - 1)*pageSize+1,
						},
					success : function(json) {
						total = json.total;
						json = json.show_list;
						$("#tt").datagrid('loadData',{"total":total,"rows":json});
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
	function doSearch(value,name){
		$.ajax({
			url:"wareHouseRegister.html",
			type : "post",
			data : {upper :10,lower :1,bpid:value},
			success :function(json){
			
				total=json.total;
				json=json.show_list;
				alert(json.length);
				$("#tt").datagrid('loadData',{"total":total,"rows":json});		
			}
		});
	}
</script> 