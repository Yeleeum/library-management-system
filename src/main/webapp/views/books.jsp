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
	<% String activity=(String) request.getAttribute("activity"); %>
	<form action='/admin<%=activity.equals("edit")?"/edit/books":"/addbook"%>' method="POST" enctype="multipart/form-data">
		<div class="left-container">
			<% if(activity.equals("edit")) { %>
				<input id="prevthumbnail" value='<%= (book == null) ? "" : book.getThumbnail() %>' name="thumbnail" hidden/>
			<% } %>
			<label for="thumbnail">Thumbnail:</label>
			<img id="imageContainer" src='/uploads/thumbnails/<%= (book == null) ? "" : book.getThumbnail() %>' width="150" height="150" alt="">
			<!-- <div id="imageContainer"></div> -->
			<input type="file" id="thumbnail" class="fileInput" name="thumbnailfile" value='<%= (book == null) ? "" : book.getThumbnail() %>'>
		</div>

		<div class="right-container">
			<% if(activity.equals("edit")) { %>
				<input type="number" hidden id="bid" name="bid" value='<%= (book == null) ? null : book.getBid() %>'>
			<% } %>
			<label for="itid">ITID:</label>
			<input type="text" id="itid" name="itid" value='<%= (book == null) ? "" : book.getItid() %>' required>
	
			<label for="title">Title:</label>
			<input type="text" id="title" name="title" value='<%= (book == null) ? "" : book.getTitle() %>' required>
	
			<label for="author">Author:</label>
			<input type="text" id="author" name="author" value='<%= (book == null) ? "" : book.getAuthor() %>' required>
	
			<label for="publisher">Publisher:</label>
			<input type="text" id="publisher" name="publisher" value='<%= (book == null) ? "" : book.getPublisher() %>' required>
	
			
	
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
		</div>
	</form>
</body>
<script src="/js/imagehandler.js"></script>
</html>
