<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Document</title>
</head>
<body>
    <% String searchValue=((String) request.getAttribute("searchValue"))==null?"":(String) request.getAttribute("searchValue");%>
    <form action="search/searchitem" method="Get">
        <input name="searchParam" type="text" value="<%=searchValue%>">
        <button type="submit">Search</button>
        <button type="submit" formaction="search/author">Author</button>
        <button type="submit" formaction="search/researcher">Researcher</button>
        <button type="submit" formaction="search/editor">Editor</button>
        <button type="submit" formaction="search/owner">Owner</button>
        <button type="submit" formaction="search/publisher">Publisher</button>
    </form>
</body>
</html>