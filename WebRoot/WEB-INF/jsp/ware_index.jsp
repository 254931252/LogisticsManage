<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html>
<head>
	<title>库房管理</title>
	<meta http-equiv="content-type" content="text/html; charset=UTF-8" />
		<link rel="stylesheet" href="css/bootstrap.min.css" />
	<link rel="stylesheet" href="css/bootstrap-responsive.min.css" />
	<link rel="stylesheet" href="css/fullcalendar.css" />
	<link rel="stylesheet" href="css/matrix-style.css" />
	<link rel="stylesheet" href="css/matrix-media.css" />
	<link rel="stylesheet" href="css/jquery.gritter.css" />
	<link href='http://fonts.useso.com/css?family=Open+Sans:400,700,800' rel='stylesheet' type='text/css'/>
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
  <h1 >库房管理</h1>
</div>
<!--close-Header-part--> 


<!--close-top-Header-menu-->
<!--sidebar-menu-->
<div id="sidebar"><a href="#" class="visible-phone"><i class="icon icon-home"></i> Dashboard</a>
  <ul>
    <li class="submenu"> <a href="#"><i class="icon icon-th-list"></i><span>中心库房购货入库</span> <span class="label label-important">2</span></a>
      <ul>
        <li class="last"><a href="in_allocate.html" target="center-frame">购货入库</a></li>
        <li class="last"><a href="ware_houseRegister.html" target="center-frame">商品入库登记</a></li>
      </ul>
    </li>
    <li class="submenu"> <a href="#"><i class="icon icon-th-list"></i><span>中心库房调拨出库</span><span class="label label-important">3</span></a>
      <ul>
        <li><a href="allocate_out.html" target="center-frame" >商品出库</a></li>
		<li ><a href="out_print.html" target="center-frame">打印出库单</a></li>
		<li class="last"><a href="distribute_print_list.html" target="center-frame">打印分发单</a></li>
      </ul>
    </li>
    <li class="submenu"> <a href="#"><i class="icon icon-th-list"></i><span>领货管理</span> <span class="label label-important">1</span></a>
      <ul>
        <li class="last"><a href="goods_get.html" target="center-frame" >领货</a></li>
      </ul>
    </li>
    <li class="submenu"> <a href="#"><i class="icon icon-th-list"></i><span>退货管理</span> <span class="label label-important">4</span></a>
      <ul>
        <li><a href="goods_back.html" target="center-frame" >退货登记</a></li>
		<li><a href="goods_depart_back.html" target="center-frame" >分站库库退货出库</a></li>
		<li><a href="goodsBack_center_in.html" target="center-frame" >中心库房退货入库</a></li>
		<li class="last"><a href="goodsBack_center_out.html" target="center-frame" >中心库房退货出库</a></li>
      </ul>
    </li>
  </ul>
</div>
<!--sidebar-menu-->

<!--main-container-part-->
<div id="content"  style="z-index: 2;position: relative;">
<!--top-Header-menu-->
<div id="user-nav" class="navbar navbar-inverse"style="position: absolute; top:-38px;left:-1px;">
  <ul class="nav">
    <li  class="dropdown" id="profile-messages" ><a title="" href="#" data-toggle="dropdown" data-target="#profile-messages" class="dropdown-toggle"><i class="icon icon-user"></i>  <span class="text">欢迎小王</span><b class="caret"></b></a>
      <ul class="dropdown-menu">
        <li><a href="#"><i class="icon-user"></i>个人资料</a></li>
        <li class="divider"></li>
        <li><a href="ware_index.html"><i class="icon-key"></i>退出</a></li>
      </ul>
    </li>
    <li class=""><a title="" href="ware_index.html"><i class="icon icon-share-alt"></i> <span class="text">Logout</span></a></li>
  </ul>
</div>
<!--breadcrumbs-->
  <div id="content-header">
    <div id="breadcrumb"> <a href="ware_index.html" title="Go to Home" class="tip-bottom"><i class="icon-home"></i>首页</a></div>
  </div>
<!--End-breadcrumbs-->
<div id="center-column">
			<iframe id="frame_content" name="center-frame" src="ware_home.html" frameborder="0" scrolling="no" allowTransparency="true" style="width:100%;height:500px;margin:0 0;padding:0 0;"></iframe>
</div>
<!--end-main-container-part-->

<!--Footer-part-->

<div class="row-fluid">
  <div id="footer" class="span12"> 2013 &copy; Matrix Admin. Brought to you by <a href="http://themedesigner.in/">Themedesigner.in</a> </div>
</div>
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


