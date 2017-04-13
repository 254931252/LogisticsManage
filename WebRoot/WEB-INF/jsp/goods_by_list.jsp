<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html>
<head>
<jsp:include page="../../inc.jsp"/>
	<title>领货 - 物流管理系统</title>
	<meta http-equiv="content-type" content="text/html; charset=UTF-8" />
	<style media="all" type="text/css">
		@import "../../style/all.css";
		@import "../../style/jquery/ui.all.css";
	</style>
	<script type="text/javascript" src="../../script/jquery-1.3.2.min.js"></script>
	<script type="text/javascript" src="../../script/jquery-ui-personalized-1.6rc6.min.js"></script>
	<script type="text/javascript" src="../../script/date.js"></script>
	<script type="text/javascript" src='../../script/common.js'></script>
	<script>
		  $(function(){
				datepicker('.date-three');
		  });

		 function checkId(){
			  var man_get=document.getElementById("man_get").value;
			  if(man_get=="" || man_get==null){
				 alert("领货人不能为空!");
				 return false;
			  }	
			  return true;
		 }
		 function checkTime(){
			  var time_get=document.getElementById("time_get").value;
			  if(time_get=="" || time_get==null){
				 alert("领货日期不能为空!");
				 return false;
			  }	
			  return true;
		 }
		 function checkSelect(){
			  if(checkId() ){
			    if(checkTime()){
					alert('领货成功!');
					window.location='goods_get.html';
					return true;					
				}
				return false;
			  }
				return false;
		 }
	</script>
</head>
<body> 
	<div class="easyui-panel" title="领货" style="width:100%;height:230px;padding:10px;background:#fafafa;">
		<div class="breadcrumbs" style='float:right;width:180px;' >				
		        <input type="button" name="help" value="帮助"  onclick="help('物流管理系统')" class="button"/>
				<input type="button" name="select" value="领货" onclick="return checkSelect() " class="button"/>
				<input type="button" name="back" value="返回" onclick="window.history.go(-1);"  class="button"/>
		</div>
    <div >
	  <table width="99%" border="0" align="center" style='position:absolute;top:80px;left:60px;'>
		<tr>
			<th>任务单号</th>
			<td>5211</td>
			<th>商品名称</th>
			<td>惠普笔记本</td>
		</tr>
		<tr>
			<th>商品编号</th>
			<td>VH054PA</td>
			<th>型号</th>
			<td>CQ35-217TX</td>
		</tr>
		<tr>
			<th>领货人</th>
			<td><input type="text" id="man_get"  size='8'><span style='color:red'>*</span></td>
			<th>数量</th>
			<td>100</td>
		</tr>
		<tr>
		    <th>领货日期</th>
			<td style="white-space:nowrap"><input type="text" id="time_get" class="date-three text" readonly><span style='color:red'>*</span></td>
			<th>计量单位</th>
			<td>台</td>			
		</tr>
		<tr>
			<th>备注信息</th>
			<td colspan="3"><textarea cols='25' ></textarea></td>
		</tr>
	  </table>
    </div>
   </div>
</body>
</html>
