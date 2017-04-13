<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
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
				 alert("实际入库数量不能为空");
				 return false;
			  }
			  else if(numIn==0){
				 alert("实际入库数量不能0");
				 return false;
			  
			  }
			  else if(isNaN(numIn)){
			     alert("实际入库数量不是数字");
				 return false;
			  }
				 window.location='in_goods.html';
				 return true;
		 }
		 var time ;
         function checkTime(){	
         time = $('#time_in').datetimebox('getValue');
		     alert(time);
			 if(time=="" || time==null){
			    alert("请选择实际入库日期!");
			    window.location='in_goods.html?bpid='+${requestScope.bpid}+'&actualamount='+${requestScope.actualamount};
			    			    return false;
			 }
			
		     return true;			
		 }
         function checkSelect(){
			 if(checkIn()){
			    if( checkTime()){
				   alert('入库成功!');
				   alert(${requestScope.bpid});
				   window.location='good_allocate.html?bpid='+${requestScope.bpid}+'&actualamount='+${requestScope.actualamount}+'&proid='+${requestScope.BuyProOder.proid}+'&proamount='+${requestScope.actualamount}+'&time='+time;   
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
				<input type="button" name="select" value="入库" onclick="checkSelect()" class="button"/>
				<input type="button" name="back" value="返回" onclick="window.history.go(-1);"  class="button"/>
			</div>
	  <table class="select-table" style="width:59%;position:absolute;top:70px;">
		<tr>
			<th>购货单号</th>
			<td>${requestScope.bpid}</td>
			<th>商品编号</th>
			<td>${requestScope.BuyProOder.proid}</td>
		</tr>
		<tr>
			<th>商品名称</th>
			<td>${requestScope.BuyProOder.proname}</td>
			<th>应入库数量</th>
			<td>${requestScope.BuyProOder.proamount}</td>
		</tr>
		<tr>
			<th>实际入库日期</th>
			<td style="white-space:nowrap"><input type="text" id="time_in"  class="easyui-datetimebox" /><span style='color:red'>*</span></td>
			<th>实际入库数量</th>
			<td><input type="text" value="${requestScope.actualamount}" value="50" size='8' id="num_in"/><span style='color:red'>*</span></td>
		</tr>
	  </table>
    </div>
</body>
</html>
