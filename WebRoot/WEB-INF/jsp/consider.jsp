<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<jsp:include page="../../inc.jsp"></jsp:include>
<title>极光物流-配送中心</title>
<meta http-equiv="content-type" content="text/html; charset=UTF-8" />
</head>
<body>
	<div style="width:100%;position:relative;" >
		<div id="p" class="easyui-panel" title="库存查询"
			style="width:100%;height:659px;padding:10px;background:#fafafa;">
			<div style="position:absolute;top:75px;left:80px;">
				商品类型&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
				<select editable="false" id="cb" class="easyui-textbox" name="dept" style="width:200px;" panelHeight="60">
					<option value=0>所有</option>
					<c:forEach var="type" items="${typeList }">
       					<option value=${type.ptid } >${type.pttype }</option>
    				</c:forEach>
				</select>
			</div>
			<div style="position:absolute;top:150px;left:80px;">
				开始日期 &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
				<input editable="false" type="text" class="easyui-datebox" id="start" />
			</div>
			<div style="position:absolute;top:225px;left:80px;">
				终止日期 &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
				<input editable="false" type="text" class="easyui-datebox" data-options="currentText:true" id="end" />
			</div>
			<div style="position:absolute; margin-right: 30px;margin-top: 15px;top:300px;left:200px;">
				<a id="btn" >刷新</a>
			</div>
			<div id="pic" style="position: absolute; width: 700px;height: 520px;left:480px;top:80px;border-radius:3px;">
				<img id="srPic" src="" />
			</div>
		</div>

	</div>
</body>
</html>
<script language="javascript">
	var type = 0;
	var typeName = "所有";
	var startDate;
	var endDate;
	function changePicture(){
		startDate = $('#start').datebox('getValue');
		endDate = $('#end').datebox('getValue');
		$('#srPic').attr("src","changeconsider.html?type=" + type + "&typeName=" + typeName + "&startDate="
			+ startDate + "&endDate=" + endDate + "&" +Math.random());
	}
	$(function(){
		$('#btn').bind('click', function() {
			changePicture();
		});
		$('#btn').linkbutton({
			iconCls : 'icon-reload'
		});
		$('#cb').combobox({
    		onSelect : function(){
    			type = $('#cb').combobox('getValue');
    			typeName = $('#cb').combobox('getText');
    			changePicture();
    		}  
		});
		formatterDate = function(date) {
			var day = date.getDate() > 9 ? date.getDate() : "0" + date.getDate();
			var month = (date.getMonth() + 1) > 9 ? (date.getMonth() + 1) : "0"
			+ (date.getMonth() + 1);
			return date.getFullYear() + '-' + month + '-' + day;
		};
		window.onload = function () { 
			$('#end').datebox('setValue', formatterDate(new Date()));
			endDate = $('#end').datebox('getValue');
			var toDay = endDate.split("-");
			var year = toDay[0];
			var month = toDay[1];
			var startMonth = month - 3;
			startDate = year + "-" + startMonth + "-" + 1;
			$('#start').datebox('setValue',startDate);
		};
		$('#start,#end').datebox({
			onSelect:function(){
				startDate = $('#start').datebox('getValue');
				endDate = $('#end').datebox('getValue');
				changePicture();
			}
		});
		changePicture();
	});
	
</script>
