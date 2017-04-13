<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"
			+ request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<jsp:include page="../../inc.jsp"></jsp:include>
<title>与分站结算 - 物流管理系统</title>
<meta http-equiv="content-type" content="text/html; charset=UTF-8" />
</head>
<body>
	<div style="width:100%;position:relative;" >
		<div id="p" class="easyui-panel" title="与分站商结算"
			style="width:100%;height:477px;padding:10px;background:#fafafa;">
			<div style="position:absolute;top:55px;left:170px;">
				商品代号 &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
				<input id=proname class="easyui-textbox" value="${requestScope.order.proId }" style="width:150px;" readonly="readonly"> 
			</div>

			<div style="position:absolute;top:55px;left:720px;">
				商品名称 &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
				<input id=proname class="easyui-textbox" value="${requestScope.order.proname }"  style="width:150px" readonly="readonly"> 
			</div>
			<div style="position:absolute;top:100px;left:170px;">
				进货量 &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
				<input id=proname class="easyui-textbox" value="${requestScope.order.buynum }" style="width:150px" readonly="readonly"> 
			</div>
			<div style="position:absolute;top:100px;left:720px;">
				单价&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
				<input id=proname class="easyui-textbox" value="${requestScope.order.proprice }" style="width:150px" readonly="readonly"> 
			</div>
			<div style="position:absolute;top:145px;left:170px;">
				结算量  &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
				<input id=proname class="easyui-textbox" value="${requestScope.order.buynum }" style="width:150px" readonly="readonly"> 
			</div>
			<div style="position:absolute;top:145px;left:720px;">
				结算金额 &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
				<input id=proname class="easyui-textbox" value="${requestScope.order.proprice*requestScope.order.buynum }.00元" style="width:150px" readonly="readonly"> 
			</div>
			<div style="position:absolute;top:190px;left:170px;">
				订单状态 &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
				<input id=bpstate class="easyui-textbox" value="${requestScope.order.osname}" style="width:150px" readonly="readonly"> 
			</div>
			<div style="position:absolute;top:190px;left:720px;">
				共计金额  &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
				<input id=proname class="easyui-textbox" value="${requestScope.order.proprice*requestScope.order.buynum }.00元" style="width:150px" readonly="readonly"> 
			</div>
			
			<div style="position:absolute;top:235px;left:170px;">
				<a id="jiesuan" />
				
			</div>
			<div style="position:absolute;top:235px;left:720px;">
				<a id="back" />
			
			</div>
		</div>

	</div>
</body>
</html>
<script language="javascript">
$('#jiesuan').linkbutton({
	text : '结算'
});
$('#back').linkbutton({
	text : '返回'
});
$("#jiesuan").click(function(){
	
	if('${requestScope.order.osname}'!="已完成"){
		$.messager.confirm('确认', '是否确认结算?', function(r) {
			if(r){
				var ordid='${requestScope.order.ordid }';
				$.ajax({
					url:'subSettlement.html',
					data:{ordid:ordid},
					type:'post',
					success:function(result){
						result=$.trim(result);
						if(result="true"){
							alert("结算成功");
							window.location.href="form-validation.html";
						}	
					}
				});
			}
		});
	}else{
		$.messager.alert("提示","该商品已结算");
	}
	
	
	
});
$("#back").click(function (){
	window.location.href="form-validation.html";
});
</script>
