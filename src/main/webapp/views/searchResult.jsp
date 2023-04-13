<!DOCTYPE html>
<%@page import="com.lms.librarymanagementsystem.models.SoftCopy"%>
<%@page import="com.lms.librarymanagementsystem.models.Theses"%>
<%@page import="com.lms.librarymanagementsystem.models.Magazines"%>
<%@page import="com.lms.librarymanagementsystem.models.Journals"%>
<%@page import="com.lms.librarymanagementsystem.models.Books"%>
<%@page import="java.util.List"%>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Document</title>
</head>
<%
	List<Books> books=(List<Books>) request.getAttribute("books");
	List<Journals> journals=(List<Journals>) request.getAttribute("journals");
	List<Magazines> magazines=(List<Magazines>) request.getAttribute("magazines");
	List<Theses> theses=(List<Theses>) request.getAttribute("theses");
	List<SoftCopy> softcopies=(List<SoftCopy>) request.getAttribute("softcopies");
%>
<body>
    <%@ include file="subSearchComponent.jsp"%>
    <% if((books==null || books.isEmpty())&& (journals==null || journals.isEmpty()) && (magazines==null || magazines.isEmpty()) && (theses==null || theses.isEmpty()) && (softcopies==null ||softcopies.isEmpty())){ %>
    	<h1>No Content Found</h1>
    <%}else{ %>
    <%if(books!=null && !books.isEmpty()){ %>
	    <div><%=books %></div>
	<%} %>
	<%if(journals!=null && !journals.isEmpty()){ %>
	    <div><%=journals %></div>
	<%} %>
	<%if(magazines!=null && !magazines.isEmpty()){ %>
	    <div><%=magazines %></div>
	<%} %>
	<%if(theses!=null && !theses.isEmpty()){ %>
	    <div><%=theses %></div>
	<%} %>
	<%if(softcopies!=null && !softcopies.isEmpty()){ %>
	    <div><%=softcopies%></div>
	<%} %>
    <%} %>
</body>
</html>