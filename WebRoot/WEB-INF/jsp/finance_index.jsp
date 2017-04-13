<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>财务管理</title>
    
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
  <h1 >&nbsp;&nbsp;&nbsp;&nbsp;财务管理</h1>
</div>
<!--close-Header-part--> 





<!--sidebar-menu-->
<div id="sidebar"><a href="#" class="visible-phone"><i class="icon icon-home"></i> Dashboard</a>
  <ul>
    <li class="submenu"> <a href="#"><i class="icon icon-th-list"></i> <span>结算管理</span> <span class="label label-important">2</span></a>
      <ul>
        <li><a href="form-common.html" target="center-frame">与供应商结算</a></li>
        <li><a href="form-validation.html" target="center-frame">与分站结算</a></li>
      </ul>
    </li>
    <li class="submenu"> <a href="#"><i class="icon icon-th-list"></i> <span>查看地图</span> <span class="label label-important">3</span></a>
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
    <li  class="dropdown" id="profile-messages" ><a title="" href="#" data-toggle="dropdown" data-target="#profile-messages" class="dropdown-toggle"><i class="icon icon-user"></i>  <span class="text">欢迎小王</span><b class="caret"></b></a>
      <ul class="dropdown-menu">
        <li><a href="#"><i class="icon-user"></i>个人资料</a></li>
        <li class="divider"></li>
        <li><a href="distribute_index.html"><i class="icon-key"></i>退出</a></li>
      </ul>
    </li>
    <li class=""><a title="" href="distribute_index.html"><i class="icon icon-share-alt"></i> <span class="text">Logout</span></a></li>
  </ul>
</div>
<!--close-top-Header-menu-->
<!--breadcrumbs-->
  <div id="content-header">
    <div id="breadcrumb"> <a href="finance_index.html" title="Go to Home" class="tip-bottom"><i class="icon-home"></i>首页</a></div>
  </div>
<!--End-breadcrumbs-->
<div id="center-column">
			<iframe id="frame_content" name="center-frame" src="finance_home.html" frameborder="0" scrolling="no" allowTransparency="true" style="width:100%;height:600px;margin:0 0;padding:0 0;"></iframe>
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


