<!DOCTYPE html>
<html>

<head>
    <title>Login Form</title>
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css"
        integrity="sha512-iecdLmaskl7CVkqkXNQ/ZH/XLlvWZOJyj7Yy7tcenmpD1ypASozpmT/E0iPtmFIB46ZmdtAc9eNBvH0H/ZpiBw=="
        crossorigin="anonymous" referrerpolicy="no-referrer" />
    <link rel="stylesheet" href="/css/loginpage.css">
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
            <br>
            <span>Don't have an Account ? <a href="/registration">Register</a></span>
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
            <br>
            <br>
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
                document.getElementById("modal-text").innerHTML = "Logging in....";

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
        const url = 'http://localhost:8080/login/admin';

        document.getElementById("modal-text").innerHTML = "Logging in....";

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