<!DOCTYPE html>
<html>

<head>
    <title>Login Form</title>
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <style type="text/css">
        * {
            margin: 0;
            padding: 0;
            box-sizing: border-box;
        }

        body {
            font-family: Arial, sans-serif;
            background-color: #282a36;
            font-family: Arial, Helvetica, sans-serif;
        }

        .profileContainer {
            display: flex;
            justify-content: center;
            align-items: center;

        }

        .profileContainer>img {
            aspect-ratio: 1/1;
            display: flex;
            justify-content: center;
            align-items: center;
            background: #5199e4;
            border-radius: 50%;
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.3);
        }

        .container {
            display: flex;
            flex-wrap: wrap;
            justify-content: center;
            align-items: center;
            height: 100vh;
            gap: 5vw;
        }

        .form {
            background-color: #fff;
            padding: 20px;
            /* box-shadow: 0 0 10px rgba(0, 0, 0, 0.3); */
            box-shadow: 4px 5px 73px 21px rgba(28, 31, 119, 0.72);
            -webkit-box-shadow: 4px 5px 73px 21px rgba(28, 31, 119, 0.72);
            -moz-box-shadow: 4px 5px 73px 21px rgba(28, 31, 119, 0.72);
            /* box-shadow: 0 0 10px rgba(43, 54, 133, 0.5), 0 2px 4px rgba(0, 0, 255, 0.1); */
            border-radius: 5px;
            margin: 10px;
            flex: 1 1 400px;
            max-width: 350px;
        }

        .form h2 {
            text-align: center;
            margin-bottom: 20px;
        }

        .form input[type="text"],
        .form input[type="password"] {
            box-sizing: border-box;
            display: block;
            width: 100%;
            padding: 10px;
            margin-bottom: 20px;
            border-radius: 5px;
            border: none;
            box-shadow: 0 0 5px rgba(0, 0, 0, 0.1);
            font-size: 16px;
            transition: box-shadow 0.2s ease-in-out;
        }

        .form input[type="text"]:focus,
        .form input[type="password"]:focus {
            box-shadow: 0 0 5px rgba(0, 0, 0, 0.3);
            outline: none;
        }

        #userbtn {
            display: block;
            width: 100%;
            padding: 10px;
            border-radius: 5px;
            border: none;
            background-color: #11c017;
            color: #fff;
            font-size: 16px;
            cursor: pointer;
            transition: background-color 0.2s ease-in-out;
            font-weight: bold;
        }

        #adminbtn {
            display: block;
            width: 100%;
            padding: 10px;
            border-radius: 5px;
            border: none;
            background-color: #d74b17;
            color: #fff;
            font-size: 16px;
            cursor: pointer;
            transition: background-color 0.2s ease-in-out;
            font-weight: bold;
        }

        #adminbtn:hover {
            background-color: #972d06;
        }

        #userbtn:hover {
            background-color: #3e8e41;
        }

        @media screen and (max-width: 768px) {
            .form {
                flex-basis: 100%;
                max-width: none;
            }
        }

        /* modal */
        .modal {
            display: none;
            /* Hidden by default */
            position: fixed;
            /* Stay in place */
            z-index: 1;
            /* Sit on top */
            left: 0;
            top: 0;
            width: 100%;
            /* Full width */
            height: 100%;
            /* Full height */
            overflow: auto;
            /* Enable scroll if needed */
            background-color: rgb(0, 0, 0);
            /* Fallback color */
            background-color: rgba(0, 0, 0, 0.4);
            /* Black w/ opacity */
        }


        /* Modal Content/Box */
        .modal-content {
            border-radius: 10px;
            background-color: #fefefe;
            margin: 15% auto;
            /* 15% from the top and centered */
            padding: 20px;
            border: 1px solid #888;
            width: 80%;
            /* Could be more or less, depending on screen size */
        }

        /* Close Button */
        .close {
            color: #000;
            float: right;
            font-size: 30px;
            font-weight: bold;
        }

        .close:hover,
        .close:focus {
            color: black;
            text-decoration: none;
            cursor: pointer;
        }
    </style>
</head>

<body>
    <div id="myModal" class="modal">
        <div class="modal-content">
            <span class="close" id="cross">&times;</span>
            <p id="modal-text">
            <p>Your Request is Still Pending. You will be notify shortly via email,
                check the email frquently </p>
            <br>
            <p>
                Admin has Rejected your application,
                check your mail inbox to know more.
            </p>
            <br>
            <p>
                wrong username or password given
            </p>
            </p>
        </div>
    </div>

    <div class="container">
        <div class="form">
            <div class="profileContainer">
                <img src="/img/user.png" alt="" width="100" height="100">
            </div>
            <h2>User Login</h2>
            <input type="text" name="username" placeholder="Username">
            <input type="password" name="password" placeholder="Password">
            <button type="submit" id="userbtn">Login</button>
        </div>
        <div class="form">
            <div class="profileContainer">
                <img src="/img/admin.png" alt="" width="100" height="100">
            </div>
            <h2>Admin Login</h2>
            <input type="text" name="username" placeholder="Username">
            <input type="password" name="password" placeholder="Password">
            <button type="submit" id="adminbtn">Login</button>
        </div>
    </div>
</body>
<script>
    // Get the modal
    var modal = document.getElementById("myModal");

    // Get the <span> element that closes the modal
    var crossIcon = document.getElementById("cross");

    // When the user clicks the button to submit the login request
    document.getElementById("userbtn").addEventListener('click', () => {
        // Show the modal
        modal.style.display = "block";

        // Update the modal text with the approval status
        document.getElementById("modal-text").innerHTML = "Your login request has been sent for approval. Please wait for the admin to approve or reject your request.";

        // When the user clicks on <span> (x), close the modal
        crossIcon.addEventListener('click', () => {
            modal.style.display = "none";
        });

        // When the user clicks anywhere outside of the modal, close it
        window.addEventListener('click', (event) => {
            if (event.target == modal) {
                modal.style.display = "none";
            }
        });

        
    });

</script>

</html>