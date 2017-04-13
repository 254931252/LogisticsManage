<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
       <title>打印出库单 - 物流管理系统</title>
       <jsp:include page="../../inc.jsp"/>
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	
  </head>
  
 <body>
    <div id="p" class="easyui-panel" title="出库单"     
        style="width:100%;height:200px;padding:10px;background:#fafafa;"   >   
	<div width="100%" border="0" align="center" >
		<table style="font-size:12px;">
		  <tr>
		    <td >库房名称</td>
		    <td><input id="subName" class="easyui-textbox"  /><span style="color:#f00">*</span>&nbsp;&nbsp;</td>
		    <td>出库日期</td>
		    <td><input id=outtime class="easyui-datebox"/><span style="color:#f00">*</span>&nbsp;&nbsp;</td>
		    <td>商品名称</td>
		    <td><input id=proName class="easyui-textbox"/>&nbsp;&nbsp;</td>
		    <td style="width:60px;"><a id="btn"/>查询</td>
		  </tr>
		 </table>
		</div>
    <div style="height:150px;position:absolute;width:98.7%;left:8px;"><table id="tt" ></table></div>  
	</div> 
</body>
</html>
<script language="javascript"> 
var proName;
var outtime;
var subName;
 	
	var total;
	$(function(){
			var p=$("#tt").datagrid('getPager');
			$(p).pagination({
				pageSize:10,
				pageList:[5,10,15]
			});
			doPage();
			$('#btn').linkbutton({
			iconCls : 'icon-search'
		});
	});
	function doPage(){
			proName=$("#proName").val();
			outtime=$("#outtime").datebox("getValue");
			subName=$("#subName").val();
			
			$.ajax({
				url:"printDeliveringPage.html",
				type:'post',
				data:{upper:10,lower:1,proName:proName,outtime:outtime,subName:subName},
				success:function(result){
					total=result.total;
					rows=result.list;
					$("#tt").datagrid("loadData",{"total":total,"rows":rows});
				}
			});
	}
		$("#btn").click(function(){
			doPage();
		
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
				width:'80',
				align:'center'
			},{
				field:'proid',
				title:'商品编号',
				width:'130',
				align:'center'
			},{
				field:'proname',
				title:'商品名称',
				width:'100',
				align:'center'
			},{	
				field:'supname',
				title:'供应商',
				width:'100',
				align:'center'
			},{
				field:'proprice',
				title:'售价',
				width:'100',
				align:'center'
			},{
				field:'buyNum',
				title:'数量',
				width:'100',
				align:'center'
			},{
				field:'totalprice',
				title:'总金额',
				width:'100',
				align:'center'
			},{
				field:'outtime',
				title:'出库时间',
				width:'130',
				align:'center'
			},{
				field:'subName',
				title:'库房名称',
				width:'100',
				align:'center'
			},{
				field:'h',
				title:'打印',
				width:'80',
				align:'center',
				formatter:function(value,row,index){  
					var btn = "";
					if(row.isdefault != 0){
						 btn = $.formatString('<a class="detailed" id="detailed" onclick="dodetailed(\'{0}\',\'{1}\')"></a>',row.ordid,row.subName);
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
		function dodetailed(ordid,subName){
			location.href="out_print_list.html?ordid="+ordid+"&subName="+subName;
		}
		var p = $("#tt").datagrid('getPager'); //返回页面对象
		var opts=$("#tt").datagrid('options');
		$(p).pagination({											//分页
			onSelectPage : function(pageNumber, pageSize) {
				var opts = $("#tt").datagrid('options');
				opts.pageNumber = pageNumber;
				opts.pageSize = pageSize;
				proName=$("#proName").val();
				outtime=$("#outtime").datebox("getValue");
				subName=$("#subName").val();
				$(this).pagination('loading');
				$.ajax({
					url : "printDeliveringPage.html",
					type : "post",
					data : {
						upper : pageNumber * pageSize,lower : (pageNumber - 1) * pageSize + 1,proName:proName,outtime:outtime,subName:subName
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
		pageList : [ 10, 15, 20 ],
		displayMsg : '当前显示{from}-{to}条记录   共{total}条记录',
	});
</script> 