<!DOCTYPE html>
<%@page import="com.lms.librarymanagementsystem.models.*"%>
<%@page import="java.util.List"%>
<%@page import="com.lms.librarymanagementsystem.models.Registration"%>
<html lang="en">
<head>
    <title>Book Donation Form</title>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css"
        integrity="sha512-iecdLmaskl7CVkqkXNQ/ZH/XLlvWZOJyj7Yy7tcenmpD1ypASozpmT/E0iPtmFIB46ZmdtAc9eNBvH0H/ZpiBw=="
        crossorigin="anonymous" referrerpolicy="no-referrer" />
    <link rel="stylesheet" href="/css/forms/books.css">
    <style>
        .rightContainer {
            width: 100%;
            height: 100%;
        }
        
        .bookForm {
            padding: 20px !important;
        }

        .left-container {
            padding: 0 20px;
            width: 40%;
        }

        .left-container img {
            aspect-ratio: 1/1;
            object-fit: cover;
            width: 100%;
            height: 40%;
            border-radius: 10px;
            box-shadow: rgba(50, 50, 93, 0.25) 0px 6px 12px -2px, rgba(0, 0, 0, 0.3) 0px 3px 7px -3px;
        }

        @media only screen and (max-width: 768px) {
            .bookForm {
                flex-direction: column;
            }

            .left-container {
                width: 100%;
            }

            .right-container {
                width: 100%;
            }

        }
    </style>
</head>
<body>
	<section class="mainContainer">
        <div class="rightContainer">
	<form action="/donation/softcopy" enctype="multipart/form-data" method="POST" class="bookForm">
		<div class="left-container">
			<label for="thumbnail">Thumbnail:</label>
            <img id="imageContainer" width="150" height="150" alt="">
			<input type="file" id="thumbnail" class="fileInput"
				value='' accept=".jpg, .png"
				name="thumbnailfile">

			<div id="pdfContainer"></div>
			<label for="filename">File</label>
			<input type="file" id="file" accept=".pdf" value=''
				name="file">
		</div>
		<div class="right-container">
            <label for="donorname">Donor Name:</label>
            <input type="text" id="donorname" name="donorName" required>

			<label for="title">Title:</label>
			<input type="text" id="title" name="title">

			<label for="owner">Owner:</label>
			<input type="text" id="owner" name="owner">

			<label for="publisher">Publisher:</label>
			<input type="text" id="publisher" value=''
				name="publisher">

			<label for="description">Description:</label>
			<input type="text" id="description" value=''
				name="description">

			<label for="category">Category:</label>
			<input type="text" id="category" name="category" value=''>

			<label for="keywords">Keywords:</label>
			<input type="text" id="keywords" value=''
				name="keywords">

			<label for="pageno">Page No:</label>
			<input type="text" id="pageno" value='' name="pageNo">

            <label for="donationdate">Donation Date:</label>
            <input type="date" id="donationdate" name="donationDate" required>

			<input type="submit" value='Submit'>

		</div>
	</form>
</div>
	</div>
</section>
</body>
<script src="https://cdnjs.cloudflare.com/ajax/libs/pdf.js/2.11.338/pdf.min.js"></script>
<script src="/js/adminPanel.js"></script>
<script src="/js/imagehandler.js"></script>
</html>
