<!DOCTYPE html>
<html>

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
            <form action='/donation/book' method="POST" enctype="multipart/form-data" class="bookForm">
                <div class="left-container">
                    <label for="thumbnail">Thumbnail:</label>
                    <img id="imageContainer" width="150" height="150" alt="">
                    <input type="file" id="thumbnail" class="fileInput" name="thumbnailfile">
                </div>

                <div class="right-container">
                    <label for="donorname">Donor Name:</label>
                    <input type="text" id="donorname" name="donorname" required>

                    <label for="title">Title:</label>
                    <input type="text" id="title" name="title" required>

                    <label for="author">Author:</label>
                    <input type="text" id="author" name="author" required>

                    <label for="publisher">Publisher:</label>
                    <input type="text" id="publisher" name="publisher" required>

                    <label for="description">Description:</label>
                    <textarea id="description" name="description" rows="5" required></textarea>

                    <label for="category">Category:</label>
                    <input type="text" id="category" name="category" required>

                    <label for="keywords">Keywords:</label>
                    <textarea id="keywords" name="keywords" rows="5" required></textarea>

                    <label for="edition">Edition:</label>
                    <input type="text" id="edition" name="edition" required>

                    <label for="pageno">Page Number:</label>
                    <input type="number" id="pageno" name="pageno" required>

                    <label for="donationdate">Donation Date:</label>
                    <input type="date" id="donationdate" name="donationdate" required>

                    <input type="submit" value='Submit' />
                </div>
            </form>
        </div>
    </section>
</body>
<script src="/js/imagehandler.js"></script>

</html>