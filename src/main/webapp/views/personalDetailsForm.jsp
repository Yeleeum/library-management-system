<!DOCTYPE html>
<html>

<head>
    <title>User Registration Form</title>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css"
        integrity="sha512-iecdLmaskl7CVkqkXNQ/ZH/XLlvWZOJyj7Yy7tcenmpD1ypASozpmT/E0iPtmFIB46ZmdtAc9eNBvH0H/ZpiBw=="
        crossorigin="anonymous" referrerpolicy="no-referrer" />
    <link rel="stylesheet" type="text/css" href="/css/forms/registration-form.css">
</head>


<body>
    <div id="view">
        <%@include file="termsandcondition.jsp"%>
        <div class="imageContainer">
            <h1>User Registration Form</h1>
            <img src="/img/library.png" alt="">
            <form class="btn">
                <button formaction="/donation/book">Donate Book</button>
                <button formaction="/donation/journal">Donate Journal</button>
                <button formaction="/donation/theses">Donate Theses</button>
                <button formaction="/donation/magazine">Donate Magazine</button>
                <button formaction="/donation/softcopy">Donate PDF</button>
            </form>
        </div>
        <div class="form">
            <form action="/registration/submitregister" method="post" enctype="multipart/form-data">
                <div class="beforepayment">
                    <div class="mb-10">
                        <label for="username">Username<span style="color: red; font-weight: bold;">*</span> :</label>
                        <input type="text" class="input-text usernameinput" placeholder="Enter Username"
                            class="usernameinput" id="username" name="username" required>
                        <p class="trueusername" hidden="true" style="color: rgb(0, 207, 0); margin-top: 3px;">You can
                            use
                            this username <i class="fa-solid fa-check"></i></p>
                        <p class="falseusername" hidden="true" style="color: rgb(216, 0, 0); margin-top: 3px;">Username
                            already in use <i class="fa-solid fa-multiply"></i></p>
                    </div>
                    <label for="password">Password<span style="color: red; font-weight: bold;">*</span> :</label>
                    <div class="passwordField">
                        <input type="password" id="password" name="password" required>
                        <i class="fa-solid fa-eye eye" onclick="togglePassword()"></i>
                    </div>
                    <label for="profilepicture">Profile Picture:</label>
                    <div class="mb-10 file-upload">
                        <input class="label" type="file" id="profilepicture" name="profilepicturefile">
                    </div>
                    <div id="name" class="mb-10">
                        <div>
                            <label for="firstname">First Name<span style="color: red; font-weight: bold;">*</span>
                                :</label>
                            <input type="text" id="firstname" name="firstName" required>
                        </div>

                        <div>
                            <label for="lastname">Last Name<span style="color: red; font-weight: bold;">*</span>
                                :</label>
                            <input type="text" id="lastname" name="lastName" required>
                        </div>
                    </div>
                    <div class="mb-10"
                        style="display: flex; justify-content: space-between; gap: 6%; align-items: center; width: 100%;">
                        <div style="width: 100%;">
                            <label for="gender">Gender:</label>
                            <select id="gender" name="gender">
                                <option value="male">Male</option>
                                <option value="female">Female</option>
                                <option value="other">Other</option>
                            </select>
                        </div>

                        <div style="width: 100%;">
                            <label for="dob" class="doblabel">Date of Birth:</label>
                            <input type="date" id="dob" name="dob">
                        </div>
                    </div>
                    <div class="mb-10">
                        <label for="phone">Phone:</label>
                        <input type="number" class="input-text" id="phone" name="phone" required>
                    </div>
                    <div class="mb-10">
                        <label for="email">Email<span style="color: red; font-weight: bold;">*</span> :</label>
                        <input type="email" id="email" name="email" required>
                    </div>
                    <div class="mb-10">
                        <label for="category">Category:</label>
                        <select id="category" name="category">
                            <option value="student">Student</option>
                            <option value="teacher">Teacher</option>
                            <option value="researcher">Researcher</option>
                            <option value="regular" selected>Regular</option>
                        </select>
                    </div>
                </div>
                <p><input type="checkbox" id="tnc_check"> <span>I agree to these <span style="color: red; font-weight: bold;">*</span> </span> <button class="anchor"
                        onclick="showTermsAndConditions()" type="button">Terms and Conditions.</button></p>
                <br>
                <div class="paymentform mb-10" hidden>
                    <label for="paymentmode">Payment Mode<span style="color: red; font-weight: bold;">*</span> </label>
                    <select id="paymentmode" name="paymentmode" required>
                        <option value="online">Online</option>
                        <option value="offline" selected>Offline</option>
                    </select>

                    <input type="text" class="input-text" id="paid" name="paid" value="unpaid" hidden>

                    <div class="Transactionform" hidden>
                        <div class="qrcode">
                            <p>Pay using this QR</p>
                            <br>
                            <img src="/img/QR.jpg" alt="QRCode">
                        </div>
                        <label for="transaction">Transaction<span style="color: red; font-weight: bold;">*</span>
                            :</label>
                        <input type="text" class="input-text" id="transaction" name="transaction"
                            placeholder="Kindly put your payment transaction id here....">

                    </div>
                </div>
                <input type="text" class="input-text" id="approved" name="approved" hidden="true" value="pending">
                <input type="submit" value="Submit and Visit Admin For Payment" class="ultimateSubmit" hidden="true">
            </form>
            <div class="nextStep">
                <button class="Proceed">Proceed</button>
            </div>
            <br>
            <span>Already have an Account ? <a href="/login">Login</a></span>
        </div>
    </div>
</body>
<script>
    /* const username = document.querySelector('#username')
    const password = document.querySelector('#password')
    const firstname = document.querySelector('#firstname')
    const lastname = document.querySelector('#lastname')
    const phone = document.querySelector('#phone')
    const proceed = document.querySelector('.Proceed')
    const beforepayment = document.querySelector('.beforepayment')
    const paymentform = document.querySelector('.paymentform')
    const paymentmode = document.querySelector('#paymentmode')
    const Transactionform = document.querySelector('.Transactionform')
    const ultimateSubmit = document.querySelector('.ultimateSubmit')
    const paid = document.querySelector('#paid')
    const transaction = document.querySelector('#transaction')

    function checkProceed() {
        if (username.value.length == 0 || password.value.length == 0 || firstname.value.length == 0 || lastname.value.length == 0 || phone.value.length == 0) {
            proceed.disabled = true
        } else {
            proceed.disabled = false
        }
    }

    checkProceed()



    const requiredFields = [username, password, firstname, lastname, phone]

    requiredFields.forEach(item => {
        item.addEventListener('input', () => {
            checkProceed()
        })
    })

    proceed.addEventListener('click', () => {
        beforepayment.hidden = beforepayment.hidden ? false : true
        paymentform.hidden = beforepayment.hidden ? false : true
        ultimateSubmit.hidden = ultimateSubmit.hidden ? false : true
        proceed.innerHTML = proceed.innerHTML == "Proceed" ? "Back" : "Proceed"
    })

    paymentmode.addEventListener('input', () => {
        Transactionform.hidden = paymentmode.value == "online" ? false : true
        transaction.required = paymentmode.value == "online" ? true : false
        paid.value = paymentmode.value == "online" ? "paid" : "unpaid"
        ultimateSubmit.value = paymentmode.value == "online" ? "Submit" : "Submit and Visit Admin For Payment"
    })

    const usernameinput = document.querySelector('.usernameinput')
    const trueusername = document.querySelector('.trueusername')
    const falseusername = document.querySelector('.falseusername')
    // const proceed = document.querySelector('.proceed')
    usernameinput.addEventListener('input', () => {
        let username = new URLSearchParams()
        username.append('username', usernameinput.value)
        var uri = "http://localhost:8080/registration/checkusername"
        fetch(uri, {
            method: 'POST',
            body: username,
        })
            .then(response => response.json())
            .then(data => {
                if (data) {
                    console.log(data)
                    trueusername.hidden = false
                    falseusername.hidden = true
                    checkProceed()
                } else {
                    trueusername.hidden = true
                    falseusername.hidden = false
                    proceed.disabled = true
                }
                if (usernameinput.value.length == 0) {
                    trueusername.hidden = true
                    falseusername.hidden = true
                }
            })
            .catch(error => console.error(error))
    }) */
    const getElement = (selector) => document.querySelector(selector); // Helper function to get DOM elements

    const username = getElement('#username');
    const password = getElement('#password');
    const firstname = getElement('#firstname');
    const lastname = getElement('#lastname');
    const email = getElement('#email');
    const phone = getElement('#phone');
    const proceed = getElement('.Proceed');
    const beforepayment = getElement('.beforepayment');
    const paymentform = getElement('.paymentform');
    const paymentmode = getElement('#paymentmode');
    const Transactionform = getElement('.Transactionform');
    const ultimateSubmit = getElement('.ultimateSubmit');
    const paid = getElement('#paid');
    const transaction = getElement('#transaction');
    const usernameinput = getElement('.usernameinput');
    const trueusername = getElement('.trueusername');
    const falseusername = getElement('.falseusername');
    const cross = document.getElementById('cross');
    const tnc = document.querySelector('.terms-and-conditions');
    const tnc_check = document.getElementById('tnc_check');

    var validEmailRegex = /^[a-zA-Z0-9.!#$%&'*+/=?^_`{|}~-]+@[a-zA-Z0-9-]+(?:\.[a-zA-Z0-9-]+)*$/;

    const checkProceed = () => {
        proceed.disabled = !(username.value.length > 0 && !trueusername.hidden && password.value.length > 0 && firstname.value.length > 0 && lastname.value.length > 0 && email.value.length > 0 && email.value.match(validEmailRegex) && phone.value.length > 0 && tnc_check.checked);

        if (proceed.disabled) {
            proceed.style = "filter: brightness(0.7);";
        } else {
            proceed.style = "";
        }
    };

    function togglePassword() {
        var password = document.getElementById("password");
        if (password.type === "password") {
            password.type = "text";
            document.querySelector(".eye").classList.remove('fa-eye');
            document.querySelector(".eye").classList.add('fa-eye-slash');
        } else {
            password.type = "password";
            document.querySelector(".eye").classList.remove('fa-eye-slash');
            document.querySelector(".eye").classList.add('fa-eye');
        }
    }

    checkProceed();

    const requiredFields = [username, password, firstname, lastname, email, phone, tnc_check];

    requiredFields.forEach(item => {
        item.addEventListener('input', checkProceed);
    });

    proceed.addEventListener('click', () => {
        beforepayment.hidden = !beforepayment.hidden;
        paymentform.hidden = !beforepayment.hidden;
        ultimateSubmit.hidden = !ultimateSubmit.hidden;
        proceed.innerHTML = (proceed.innerHTML === "Proceed") ? "Back" : "Proceed";
    });

    paymentmode.addEventListener('input', () => {
        Transactionform.hidden = paymentmode.value !== "online";
        transaction.required = paymentmode.value === "online";
        transaction.value = paymentmode.value === "offline" ? "" : transaction.value
        paid.value = (paymentmode.value === "online") ? "paid" : "unpaid";
        ultimateSubmit.value = (paymentmode.value === "online") ? "Submit" : "Submit and Visit Admin For Payment";
    });

    usernameinput.addEventListener('input', () => {
        let usernameParams = new URLSearchParams();
        usernameParams.append('username', usernameinput.value);
        const uri = "http://localhost:8080/registration/checkusername";
        fetch(uri, {
            method: 'POST',
            body: usernameParams,
        })
            .then(response => response.json())
            .then(data => {
                if (data) {
                    trueusername.hidden = false;
                    falseusername.hidden = true;
                    checkProceed();
                } else {
                    trueusername.hidden = true;
                    falseusername.hidden = false;
                    checkProceed();
                }
                if (usernameinput.value.length === 0) {
                    trueusername.hidden = true;
                    falseusername.hidden = true;
                }
            })
            .catch(error => console.error(error));
    });

    const showTermsAndConditions = () => {
        tnc.classList.toggle('hidden');
        console.log(tnc_check.checked)
    }

    cross.addEventListener('click', (e) => {
        showTermsAndConditions();
    })

    
</script>

</html>