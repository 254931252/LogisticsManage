<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"
			+ request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>
<jsp:include page="../../inc.jsp" />
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html>
<head>
<title>新订订单 - 物流管理系统</title>
<meta http-equiv="content-type" content="text/html; charset=UTF-8" />
<style media="all" type="text/css">
@import "style/all.css";
</style>
<script type="text/javascript">
	function check() {
		var merchandiseQuantity = document.frm4.merchandiseQuantity.value;
		if (merchandiseQuantity == null || merchandiseQuantity == "") {
			alert("数量不能为空！");
			document.frm4.merchandiseQuantity.focus();
			return false;
		}
		window.location = 'add.html';
	}
</script>
</head>
<body style="background: none">
	<div class="top-bar">
		<!--a href="#" class="button">取 消</a><a href="#" class="button">保 存</a-->
		<h1>新订订单</h1>
		<div class="breadcrumbs">
			<a href="login.html" target="_top">首页</a>
			/
			<a href="user_index.html" target="_top">客户服务中心</a>
		</div>
	</div>
	<div class="select-bar" />
	<form name="frm4" method="post">
		<div class="table" style="height:600px;">
			<img src="style/img/bg-th-left.gif" width="8" height="7" alt="" class="left" /> <img
				src="style/img/bg-th-right.gif" width="7" height="7" alt="" class="right" />
			<table class="listing form" cellpadding="0" cellspacing="0">
				<tr>
					<th class="full" colspan="4">新订订单(*号为必填项)</th>
				</tr>
				<tr>
					<td width="25%" class="first style1" rowspan="2"><b>选择商品</td>
					<!-- <td width="25%"><b>一级分类</td>	 -->
					<td width="25%"><b>商品名称</td>
				</tr>
				<tr>
					<%-- <td>
					<select size="10" style="width:100%">
						<option>商品类</option>
						<c:forEach items="${requestScope.list}" var="list">
						<option id="pttype">${list.pttype}</option>
						</c:forEach>
					</select>
				</td> --%>
					<td><select size="10" id="proname" style="width:100%">
							<c:forEach items="${requestScope.list1}" var="st">
								<option name="${st.proid}">${st.proname}</option>
							</c:forEach>
						</select></td>
				</tr>
				<tr>
					<td class="first">订购数量(*)</td>
					<td><input type="text" name="buynum" id="buynum" class="text" value="0" /></td>
					<td>计量单位</td>
					<td class="punit"></td>
				</tr>
				<tr>
					<td class="first">单价</td>
					<td class="proprice"></td>
					<td>备注信息</td>
					<td class="pmodel"></td>
				</tr>
				<tr>
					<td class="first">金额</td>
					<td class="cost"></td>
					<td>商品说明</td>
					<td class="proinfo"></td>
				</tr>
				<tr>
					<td class="first">收货地址</td>
					<td class="proadress" colspan="3"><input id="proadress" /></td>
				</tr>
				<tr>
					<td colspan="4" align="center"><input type="button" class="button"
							onclick="javascript:window.history.go(-1)" value="上一步" />&nbsp; <input type="button"
							class="add" width="200" value="添加此商品" />&nbsp; <input type="button" class="button"
							onclick="javascript:window.location='order_products.html?userid='+${param.userid}"
							value="浏览订单" /></td>
				</tr>
			</table>
		</div>
	</form>
</body>
</html>
<script type="text/javascript">
	$(document).ready(function() {
		$("#buynum").blur(function() {
			var proname = $("#proname").val();
			var buynum = $("#buynum").val();
			$.ajax({
				url : "getProduct.html",
				data : {
					proname : proname,
					buynum : buynum
				},
				type : "post",
				success : function(json) {
					/* alert($(".pmodel").val(json.product.pmodel));	 */
					$(".proprice").text(json.product.proprice);//将proprice的值传到<td></td>中
					$(".pmodel").text(json.product.pmodel);//将pmodel的值传到input框中
					$(".proinfo").text(json.product.proinfo);
					$(".punit").text(json.product.punit);
					$(".cost").text(json.product.cost);
				}
			});
		});
		$("#proname").change(function() {
			/* alert($("#proname").val()); *///获取selectz中的下拉框的值
			/* var proid=$("#proname").find("option:selected").attr("name");//获取下拉框中option中的属性值 */
			var proname = $("#proname").val();
			var buynum = $("#buynum").val();
			$.ajax({
				url : "getProduct.html",
				data : {
					proname : proname,
					buynum : buynum
				},
				type : "post",
				success : function(json) {
					/* alert($(".pmodel").val(json.product.pmodel));	 */
					$(".proprice").text(json.product.proprice);//将proprice的值传到<td></td>中
					$(".pmodel").text(json.product.pmodel);//将pmodel的值传到input框中
					$(".proinfo").text(json.product.proinfo);
					$(".punit").text(json.product.punit);
					$(".cost").text(json.product.cost);
				}
			});
		});
		$(".add").click(function() {
			var buynum = $("[name=buynum]").val();
			var proid = $("#proname").find("option:selected").attr("name");
			var proadress=$("#proadress").val();
			if(proadress==null||proadress==""){
				$.messager.alert("提示!","收货地址不可为空！");
				return ;
			}
			$.ajax({//执行添加订单方法
				url : "addOrders.html",
				data : {
					userid: '${requestScope.userid}',
					buynum : buynum,
					proadress: proadress,
					proid : proid
				},
				type : "post",
				success : function(result) {
					if($.trim(result)=="true"){
						$.messager.alert("提示！","添加成功");
					}else{
						$.messager.alert("提示！","添加失败");
					}
				}
			});
		});
	});
</script>
