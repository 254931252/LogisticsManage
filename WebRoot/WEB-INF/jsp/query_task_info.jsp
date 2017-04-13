<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <link rel="stylesheet" href="css/all.css" />
<jsp:include page="../../inc.jsp"></jsp:include>
  <head>
  	<title>任务单信息</title>
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

		<div id="p" class="easyui-panel" title="分站中心"
			style="width:100%;height:457px;padding:10px;background:#fafafa;">
		<h1 style="text-align:center">商品详细信息</h1>
	<div region="center",border="false">
		 <table class="select-table" style="border:1px solid #333;width:100%;">
				<tr>
					<th width="24%" >订单编号：</th>
					<td width="26%">${orderPro.ordid }</td>
				</tr>
				<tr>
					<th width="24%" >商品编号：</th>
					<td width="26%">${orderPro.proid }</td>
				</tr><tr>
					<th width="24%">商品名称：</th>
					<td width="26%">${orderPro.proname }</td>
				</tr>
				<tr>
					<th >商品类别：</th>
					<td>${orderPro.pttype }</td>
				</tr><tr>
				  <th>商品单价：</th>
				  <td>${orderPro.proprice }</td>
				</tr>
				<tr>
					<th>商品数量：</th>
					<td>${orderPro.buynum }</td>
				</tr><tr>
				  <th>总金额：</th>
				  <td>${orderPro.buynum*orderPro.proprice }</td>
				</tr>
			    </table>
			</div>
			<br>
			<div style="color:#f00;font-weight:700;text-align:center">
				<a style="color:#f00;" class="easyui-linkbutton" href="#">&nbsp;打印&nbsp;</a>&nbsp;
				<a style="color:#f00;" class="easyui-linkbutton" href="javascript:back();">&nbsp;返回&nbsp;</a>
			</div>
			</div>
  </body>
</html>
<script type="text/javascript">
	function back(){
		location.href=document.referrer;
	}
</script>
