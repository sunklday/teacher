<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%--
  Created by IntelliJ IDEA.
  User: admin
  Date: 2016/1/25
  Time: 11:35
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>修改</title>
</head>
<body>
<form:form action="/update" method="post" commandName="teacher" role="form"><%--commandName是数据对象的名称是数据表的名称--%>
 <table>
   <tr>
     <td>name</td>
     <td><input type="text" name="name" value="${teacher.name}" readonly="readonly"></td>
   </tr>
   <tr>
     <td>age</td>
     <td><input type="text" name="age" value="${teacher.age}" ></td>
   </tr>
   <tr>
     <td>school</td>
     <td><input type="text" name="school" value="${teacher.school}" ></td>
   </tr>
   <tr>
     <td><input type="submit" value="Save Changes" /></td>
   </tr>
 </table>



 <%-- <div class="">
    <label for="name">name</label><br>
    <input type="text"  id="name" name="name" value="${teacher.name}" readonly="readonly" />
  </div>
  <div class="">
    <label for="age">age</label><br>
    <input type="text"  id="age" name="age" value="${teacher.age}" />
  </div>
  <div class="">
    <label for="school">school</label><br>
    <input type="text" id="school" name="school" value="${teacher.school}"  />
  </div>
  <div class="">
    <button type="submit" class="">提交</button>
  </div>--%>
</form:form>
</body>
</html>
