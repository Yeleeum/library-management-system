<!DOCTYPE html>
<html>
<head>
	<title>Magazines</title>
	<style>
		form {
			max-width: 100%;
			margin: 0 auto;
			padding: 20px;
			background-color: #f2f2f2;
			border-radius: 10px;
			box-shadow: 0px 0px 10px rgba(0, 0, 0, 0.2);
			font-family: Arial, sans-serif;
		}

		label {
			display: block;
			margin-bottom: 10px;
			font-weight: bold;
			color: #333;
		}

        input{
            width: 100%;
        }

		input[type=text], select {
			padding: 10px;
			border-radius: 5px;
			border: none;
			box-shadow: 0px 0px 5px rgba(0, 0, 0, 0.1);
			font-size: 16px;
			margin-bottom: 20px;
		}

		input[type=submit] {
			background-color: #4CAF50;
			color: white;
			padding: 12px 20px;
			border: none;
			border-radius: 5px;
			cursor: pointer;
		}

		input[type=submit]:hover {
			background-color: #3e8e41;
		}
	</style>
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
