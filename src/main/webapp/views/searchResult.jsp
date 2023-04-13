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
			<!-- <div><%=books %></div> -->
			<% for(Books book : books){ %>
				<div>
					<a href="/search/searchitem/<%= book.getBid() %>" >
						<div>
							<img src="/uploads/thumbnails/book.jpg" alt="<%= book.getTitle() %>" width="300" height="300">
						</div>
					</a>
					<div>
							<h3><%= book.getTitle() %> : <%= book.getEdition() %></h3>
							<h4>Author : <%= book.getAuthor() %></h4>
							<h4>Published by <%= book.getPublisher() %></h4>
							<a href="/search/category?searchParam=<%= book.getCategory() %>">#<%= book.getCategory() %></a>
					</div>
				</div>
			<% } %>
		<%} %>
		<%if(journals!=null && !journals.isEmpty()){ %>
			<!-- <div><%=journals %></div> -->

			<% for(Journals journal : journals){ %>
				<div>
					<%= journal %>
				</div>
			<% } %>
		<%} %>
		<%if(magazines!=null && !magazines.isEmpty()){ %>
			<!-- <div><%=magazines %></div> -->
			<% for(Magazines magazine : magazines){ %>
				<div>
					<%= magazine %>
				</div>
			<% } %>

		<%} %>
		<%if(theses!=null && !theses.isEmpty()){ %>
			<!-- <div><%=theses %></div> -->

			<% for(Theses thesesItem : theses){ %>
				<div>
					<%= thesesItem %>
				</div>
			<% } %>
		<%} %>
		<%if(softcopies!=null && !softcopies.isEmpty()){ %>
			<!-- <div><%=softcopies%></div> -->
			<% for(SoftCopy softcopy : softcopies){ %>
				<div>
					<%= softcopy %>
				</div>
			<% } %>
		<%} %>
    <%} %>
</body>
</html>