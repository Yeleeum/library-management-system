<!DOCTYPE html>
<html>
<head>
	<title>Journals</title>
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

        input{
            width: 100%;
        }

		label {
			display: block;
			margin-bottom: 10px;
			font-weight: bold;
			color: #333;
		}

		input[type=text], select {
			padding: 10px;
			border-radius: 5px;
			border: none;
			box-shadow: 0px 0px 5px rgba(0, 0, 0, 0.1);
			font-size: 16px;
			margin-bottom: 20px;
		}

		input[type=number] {
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
