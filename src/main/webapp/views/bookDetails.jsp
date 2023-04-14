<!DOCTYPE html>
<%@page import="com.lms.librarymanagementsystem.models.Books"%>
<%@page import="java.util.List"%>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <title>Book Details Page</title>
    <link rel="stylesheet" href="/css/style.css">
</head>

<body>
    <% Books book = (Books) request.getAttribute("book"); %>
    <header>
        <h1>Book Details</h1>
    </header>

    <div class="book-details">
        <img src="/uploads/thumbnails/book.jpg" alt="Book Cover">
        <div>
            <h2>
                <%= book.getTitle() %>
            </h2>
            <p>Author: <%= book.getAuthor() %>
            </p>
            <p>Edition: <%= book.getEdition() %>
            </p>
            <p>Stock: <%= book.getStock() %></p>
            <p>Publisher: <%= book.getPublisher() %>
            </p>
            <p>Pages: <%= book.getPageno() %>
            </p>
            <p></p>
            <p>Category: <%= book.getCategory() %>
            </p>
            <div>
                <button>Borrow</button>
                <button>Return</button>
            </div>
        </div>
    </div>
    <div  class="description">
        <h1><u>Description</u></h1>
        <div class="descArea" readonly>
            <%= book.getDescription() %>
            
            <pre>#<%= book.getKeywords() %></pre>
        </div>
    </div>

</body>

</html>