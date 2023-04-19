<!DOCTYPE html>
<%@page import="com.lms.librarymanagementsystem.models.Journals" %>
<%@page import="java.util.List" %>
<html>

<head>
	<title>Journals</title>
	<link rel="stylesheet" href="/css/forms/books.css">
</head>
<body>
	<% Journals journal = (Journals) request.getAttribute("journal"); %>
	<% String activity=(String) request.getAttribute("activity"); %>
	<form action='/admin<%=activity.equals("edit")?"/edit/books":"/addbook"%>' method="POST" enctype="multipart/form-data">
		<div class="left-container">
			<% if(activity.equals("edit")) { %>
				<input id="prevthumbnail" value='<%= (journal == null) ? "" : journal.getThumbnail() %>' name="thumbnail" hidden/>
			<% } %>
			<label for="thumbnail">Thumbnail:</label>
			<img id="imageContainer" src='/uploads/thumbnails/<%= (journal == null) ? "" : journal.getThumbnail() %>' alt="">
			<input type="file" class="fileInput" id="thumbnail" name="thumbnailfile">
		</div>
		<div class="right-container">
			<% if(activity.equals("edit")) { %>
				<input type="text" hidden id="bid" name="bid" value='<%= (journal == null) ? "" : journal.getJid() %>'>
			<% } %>
			<label for="itid">ITID:</label>
			<input type="text" id="itid" name="itid" value='<%= (journal == null) ? "" : journal.getItid() %>' required>

			<label for="title">Title:</label>
			<input type="text" id="title" name="title" value='<%= (journal == null) ? "" : journal.getTitle() %>' required>

			<label for="publisher">Publisher:</label>
			<input type="text" id="publisher" name="publisher" value='<%= (journal == null) ? "" : journal.getPublisher() %>' required>

			<label for="editor">Editor:</label>
			<input type="text" id="editor" name="editor" value='<%= (journal == null) ? "" : journal.getEditor() %>'>

			<label for="description">Description:</label>
			<textarea id="description" name="description"><%= (journal == null) ? "" : journal.getDescription() %></textarea>

			<label for="category">Category:</label>
			<input type="text" id="category" name="category" value='<%= (journal == null) ? "" : journal.getCategory() %>'>

			<label for="keywords">Keywords:</label>
			<textarea id="keywords" name="keywords"><%= (journal == null) ? "" : journal.getKeywords() %></textarea>

			<label for="startyear">Start Year:</label>
			<input type="number" id="startyear" name="startYear" value='<%= (journal == null) ? "" : journal.getStartYear() %>'>

			<label for="endyear">End Year:</label>
			<input type="number" id="endyear" name="endYear" value='<%= (journal == null) ? "" : journal.getEndYear() %>'>

			<label for="pageno">Page No:</label>
			<input type="number" id="pageno" name="pageNo" value='<%= (journal == null) ? "" : journal.getPageNo() %>'>

			<label for="stock">Stock:</label>
			<input type="number" id="stock" name="stock" value='<%= (journal == null) ? "" : journal.getStock() %>'>

			<input type="submit" value="Submit">
		</div>
	</form>
</body>
<script src="imagehandler.js"></script>
</html>