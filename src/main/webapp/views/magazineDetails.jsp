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
    <% Magazines magazine = (Magazines) request.getAttribute("magazine"); %>
    <%@include file="Headers.jsp"%>
    <header style="width: 100%; display: flex; justify-content: space-between; align-items: center;">
        <h1>Magazine Details</h1>
        <%@include file="mainSearchComponent.jsp"%>
    </header>

    <div class="book-details">
        <img src="/uploads/thumbnails/<%=magazine.getThumbnail()%>" alt="Book Cover">
        <div>
            <h2>
                <%= magazine.getTitle() %>
            </h2>
            <p>Publisher: <%= magazine.getPublisher() %></p>
            <p>Issue Date: <%= magazine.getIssuedate() %></p>
            <p>Issue number: <%= magazine.getIssuenumber() %></p></p>
            <p>Frequency: <%= magazine.getFrequency() %></p>
            <p>Special Issue: <%= magazine.getSpecialissue() %></p>
            <p>Stock: <%= magazine.getStock() %></p>
            <div>
                <% String type = "magazines"; %>
                <% int id = magazine.getMid(); %>
                <% String itid=magazine.getItid();%>
                <% Integer stock=magazine.getStock();%>
                <%@include file="itemAction.jsp" %>
            </div>
        </div>
    </div>
    <div  class="description">
        <h1><u>Description</u></h1>
        <div class="descArea" readonly>
            <%= magazine.getDescription() %>
            
            <pre>#<%= magazine.getKeywords() %></pre>
        </div>
    </div>
    <%@ include file="alternativeSoftCopy.jsp"%>

</body>

</html>