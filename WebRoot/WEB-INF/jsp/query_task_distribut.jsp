<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<jsp:include page="../../inc.jsp"></jsp:include>
  <link rel="stylesheet" href="css/all.css" />
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
  <div class="easyui-panel" title="任务单详细信息" style="width:100%;margin:10px 0;padding:5px;text-align: right;border:none;border-bottom:2px solid #F99999;">
		
		
		<a id="btn2" onclick="save()" class="easyui-linkbutton">提交分配结果</a>
		<a id="btn2" href="query_print_task_sign_form.html" class="easyui-linkbutton">返回</a>
	

		<h1 style="text-align:center">任务单分配</h1>
	<div region="center",border="false">
		 <table class="select-table" style="border:1px solid #333;width:100%;">
				<tr>
					<th width="24%" style="width:50px">任务单编号：</th>
					<td width="26%">${showTask.taskId }</td>
					<th width="24%"  style="width:50px">订单号编号：</th>
					<td width="26%">${showTask.ordId }</td>
				</tr>
				<tr>
					<th>任务生成日期：</th>
					<td>${showTask.createDate }</td>
				  <th>任务状态：</th>
				  <td>
				  	<select id="orderState" class="easyui-combobox" style="width:150px">
				  		<c:forEach var="state" items="${orderState}">
				  			<c:choose>
				  				<c:when test="${state.osname==showTask.osname }">
				  					<option value="${state.osid }" selected=selected>${state.osname }</option>
				  				</c:when>
				  				<c:otherwise>
				  					<option value="${state.osid }">${state.osname }</option>
				  				</c:otherwise>
				  			</c:choose>
				  		</c:forEach>
				  	</select></td>
				</tr>
				<tr>
					  <th >分站名称：</th>
					  <td>
					  	<select class="easyui-combobox" id="substation"style="width:150px">
					  		<c:forEach var="sub" items="${substation }">
					  			<c:choose>
					  				<c:when test="${sub.subName==showTask.subName }">
					  					<option value="${sub.subId }" selected=selected>${sub.subName }</option>
					  				</c:when>
					  				<c:otherwise>
					  					<option value="${sub.subId }">${sub.subName }</option>
					  				</c:otherwise>
					  			</c:choose>
					  		</c:forEach>
					  	</select></td>
					  
					  <th>投递区域：</th>
					  <td>${showTask.district }</td>
				</tr>
			    </table>
				<br/>
				<table class="select-table" style="border:1px solid #333;width:100%;">
				
				<tr>
				  <th>投递地址：</th>
				  <td>${showTask.address }</td>
					<th>邮政编码：</th>
					<td>${showTask.code }</td>
				</tr>
				<tr>
				    <th>送货日期：</th>
					<td>${date }</td>
				  	<th>配送员：</th>
				 	<td>
				 		<select id="sender" class="easyui-combobox" style="width:150px">
				 			<option value="">--请选择--</option>
				 			<c:forEach var="sd" items="${sender }">
				 				<c:choose>
				 					<c:when test="${showTask.doTaskId==sd.senId }">
						 				<option  selected=selected value="${sd.senId }">${sd.senName }</option>
				 					</c:when>
				 					<c:otherwise>
				 						<option value="${sd.senId }">${sd.senName }</option>
				 					</c:otherwise>
				 				</c:choose>
				 			</c:forEach>
				 		</select>
				 	</td>
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
				
			</table></div>
</div>
	
  </body>
</html>
<script type="text/javascript">
	function save(){
		var substation=$("#substation").combobox("getValue");
		var orderState =$("#orderState").combobox("getValue");
		var sender=$("#sender").combobox("getValue");
		var taskId='${showTask.taskId }';
		var ordid='${showTask.ordId }';
		$.ajax({
			url:'doDistribute.html',
			type:'post',
			data:{taskId:taskId,ordid:ordid,substation:substation,orderState:orderState,sender:sender},
			success:function(result){
				alert(result);
				if(sender=="-1"){
					alert("已发往下一分站");
					location.href="query_print_task_sign_form.html";
				}else{
					alert("此任务已分配");
					location.href="query_sign_form_info.html?id="+taskId;
				}
			}
		});
	}
</script>
