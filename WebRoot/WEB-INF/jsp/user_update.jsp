<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html>
<head>
	<title>新客户登记 - 物流管理系统</title>
	<meta http-equiv="content-type" content="text/html; charset=gb2312" />
	<style media="all" type="text/css">@import "style/all.css";</style>
	<script type="text/javascript" src="js/jquery-1.8.3.js"></script>
</head>
<body style="background: none">
	<div class="top-bar">
		<!--a href="#" class="button">取 消</a><a href="#" class="button">保 存</a-->
		<h1>修改客户信息</h1>
		<div class="breadcrumbs">
			<a href="index.html" target="_top">首页</a> /
			<a href="user_index.html" target="_top">客户服务中心</a>
		</div>
	</div>
	<div class="table">
		<img src="style/img/bg-th-left.gif" width="8" height="7" alt="" class="left" />
		<img src="style/img/bg-th-right.gif" width="7" height="7" alt="" class="right" />
		<table class="listing form" cellpadding="0" cellspacing="0">
			<tr>
				<th class="full" colspan="4">修改客户信息</th>
			</tr>
			<tr>
				<td class="first">客户编号</td>
				<td>${requestScope.uu.userid}</td>
				<td>客户姓名</td>
				<td class="last"><input type="text" name="name" class="text" value="${requestScope.uu.name}"/></td>
			</tr>
			<tr>
				<td class="first">身份证编号</td>
				<td><input type="text" class="text" name="idcard" value="${requestScope.uu.idcard}"/></td>
				<td>工作单位</td>
				<td class="last"><input type="text" name="workspace" class="text" value="${requestScope.uu.workspace}"/></td>
			</tr>
			<tr class="bg">
				<td class="first">座机</td>
				<td><input type="text" class="text" name="studio" value="${requestScope.uu.studio}"/></td>
				<td>移动电话</td>
				<td class="last"><input type="text" class="text" name="tel" value="${requestScope.uu.tel}"/></td>
			</tr>
			<tr>
				<td class="first">联系地址</td>
				<td><input type="text" class="text" name="address" value="${requestScope.uu.address}"/></td>
				<td>邮编</td>
				<td class="last"><input type="text" name="code" class="text" value="${requestScope.uu.code}"/></td>
			</tr>
			<tr>
				<td class="first">E-mail</td>
				<td><input type="text" class="text" name="email" value="${requestScope.uu.email}"/></td>
				<td>区域</td>
				<td class="last"><input type="text" name="district"class="text" value="${requestScope.uu.district}"/></td>
			</tr>
		</table>
		<div align="center" style="width:100%;">
			<input type="button" class="ff" onclick="javascript:window.history.go(-1);" value=" 返 回 "/>&nbsp;
			<input type="button" id="button" value=" 修 改 "/>			
		</div>
	</div>
</body>
</html>

<script type="text/javascript">
	$(document).ready(function(){		
		$("#button").click(function(){
			var name=$("[name=name]").val();
			var idcard=$("[name=idcard]").val();
			var workspace=$("[name=workspace]").val();
			var studio =$("[name=studio]").val();
			var tel=$("[name=tel]").val();
			var address=$("[name=address]").val();
			var code=$("[name=code]").val();
			var email=$("[name=email]").val();
			var district=$("[name=district]").val();
			$.ajax({			
				url:"updatePerpleByUserId.html?userid="+${requestScope.uu.userid},
				data:{name:name,idcard:idcard,workspace:workspace,studio:studio,tel:tel,
				address:address,code:code,email:email,district:district},
				type:"post",
				success:function(result){					
						window.location.href="user_search.html";									
				}
			});	
		});
	});
</script>