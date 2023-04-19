<!DOCTYPE html>
<%@page import="com.lms.librarymanagementsystem.models.Books"%>
<%@page import="java.util.List"%>
<html>
<head>
	<title>Books</title>
	<link rel="stylesheet" href="/css/forms/books.css">
</head>
<body>
	<% Books book = (Books) request.getAttribute("book"); %>
	<form action="/admin/addbook" method="POST" enctype="multipart/form-data">
		<label for="itid">ITID:</label>
		<input type="text" id="itid" name="itid" value='<%= (book == null) ? "" : book.getItid() %>' required>

		<label for="title">Title:</label>
		<input type="text" id="title" name="title" value='<%= (book == null) ? "" : book.getTitle() %>' required>

		<label for="author">Author:</label>
		<input type="text" id="author" name="author" value='<%= (book == null) ? "" : book.getAuthor() %>' required>

		<label for="publisher">Publisher:</label>
		<input type="text" id="publisher" name="publisher" value='<%= (book == null) ? "" : book.getPublisher() %>' required>

		<label for="thumbnail">Thumbnail:</label>
		<img id="imageContainer" src='/uploads/thumbnails/<%= (book == null) ? "" : book.getThumbnail() %>' width="150" height="150" alt="">
		<!-- <div id="imageContainer"></div> -->
		<input type="file" id="thumbnail" class="fileInput" name="thumbnailfile" value='<%= (book == null) ? "" : book.getThumbnail() %>'>

		<label for="description">Description:</label>
		<textarea id="description" name="description"><%= (book == null) ? "" : book.getDescription() %></textarea>

		<label for="category">Category:</label>
		<input type="text" id="category" name="category" value='<%= (book == null) ? "" : book.getCategory() %>'>

		<label for="keywords">Keywords:</label>
		<textarea id="keywords" name="keywords" ><%= (book == null) ? "" : book.getKeywords() %></textarea>

		<label for="edition">Edition:</label>
		<input type="text" id="edition" name="edition" value='<%= (book == null) ? "" : book.getEdition() %>'>

		<label for="pageno">Page No:</label>
		<input type="number" id="pageno" name="pageno" value='<%= (book == null) ? "" : book.getPageno() %>'>

		<label for="stock">Stock:</label>
		<input type="number" id="stock" name="stock" value='<%= (book == null) ? "" : book.getStock() %>' required>

		<label for="location">Location:</label>
		<input type="text" id="location" name="location" value='<%= (book == null) ? "" : book.getLocation() %>' required>

		<input type="submit" value="Submit">
	</form>
</body>

<script>
  const fileInput = document.querySelector('.fileInput');
  const imageContainer = document.getElementById('imageContainer');


	/*// Select the file input element
	const fileInputElement = document.getElementById("thumbnail");

	// Get the selected image file
	 const imageFile = '/uploads/thumbnails/<%= (book == null) ? "" : book.getThumbnail() %>';
	console.log(imageFile)

	// Create a new File object with the image file
	const file = new File([], imageFile.name, { type: imageFile.type });
	console.log(file)
	
	// Create a new Blob object with the File object
	const blob = new Blob([file], { type: imageFile.type });
	console.log(blob) */

  fileInput.addEventListener('change', (event) => {
    const file = event.target.files[0];
    const reader = new FileReader();

    reader.addEventListener('load', () => {
      const imageUrl = reader.result;
    //   const imageElement = document.createElement('img');
      imageContainer.src = imageUrl;
    //   imageContainer.appendChild(imageElement);
    });

    reader.readAsDataURL(file);
  });
</script>
</html>
