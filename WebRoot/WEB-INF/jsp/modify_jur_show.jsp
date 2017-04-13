<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <jsp:include page="../../inc.jsp"></jsp:include>
    
    <title>修改用户权限</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	

  </head>
  
  <body>
    <div style="width:100%;position:relative;" >
		<div id="p" class="easyui-panel" title="修改用户权限"
			style="width:100%;height:477px;padding:10px;background:#fafafa;">
			
			<div style="position:absolute;top:145px;left:100px;">
				用户名:<input id=userName class="easyui-textbox"  style="width:150px" > 
			</div>
			<div style="position:absolute;top:145px;left:300px;">
				<a class="easyui-linkbutton" id="btn">查找</a>
			</div>
			<div style="position:absolute;top:3	45px;left:200px;">
				<a class="easyui-linkbutton" id="btn">修改</a>
			</div>
			
		</div>

	</div>
  </body>
</html>
<script language="javascript">
$(function(){
	$("#btn").click(function(){
		var userName=$("#userName").textbox("getValue");
		alert(userName);
	});
});
</script>