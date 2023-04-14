<!DOCTYPE html>
<html>
<head>
	<title>Journals</title>
    <link rel="stylesheet" href="css/forms/journals.css">
</head>
<body>
	<form action="/journals" method="POST">
		<label for="itid">ITID:</label>
		<input type="text" id="itid" name="itid" required>

		<label for="title">Title:</label>
		<input type="text" id="title" name="title" required>

		<label for="publisher">Publisher:</label>
		<input type="text" id="publisher" name="publisher" required>

		<label for="editor">Editor:</label>
		<input type="text" id="editor" name="editor">

		<label for="description">Description:</label>
		<textarea id="description" name="description"></textarea>

		<label for="category">Category:</label>
		<select id="category" name="category">
			<option value="option1">Option 1</option>
			<option value="option2">Option 2</option>
			<option value="option3">Option 3</option>
		</select>

		<label for="keywords">Keywords:</label>
		<textarea id="keywords" name="keywords"></textarea>

		<label for="startyear">Start Year:</label>
		<input type="number" id="startyear" name="startYear">

		<label for="endyear">End Year:</label>
		<input type="number" id="endyear" name="endYear">

		<label for="pageno">Page No:</label>
		<input type="number" id="pageno" name="pageNo">

		<label for="stock">Stock:</label>
		<input type="number" id="stock" name="stock">

		<input type="submit" value="Submit">
	</form>
</body>
</html>
