<!DOCTYPE html>
<html>
<head>
	<title>Softcopy</title>
	<link rel="stylesheet" href="/css/forms/softcopy.css" enctype="multipart/form-data">
</head>
<body>
	<form action="/admin/addsoftcopy" enctype="multipart/form-data" method="POST">
		<label for="title">SID:</label>
		<input type="text" id="title" name="sid">
		
		<label for="title">Title:</label>
		<input type="text" id="title" name="title">

		<label for="owner">Owner:</label>
		<input type="text" id="owner" name="owner">

		<label for="publisher">Publisher:</label>
		<input type="text" id="publisher" name="publisher">

		<label for="description">Description:</label>
		<input type="text" id="description" name="description">

		<label for="thumbnail">Thumbnail:</label>
		<input type="file" id="thumbnail" name="thumbnailfile">

		<label for="category">Category:</label>
		<select id="category" name="category">
			<option value="option1">Option 1</option>
			<option value="option2">Option 2</option>
			<option value="option3">Option 3</option>
		</select>

		<label for="keywords">Keywords:</label>
		<input type="text" id="keywords" name="keywords">

		<label for="pageno">Page No:</label>
		<input type="text" id="pageno" name="pageno">

		<label for="filename">File</label>
		<input type="file" id="file" name="file">

		<input type="submit" value="Submit">
	</form>
</body>
</html>
