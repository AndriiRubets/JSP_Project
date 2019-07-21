<%@ page import="model.Checklist" %>
<%@ page import="java.util.List" %><%--
  Created by IntelliJ IDEA.
  User: ar
  Date: 21.07.2019
  Time: 14:32
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Checklist list</title>
</head>
<body>
<jsp:include page="/header.jsp"></jsp:include>

<table>
    <tr>
        <th style="width: 150px;">ID</th>
        <th style="width: 150px;">Name</th>
        <th style="width: 150px;">Created Date</th>
        <th style="width: 150px;">Completed Date</th>
        <th style="width: 150px;">Remove</th>
        <th style="width: 150px;">Items</th>
        <th style="width: 150px;">Add Item</th>
    </tr>
    <% List<Checklist> checklists= (List<Checklist>) request.getAttribute("checklistList");
        for (int i = 0; i<checklists.size();i++) {
            Checklist s=checklists.get(i);

            out.print("<tr>");
            out.print("<td>"+s.getId()+"</td>");
            out.print("<td>"+s.getName()+"</td>");
            out.print("<td>"+s.getDateCreated()+"</td>");
            out.print("<td>"+s.getDateCompleted()+"</td>");
            out.print("<td>" +
                    "<a href=\"/checklist/remove?studentId="+s.getId()+"\">Remove</a>"+
                    "</td>");
            out.print("</tr>");
        }
    %>
</table>
</body>
</html>
