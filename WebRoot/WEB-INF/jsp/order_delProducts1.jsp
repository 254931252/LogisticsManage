<%@ page language="java" import="java.util.*" pageEncoding="GBK"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<jsp:include page="../../inc.jsp" ></jsp:include>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html>
<head>
	<title>�˻��굥 - ��������ϵͳ</title>
	<meta http-equiv="content-type" content="text/html; charset=gb2312" />
	<style media="all" type="text/css">@import "style/all.css";</style>
	
</head>
<body style="background: none">
	<div class="top-bar">
				<!--a href="#" class="button">ADD NEW </a-->
				<h1>�˻��굥</h1>
				<div class="breadcrumbs"><a href="user_index.html" target="_top">��ҳ</a>  <a href="user_index.html">�ͻ���������</a></div>
			</div>
			<div class="select-bar"/>
			<div class="table">
				
				<table id="tt" class=easyui-datagrid style="width:700" >
					
					<tr>
						<td class="first style1" style="width:150px">�ܶ�</td>
						<td colspan="9" style="width:50px">88888Ԫ</td>
					</tr>
				</table>
				
				<div align="center" style="width:100%;">
					
				</div>
			</div>
</body>
</html>
<script>
	$(function(){
	$("#tt").datagrid({ 
		width:'100%',    //��datagrid�����������
		nowrap: true,//��ʾ��ֹ��Ԫ���е������Զ�����
		striped: true,//�Ƿ���ʾ������Ч��
		collapsible: true,//�����Ƿ���ʾ���۵���ť��
		loadMsg: '���ݼ�����.....',    //�����ݱ�����Զ�����ݵ�ʱ����ʾ��Ϣ��
		fitColumns: true ,     //�������Զ�չ��/�����еĴ�С������Ӧ����Ŀ�ȣ���ֹˮƽ������
		sortName: 't',
		sortOrder:'asc',
		remoteSort:false,
		columns :[[{
			field:'t',
			width:'100',
			align:'center',
			title:'��Ʒ���' 
	},{
			field:'t',
			width:'100',
			align:'center',
			title:'��Ʒ����'    
	},{
			field:'t',
			width:'100',
			align:'center',
			title:'����' 
	},{
			field:'t',
			width:'100',
			align:'center',
			title:'��λ'     												
	},{
			field:'t',
			width:'100',
			align:'center',
			title:'����' 
	},{
			field:'t',
			width:'100',
			align:'center',
			title:'���' 
	},{
			field:'t',
			width:'100',
			align:'center',
			title:'��Ʒ˵��' 
	}]],
		pagination:true,//�ɷ�ҳ
		rownumbers:true  //�кŲ��ۼ�
	});
	});
</script>
