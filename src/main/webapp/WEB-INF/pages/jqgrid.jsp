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
  <script type="text/javascript" src="js/libs/modernizr.min.js"></script>
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
            <li><a href="administer-公告发布.html"><i class="icon-font">&#xe005;</i>公告发布</a></li>
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
        <form action="/jscss/admin/design/add" method="post" id="myform" name="myform" enctype="multipart/form-data">
          <table class="insert-tab" width="100%">
            <tbody><tr>
              <th width="120"><i class="require-red">*</i>分类：</th>
              <td>
                <select name="colId" id="catid" class="required">
                  <option value="18">请选择</option>
                  <option value="19">运动健身</option>
                  <option value="20">旅游</option>
                  <option value="21">文学艺术</option>
                  <option value="22">演讲</option>
                  <option value="23">经济</option>
                  <option value="24">电影</option>
                  <option value="25">科技</option>
                  <option value="26">美食</option>
                </select>
              </td>
            </tr>
            <tr>
              <th><i class="require-red">*</i>标题：</th>
              <td>
                <input class="common-text required" id="title" name="title" size="50" value="" type="text">
              </td>
            </tr>
            <tr>
              <th><i class="require-red">*</i>图片：</th>
              <td><input name="smallimg" id="" type="file"><!--<input type="submit" onclick="submitForm('/jscss/admin/design/upload')" value="上传图片"/>--></td>
            </tr>
            <tr>
              <th><i class="require-red">*</i>视频：</th>
              <td><input name="vedio" id="" type="file"><!--<input type="submit" onclick="submitForm('/jscss/admin/design/upload')" value="上传视频"/>--></td>
            </tr>
            <tr>
              <th>课程介绍：</th>
              <td><textarea name="content" class="common-textarea" id="content" cols="30" style="width: 98%;" rows="10"></textarea></td>
            </tr>
            <tr>
              <th></th>
              <td>
                <input class="btn btn-primary btn6 mr10" value="发布" type="submit">
                <input class="btn btn6" onclick="history.go(-1)" value="返回" type="button">
              </td>
            </tr>
            </tbody></table>
        </form>
      </div>
    </div>

  </div>
  <!--/main-->
</div>
</body>
</html>
