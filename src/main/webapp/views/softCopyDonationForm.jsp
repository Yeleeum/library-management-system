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

        /* Style for the alert box */
        .alert {
            width: 100%;
            display: flex;
            justify-content: space-between;
            align-items: center;
            flex-direction: row-reverse;
            padding: 20px;
            background-color: #52f583;
            color: white;
            margin-bottom: 15px;
            position: relative;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.15);
        }

        /* Style for the close button */
        .closebtn {
            margin-right: 15px;
            margin-top: 5px;
            color: white;
            font-size: 22px;
            font-weight: bold;
            cursor: pointer;
        }

        /* Hover effect for the close button */
        .closebtn:hover {
            color: black;
        }

        /* Add some additional styling for the strong tag */
        .alert strong {
            font-weight: bold;
        }

        /* Add a border on the bottom of the alert box */
        .alert::before {
            content: "";
            display: block;
            position: absolute;
            bottom: 0;
            left: 0;
            width: 100%;
            height: 3px;
            background-color: rgba(255, 255, 255, 0.3);
        }

        /* Add a fade-in effect to the alert box */
        .alert.fade-in {
            animation: fade-in 0.5s ease-in-out;
        }

        /* Define the animation for the fade-in effect */
        @keyframes fade-in {
            from {
                opacity: 0;
                transform: translateY(-10px);
            }

            to {
                opacity: 1;
                transform: translateY(0);
            }
        }
    </style>
</head>
<% String message=(String) request.getAttribute("message"); %>
<body>
    <% if(message !=null) { %>
        <div class="alert">
            <span class="closebtn" onclick="this.parentElement.style.display='none';">&times;</span>
            <strong>
                <%= message %>
            </strong>
        </div>
    <% } %>
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
			<input type="number" id="pageno" value='' name="pageNo">

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
