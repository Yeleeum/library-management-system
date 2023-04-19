<!DOCTYPE html>
<%@page import="com.lms.librarymanagementsystem.models.Journals"%>
<%@page import="java.util.List"%>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <title>Book Details Page</title>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css"
        integrity="sha512-iecdLmaskl7CVkqkXNQ/ZH/XLlvWZOJyj7Yy7tcenmpD1ypASozpmT/E0iPtmFIB46ZmdtAc9eNBvH0H/ZpiBw=="
        crossorigin="anonymous" referrerpolicy="no-referrer" />
    <style>
        /* Global Styles */
        * {
            box-sizing: border-box;
            margin: 0;
            padding: 0;
        }

        body {
            width: 100%;
            overflow-x: hidden;
            font-family: Arial, sans-serif;
            line-height: 1.5;
        }

        /* Header Styles */
        header {
            background-color: #525252;
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
            /* padding: 0.5rem 1.5em; */
            padding-top: 0.5rem;
            padding-left: 1.5rem;
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
            box-shadow: rgba(60, 64, 67, 0.3) 0px 1px 2px 0px, rgba(60, 64, 67, 0.15) 0px 2px 6px 2px;
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
    <% Journals journal = (Journals) request.getAttribute("journal"); %>
    <header style="width: 100%; display: flex; justify-content: space-between; align-items: center;">
        <h1>Journal Details</h1>
        <%@include file="mainSearchComponent.jsp"%>
    </header>

    <div class="book-details">
        <img src="/uploads/thumbnails/book.jpg" alt="Book Cover">
        <div>
            <h2>
                <%= journal.getTitle() %>
            </h2>
            <p>Publisher: <%= journal.getPublisher() %></p>
            <p>Editor: <%= journal.getEditor() %></p>
            <p>Stock: <%= journal.getStock() %></p></p>
            <p>Pages: <%= journal.getPageNo() %></p>
            <p>Category: <%= journal.getCategory() %></p>
            <p>Start Year: <%= journal.getStartYear() %></p>
            <p>End Year: <%= journal.getEndYear()%> </p>
            <div>
                <% String type = "journal"; %>
                <% int id = journal.getJid(); %>
                <%@include file="itemAction.jsp" %>
            </div>
        </div>
    </div>
    <div  class="description">
        <h1><u>Description</u></h1>
        <div class="descArea" readonly>
            <%= journal.getDescription() %>
            
            <pre>#<%= journal.getKeywords() %></pre>
        </div>
    </div>
    <%@ include file="alternativeSoftCopy.jsp"%>

</body>

</html>