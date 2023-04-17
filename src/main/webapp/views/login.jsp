<!DOCTYPE html>
<html>

<head>
    <title>Login Form</title>
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css"
        integrity="sha512-iecdLmaskl7CVkqkXNQ/ZH/XLlvWZOJyj7Yy7tcenmpD1ypASozpmT/E0iPtmFIB46ZmdtAc9eNBvH0H/ZpiBw=="
        crossorigin="anonymous" referrerpolicy="no-referrer" />
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

        .passField {
            width: 100%;
            display: flex;
            justify-content: space-around;
            align-items: center;
            flex-direction: row;
            padding-right: 10px;
            border-radius: 5px;
            border: none;
            box-shadow: 0 0 5px rgba(0, 0, 0, 0.1);
            transition: box-shadow 0.2s ease-in-out;
            overflow: hidden;
            margin-bottom: 20px;
        }

        .passField input[type="password"],
        #password,
        #adminpassword {
            display: block;
            width: 100%;
            padding: 10px;
            font-size: 16px;
            outline: none;
            border: none;
        }

        #username,
        #adminusername {
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

        #username:focus,
        #adminusername:focus,
        .passField:focus-within {
            box-shadow: 0 0 5px rgba(0, 0, 0, 0.3);
            outline: none;
        }

        i {
            cursor: pointer;
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
            display: flex;
            flex-direction: row-reverse;
            justify-content: space-between;
            align-items: center;
            border-radius: 10px;
            /* background-color: #fefefe; */
            background-color: #2f3140f2;
            margin: 15% auto;
            /* 15% from the top and centered */
            padding: 20px;
            border: 1px solid #888;
            width: 80%;
            /* Could be more or less, depending on screen size */
        }

        /* Close Button */
        .close {
            display: inline;
            color: aliceblue;
            float: right;
            font-size: 30px;
            font-weight: bold;
            margin-bottom: 10px;
        }

        .close:hover,
        .close:focus {
            color: rgb(222, 222, 222);
            text-decoration: none;
            cursor: pointer;
        }
    </style>
</head>

<body>
    <div id="myModal" class="modal">
        <div class="modal-content">
            <span class="fa-solid fa-multiply close" id="cross"></span>
            <p id="modal-text" style="display: inline;">
            </p>
        </div>
    </div>

    <div class="container">
        <div class="form">
            <div class="profileContainer">
                <img src="/img/user.png" alt="" width="100" height="100">
            </div>
            <h2>User Login</h2>
            <input type="text" name="username" oninput="checkVisible('user')" placeholder="Username" id="username"
                required>
            <div class="passField">
                <input type="password" name="password" oninput="checkVisible('user')" placeholder="Password"
                    id="password" required>
                <i class="fa-solid fa-eye eye" onclick='togglePassword("password", "eye")'></i>
            </div>
            <button type="submit" id="userbtn">Login</button>
        </div>
        <div class="form">
            <div class="profileContainer">
                <img src="/img/admin.png" alt="" width="100" height="100">
            </div>
            <h2>Admin Login</h2>
            <input type="text" name="username" oninput="checkVisible('admin')" placeholder="Username" id="adminusername"
                required>
            <div class="passField">
                <input type="password" name="password" oninput="checkVisible('admin')" placeholder="Password"
                    id="adminpassword" required>
                <i class="fa-solid fa-eye adeye" onclick='togglePassword("adminpassword", "adeye")'></i>
            </div>
            <button type="submit" id="adminbtn">Login</button>
        </div>
    </div>
</body>
<script>
    // Get the modal
    var modal = document.getElementById("myModal");

    var username = document.getElementById('username')
    var password = document.getElementById('password')

    var adminusername = document.getElementById('adminusername')
    var adminpassword = document.getElementById('adminpassword')

    // Get the <span> element that closes the modal
    var crossIcon = document.getElementById("cross");

    let userbtn = document.getElementById("userbtn");
    let adminbtn = document.getElementById("adminbtn");

    // initial
    userbtn.disabled = true;
    userbtn.style = "filter: brightness(0.6)";
    adminbtn.disabled = true;
    adminbtn.style = "filter: brightness(0.6)";

    const checkVisible = (str) => {
        if (str === 'user') {
            if (username.value === "" || password.value === "") {
                userbtn.disabled = true;
                userbtn.style = "filter: brightness(0.6)";
            } else {
                userbtn.disabled = false;
                userbtn.style = "";
            }
        } else if (str === 'admin') {
            if (adminusername.value === "" || adminpassword.value === "") {
                adminbtn.disabled = true;
                adminbtn.style = "filter: brightness(0.6)";
            } else {
                adminbtn.disabled = false;
                adminbtn.style = "";
            }
        }
    }

    function togglePassword(response, icon) {
        var password = document.getElementById(response);
        if (password.type === "password") {
            password.type = "text";
            document.querySelector("." + icon).classList.remove('fa-eye');
            document.querySelector("." + icon).classList.add('fa-eye-slash');
        } else {
            password.type = "password";
            document.querySelector("." + icon).classList.remove('fa-eye-slash');
            document.querySelector("." + icon).classList.add('fa-eye');
        }
    }

    // When the user clicks the button to submit the login request
    document.getElementById("userbtn").addEventListener('click', () => {
        // Show the modal
        // URL and data to be sent in the request
        let usernameParams = new URLSearchParams();
        usernameParams.append('username', username.value);
        usernameParams.append('password', password.value);
        const url = 'http://localhost:8080/login/users';

        // Fetch options
        const options = {
            method: 'POST',
            body: usernameParams
        };

        // Send POST request
        fetch(url, options)
            .then(response => { return response.text() })
            .then(data => {
                // console.log(data); // Handle the response data
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

                if (data === "pending") {
                    document.getElementById('modal-text').innerHTML = `<p style="color: yellow; display: inline;">Your Request is Still Pending. You will be notify shortly via email, check the email frquently </p>`;
                } else if (data === "rejected") {
                    document.getElementById('modal-text').innerHTML = `<p style="color: #ff5f85; display: inline;">Admin has Rejected your application,
                    check your mail inbox to know more.</p>`;
                } else if (data === "not found") {
                    document.getElementById('modal-text').innerHTML = `<p style="color: red; display: inline;">Wrong username or password given</p>`;
                } else {
                    window.location.href = "http://localhost:8080/user";
                }
            })
            .catch(error => {
                console.error('Error:', error);
            });

    });


    document.getElementById("adminbtn").addEventListener('click', () => {
        // Show the modal
        // URL and data to be sent in the request
        let usernameParams = new URLSearchParams();
        usernameParams.append('username', adminusername.value);
        usernameParams.append('password', adminpassword.value);
        const url = 'http://localhost:8080/login/users';

        // Fetch options
        const options = {
            method: 'POST',
            body: usernameParams
        };

        // Send POST request
        fetch(url, options)
            .then(response => { return response.text() })
            .then(data => {
                // console.log(data); // Handle the response data
                modal.style.display = "block";


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

                if (data === "not found") {
                    document.getElementById('modal-text').innerHTML = `<p style="color: red; display: inline;">Wrong username or password given</p>`;
                } else {
                    window.location.href = "http://localhost:8080/admin";
                }
            })
            .catch(error => {
                console.error('Error:', error);
            });

    })
</script>

</html>