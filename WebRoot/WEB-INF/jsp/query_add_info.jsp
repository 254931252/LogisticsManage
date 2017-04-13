<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <link rel="stylesheet" href="css/all.css" />
<jsp:include page="../../inc.jsp"></jsp:include>
  <head>
  <title>回执单录入</title>
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
  <div class="easyui-panel" title="回执单录入" style="width:100%;margin:10px 0;padding:5px;text-align: right;border:none;border-bottom:2px solid #F99999;">		
	
	 <br>
		 <table class="select-table" style="border:1px solid #333;width:100%">
				<tr>
					<th width="24%" >任务单编号：</th>
					<td width="26%">${showTask.taskId }</td>
					<th width="24%">订单编号：</th>
					<td width="26%">${showTask.ordId }</td>
				</tr>
				<tr>
					<th >送货分站编号：</th>
					<td>${showTask.subId }</td>
					<th>送货分站：</th>
					<td>${showTask.subName }</td>
				</tr>
				<tr>
				  <th>投递员编号：</th>
				  <td>${showTask.doTaskId }</td>
				  <th>投递员：</th>
				  <td>${name }</td>
				</tr>
				<tr>
				  <th>商品编号：</th>
				  <td>${orderPro.proid }</td>
				  <th>商品名称：</th>
					<td>${orderPro.pttype }</td>
				</tr>
				<tr>
					<th>购买数量：</th>
					<td>${orderPro.buynum }</td>
					 <th>订单状态：</th>
				  	<td><select id="cc" class="easyui-combobox" style="width:145px">
					<c:forEach var="s" items="${state }">
						<c:choose>
							<c:when test="${s.osid==showTask.subId }">
								<option selected="selected" value="${s.osid }">${s.osname }</option>
							</c:when>
							<c:otherwise>							
								<option value="${s.osid }">${s.osname }</option>
							</c:otherwise>
						</c:choose>
					</c:forEach>
					</td>
			   </tr>
				<tr>
				    <th>客户编号：</th>
					<td >${showTask.userId }</td>
					<th>客户：</th>
					<td>${showTask.name }</td>
				</tr>
				</table>
				<br/>
               
				<div style="font-weight:700;text-align:center;">
					<a id="btn2" href="save();" class="easyui-linkbutton">&nbsp;回执录入&nbsp;</a>&nbsp;
					<a id="btn2" href="print();" class="easyui-linkbutton">&nbsp;打印回执单&nbsp;</a>&nbsp;
					<a id="btn2" href="javascript:back();" class="easyui-linkbutton">&nbsp;返回上层&nbsp;</a></div>
         		</div>
         </div>	
  </body>
</html>
<script type="text/javascript">
	function save(){
		var ordid='${showTask.ordId }';
		var state=$("#cc").combobox("getValue");
		$.ajax({
			url:'doSave.html',
			type:'post',
			data:{ordid:ordid,state:state},
			success:function(result){
				
			}
		});
	}
	function back(){
	
		location.href=document.referrer;
	}
	function print(){
		alert("正在连接打印机");
	}
</script>
