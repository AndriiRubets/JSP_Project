<%@ page import="model.Status" %><%--
  Created by IntelliJ IDEA.
  User: ar
  Date: 21.07.2019
  Time: 15:33
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Item Form</title>
</head>
<body>
<jsp:include page="/header.jsp"></jsp:include>

<form action="/item/add" method="post">
    Name:  <input type="text"  name="name"><br>
    Description:  <input type="text"  name="description"><br>
    <input type="hidden" name="checklistId" value="<%=request.getAttribute("checklistId")%>" readonly>
    <%--Przedmiot:  <input type="text" name="subject"><br>--%>
    <select name="status">
        <%
            for (Status s :
                    Status.values()) {%>
        <option value="<%=s%>"><%=s%></option>
        <%
            }
        %>
    </select><br>
    Completed: <input type="checkbox" name="completed" ><br>
    <input type="submit">
</form>
</body>
</html>
