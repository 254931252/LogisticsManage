<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    <jsp:include page="../../inc.jsp"/>
    <title>领货 - 物流管理系统</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
  </head>
  
  <body>
    <div id="p" class="easyui-panel" title="领货 "     
        style="width:100%;height:150px;padding:10px;background:#fafafa;">   
<div style="position:absolute;width:100%;font-size:12px;">
 <table style="font-size:12px;">
   <tr>
    <td>任务单号</td>
    <td><input id="ss" class="easyui-searchbox" style="width:300px" ></input> 
    </td>
   </tr>
 </table>
</div>
<div style="position:absolute;top:78px;left:9px;width:98.7%;"><table id="tt" ></table></div> 
</div> 
</body>
</html>
<script language="javascript"> 
 
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
				field:'a',
				title:'任务单号',
				width:'120',
				align:'center'
			},{
				field:'b',
				title:'商品编号',
				width:'130',
				align:'center'
			},{
				field:'c',
				title:'商品名称',
				width:'100',
				align:'center'
			},{	
				field:'d',
				title:'型号',
				width:'100',
				align:'center'
			},{
				field:'e',
				title:'数量',
				width:'120',
				align:'center'
			},{
				field:'f',
				title:'计量单位',
				width:'100',
				align:'center'
			},{	
				field:'g',
				title:'售价',
				width:'100',
				align:'center'
			},{
				field:'h',
				title:'操作',
				width:'80',
				align:'center',
				formatter:function(value,row,index){  
					var btn = "";
					if(row.isdefault != 0){
						 btn = $.formatString('<a class="detailed" id="detailed" onclick="dodetailed(\'{0}\')"></a>',row.messageId);
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
		pageSize : 10,
		pageList : [ 10, 15, 20 ],
		displayMsg : '当前显示{from}-{to}条记录   共{total}条记录',
	});
</script> 