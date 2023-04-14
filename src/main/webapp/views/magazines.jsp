<!DOCTYPE html>
<html>
<head>
	<title>Magazines</title>
	<link rel="stylesheet" href="css/forms/magazines.css">
</head>
<body>
	<form action="/magazines" method="POST">

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
	</form>
</body>
</html>
