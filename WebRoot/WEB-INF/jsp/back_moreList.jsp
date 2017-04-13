<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    
    <title>退货单 - 物流管理系统</title>
	<jsp:include page="../../inc.jsp"/>
  </head>
  
  <body>
<div id="p" class="easyui-panel" title="退货单"     
        style="width:100%;height:200px; background:#fafafa;">    
	<table id="tt" style="width:99%;position:absolute;top:60px;" >
	<tr>
		 <th>经手人</th>
		 <td>张三</td>
	     <th>打印时间</th>
	     <td>2012-05-06</td>
    </tr>
	<tr>
		<th>商品编号</th>
		<td>SN9996</td>
		<th>商品名称</th>
		<td>数码相机SONY</td>
	</tr>
	<TR>
		<TH>型号</TH>
		<td>DSC-T900</td>
		<TH>厂商</TH>
		<td>SONY</td>
	</TR>
	<TR>
	<TH>退货数量</TH>
	<TD>1</TD>
	<th>计量单位</th>
	<td>台</td>
	</TR>
	<tr>
		<th>售价 </th>
		<td>5000</td>
		<th>退货日期</th>
		<td>2009-05-20</td>
	</tr>
	</table>
	</div>
</body>
</html>
