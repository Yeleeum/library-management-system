<!-- <!DOCTYPE html>
<html>
<head>
	<title>Magazines</title>
	<link rel="stylesheet" href="/css/forms/magazines.css">
</head>
<body>
	<form action="/admin/addmagazine" method="POST" enctype="multipart/form-data">

		<label for="itid">ITID:</label>
		<input type="text" id="itid" name="itid" required>

		<label for="title">Title:</label>
		<input type="text" id="title" name="title">

		<label for="publisher">Publisher:</label>
		<input type="text" id="publisher" name="publisher">

		<label for="issuedate">Issue Date:</label>
		<input type="text" id="issuedate" name="issuedate">

		<label for="issuenumber">Issue Number:</label>
		<input type="text" id="issuenumber" name="issuenumber">

		<label for="description">Description:</label>
		<input type="text" id="description" name="description">

		<label for="thumbnail">Thumbnail:</label>
		<input type="file" id="thumbnail" name="thumbnailfile">

		<label for="frequency">Frequency:</label>
		<input type="text" id="frequency" name="frequency">

		<label for="keywords">Keywords:</label>
		<input type="text" id="keywords" name="keywords">

		<label for="specialissue">Special Issue:</label>
		<input type="text" id="specialissue" name="specialissue">

		<label for="category">Category:</label>
		<select id="category" name="category">
			<option value="option1">Option 1</option>
			<option value="option2">Option 2</option>
			<option value="option3">Option 3</option>
		</select>

		<label for="stock">Stock:</label>
		<input type="text" id="stock" name="stock">

		<input type="submit" value="Submit">
	</form> -->
<!DOCTYPE html>
<%@page import="com.lms.librarymanagementsystem.models.*"%>
<%@page import="java.util.List"%>
<html>

<head>
	<title>Magazines</title>
	<link rel="stylesheet" href="/css/forms/books.css">
</head>

<body>
	<% Magazines magazine = (Magazines) request.getAttribute("magazine"); %>
	<% String activity=(String) request.getAttribute("activity"); %>
	<form action='/admin<%=activity.equals("edit")?"/edit/magazines":"/addmagazine"%>' method="POST" enctype="multipart/form-data">
		<div class="left-container">
			<% if(activity.equals("edit")) { %>
				<input id="prevthumbnail" value='<%= (magazine == null) ? "" : magazine.getThumbnail() %>' name="thumbnail" hidden/>
			<% } %>
			<label for="thumbnail">Thumbnail:</label>
			<img id="imageContainer" src='/uploads/thumbnails/<%= (magazine == null) ? "" : magazine.getThumbnail() %>' alt="">
			<input type="file" class="fileInput" id="thumbnail" name="thumbnailfile">
		</div>
		<div class="right-container">
			<% if(activity.equals("edit")) { %>
				<input type="number" hidden id="mid" name="mid" value='<%= (magazine == null) ? null : magazine.getMid() %>'>
			<% } %>

			<label for="itid">ITID:</label>
			<input type="text" id="itid" name="itid" value='<%= (magazine == null) ? "" : magazine.getItid() %>' required>

			<label for="title">Title:</label>
			<input type="text" id="title" value='<%= (magazine == null) ? "" : magazine.getTitle() %>' name="title">

			<label for="publisher">Publisher:</label>
			<input type="text" id="publisher" value='<%= (magazine == null) ? "" : magazine.getPublisher() %>' name="publisher">

			<label for="issuedate">Issue Date:</label>
			<input type="text" id="issuedate" value='<%= (magazine == null) ? "" : magazine.getIssuedate() %>' name="issuedate">

			<label for="issuenumber">Issue Number:</label>
			<input type="text" id="issuenumber" value='<%= (magazine == null) ? "" : magazine.getIssuenumber() %>' name="issuenumber">

			<label for="description">Description:</label>
			<input type="text" id="description" value='<%= (magazine == null) ? "" : magazine.getDescription() %>' name="description">

			<label for="frequency">Frequency:</label>
			<input type="text" id="frequency" value='<%= (magazine == null) ? "" : magazine.getFrequency() %>' name="frequency">

			<label for="keywords">Keywords:</label>
			<input type="text" id="keywords" value='<%= (magazine == null) ? "" : magazine.getKeywords() %>' name="keywords">

			<label for="specialissue">Special Issue:</label>
			<input type="text" id="specialissue" value='<%= (magazine == null) ? "" : magazine.getSpecialissue() %>' name="specialissue">

			<label for="category">Category:</label>
			<input type="text" id="category" value='<%= (magazine == null) ? "" : magazine.getCategory() %>' name="category">

			<label for="stock">Stock:</label>
			<input type="number" id="stock" value='<%= (magazine == null) ? null: magazine.getStock() %>' name="stock">

			<input type="submit" value="Submit">
		</div>
	</form>
</body>
<script src="/js/imagehandler.js"></script>

</html>
</body>

</html>