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
    <div style="width:100%;height:100%;position:relative;" >
		<div id="p" class="easyui-panel" title="修改用户权限"
			style="width:100%;height:477px;padding:10px;background:#fafafa;">
			
			<div style="position:absolute;top:145px;left:80px;">
				用户名:<input id=userName class="easyui-textbox"  style="width:150px" > 
			</div>
			<div style="position:absolute;top:250px;left:100px;">
				<a class="easyui-linkbutton" id="find">查找</a>
			</div>
			<div style="position:absolute;top:250px;left:250px;">
				<a class="easyui-linkbutton" id="modify">修改</a>
			</div>
			<div style="position:absolute;top:50px;left:600px;">
			<ul id="tt"></ul>
 			
		</div>

	</div>
  </body>
</html>
<script language="javascript">
$(function(){
	$("#find").click(function(){
		var userName=$("#userName").textbox("getValue");
		if(userName==null||userName.length==0){
			$.messager.alert("提示","请输入用户名");
		}else{
			$.ajax({
				url:"findUserName.html",
				data:{userName:userName},
				type:"post",
				success:function(result){
					result=$.trim(result);
					if(result=="false")
						$.messager.alert("提示","您输入的用户名不存在！");
					else{
						$("#tt").tree({
							url:"findJurList.html",
							queryParams:{userName:userName},
							checkbox: true,
							cascadeCheck: true,  
							animate:true,
							lines:true,
							
						});
					}
				}
			});
			$("#tt span[class^='tree-icon tree-file']").remove();
			
		}
	});
	$("#modify").click(function(){
		var userName=$("#userName").textbox("getValue");
		if(userName==null||userName.length==0){
			$.messager.alert("提示","请输入用户名");
		}else{
	 		$.ajax({
				url:"findUserName.html",
				data:{userName:userName},
				type:"post",
				success:function(result){
					result=$.trim(result);
					if(result=="false")
						$.messager.alert("提示","您输入的用户名不存在！");
					else{
						var arr = [];
						var a;
				 	 	var checkeds = $('#tt').tree('getChecked', ['checked','indeterminate']);
				 		for (var i = 0; i < checkeds.length; i++) {
				    		arr.push(checkeds[i].text);
				    		a=arr.join(',');
				  			}
				 		if(a!=null&&a.length!=0){
				 			$.ajax({
								url:"modifyJur.html",
								data:{userName:userName,arr:a},
								type:"post",
								success:function(result){
									result=$.trim(result);
									if(result=="true"){
										alert("修改成功");
									}
								}
							});
				 			window.location.href="modify_jur_home.html";
				 		}else{
				 			$.messager.alert("提示","请先选择您要修改的权限！");
				 		}
					}
				}
			});
		}
	});
});

</script>