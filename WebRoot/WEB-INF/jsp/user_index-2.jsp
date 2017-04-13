<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html>
<head>
	<title>物流管理系统</title>
	<meta http-equiv="content-type" content="text/html; charset=UTF-8" />
	<style media="all" type="text/css">@import "../../style/all.css";</style>
</head>
<body>
<div id="main">
	<div id="header">
		<a href="#" class="logo"><img src="../../style/img/logo.gif" width="101" height="29" alt="" /></a>
		<ul id="top-navigation">
			<li><span><span><a href="#">首页</a></span></span></li>
			<li class="active"><span><span>客户服务中心</span></span></li>
			<li><span><span><a href="#">调度中心</a></span></span></li>
			<li><span><span><a href="#">分站管理</a></span></span></li>
			<li><span><span><a href="#">库房管理</a></span></span></li>
			<li><span><span><a href="#">配送中心</a></span></span></li>
			<li><span><span><a href="#">财务管理</a></span></span></li>
		</ul>
	</div>
	<div id="middle">
		<div id="left-column">
			<h3>客户管理</h3>
			<ul class="nav">
				<li><a href="#">新客户登记</a></li>
				<li><a href="#">客户信息查阅</a></li>
				<li class="last"><a href="#">客户订购信息查阅</a></li>
			</ul>
			<h3>订单管理</h3>
			<ul class="nav">
				<li><a href="#">订单信息查阅</a></li>
				<li><a href="#">客户信息查阅</a></li>
				<li class="last"><a href="#">客户订购信息查阅</a></li>
			</ul>
			<a href="#" class="link">Link here</a>
		</div>
		<div id="center-column">
			<div class="top-bar">
				<a href="#" class="button">ADD NEW </a>
				<h1>目录</h1>
				<div class="breadcrumbs"><a href="../../index.jsp">首页</a> / <a href="#">客户服务中心</a></div>
			</div><br />
		  <div class="select-bar">
		    <label><input type="text" name="textfield" /></label>
		    <label><input type="submit" name="Submit" value="查询" /></label>
		  </div>
			<div class="table">
				<img src="../style/img/bg-th-left.gif" width="8" height="7" alt="" class="left" />
				<img src="../style/img/bg-th-right.gif" width="7" height="7" alt="" class="right" />
				<table class="listing" cellpadding="0" cellspacing="0">
					<tr>
						<th class="first" width="177">Header Here</th>
						<th>Header</th>
						<th>Head</th>
						<th>Header</th>
						<th>Header</th>
						<th>Head</th>
						<th>Header</th>
						<th class="last">Head</th>
					</tr>
					<tr>
						<td class="first style1">- Lorem Ipsum </td>
						<td><img src="../../style/img/add-icon.gif" width="16" height="16" alt="" /></td>
						<td><img src="../../style/img/hr.gif" width="16" height="16" alt="" /></td>
						<td><img src="../../style/img/save-icon.gif" width="16" height="16" alt="" /></td>
						<td><img src="../../style/img/edit-icon.gif" width="16" height="16" alt="" /></td>
						<td><img src="../../style/img/login-icon.gif" width="16" height="16" alt="" /></td>
						<td><img src="../../style/img/save-icon.gif" width="16" height="16" alt="save" /></td>
						<td class="last"><img src="../../style/img/add-icon.gif" width="16" height="16" alt="add" /></td>
					</tr>

		
				</table>
				<div class="select">
					<strong>Other Pages: </strong>
					<select>
						<option>1</option>
					</select>
			  </div>
			</div>
		  <div class="table">
				<img src="../style/img/bg-th-left.gif" width="8" height="7" alt="" class="left" />
				<img src="../style/img/bg-th-right.gif" width="7" height="7" alt="" class="right" />
				<table class="listing form" cellpadding="0" cellspacing="0">
					<tr>
						<th class="full" colspan="2">Header Here</th>
					</tr>
					<tr>
						<td class="first" width="172"><strong>Lorem Ipsum</strong></td>
						<td class="last"><input type="text" class="text" /></td>
					</tr>
					<tr class="bg">
						<td class="first"><strong>Lorem Ipsum</strong></td>
						<td class="last"><input type="text" class="text" /></td>
					</tr>
					<tr>
						<td class="first""><strong>Lorem Ipsum</strong></td>
						<td class="last"><input type="text" class="text" /></td>
					</tr>
					<tr class="bg">
						<td class="first"><strong>Lorem Ipsum</strong></td>
						<td class="last"><input type="text" class="text" /></td>
					</tr>
				</table>
	        <p>&nbsp;Content</p>
		  </div>
		</div>
		<div id="right-column">
			<strong class="h">INFO</strong>
			<div class="box">客户是整体系统的核心，该功能主要用来维护和客户基本信息相关的操作，同时可以查询客户以前的订单信息。</div>
		</div>
	</div>
	<div id="footer"></div>
</div>


</body>
</html>
