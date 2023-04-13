<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Document</title>
    <style>
        *{
            margin: 0;
            padding: 0;
            box-sizing: border-box;
        }

        form {
            background-color: #333;
            color: #fff;
            padding: 1rem;
        }
    </style>
</head>
<body>
    <% 
        String searchValue=((String) request.getAttribute("searchValue"))==null?"":(String) request.getAttribute("searchValue");
        String type=(String) request.getAttribute("type");
    %>
    <form action="/search/searchitem" method="Get" id="search">
        <input name="searchParam" type="text" value="<%=searchValue%>">
            <button type="submit">Search</button>
        </form>
        <button type="submit" formaction="/search/author" form="search">Author</button>
        <button type="submit" formaction="/search/researcher" form="search">Researcher</button>
        <button type="submit" formaction="/search/editor" form="search">Editor</button>
        <button type="submit" formaction="/search/owner" form="search">Owner</button>
        <button type="submit" formaction="/search/publisher" form="search">Publisher</button>
        <button type="submit" formaction="/search/category" form="search">Category</button>
        <button type="submit" formaction="/books/search" form="search">Books</button>
        <button type="submit" formaction="/journals/search" form="search">Journals</button>
        <%if(type!=null){%>
            <%if(type.equals("books")){%>
                <button type="submit" formaction="/books/author" form="search">Author</button>
                <button type="submit" formaction="/books/publisher" form="search">Publisher</button>
            <%}else if(type.equals("journals")){%>
                <button type="submit" formaction="/journals/author" form="search">Author</button>
                <button type="submit" formaction="/journals/publisher" form="search">Publisher</button>
            <%}else if(type.equals("magazines")){%>
            <%}else if(type.equals("theses")){%>
            <%}else if(type.equals("softcopy")){%>
            <%}%>
        <%}%>
    
</body>
</html>