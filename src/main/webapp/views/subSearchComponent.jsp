<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css" integrity="sha512-iecdLmaskl7CVkqkXNQ/ZH/XLlvWZOJyj7Yy7tcenmpD1ypASozpmT/E0iPtmFIB46ZmdtAc9eNBvH0H/ZpiBw==" crossorigin="anonymous" referrerpolicy="no-referrer" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Document</title>
    <style>
        @import url('https://fonts.googleapis.com/css2?family=Lato:ital,wght@0,400;0,700;1,300&family=Lora:ital,wght@0,400;0,600;0,700;1,400&display=swap');
        
        body{
            background-color: rgba(164, 163, 163, 0.819);
        }
        
        *{
            margin: 0;
            padding: 0;
            font-family: 'Lora', serif;
            box-sizing: border-box;
        }

        input[type=text]{
            width: 20vw;
            padding: 10px 15px;
            border-radius: 5px;
            background-color: #fff;
            color: black;
            outline: none;
            border: none;
        }

        input[type=text]:focus{
            border: 3px solid #3dc5ffce;
        }

        .headerview {
            font-weight: bolder;
            background-color: #606060;
            color: #fff;
            padding: 1rem;
        }

        .filter > p, .exclusivfilter {
            font-family: system-ui, -apple-system, BlinkMacSystemFont, 'Segoe UI', Roboto, Oxygen, Ubuntu, Cantarell, 'Open Sans', 'Helvetica Neue', sans-serif;
            font-weight: bold;
            font-size: 17px;
        }

        button{
            padding: 10px 20px;
            background: #170c0c;
            color: #fff;
            font-weight: bolder;
            border-radius: 10px;
            cursor: pointer;
        }
    </style>
</head>
<body>
    <% 
        String searchValue=((String) request.getAttribute("searchValue"))==null?"":(String) request.getAttribute("searchValue");
        String type=(String) request.getAttribute("type");
    %>
    <section class="headerview">
        <form action="/search/searchitem" method="Get" id="search">
            <input name="searchParam" type="text" value="<%=searchValue%>">
                <!-- <button type="submit">Search</button> -->
                <button type="submit"><i class="fa fa-search"></i></button>
        </form>
        <br>
        <div class="filter">
            <p>Filters</p>
            <br>
                <button type="submit" formaction="/search/author" form="search">Author</button>
                <button type="submit" formaction="/search/researcher" form="search">Researcher</button>
                <button type="submit" formaction="/search/editor" form="search">Editor</button>
                <button type="submit" formaction="/search/owner" form="search">Owner</button>
                <button type="submit" formaction="/search/publisher" form="search">Publisher</button>
                <button type="submit" formaction="/search/category" form="search">Category</button>
                <button type="submit" formaction="/books/search" form="search">Books</button>
                <button type="submit" formaction="/journals/search" form="search">Journals</button>
        </div>
        <%if(type!=null){%>
            <br>
            <div class="exclusivfilter">
                <p>Exclusive filters on <%= type %></p>
                <br>
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
    </section>
</body>
</html>