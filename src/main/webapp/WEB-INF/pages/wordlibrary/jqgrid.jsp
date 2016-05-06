<%--
  Created by IntelliJ IDEA.
  User: admin
  Date: 2016/5/3
  Time: 17:17
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
  <meta charset="UTF-8">
  <title>后台管理</title>
  <link rel="stylesheet" type="text/css" href="css/common.css"/>
  <link rel="stylesheet" type="text/css" href="css/main.css"/>

  <!--jqgrid-->
  <link rel="stylesheet" type="text/css" media="screen" href="css/jquery-ui-1.11.4.custom/jquery-ui.theme.min.css" />
  <link rel="stylesheet" type="text/css" media="screen" href="css/ui.jqgrid.css" />
  <script src="js/jquery-1.11.0.min.js"                        type="text/javascript"></script>
  <script src="js/jquery-ui.min.js"                            type="text/javascript"></script>
  <script src="js/jquery.jqGrid.min.js"                        type="text/javascript"></script>
  <script src="js/i18n/grid.locale-cn.js"                      type="text/javascript"></script>
  <script type="text/javascript" src="js/libs/modernizr.min.js"></script>

  <script src="js/laoca/laoca-controller.js"      type="text/javascript"></script>
</head>
<body>
<script><%
  if(session.getAttribute("admin")==null){
%>
window.parent.location='/';
  <%
    }
  %></script>
<div class="topbar-wrap white">
  <div class="topbar-inner clearfix">
  </div>
</div>
<div class="container clearfix">
  <div class="sidebar-wrap">
    <div class="sidebar-title">
      <h1>菜单</h1>
    </div>
    <div class="sidebar-content">
      <ul class="sidebar-list">
        <li>
          <a href="#"><i class="icon-font">&#xe003;</i>常用操作</a>
          <ul class="sub-menu">
            <li><a href="/jqgrid"><i class="icon-font">&#xe008;</i>主页</a></li>
            <li><a href="/edit"><i class="icon-font">&#xe005;</i>添加词库</a></li>
            <li><a href="/admin"><i class="icon-font">&#xe006;</i>管理员管理</a></li>
          </ul>
        </li>
        <li>
          <a href="#"><i class="icon-font">&#xe018;</i>---</a>
          <ul class="sub-menu">
            <li><a href=""><i class="icon-font">&#xe017;</i>---</a></li>
            <li><a href=""><i class="icon-font">&#xe037;</i>---</a></li>
            <li><a href=""><i class="icon-font">&#xe046;</i>---</a></li>
            <li><a href=""><i class="icon-font">&#xe045;</i>---</a></li>
          </ul>
        </li>
      </ul>
    </div>
  </div>
  <!--/sidebar-->
  <div class="main-wrap">

    <div class="crumb-wrap">
      <div class="crumb-list"><i class="icon-font"></i><a href="/jqgrid">首页</a><span class="crumb-step">&gt;</span><a class="crumb-name" href="/jscss/admin/design/"></a><span class="crumb-step">&gt;</span><span></span></div>
    </div>
    <table id="list4"></table>
    <div id="gridpager"></div>

  </div>
  <!--/main-->
</div>
</body>
</html>
