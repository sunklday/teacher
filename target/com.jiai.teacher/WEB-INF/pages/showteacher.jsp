<%--
  Created by IntelliJ IDEA.
  User: admin
  Date: 2016/1/25
  Time: 9:49
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title></title>
</head>
<body>
      <h2>${teacherInfo.name}</h2>
      <table >
        <c: var="teacherInfo">
          <tr>
            <th>name</th>
            <td>${teacherInfo.name}</td>
          </tr>
          <tr>
            <th>classid</th>
            <td>${teacherInfo.classid}</td>
          </tr>
          <tr>
            <th>subject</th>
            <th>${teacherInfo.subject}</th>
          </tr>
        </c:>
      </table>
</body>
</html>