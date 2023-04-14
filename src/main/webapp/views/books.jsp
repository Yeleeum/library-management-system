<!DOCTYPE html>
<html>
<head>
	<title>Books</title>
	<link rel="stylesheet" href="css/forms/books.css">
</head>
<body>
	<%@ include file="mainSearchComponent.jsp"%>
	<form action="/books" method="POST" enctype="multipart/form-data">
		<label for="itid">ITID:</label>
		<input type="text" id="itid" name="itid" required>

		<label for="title">Title:</label>
		<input type="text" id="title" name="title" required>

		<label for="author">Author:</label>
		<input type="text" id="author" name="author" required>

		<label for="publisher">Publisher:</label>
		<input type="text" id="publisher" name="publisher" required>

		<label for="thumbnail">Thumbnail:</label>
		<input type="file" id="thumbnail" name="thumbnailfile">

		<label for="description">Description:</label>
		<textarea id="description" name="description"></textarea>

		<label for="category">Category:</label>
		<input type="text" id="category" name="category">

		<label for="keywords">Keywords:</label>
		<textarea id="keywords" name="keywords"></textarea>

		<label for="edition">Edition:</label>
		<input type="text" id="edition" name="edition">

		<label for="pageno">Page No:</label>
		<input type="number" id="pageno" name="pageno">

		<label for="stock">Stock:</label>
		<input type="number" id="stock" name="stock" required>

		<label for="location">Location:</label>
		<input type="text" id="location" name="location" required>

		<input type="submit" value="Submit">
	</form>
</body>
</html>
