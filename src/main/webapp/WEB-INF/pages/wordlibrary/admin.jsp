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
<script>
  $(function(){
    $(".add-new-project").click(function(){
      window.location.href = "projectmanage/laoca/laoca-every-case.ftl";
    });

    $(".classify-manage").click(function(){
      window.location.href = "projectmanage/laoca/classify-manage.ftl";
    });

    initjqgrid("allcase");
    $(window).resize(function(){
      $("#list4").setGridWidth($("#anli").width());
    });
  })

  function initjqgrid(laocaselect) {
    jQuery("#list4").jqGrid({
      url:"/words/admin/"+laocaselect,
      datatype: "json",
      height: 'auto',
      autowidth:true,
      colNames:['序号','管理员名称', '密码','介绍','操作'],
      colModel:[
        {name:'id',             index:'id',             align:"center",sortable: false, width:"10px",key:true,hidden:true},
        {name:'adminName',          index:'adminName',          align:"center",sortable: false, width:"200px" },
        {name:'passWord',          index:'passWord',          align:"center",sortable: false, width:"200px" },
        {name:'introduce',          index:'introduce',          align:"center",sortable: false, width:"200px" },
        {name:'edit',           index:'edit',           align:"center",sortable: false, width:"80px",formatter: cLink}
      ],
      jsonReader: {
        root: "rows",
        page: "page",
        total: "total",
        records: "records"
      },
      pager : '#gridpager',
      rowNum:20,
      rowList:[20],
      multiselect: false,
      viewrecords : true,
      rownumbers:true,
      caption: "管理员编辑"
    });
    jQuery("#list4").navGrid( '#gridpager', {edit : false,add : false,del : false,search:false});
    $("#jqgh_list4_rn").append("序号");
  }
  function cLink(cellvalue, options, rowObject) {
    var link ="/admindateedit";
    var param = "adminName";

    return "<a href ="+link+"?"+param+"="+encodeURI(rowObject.adminName)+">编辑</a>";
  }

</script>
</body>
</html>
