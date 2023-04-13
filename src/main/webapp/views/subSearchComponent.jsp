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
    <% String searchValue=((String) request.getAttribute("searchValue"))==null?"":(String) request.getAttribute("searchValue");%>
    <form action="searchitem" method="Get">
        <input name="searchParam" type="text" value="<%=searchValue%>">
        <button type="submit">Search</button>
        <button type="submit" formaction="author">Author</button>
        <button type="submit" formaction="researcher">Researcher</button>
        <button type="submit" formaction="editor">Editor</button>
        <button type="submit" formaction="owner">Owner</button>
    </form>
</body>
</html>