<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%
       java.util.Date date = new java.util.Date();
            String datestr = java.text.DateFormat.getDateTimeInstance().format(date);
   %>
  
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html>
<head>
	<title>中心库房调拨出库 - 物流管理系统</title>
	<meta http-equiv="content-type" content="text/html; charset=UTF-8" />
	<link href="css/all.css" rel="stylesheet" type="text/css"/>
	<jsp:include page="../../inc.jsp"/>
</head>
<body style="background: none">
	<br/>
	<br/>
	<br/>
    <br/>
	<br/>
	<div align="center"> <H1>出&nbsp;&nbsp;&nbsp;&nbsp;库&nbsp;&nbsp;&nbsp;&nbsp;单</H1></div>
<div align="center">
	<table width="100%x" align="center">
		<tr>
			<td  align="center" >送往:${requestScope.subName}</td>
			<td align="center" style="color:#f00;font-size:14px;"> 打印时间 :<%=datestr %> </td>
		</tr>
	</table>
	<div  style ="width:100%">
		   	<table class="select-table" >	
			   <tr>
					<th>商品编号</th>
					<td>${requestScope.buyProOder.proid}</td>
				    <th>售价</th>
					<td>${requestScope.buyProOder.proprice}</td>
				</tr>
				<tr> 
					<th>商品名称</th>
					<td>${requestScope.buyProOder.proname}</td>
					<th>数量</th>
					<td>${requestScope.buyProOder.buyNum}</td>
				</tr>
				<tr>
					<th>厂商</th>
					<td>${requestScope.buyProOder.supname}</td>
					<th>商品数量总计</th>
					<td >${requestScope.buyProOder.buyNum}</td>
				</tr>
				
			</table>
            <br/>
			<table class="select-table">
				<tr>
					<th>总金额</th>
					<td>${requestScope.buyProOder.buyNum*requestScope.buyProOder.proprice}</td>
					<th>日期</th>
					<td>${requestScope.buyProOder.outtime}</td>
				</tr>
			</table>
		 </div>
		 <br/>
		 <br/>
		 <div><input type="button" class="print" value="打印" style="width:100px;font-size:16px;font-weight:bold;position:absolute;left:500px;" /></div>
		 <div><input type="button" class="but" value="返回" style="width:100px;font-size:16px;font-weight:bold;" /></div>
    </div>
</body>
</html>
<script language="javascript">
	$(".but").click(function(){
		
		location.href="out_print.html";
	});
	$(".print").click(function(){
			alert("打印完成 ");
			location.href="out_print.html";
	});

</script>