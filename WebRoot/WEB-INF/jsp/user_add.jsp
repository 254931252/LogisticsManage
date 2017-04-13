<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"
			+ request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>
<jsp:include page="../../inc.jsp"></jsp:include>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html>
<head>
<title>新客户登记 - 物流管理系统</title>
<meta http-equiv="content-type" content="text/html; charset=UTF-8" />
<style media="all" type="text/css">
@import "style/all.css";
</style>
</head>

<body style="background: none">
	<div class="top-bar">
		<h1>新客户登记</h1>
		<div class="navbar navbar-inverse">
			<!-- <div class="button-bar">
				<input type="button" name="Submit" value="帮助" class="button" />
				<input type="button" class="button" onclick="check()" value="保存" />
			</div> -->
			<a href="index.html" target="_top">首页</a>
			<a href="user_index.html" target="_top">客户服务中心</a>
		</div>
	</div>
	<div class="select-bar" />
	<form name="frm1" method="post">
		<div class="table">
			<img src="style/img/bg-th-left.gif" width="8" height="7" alt="" class="left" /> <img
				src="style/img/bg-th-right.gif" width="7" height="7" alt="" class="right" />
			<table class="listing form" cellpadding="0" cellspacing="0" align="center">
				<tr>
					<th class="full" colspan="4">添加新客户信息(*号为必填项)</th>
				</tr>
				<tr>
					<td class="first">客户姓名(*)</td>
					<td><input type="text" name="name" class="text" /></td>
					<td>身份证编号(*)</td>
					<td class="last"><input name="idcard" type="text" class="text" /></td>
				</tr>
				<tr>
					<td class="first">工作单位</td>
					<td><input type="text" name="workspace" class="text" /></td>
					<td>座机</td>
					<td class="last"><input name="studio" type="text" class="text" /></td>
				</tr>
				<tr class="bg">
					<td class="first">移动电话</td>
					<td><input type="text" name="tel" class="text" /></td>
					<td>联系地址</td>
					<td class="last"><input name="address" type="text" class="text" /></td>
				</tr>
				<tr>
					<td class="first">邮编</td>
					<td><input type="text" name="code" class="text" /></td>
					<td>E-mail</td>
					<td class="last"><input type="text" name="email" class="text" /></td>
				</tr>
				<tr>
					<td class="first">区域</td>
					<td><input name="district" type="text" class="text" /></td>
					<td style="display:none">id</td>
					<td class="last" style="display:none"><input name="userid" type="text" class="text" /></td>
				</tr>
			</table>
		</div>
		<div class="table">
			<table>
				<tr>
					<th class="full" colspan="4">注册用户名(*号为必填项)</th>
				</tr>
				<tr></tr>
				<tr>
					<td class="first">登陆名(*)</td>
					<td><input type="text" class="loginname" name="username" /></td>
					<td class="first">登陆密码</td>
					<td><input type="text" class="pass" name="userpass" /></td>
					<td><input type="button" class="create" value="注册" /></td>
				</tr>
			</table>
		</div>
	</form>
</body>
</html>
<script type="text/javascript" src="../../js/jquery-1.8.3.js"></script>
<script type="text/javascript">
	$(document).ready(function() {
		$(".button").click(function() {
			var name = $("[name=name]").val();
			var idcard = $("[name=idcard]").val();
			var studio = $("[name=studio]").val();
			var address = $("[name=address]").val();
			var district = $("[name=district]").val();
			var workspace = $("[name=workspace]").val();
			var tel = $("[name=tel]").val();
			var code = $("[name=code]").val();
			var email = $("[name=email]").val();
			$.ajax({
				url : "updateUser.html",
				data : {
					name : name,
					idcard : idcard,
					studio : studio,
					address : address,
					district : district,
					workspace : workspace,
					tel : tel,
					code : code,
					email : email
				},
				type : "post",
				success : function(result) {
					if (result == "false") {
						alert("保存失败,请重新保存");
					}
					if (result == "ture") {
						window.location.href = "user_search.html";
					}
				}
			});
		});
		$(".create").click(function() {
			var name = $("[name=name]").val();
			var idcard = $("[name=idcard]").val();
			var studio = $("[name=studio]").val();
			var address = $("[name=address]").val();
			var district = $("[name=district]").val();
			var workspace = $("[name=workspace]").val();
			var tel = $("[name=tel]").val();
			var code = $("[name=code]").val();
			var email = $("[name=email]").val();
			var username = $("[name=username]").val();
			var userpass = $("[name=userpass]").val();
			if(name ==null || name==""){
				$.messager.alert("提示！","客户姓名不可为空!")
				return;
			}
			if(idcard ==null || idcard==""){
				$.messager.alert("提示！","身份证编号不可为空!")
				return;
			}
			$.ajax({
				url : "addUser.html",
				data : {
					name : name,
					idcard : idcard,
					studio : studio,
					address : address,
					district : district,
					workspace : workspace,
					tel : tel,
					code : code,
					email : email,
					username : username,
					userpass : userpass
				},
				type : "post",
				success : function(result) {
					alert("注册成功");
					window.location.href = "user_search.html";
				}
			});
		});
	})
</script>
