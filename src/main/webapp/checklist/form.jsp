<%--
  Created by IntelliJ IDEA.
  User: ar
  Date: 21.07.2019
  Time: 14:31
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Checklist Form</title>
</head>
<body>
<jsp:include page="/header.jsp"></jsp:include>

<form action="/checklist/add" method="post">
    Name:  <input type="text" name="name"><br>
    Created date: <input type="datetime-local" name="date_created"><br>
    Completed date: <input type="datetime-local" name="date_completed"><br>
    Czy mozna poprawic: <input type="checkbox" name="archived" ><br>
    <input type="submit">
</form>
</body>
</html>
