<%@page import="com.lms.librarymanagementsystem.FileHandler.SessionHandler"%>
<% if(SessionHandler.getAccessSession(request).equals("admin")) {%>
    <form method="get">
        <button formaction="/admin/edit/<%= type %>/<%= id %>">Edit</button>
        <button formaction="/admin/delete/<%= type %>/<%= id %>">Delete</button>
    </form>
<% } else { %>
    <button onclick="javascript(void(0))">Borrow</button>
    <button onclick="javascript(void(0))">Return</button>
<% } %>