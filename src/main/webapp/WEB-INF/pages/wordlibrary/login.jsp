<%--
  Created by IntelliJ IDEA.
  User: Sun
  Date: 2016/5/6
  Time: 20:26
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title></title>
  <link href="css/login.css" rel="stylesheet" type="text/css" />
</head>
<body>
<%--<form action="loginAction" method="post">--%>
  <%--<div class="header">--%>
    <%--<h2 class="logo png">${error}</h2>--%>

  <%--</div>--%>
  <%--<ul>--%>
    <%--<li><label>用户名</label><input name="adminName" type="text" class="text"/></li>--%>
    <%--<li/>--%>
    <%--<li><label>密　码</label><input name="passWord" type="password" class="text" /></li>--%>
    <%--<li/>--%>
    <%--<li class="submits">--%>
      <%--<input class="submit" type="submit" value="登录" />--%>
    <%--</li>--%>
  <%--</ul>--%>
  <%--<div class="copyright">© 2013 - 2014 |</div>--%>
<%--</form>--%>

<div class="main-login">

  <div class="login-content">
    <h2>${error}</h2>

    <form action="loginAction" method="post" id="login-form" name="login-form">
      <div class="login-info">
        <span class="user">&nbsp;</span>
        <input name="adminName" id="adminName" type="text"  value="" class="login-input"/>
      </div>
      <div class="login-info">
        <span class="pwd">&nbsp;</span>
        <input name="passWord" id="passWord" type="password"  value="" class="login-input"/>
      </div>
      <div class="login-oper">
        <input style="margin:1px 10px 0px 2px; float:left;" name="" type="checkbox" value="" checked="checked" /><span>记住密码</span>
      </div>
      <div class="login-oper">
        <input name="" type="submit" value="登 录" class="login-reset"/>

      </div>
    </form>
  </div>

</div>

<div style="text-align:center;">
</div>
</body>
<script>

</script>
</html>
