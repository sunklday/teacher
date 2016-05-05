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
  <script type='text/javascript' src="js/ajaxfileupload.js"></script>
  <script type='text/javascript' src="js/jquery.form.js"></script>

</head>
<body>
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
            <li><a href="administer-分类管理（标签）.html"><i class="icon-font">&#xe008;</i>分类管理</a></li>
            <li><a href="/edit"><i class="icon-font">&#xe005;</i>公告发布</a></li>
            <li><a href="administer-订单查询.html"><i class="icon-font">&#xe006;</i>订单查询</a></li>
          </ul>
        </li>
        <li>
          <a href="#"><i class="icon-font">&#xe018;</i>系统管理</a>
          <ul class="sub-menu">
            <li><a href="system.html"><i class="icon-font">&#xe017;</i>系统设置</a></li>
            <li><a href="system.html"><i class="icon-font">&#xe037;</i>清理缓存</a></li>
            <li><a href="system.html"><i class="icon-font">&#xe046;</i>数据备份</a></li>
            <li><a href="system.html"><i class="icon-font">&#xe045;</i>数据还原</a></li>
          </ul>
        </li>
      </ul>
    </div>
  </div>
  <!--/sidebar-->
  <div class="main-wrap">

    <div class="crumb-wrap">
      <div class="crumb-list"><i class="icon-font"></i><a href="/jscss/admin/design/">首页</a><span class="crumb-step">&gt;</span><a class="crumb-name" href="/jscss/admin/design/">公告发布</a><span class="crumb-step">&gt;</span><span>新增公告</span></div>
    </div>
    <div class="result-wrap">
      <div class="result-content">

          <table class="insert-tab" width="100%">
            <tbody>
              <th><i class="require-red">*</i>词库名称：</th>
              <td>
                <input class="common-text required" id="wordsFileName" name="wordsFileName" size="50" value="" type="text">
              </td>
            </tr>

            <tr>
              <th><i class="require-red">*</i>文件：</th>

              <td><input id="filePath" name="wordsFileName" type="file"><input id="uploadFile" type="submit" value="upload"/></td>

            </tr>
              <input type="hidden" id="icoHid" >
            <tr>
              <th>介绍：</th>
              <td><textarea name="introduce" class="common-textarea" id="introduce" cols="30" style="width: 98%;" rows="10"></textarea></td>
            </tr>
            <tr>
              <th></th>
              <td>
                <div class="btn btn-primary btn6 mr10" id="save-button" >提交</div>
                <input class="btn btn6" onclick="history.go(-1)" value="返回" type="button">
              </td>
            </tr>
            </tbody></table>


      </div>
    </div>

  </div>
  <!--/main-->
</div>
<script>
  $('#save-button').on('click', function () {
    var wordsFileName = $("#wordsFileName").val(),
            filePath = $("#icoHid").val(),
            introduce = $("#introduce").val();
    $(this).ajaxSubmit({
      type: 'post', // 提交方式 get/post
      url: '/words/add/add', // 需要提交的 url
      data: {
        'wordsFileName': wordsFileName,
        'filePath': filePath,
        'introduce': introduce
      },
      success: function (data) {

        alert('提交成功！');
        top.location='/jqgrid';
      }
    });
  });

  $("#uploadFile").click(function () {
    var f = document.getElementById("filePath").files;
    $("#icoHid").val(f[0].name);
    /* alert("上传图标");*/
    uploadImage("filePath");
  });
  function uploadImage(id) {
    $.ajaxFileUpload({
      url: "/words/upload",
      secureuri: false,
      fileElementId: id,
      type: 'post',

      success: function (data, status) {

          alert('操作ok');
        //$("#loading").hide();
      },
      error: function (data, status, e) {
        alert(e);
        //$("#loading").hide();
      }
    });
  }
</script>
</body>
</html>
