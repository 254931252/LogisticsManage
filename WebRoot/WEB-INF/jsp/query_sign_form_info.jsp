<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>


<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <link rel="stylesheet" href="css/all.css" />
<jsp:include page="../../inc.jsp"></jsp:include>
  <head>
  	<title>任务单详细信息</title>
  </head>
    <style>
 	a{
 		text-decoration: none;
 		color:#333;
 		font-size:14px;
 	}
 	a:hover{
 		text-decoration: underline;}
 
 </style>
  <body>
  <div class="easyui-panel" title="商品签收单" style="width:100%;margin:10px 0;padding:5px;text-align: right;border:none;border-bottom:2px solid #F99999;">

		<h1 style="text-align:center">商品签收单</h1>
	<div region="center",border="false">
		 <table class="select-table" style="border:1px solid #333;width:100%;">
				<tr>
					<th width="24%" >任务签收单编号：</th>
					<td width="26%">${showTask.taskId }</td>
					<th width="24%">订单号编号：</th>
					<td width="26%">${showTask.ordId }</td>
				</tr>
				<tr>
					<th>任务生成日期：</th>
					<td>${showTask.createDate }</td>
				  <th>任务状态：</th>
				  <td>${showTask.osname }</td>
				</tr>
				<tr>
					<th>任务生成日期：</th>
					<td>${showTask.createDate }</td>
				  <th>投递区域：</th>
				  <td>${showTask.district }</td>
				</tr>
			    </table>
				<br/>
				<table class="select-table" style="border:1px solid #333;width:100%;">
				<tr>
				    <th>分站编号：</th>
					<td >${showTask.subId }</td>
					<th >分站名称：</th>
					<td>${showTask.subName }</td>
				</tr>
				<tr>
				    <th>投递员编号：</th>
					<td >${showTask.doTaskId }</td>
				  	<th>配送员：</th>
				 	 <td>${name }</td>
				</tr>
				<tr>
				  <th>投递地址：</th>
				  <td>${showTask.address }</td>
					<th>邮政编码：</th>
					<td>${showTask.code }</td>
				</tr>
				</table>
				<br/>
                <table class="select-table" style="border:1px solid #333;width:100%;">
				<tr>
				    <th>客户编号：</th>
					<td >${showTask.userId }</td>
				    <th>客户身份证号：</th>
					<td >${showTask.idcard }</td>
				</tr>
				<tr>
				  <th>联系电话：</th>
					<td>${showTask.tel }</td>
				  <th>邮箱：</th>
					<td>${showTask.email }</td>
				</tr>
				<tr>
					<th>客户名称：</th>
					<td>${showTask.name }</td>
				    <th>客户签名：</th>
					<td></td>
				</tr>						
			</table>
				<br>
				<table class="select-table" style="border:1px solid #333;width:100%;">
				<tr>
					<th width="24%" >订单编号：</th>
					<td width="26%">${orderPro.ordid }</td>
					<th width="24%" >商品编号：</th>
					<td width="26%">${orderPro.proid }</td>
				</tr><tr>
					<th width="24%">商品名称：</th>
					<td width="26%">${orderPro.proname }</td>
					<th >商品类别：</th>
					<td>${orderPro.pttype }</td>
				</tr><tr>
				  <th>商品单价：</th>
				  <td>${orderPro.proprice }</td>
					<th>商品数量：</th>
					<td>${orderPro.buynum }</td>
				</tr><tr>
				  <th>总金额：</th>
				  <td colspan="3">${orderPro.buynum*orderPro.proprice }</td>
				</tr>
			    </table>
			</div>
			<br>
			<div style="color:#f00;font-weight:700;text-align:center">
				<a  id="print0" style="color:#f00;" class="easyui-linkbutton">&nbsp;打印&nbsp;</a>&nbsp;
				<a style="color:#f00;" class="easyui-linkbutton" href="javascript:back();">&nbsp;确定&nbsp;</a>
			</div>
			</div>
</div>
	
  </body>
</html>
<script type="text/javascript">
	function back(){
		location.href="query_print_task_sign_form.html";
	}
	 $("#print").click(function(){
	 
		alert("正在连接打印机");
	 })
	
</script>
