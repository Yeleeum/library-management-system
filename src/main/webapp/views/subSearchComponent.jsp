<!-- <!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css" integrity="sha512-iecdLmaskl7CVkqkXNQ/ZH/XLlvWZOJyj7Yy7tcenmpD1ypASozpmT/E0iPtmFIB46ZmdtAc9eNBvH0H/ZpiBw==" crossorigin="anonymous" referrerpolicy="no-referrer" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Document</title>
    <link rel="stylesheet" href="/css/style.css">
</head> -->
<body>
    <% 
        String searchValue=((String) request.getAttribute("searchValue"))==null?"":(String) request.getAttribute("searchValue");
        String type=(String) request.getAttribute("type");
    %>
    <section class="headerview">
        <form action="/search/searchitem" method="Get" id="search">
            <input name="searchParam" class="search" type="text" placeholder="Search..." value="<%=searchValue%>">
                <!-- <button type="submit">Search</button> -->
                <button type="submit" class="search"><i class="fa fa-search"></i></button>
        </form>
        <br>
        <div>
            <button type="submit" formaction="/books/search" form="search">Books</button>
            <button type="submit" formaction="/journals/search" form="search">Journals</button>
            <%if(type!=null){%>
                <br><br>
                <div class="exclusivfilter">
                    <p>Exclusive filters on <%= type %></p>
                    
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
                </div>
            <%}%>
        </div>
        <br>
        <div class="filter">
            <p>Filters</p>
            <div>
                <button type="submit" formaction="/search/author" form="search">Author</button>
                <button type="submit" formaction="/search/researcher" form="search">Researcher</button>
                <button type="submit" formaction="/search/editor" form="search">Editor</button>
                <button type="submit" formaction="/search/owner" form="search">Owner</button>
                <button type="submit" formaction="/search/publisher" form="search">Publisher</button>
                <button type="submit" formaction="/search/category" form="search">Category</button>
            </div>
        </div>
    </section>
<!-- </body>
</html> -->