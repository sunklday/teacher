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
      <div class="crumb-list"><i class="icon-font"></i><a href="/jqgrid">首页</a><span class="crumb-step">&gt;</span><a class="crumb-name" href="">词库修改</a><span class="crumb-step">&gt;</span><span></span></div>
    </div>
    <div class="result-wrap">
      <div class="result-content">

          <table class="insert-tab" width="100%">
            <tbody>
              <th><i class="require-red">*</i>词库名称：</th>
              <td>
                <input class="common-text required" id="wordsFileName" name="wordsFileName" size="50" value="${WordsFile.wordsFileName}" type="text">
              </td>
            </tr>

            <tr>
              <th><i class="require-red">*</i>文件：</th>

              <td><input id="filePath" name="wordsFileName" type="file" value="${WordsFile.filePath}"><input id="uploadFile" type="submit" value="upload"/></td>

            </tr>
              <input type="hidden" id="icoHid" >
              <input type="hidden" id="wordsFileId" value="${WordsFile.id}">
            <tr>
              <th>介绍：</th>
              <td><textarea name="introduce" class="common-textarea" id="introduce" cols="30"  style="width: 98%;" rows="10">${WordsFile.introduce}</textarea></td>
            </tr>
            <tr>
              <th></th>
              <td>
                <div class="btn btn-primary btn6 mr10" id="save-button" >提交</div>
                <input class="btn btn6" onclick="history.go(-1)" value="返回" type="button">
                <div class="btn btn6" id="delect-button" >删除<div>
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
            id=$("#wordsFileId").val(),
            introduce = $("#introduce").val();
    if(wordsFileName==""){
      alert('请输入词库名称！');
      return false;
    }
    if(filePath==""){
      alert('请上传文件！');
      return false;
    }
    if(id==""){
      id="0";
    }
    $(this).ajaxSubmit({
      type: 'post', // 提交方式 get/post
      url: '/words/update/add', // 需要提交的 url
      data: {
        'id':id,
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

          alert('上传成功');
        //$("#loading").hide();
      },
      error: function (data, status, e) {
        alert(e);
        //$("#loading").hide();
      }
    });
  }

  $('#delect-button').on('click', function () {
    var r=confirm("确定删除");
    var id=$("#wordsFileId").val();
    if(id==""){
      return false;
    }
    if (r==true)
    {
      $(this).ajaxSubmit({
        type: 'post', // 提交方式 get/post
        url: '/words/update/dec', // 需要提交的 url
        data: {
          id:id
        },
        success: function (data) { // data 保存提交后返回的数据，一般为 json 数据
          // 此处可对 data 作相关处理
          alert('删除成功！');
          window.location.href='/jqgrid';
        }
      });
    }
    else
    {
      alert("取消删除");
    }

  });
</script>
</body>
</html>
