<%@ page import="model.ChecklistItem" %>
<%@ page import="java.util.List" %><%--
  Created by IntelliJ IDEA.
  User: ar
  Date: 21.07.2019
  Time: 15:33
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Item List</title>
</head>
<body>
<jsp:include page="/header.jsp"></jsp:include>

<table>
    <tr>
        <th style="width: 150px;">ID</th>
        <th style="width: 150px;">Name</th>
        <th style="width: 150px;">Description</th>
        <th style="width: 150px;">Completed?</th>
        <th style="width: 150px;">Remove</th>
        <th style="width: 150px;">Status</th>
    </tr>
    <% List<ChecklistItem> checklistsItem= (List<ChecklistItem>) request.getAttribute("itemList");
        for (int i = 0; i<checklistsItem.size();i++) {
            ChecklistItem s=checklistsItem.get(i);

            out.print("<tr>");
            out.print("<td>"+s.getId()+"</td>");
            out.print("<td>"+s.getName()+"</td>");
            out.print("<td>"+s.getDescription()+"</td>");
            out.print("<td>"+s.isCompleted()+"</td>");
            out.print("<td>" +
                    "<a href=\"/checklist/remove?checklistId="+s.getId()+"\">Remove</a>"+
                    "</td>");
            out.print("</tr>");
        }
    %>
</table>
</body>
</html>
