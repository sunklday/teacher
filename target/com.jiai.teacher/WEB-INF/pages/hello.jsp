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
    <title>教师</title>
</head>
<body>
	<h1>${message}</h1>
	<table >
		<c: var="teacher">
			<tr>
				<th>name</th>
				<td><a href="/showteacher/${teacher.name}">${teacher.name}</a></td>
			</tr>
			<tr>
				<th>age</th>
				<td>${teacher.age}</td>
			</tr>
			<tr>
				<th>school</th>
				<th>${teacher.school}</th>
			</tr>
			<tr>
				<th><a href="/modify/${teacher.name}">修改</a></th>
			</tr>

		</c:>
	</table>
</body>
</html>