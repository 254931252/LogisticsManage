<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <title>新客户信息</title>
	<meta http-equiv="content-type" content="text/html; charset=UTF-8" />
	<style media="all" type="text/css">@import "style/all.css";</style>
	<script type="text/javascript" src="../../js/jquery-1.8.3.js"></script>

  </head>
  
  <body style="background: none">
	<div class="top-bar" >
		<h1>新客户信息</h1>
		<div class="navbar navbar-inverse">
			<div class="button-bar">
				<input type="button" name="Submit" value="帮助" class="button"/>
				<input type="button" class="button" onclick="check()" value="保存"/>
			</div>
			<a href="index.html" target="_top">首页</a> 
			<a href="user_index.html" target="_top">客户服务中心</a>
		</div>
	</div>
<div class="select-bar"/>

	<div class="table" >
		<img src="style/img/bg-th-left.gif" width="8" height="7" alt="" class="left" />
		<img src="style/img/bg-th-right.gif" width="7" height="7" alt="" class="right" />
		<table class="listing form" cellpadding="0" cellspacing="0" align="center">
			<tr>
				<th class="full" colspan="4">新客户信息(*号为必填项)</th>
			</tr>
			<tr>
				<td class="first">客户姓名(*)</td>
				<td><input type="text" name=${sessionScope.user2.username} class="text" /></td>
				<td>身份证编号(*)</td>
				<td class="last"><input name=${sessionScope.idcard}  type="text" class="text" /></td>
			</tr>
			<tr>
				<td class="first">工作单位</td>
				<td><input type="text" name=${sessionScope.workspace} class="text" /></td>
				<td>座机(*)</td>
				<td class="last"><input name="officePhoneNumber" type="text" class="text" /></td>
			</tr>
			<tr class="bg">
				<td class="first">移动电话</td>
				<td><input type="text" name=${sessionScope.tel} class="text" /></td>
				<td>联系地址(*)</td>
				<td class="last"><input name=${sessionScope.address} type="text" class="text" /></td>
			</tr>
			<tr>
				<td class="first">邮编</td>
				<td><input type="text" name="code" class="text" /></td>
				<td>E-mail</td>
				<td class="last"><input type="text" name="email" class="text" /></td>
			</tr>
			<tr>
				<td class="first">区域(*)</td>
				<td><input name="district" type="text" class="text" /></td>
				<td style="display:none">id</td>
				<td class="last" style="display:none"><input name="userid" type="text" class="text"/></td>
			</tr>
		</table>
		</div>
</body>
</html>
