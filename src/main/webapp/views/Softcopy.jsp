<!DOCTYPE html>
<html>
	<%@page import="com.lms.librarymanagementsystem.models.*" %>
	<%@page import="com.lms.librarymanagementsystem.FileHandler.SessionHandler"%>
<head>
	<title>Softcopy</title>
	<link rel="stylesheet" href="/css/forms/softcopy.css" enctype="multipart/form-data">
</head>
<body>
	<% SoftCopy softcopy=(SoftCopy) request.getAttribute("softcopy"); %>
	<form action="/admin/addsoftcopy" enctype="multipart/form-data" method="POST">
		<label for="title">SID:</label>
		<input type="text" id="title" value='<%= (softcopy == null) ? "" : softcopy.getSid() %>' name="sid">
		
		<label for="title">Title:</label>
		<input type="text" id="title" value='<%= (softcopy == null) ? "" : softcopy.getTitle() %>'  name="title">

		<label for="owner">Owner:</label>
		<input type="text" id="owner" value='<%= (softcopy == null) ? "" : softcopy.getOwner() %>'  name="owner">

		<label for="publisher">Publisher:</label>
		<input type="text" id="publisher" value='<%= (softcopy == null) ? "" : softcopy.getPublisher() %>'  name="publisher">

		<label for="description">Description:</label>
		<input type="text" id="description" value='<%= (softcopy == null) ? "" : softcopy.getDescription() %>'  name="description">

		<label for="thumbnail">Thumbnail:</label>
		<img id="imageContainer"  src='/uploads/thumbnails/<%= (softcopy == null) ? "" : softcopy.getThumbnail() %>' width="150" height="150" alt="">
		<input type="file" id="thumbnail" class="fileInput" value='<%= (softcopy == null) ? "" : softcopy.getThumbnail() %>'  name="thumbnailfile">

		<label for="category">Category:</label>
		<select id="category" name="category" value='<%= (softcopy == null) ? "" : softcopy.getCategory() %>' >
			<option value="option1">Option 1</option>
			<option value="option2">Option 2</option>
			<option value="option3">Option 3</option>
		</select>

		<label for="keywords">Keywords:</label>
		<input type="text" id="keywords"  value='<%= (softcopy == null) ? "" : softcopy.getKeywords() %>' name="keywords">

		<label for="pageno">Page No:</label>
		<input type="text" id="pageno"  value='<%= (softcopy == null) ? "" : softcopy.getPageno() %>' name="pageno">

		<label for="filename">File</label>
		<input type="file" id="file"  value='<%= (softcopy == null) ? "" : softcopy.getFilename() %>' name="file">

		<input type="submit" value="Submit">
	</form>
</body>
<script>
	const fileInput = document.querySelector('.fileInput');
	const imageContainer = document.getElementById('imageContainer');
  
	fileInput.addEventListener('change', (event) => {
	  const file = event.target.files[0];
	  const reader = new FileReader();
  
	  reader.addEventListener('load', () => {
		const imageUrl = reader.result;
		imageContainer.src = imageUrl;
	  });
  
	  reader.readAsDataURL(file);
	});
  </script>
</html>
