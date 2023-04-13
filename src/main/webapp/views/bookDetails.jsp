<!DOCTYPE html>
<%@page import="com.lms.librarymanagementsystem.models.Books"%>
<%@page import="java.util.List"%>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <title>Book Details Page</title>
    <style>
        /* Global Styles */
        * {
            box-sizing: border-box;
            margin: 0;
            padding: 0;
        }

        body {
            font-family: Arial, sans-serif;
            line-height: 1.5;
        }

        /* Header Styles */
        header {
            background-color: #333;
            color: #fff;
            padding: 1rem;
        }

        h1 {
            font-size: 2rem;
            margin: 0;
        }

        /* Book Details Styles */
        .book-details {
            width: 100%;
            display: flex;
            flex-wrap: wrap;
            justify-content: flex-start;
            margin-left: 1.5rem;
            margin-top: 2rem;
        }

        .description{
            width: 100%;
            padding: 0.5rem 1.5em;
        }

        .descArea{
            padding: 10px;
            border: 0.5px dashed black;
            word-wrap: break-word;
        }

        .book-details img {
            border-radius: 10px;
            max-width: 300px;
            margin-right: 2rem;
        }

        .book-details h2 {
            font-size: 1.5rem;
            margin-bottom: 1rem;
        }

        .book-details p {
            margin-bottom: 1rem;
        }

        button{
            padding: 10px 20px;
            background: #000;
            color: #fff;
            font-weight: bolder;
            border-radius: 10px;
            cursor: pointer;
        }
    </style>
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