<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
   <jsp:include page="../../inc.jsp" />
    
   <title>商品出库 - 物流管理系统</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
  </head>
  <body>
    <div id="p" class="easyui-panel" title="商品出库"     
        style="width:100%;height:200px;padding:10px;background:#fafafa;">   
		<div width="100%" border="0" >
		  <tr>
		    <td align="right" >订单编号</td>
		    <td><input id="ss" class="easyui-searchbox" searcher="doSearch"style="width:300px" /></td>
		  </tr>
		</div>
<div style="position:absolute;top:80px;left:9px;width:98.7%;"><table id="tt"></table></div>  
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
 		url:"getDiliverlingList.html",
 		type:"post",
 		data:{upper:10,lower:1},
 		success:function(json){
 		   var total =json.total;
 		 
 		   var d_list=json.d_list;
 		
 		   $("#tt").datagrid('loadData',{"total":total,"rows":d_list});
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
				field:'ordid',
				title:'订单编号',
				width:'100',
				align:'center'
			},{
				field:'proid',
				title:'商品编号',
				width:'100',
				align:'center'
			},{
				field:'proname',
				title:'商品名称',
				width:'80',
				align:'center'
			},{	
				field:'supname',
				title:'供应商',
				width:'80',
				align:'center'
			},{	
				field:'pmodel',
				title:'型号',
				width:'80',
				align:'center'
			},{	
				field:'proprice',
				title:'售价',
				width:'80',
				align:'center'
			},{	
				field:'buyNum',
				title:'应出库数量',
				width:'100',
				align:'center'
			},{	
				field:'actualOutAmount',
				title:'实际出库数量',
				width:'100',
				align:'center',
				formatter:function(value,row,index){  
					var input = "";
					if(row.isdefault != 0){
						 input = $.formatString('<input class="inputt"  type ="text" value="\{0}\"  style="width:100px;"/>',row.actualOutAmount);
					}
					return input;  
	        	}  
			},{	
				field:'punit',
				title:'计量单位',
				width:'100',
				align:'center'
			},{	
				field:'outWareDate',
				title:'要求出库日期',
				width:'100',
				align:'center'
			},{
				field:'f',
				title:'操作',
				width:'80',
				align:'center',
				formatter:function(value,row,index){  
					var but = "";
					if(row.isdefault != 0){
						 but = $.formatString('<a class="detailed" id="detailed" onclick="dodetailed(\'{0}\')"></a>',row.ordid);
					}
					return but;  
	        	}  
			}]],
			onLoadSuccess:function(data){
				$('.detailed').linkbutton({text:'查看'}),  
		        $('.detailed').linkbutton('resize',{		//设置按钮的高度
		        	height:20
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
				var value=$("#ss").val();
				alert(value);
				$(this).pagination('loading');
				$.ajax({
					url:"getDiliverlingList.html",
					type : "post",
					data : {upper :10,lower :1,ordid:value},
					success :function(json){
						total=json.total;
					    var	d_list=json.d_list;
						$("#tt").datagrid('loadData',{"total":total,"rows":d_list});		
					}
		});
				$(this).pagination('loaded');
			},
		});
		function dodetailed(ordid){
			var actualOutAmount=$(".inputt").val();
		  alert(ordid+"***----"+actualOutAmount);
			window.location.href="outWare.html?ordid="+ordid+"&actualOutAmount="+actualOutAmount;
		}
		$(p).pagination({
		pageSize : 10,
		pageList : [ 10, 15, 20 ],
		displayMsg : '当前显示{from}-{to}条记录   共{total}条记录',
	});
	function doSearch(value,name){
		$.ajax({
			url:"getDiliverlingList.html",
			type : "post",
			data : {upper :10,lower :1,ordid:value},
			success :function(json){
				total=json.total;
			    var	d_list=json.d_list;
				$("#tt").datagrid('loadData',{"total":total,"rows":d_list});		
			}
		});
	}
</script> 