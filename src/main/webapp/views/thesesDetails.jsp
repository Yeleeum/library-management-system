<!DOCTYPE html>
<%@page import="com.lms.librarymanagementsystem.models.*"%>
<%@page import="java.util.List"%>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <title>Book Details Page</title>
    <link rel="stylesheet" href="/css/style.css">
</head>

<body>
    <% Theses theses = (Theses) request.getAttribute("theses"); %>
    <header>
        <h1>Theses Details</h1>
    </header>

    <div class="book-details">
        <img src="/uploads/thumbnails/book.jpg" alt="Book Cover">
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
                <button>Borrow</button>
                <button>Return</button>
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

</body>

</html>