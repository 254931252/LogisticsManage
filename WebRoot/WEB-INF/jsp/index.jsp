<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>极光物流</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<link rel="stylesheet" href="css/bootstrap.min.css" />
	<link rel="stylesheet" href="css/bootstrap-responsive.min.css" />
	<link rel="stylesheet" href="css/fullcalendar.css" />
	<link rel="stylesheet" href="css/matrix-style.css" />
	<link rel="stylesheet" href="css/matrix-media.css" />
	<link rel="stylesheet" href="css/jquery.gritter.css" />
	<link href='http://fonts.useso.com/css?family=Open+Sans:400,700,800' rel='stylesheet' type='text/css'>
	<style type="text/css">
		ul li{
			list-style-type: none;
		}
	</style>
	</head>
	<body style="background-color: #939db8;height: 825px;">
<div style="width: 1500px;margin: auto;background-color: #2e363f;">
<!--Header-part-->
<div id="header" style="z-index: 1;">
  <h1 >物流管理中心</h1>
</div>
<!--close-Header-part--> 





<!--sidebar-menu-->
<div id="sidebar"><a href="#" class="visible-phone"><i class="icon icon-home"></i> Dashboard</a>

  <ul>
  <c:forEach items="${sessionScope.jurList }" var="jur">
  <%-- <c:if test="${jur.jurName eq '客服'}">
  <li class="submenu"> <a href="#"><i class="icon icon-th-list"></i> <span>客服管理</span> </a>
      <ul>
      <c:forEach items="${sessionScope.actionList }" var="action">
      	<c:if test="${action.actName eq '新客户登记'}">
        <li><a href="user_add.html" target="center-frame">新客户登记</a></li>
        </c:if>
        <c:if test="${action.actName eq '客户信息查询/编辑'}">
        <li><a href="user_search.html" target="center-frame">客户信息查询/编辑</a></li>
        </c:if>
         <c:if test="${action.actName eq '客户订购信息查询'}">
        <li><a href="user_orderformList.html" target="center-frame">客户订购信息查询</a></li>
        </c:if>
        <c:if test="${action.actName eq '订单查询'}">
	        <li><a href="order_search.html" target="center-frame">订单查询</a></li>
	    </c:if>
     </c:forEach>
      </ul>
    </li>
 </c:if> --%>
  
   <c:if test="${jur.jurName eq '客户'}">
    <li class="submenu"> <a href="#"><i class="icon icon-th-list"></i> <span>客户管理</span> </a>
      <ul>
  		<c:forEach items="${sessionScope.actionList }" var="action">
	  		<c:if test="${action.actName eq '新客户登记'}">
	        <li><a href="user_add.html" target="center-frame">新客户登记</a></li>
	        </c:if>
	        <c:if test="${action.actName eq '客户信息查询/编辑'}">
        <li><a href="user_search.html" target="center-frame">客户信息查询/编辑</a></li>
        </c:if>
         <c:if test="${action.actName eq '客户订购信息查询'}">
        <li><a href="user_orderformList.html" target="center-frame">客户订购信息查询</a></li>
        </c:if>
        </c:forEach>
      </ul>
    </li>
   </c:if>
       
       
      <c:if test="${jur.jurName eq '配送'}">
    <li class="submenu"> <a href="#"><i class="icon icon-th-list"></i> <span>配送管理</span> </a>
      <ul>
  		<c:forEach items="${sessionScope.actionList }" var="action">
	       <c:if test="${action.actName eq '商品管理'}">
	      	<li><a href="product_manage.html" target="center-frame">商品管理</a></li>
	      	 </c:if>
	      	 <c:if test="${action.actName eq '库存查询'}">
	      	<li><a href="inventory_manage.html" target="center-frame">库存查询</a></li>
	      	 </c:if>
	      	 <c:if test="${action.actName eq '进货安排'}">
	        <li><a href="buy_product.html" target="center-frame">进货安排</a></li>
	         </c:if>
	         
	       <c:if test="${action.actName eq '库房查询'}">
	        <li><a href="waerhouse_manage.html" target="center-frame">库房查询</a></li>
	         </c:if>
	         <c:if test="${action.actName eq '出入库查询'}">
	        <li><a href="outorinto_warehouse.html?whId=0" target="center-frame">出入库查询</a></li>
	         </c:if>
	         
	         <c:if test="${action.actName eq '需求统计'}">
	        <li><a href="statisticalRequirement.html" target="center-frame">需求统计</a></li>
	         </c:if>
	         <c:if test="${action.actName eq '销量排行'}">
	        <li><a href="consider.html" target="center-frame">销量排行</a></li>
	         </c:if>
	    	
        </c:forEach>
      </ul>
    </li>
   </c:if> 
    
    
    <c:if test="${jur.jurName eq '调度'}">
    <li class="submenu"> <a href="#"><i class="icon icon-th-list"></i> <span>调度中心</span> </a>
      <ul>
      <c:forEach items="${sessionScope.actionList }" var="action">
      <c:if test="${action.actName eq '手动调度'}">
        <li><a href="dispatch_hand_make.html" target="center-frame">手动调度</a></li>
         </c:if>
        <c:if test="${action.actName eq '自动调度'}">
        <li><a href="dispatch_self_make.html" target="center-frame">自动调度</a></li>
         </c:if>
        <c:if test="${action.actName eq '订单状态修改'}">
        <li><a href="dispatch_update_orders.html" target="center-frame">订单状态修改</a></li>
         </c:if>
        <c:if test="${action.actName eq '任务单管理'}">
        <li><a href="dispatch_task_manage.html" target="center-frame">任务单管理</a></li>
         </c:if>
         </c:forEach>
      </ul>
    </li>
	</c:if>
         
     <c:if test="${jur.jurName eq '分站'}">
    <li class="submenu"> <a href="#"><i class="icon icon-th-list"></i> <span>分站管理</span> </a>
      <ul>
       <c:forEach items="${sessionScope.actionList }" var="action">
      	<c:if test="${action.actName eq '任务查询与分配'}">
        <li><a href="query_print_task_sign_form.html" target="center-frame">任务查询与分配</a></li>
        </c:if>
        <c:if test="${action.actName eq '签收/任务打印回执录入'}">
        <li><a href="query.html" target="center-frame">签收/任务打印回执录入</a></li>
        </c:if>
        <c:if test="${action.actName eq '缴款查询'}">
        <li><a href="query_pay.html" target="center-frame">缴款查询</a></li>
        </c:if>
      </c:forEach>
      </ul>
    </li>
	</c:if>
    
    
    <c:if test="${jur.jurName eq '库房'}">
    <li class="submenu"> <a href="#"><i class="icon icon-th-list"></i><span>中心库房购货入库</span> </a>
      <ul>
      <c:forEach items="${sessionScope.actionList }" var="action">
      <c:if test="${action.actName eq '购货入库'}">
        <li class="last"><a href="in_allocate.html" target="center-frame">购货入库</a></li>
        </c:if>
       <c:if test="${action.actName eq '商品出库'}">
        <li><a href="allocate_out.html" target="center-frame" >商品出库</a></li>
         </c:if>
         <c:if test="${action.actName eq '打印出库单'}">
		<li ><a href="out_print.html" target="center-frame">打印出库单</a></li>
		 </c:if>
		 <c:if test="${action.actName eq '打印分发单'}">
		<li class="last"><a href="distribute_print_list.html" target="center-frame">打印分发单</a></li>
		 </c:if>
       <c:if test="${action.actName eq '商品入库登记'}">
        <li class="last"><a href="in_depart.html" target="center-frame" >商品入库登记</a></li>
        </c:if>
      </c:forEach>
      </ul>
    </li>
	</c:if>
    
    <c:if test="${jur.jurName eq '财务'}">
    <li class="submenu"> <a href="#"><i class="icon icon-th-list"></i> <span>结算管理</span> </a>
      <ul>
      <c:forEach items="${sessionScope.actionList }" var="action">
       <c:if test="${action.actName eq '与供应商结算'}">
        <li><a href="form-common.html" target="center-frame">与供应商结算</a></li>
        </c:if>
         <c:if test="${action.actName eq '与分站结算'}">
        <li><a href="form-validation.html" target="center-frame">与分站结算</a></li>
        </c:if>
       </c:forEach>
      </ul>
    </li>
 	 </c:if>
   </c:forEach>
    <li class="submenu"> <a href="#"><i class="icon icon-th-list"></i> <span>查看地图</span> </a>
      <ul>
        <li><a href="http://developer.baidu.com/map/jsdemo/demo/b0_7.htm" target="center-frame">我的位置</a></li>
        <li><a href="http://developer.baidu.com/map/jsdemo/demo/f0_6.htm" target="center-frame">鼠标测距</a></li>
        <li><a href="http://developer.baidu.com/map/jsdemo/demo/f0_3.htm" target="center-frame">拾取坐标</a></li>
      </ul>
    </li>
  </ul>
  
</div>
<!--sidebar-menu-->

<!--main-container-part-->
<div id="content" style="z-index: 2;position: relative;">
<!--top-Header-menu-->
<div id="user-nav" class="navbar navbar-inverse" style="position: absolute; top:-38px;left:-1px;">
  <ul class="nav">
    <li  class="dropdown" id="profile-messages" ><a title="" href="#" data-toggle="dropdown" data-target="#profile-messages" class="dropdown-toggle"><i class="icon icon-user"></i>  <span class="text">欢迎${sessionScope.user.name }</span><b class="caret"></b></a>
      <ul class="dropdown-menu">
        <li><><i class="icon-user"></i>个人资料</a></li>
        <li class="divider"></li>
        <li><a href="logout.html"><i class="icon-key"></i>退出</a></li>
      </ul>
    </li>
    <li class=""><a title="" href="logout.html"><i class="icon icon-share-alt"></i> <span class="text">Logout</span></a></li>
  </ul>
</div>
<!--close-top-Header-menu-->
<!--breadcrumbs-->
  <div id="content-header">
    <div id="breadcrumb"> <a href="index.html" title="Go to Home" class="tip-bottom"><i class="icon-home"></i>首页</a></div>
  </div>
<!--End-breadcrumbs-->
<div id="center-column">
			<iframe id="frame_content" name="center-frame" src="home_image.jsp" frameborder="0" scrolling="no" allowTransparency="true" style="width:100%;height:675px;margin:0 0;padding:0 0;"></iframe>
</div>
<!--end-main-container-part-->

<!--Footer-part-->

<div class="row-fluid">
  <div id="footer" class="span12"> 2013 &copy; Matrix Admin. Brought to you by <a href="http://themedesigner.in/">Themedesigner.in</a> </div>
</div>
</div>
<!--end-Footer-part-->

<script src="js/excanvas.min.js"></script> 
<script src="js/jquery.min.js"></script> 
<script src="js/jquery.ui.custom.js"></script> 
<script src="js/bootstrap.min.js"></script>  
<script src="js/jquery.peity.min.js"></script> 
<script src="js/fullcalendar.min.js"></script> 
<script src="js/matrix.js"></script> 


<script type="text/javascript">
  // This function is called from the pop-up menus to transfer to
  // a different page. Ignore if the value returned is a null string:
  function goPage (newURL) {

      // if url is empty, skip the menu dividers and reset the menu selection to default
      if (newURL != "") {
      
          // if url is "-", it is this page -- reset the menu:
          if (newURL == "-" ) {
              resetMenu();            
          } 
          // else, send page to designated URL            
          else {  
            document.location.href = newURL;
          }
      }
  }

// resets the menu selection upon entry to this page:
function resetMenu() {
   document.gomenu.selector.selectedIndex = 2;
}
</script>
</body>
</html>


