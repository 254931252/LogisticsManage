<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html>
<head>
<jsp:include page="../../inc.jsp"/>
	<title>购货入库 - 物流管理系统</title>
	<meta http-equiv="content-type" content="text/html; charset=UTF-8" />
	
	<script type="text/javascript">
	
			
		 function checkIn(){
		      var numIn=document.getElementById("num_in").value;
			  if(numIn=="" || numIn==null){
				 alert("实际出库数量不能为空");
				 return false;
			  }
			  else if(numIn==0){
				 alert("实际出库数量不能0");
				 return false;
			  
			  }
			  else if(isNaN(numIn)){
			     alert("实际出库数量不是数字");
				 return false;
			  }
			  return true;
		 }
		 var outTime ;
         function checkTime(){	
         outTime = $('#time_in').datetimebox('getValue');
		    
			 if(outTime=="" || outTime==null){
			    alert("请选择实际出库日期!");
			    window.location="";
			    return false;
			 }
		     return true;			
		 }
         function checkSelect(){
			 if(checkIn()){
			    if( checkTime()){
			    	 /* var subName = $("#subName").val(); */
				   alert('出库成功!');
				 
				   window.location.href="updateOutWareOutfo.html?ordid="+${requestScope.buyProOder.ordid}+"&subName="+'${requestScope.buyProOder.subName}'+"&outTime="+outTime+"&proid="+${requestScope.buyProOder.proid}+"&buyNum="+${requestScope.buyProOder.buyNum} ;  
				}	
				return false;
			}	 
			 return false;
		 }
	</script>
</head>
<body style="background: none ;width:100% ;font-size:16px;">
	<div class="easyui-panel" title="购货入库" style="width:60%;height:300px;padding:10px;background:#fafafa;">
			<div class="button-bar" style="float:right;">
				<input type="button" name="help" value="帮助" class="button"  onclick="help('物流管理系统')"/>
				<input type="button" name="select" value="出库" onclick="checkSelect();" class="button"/>
				<input type="button" name="back" value="返回" onclick="window.history.go(-1);"  class="button"/>
			</div>
	  <table class="select-table" style="width:59%;position:absolute;top:70px;">
		<tr>
			<th>订单编号</th>
			<td>${requestScope.buyProOder.ordid}</td>
			<th>商品编号</th>
			<td>${requestScope.buyProOder.proid}</td>
		</tr>
		<tr>
			<th>商品名称</th>
			<td>${requestScope.buyProOder.proname}</td>
			<th>应出库数量</th>
			<td>${requestScope.buyProOder.buyNum}</td>
		</tr>
		<tr>
			<th>实际出库日期</th>
			<td style="white-space:nowrap"><input type="text" id="time_in"  class="easyui-datetimebox" /><span style='color:red'>*</span></td>
			<th>实际出库数量</th>
			<td><input type="text" value="${requestScope.actualOutAmount}" value="50" size='8' id="num_in" readonly/><span style='color:red'>*</span></td>
		</tr>
		<tr>
			<th>目的分站库房</th>
			<td>${requestScope.buyProOder.subName}</td>
		</tr>
	  </table>
    </div>
</body>
</html>
