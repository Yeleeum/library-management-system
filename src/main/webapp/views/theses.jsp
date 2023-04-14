<!DOCTYPE html>
<html>
<head>
	<title>Theses</title>
	<link rel="stylesheet" href="css/forms/theses.css">
</head>
<body>
	<form action="/theses" method="POST">
		<label for="itid">ITID:</label>
		<input type="text" id="itid" name="itid" required>

		<label for="title">Title:</label>
		<input type="text" id="title" name="title">

		<label for="researcher">Researcher:</label>
		<input type="text" id="researcher" name="researcher">

		<label for="guides">Guides:</label>
		<input type="text" id="guides" name="guides">

		<label for="description">Description:</label>
		<input type="text" id="description" name="description">

		<label for="category">Category:</label>
		<select id="category" name="category">
			<option value="option1">Option 1</option>
			<option value="option2">Option 2</option>
			<option value="option3">Option 3</option>
		</select>

		<label for="keywords">Keywords:</label>
		<input type="text" id="keywords" name="keywords">

		<label for="completeddate">Completed Date:</label>
		<input type="text" id="completeddate" name="completeddate">

		<label for="place">Place:</label>
		<input type="text" id="place" name="place">

		<label for="abstract">Abstract:</label>
		<input type="text" id="abstract" name="abstract">

		<label for="pageno">Page No:</label>
		<input type="text" id="pageno" name="pageno">

		<label for="stock">Stock:</label>
		<input type="text" id="stock" name="stock">

		<input type="submit" value="Submit">
	</form>
</body>
</html>
