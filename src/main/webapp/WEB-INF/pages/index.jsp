<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%--
  Created by IntelliJ IDEA.
  User: admin
  Date: 2016/1/15
  Time: 16:26
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>查询</title>
</head>
<body>
<div>
    <form:form action="hello" method="get">
        <input type="text" name="name" />
        <input type="submit" value="Submit" />
    </form:form>
 <%-- <form name="input" action="hello.asp" method="get">
   search
    <input type="text" name="name" />
    <input type="submit" value="Submit" />
  </form>--%>
</div>
</body>
</html>
