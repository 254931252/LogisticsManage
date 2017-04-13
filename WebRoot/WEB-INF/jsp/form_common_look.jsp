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
<title>与供应商结算 - 物流管理系统</title>
<meta http-equiv="content-type" content="text/html; charset=UTF-8" />
</head>
<body>
	<div style="width:100%;position:relative;" >
		<div id="p" class="easyui-panel" title="与供应商结算"
			style="width:100%;height:477px;padding:10px;background:#fafafa;">
			<div style="position:absolute;top:55px;left:170px;">
				商品代号 &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
				<input id=proname class="easyui-textbox" value="${requestScope.bpo.proid }" style="width:150px;" readonly="readonly"> 
			</div>

			<div style="position:absolute;top:55px;left:720px;">
				商品名称 &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
				<input id=proname class="easyui-textbox" value="${requestScope.bpo.proname }"  style="width:150px" readonly="readonly"> 
			</div>
			<div style="position:absolute;top:100px;left:170px;">
				进货量 &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
				<input id=proname class="easyui-textbox" value="${requestScope.bpo.proamount }" style="width:150px" readonly="readonly"> 
			</div>
			<div style="position:absolute;top:100px;left:720px;">
				单价&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
				<input id=proname class="easyui-textbox" value="${requestScope.bpo.proprice }" style="width:150px" readonly="readonly"> 
			</div>
			<div style="position:absolute;top:145px;left:170px;">
				结算量  &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
				<input id=proname class="easyui-textbox" value="${requestScope.bpo.proamount }" style="width:150px" readonly="readonly"> 
			</div>
			<div style="position:absolute;top:145px;left:720px;">
				结算金额 &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
				<input id=proname class="easyui-textbox" value="${requestScope.bpo.proamount*requestScope.bpo.proprice }.00元" style="width:150px" readonly="readonly"> 
			</div>
			<div style="position:absolute;top:190px;left:170px;">
				结算状态 &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
				<input id=bpstate class="easyui-textbox" value="${requestScope.bpo.bpstate}" style="width:150px" readonly="readonly"> 
			</div>
			<div style="position:absolute;top:190px;left:720px;">
				共计金额  &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
				<input id=proname class="easyui-textbox" value="${requestScope.bpo.proamount*requestScope.bpo.proprice }.00元" style="width:150px" readonly="readonly"> 
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
	var bpstate=$("#bpstate").val();
	if(bpstate=="未结算"){
		$.messager.confirm('确认', '是否确认结算?', function(r) {
			if(r){
				var bpid='${requestScope.bpo.bpid }';
				$.ajax({
					url:'settlement.html',
					data:{bpid:bpid},
					type:'post',
					success:function(result){
						result=$.trim(result);
						if(result="true"){
							alert("结算成功");
							window.location.href="form-common.html";
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
	window.location.href="form-common.html";
});
</script>
