<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html>
<head>
  <jsp:include page="../../inc.jsp" />
	<title>购货入库 - 物流管理系统</title>
	<meta http-equiv="content-type" content="text/html; charset=UTF-8" />
	<link href="easyui/themes/icon.css" rel="stylesheet" type="text/css"/>
</head>
<body>
    <div id="p" class="easyui-panel" title="购货入库"     
        style="width:100%;height:200px;padding:10px;background:#fafafa;"   >   
		<div style="position:absolute;width:100%">
		<table style="font-size:12px;">
		  <tr>
		    <td align="right" >购货单号&nbsp;&nbsp;</td>
		    <td><input id="ss" class="easyui-searchbox" searcher="doSearch" prompt="请输入购货单号"   style="width: 160px; vertical-align: middle;"></input> </td>
		  </tr>
		  </table>
		</div>
       <div style="width:98.7%;position:absolute;left:9px;top:80px;"><table id="tt" ></table>
       </div>  
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
 	 	 url:"inAllocate.html",
 	 	 type:"post",
 	 	 data:{upper:10,lower:1},
 	 	 success:function(json){
 	 	
 	 	 	total=json.total;				 //获取返回的json对象中第一个数据即表里的数据总数
 	 	 	json=json.list;						//移除第一个数据
 	 	 	$("#tt").datagrid('loadData',{"total":total,"rows":json}); //遍历json对象中剩下的数据即分页得到的数据list，然后加载到表格中
 	 	 }
 	 });
 	});
 	 
 /* 	$('#ss').bind('click',function(){
 		var bpid=$("#ss").textbox("getValue");
 		$.ajax({
 			url:"inAllocate.html",
 			type:"post",
 			data:{upper:10,lower:1,bpid:bpid},
 			success:function(json){
 				total=json.total;
 				json=json.list;
 				$("#tt").datagrid('loadData',{"total":total,"rows":json});
 			}
 		});
 	}); */
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
				title:'购货编号',
				width:'10%',
				align:'center'
			},{
				field:'proid',
				title:'商品编号',
				width:'15%',
				align:'center'
			},{
				field:'proname',
				title:'商品名称',
				width:'30%',
				align:'center'
			},{	
				field:'proamount',
				title:'应入库数量',
				width:'15%',
				align:'center',
			},{
				field:'actualamount',
				title:'实际入库数量',
				width:'15%',
				align:'center',
				formatter:function(value,row,index){
					var input = "";
					if(row.isdefault != 0){
						 input = $.formatString('<input class="inputt"  type ="text" value="\{0}\" style="width:100px;"/>',row.actualamount);	
					}
					return input;  
	        	}  
			},{
				field:'update',
				title:'操作',
				width:'10%',
				align:'center',
				formatter:function(value,row,index){  
					var btn = "";
						if (row.isdefault != 0) {
							btn = $.formatString(
									'<a class="detailed" id="detailed" onclick="dodetailed(\'{0}\',\'{1}\')"></a>',row.bpid,index);
						}
						return btn;
	        	}  
			}
			]],
			onLoadSuccess:function(data){
				$('.detailed').linkbutton({text:'操作'}),  
		        $('.detailed').linkbutton('resize',{		//设置按钮的高度
		        	height:20
		        }) 
			}		
		});
		var p = $("#tt").datagrid('getPager'); //返回页面对象
		var opts=$("#tt").datagrid('options');
		function dodetailed(bpid,index){
		      var input=$(".inputt");
		       alert(input[index].value);
			  var actualamount=input[index].value;
	
				window.location.href="in_goods.html?bpid="+bpid+"&actualamount="+actualamount;
		}
		$(p).pagination({
			onSelectPage : function(pageNumber,pageSize) {
				var opts = $("#tt").datagrid('options');
				opts.pageNumber =pageNumber;
				opts.pageSize = pageSize;
				$(this).pagination('loading');
				$.ajax({
					url : "inAllocate.html",
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
	function doSearch(value,name){ //用户输入用户名,点击搜素,触发此函数  
      $.ajax({
 	 	 url:"inAllocate.html",
 	 	 type:"post",
 	 	 data:{upper:10,lower:1,bpid:value},
 	 	 success:function(json){
 	 	
 	 	 	total=json.total;				 //获取返回的json对象中第一个数据即表里的数据总数
 	 	 	json=json.list;						//移除第一个数据
 	 	 	$("#tt").datagrid('loadData',{"total":total,"rows":json}); //遍历json对象中剩下的数据即分页得到的数据list，然后加载到表格中
 	 	 }
 	 });
    }  
</script> 