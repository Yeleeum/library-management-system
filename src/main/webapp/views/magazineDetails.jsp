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
    <% Magazines magazine = (Magazines) request.getAttribute("magazine"); %>
    <header>
        <h1>Journal Details</h1>
    </header>

    <div class="book-details">
        <img src="/uploads/thumbnails/book.jpg" alt="Book Cover">
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
                <button>Borrow</button>
                <button>Return</button>
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

</body>

</html>