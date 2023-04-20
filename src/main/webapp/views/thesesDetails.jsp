<!DOCTYPE html>
<%@page import="com.lms.librarymanagementsystem.models.*"%>
<%@page import="java.util.List"%>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <title>Book Details Page</title>
    <link rel="stylesheet" href="/css/style.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css"
        integrity="sha512-iecdLmaskl7CVkqkXNQ/ZH/XLlvWZOJyj7Yy7tcenmpD1ypASozpmT/E0iPtmFIB46ZmdtAc9eNBvH0H/ZpiBw=="
        crossorigin="anonymous" referrerpolicy="no-referrer" />
</head>

<body>
    <% Theses theses = (Theses) request.getAttribute("theses"); %>
    <header style="width: 100%; display: flex; justify-content: space-between; align-items: center;">
        <h1>Theses Details</h1>
        <%@include file="mainSearchComponent.jsp"%>
    </header>

    <div class="book-details">
        <img src="/uploads/thumbnails/<%=theses.getThumbnail()%>" alt="Book Cover">
        <div>
            <h2>
                <%= theses.getTitle() %>
            </h2>
            <p>Researcher: <%= theses.getResearcher() %></p>
            <p>Guides: <%= theses.getGuides() %></p>
            <p>Completed On: <%= theses.getCompletedDate() %></p></p>
            <p>Place: <%= theses.getPlace() %></p>
            <p>Abstract: <%= theses.getAbstractContent() %></p>
            <p>Page No: <%= theses.getPageNo() %></p>
            <div>
                <% String type = "theses"; %>
                <% int id = theses.getTid(); %>
                <% String itid=theses.getItid();%>
                <%@include file="itemAction.jsp" %>
            </div>
        </div>
    </div>
    <div  class="description">
        <h1><u>Description</u></h1>
        <div class="descArea" readonly>
            <%= theses.getDescription() %>
            
            <pre>#<%= theses.getKeywords() %></pre>
        </div>
    </div>
    <%@ include file="alternativeSoftCopy.jsp"%>

</body>

</html>