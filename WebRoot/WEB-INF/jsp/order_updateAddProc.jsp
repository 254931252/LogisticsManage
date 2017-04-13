<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html>
<head>
	<title>换购物品 - 物流管理系统</title>
	<meta http-equiv="content-type" content="text/html; charset=UTF-8" />
	<style media="all" type="text/css">@import "style/all.css";</style>
	<script type="text/javascript">
		function check(){
			var merchandiseQuantity = document.frm6.merchandiseQuantity.value;
			if(merchandiseQuantity==null||merchandiseQuantity==""){
				alert("换购数量不能为空！");
				document.frm6.merchandiseQuantity.focus();
				return false;
			}
			window.location='updateAddProc.jsp';
		}
	</script>
</head>
<body style="background: none">
	<div class="top-bar">
		<!--a href="#" class="button">取 消</a><a href="#" class="button">保 存</a-->
		<h1>换购物品</h1>
		<div class="breadcrumbs">
			<a href="../../index.html" target="_top">首页</a>
			<a href="../index.html" target="_top">客户服务中心</a>
		</div>
	</div>
	<div class="select-bar"/>
<form name="frm6" method="post">
	<div class="table">
		<img src="../../style/img/bg-th-left.gif" width="8" height="7" alt="" class="left" />
		<img src="../../style/img/bg-th-right.gif" width="7" height="7" alt="" class="right" />
		<table class="listing form" cellpadding="0" cellspacing="0">
			<tr>
				<th class="full" colspan="4">换购物品(*号为必填项)</th>
			</tr>
			<tr>
				<td width="25%" class="first style1" rowspan="2"><b>选择商品</td>
				<td width="25%"><b>一级分类</td>
				<td width="25%"><b>二级分类</td>
				<td width="25%"><b>商品名称</td>
			</tr>
			<tr>
				<td>
					<select size="10" style="width:100%">
						<option>读数据库一类</option>
						<option>服装</option>
						<option>书籍</option>
						<option>食品</option>
						<option>服装</option>
						<option>书籍</option>
						<option>食品</option>
						<option>服装</option>
						<option>书籍</option>
						<option>食品</option>
						<option>服装</option>
						<option>书籍</option>
						<option>食品</option>
						<option>服装</option>
						<option>书籍</option>
						<option>食品</option>
					</select>
				</td>
				<td>
					<select size="10" style="width:100%">
						<option>读数据库二类</option>
						<option>服装</option>
						<option>书籍</option>
						<option>食品</option>
					</select>
				</td>
				<td>
					<select size="10" style="width:100%">
						<option>商品名称</option>
						<option>服装</option>
						<option>书籍</option>
						<option>食品</option>
					</select>
				</td>
			</tr>
			<tr>
				<td class="first" >换购数量(*)</td>
				<td><input name="merchandiseQuantity" type="text" class="text" /></td>
				<td>计量单位</td>
				<td class="last">个</td>
			</tr>
			<tr >
				<td class="first">单价</td>
				<td><input type="text" class="text" value="8888元" readonly/></td>
				<td>折扣</td>
				<td class="last">无</td>
			</tr>
			<tr>
				<td class="first">金额</td>
				<td><input type="text" class="text" value="88880元" readonly/></td>
				<td>商品说明</td>
				<td class="last">无</td>
			</tr>
			<tr>
				<td class="first">备注信息</td>
				<td><input type="text" class="text" /></td>
				<td></td>
				<td class="last">

				</td>
			</tr>
			<tr>
				<td colspan="4" align="center">
					<input type="button" class="button" onclick="javascript:window.history.go(-1)" value="上一步"/>&nbsp;
					<input type="button"  class="button" onclick="check();" value="换购此商品"/>&nbsp;
					<input type="button"  class="button" onclick="javascript:window.location='order_updateProducts.html'" value="下一步"/>
				</td>
			</tr>
		</table>
	</div>
</form>
</body>
</html>
