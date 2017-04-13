<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html>
<head>
<jsp:include page="../../inc.jsp" ></jsp:include>
	<title>修改订单商品 - 物流管理系统</title>
	<meta http-equiv="content-type" content="text/html; charset=UTF-8" />
	<style media="all" type="text/css">@import "style/all.css";</style>
</head>
<body style="background: none">
	<div class="top-bar">
		<!--a href="#" class="button">取 消</a><a href="#" class="button">保 存</a-->
		<h1>修改订单商品</h1>
		<div class="breadcrumbs">
			<a href="index.html" target="_top">首页</a> /
			<a href="user_index.html" target="_top">客户服务中心</a>
		</div>
	</div>
	<div class="select-bar"/>
	<div class="table">
		<img src="style/img/bg-th-left.gif" width="8" height="7" alt="" class="left" />
		<img src="style/img/bg-th-right.gif" width="7" height="7" alt="" class="right" />
<form>
		<table class="listing form" cellpadding="0" cellspacing="0">
			<tr>
				<th class="full" colspan="4">修改订单商品</th>
			</tr>
			<tr>
				<td class="first">商品编号</td>
				<td>${requestScope.pt.proid}</td>
				<td>商品名称</td>
				<td class="last">
				<input type="text" id="proname" class="text"  value="${requestScope.pt.proname}" readonly/>
				</td>
			</tr>
			<tr>
				<td class="first" >订购数量(*)</td>
				<td><input type="text" class="text" id="buynum" value="${requestScope.pt.buynum }"/></td>
				<td>计量单位</td>
				<td class="last" ><input type="text" class="text" value="${requestScope.pt.punit}"readonly/></td>
			</tr>
			<tr >
				<td class="first">单价</td>
				<td><input type="text" class="text" value="${requestScope.pt.proprice}" readonly/></td>
				<td>折扣</td>
				<td class="last">无</td>
			</tr>
			<tr>
				<td class="first">金额</td>
				<td><input type="text" class="cost" value="${requestScope.pt.cost}" readonly/></td>
				<td>商品说明</td>
				<td class="last"><input type="text" class="text" value="${requestScope.pt.pmodel}" readonly/></td>
			</tr>
			<tr>
				<td class="first">备注信息</td>
				<td><input type="text" class="text" value="${requestScope.pt.proinfo}" readonly/></td>
				<td></td>
				<td class="last">

				</td>
			</tr>
			<tr>
				<td colspan="4">
					<input type="button" class="button" width="200" onclick="javascript:history.go(-1)" value="返 回"/>
					<input type="button" id="update" width="200" value="修 改"/>
					</td>
			</tr>
		</table>

</form>
	</div>
</body>
</html>
<script>
	$(document).ready(function(){
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
					$(".cost").val(json.product.cost);
				}
			});
		});
		$("#update").click(function(){			
			var buynum=$("#buynum").val();						
			var ordid=${requestScope.pt.ordid}
			$.ajax({
				url:"updateBuynum.html",
				data:{buynum:buynum,ordid:ordid},
				type:"post",
				success:function(result){
					window.location='order_products.html?userid='+${pt.userid};
				}
			});
		});
	});
</script>
