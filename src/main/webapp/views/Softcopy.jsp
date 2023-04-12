<!DOCTYPE html>
<html>
<head>
	<title>Softcopy</title>
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
	<form action="/softcopy" enctype="multipart/form-data" method="POST">
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
