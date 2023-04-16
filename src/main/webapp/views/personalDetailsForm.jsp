<!DOCTYPE html>
<html>

<head>
    <title>User Registration Form</title>
</head>


<body>
    <h1>User Registration Form</h1>
    <form action="/registration/submitregister" method="post" enctype="multipart/form-data">
        <div class="beforepayment">
            <label for="username">Username:</label>
            <input type="text" placeholder="Enter Username" class="usernameinput" id="username" name="username"
                required>
            <h3 class="trueusername" hidden="true">You can use this username</h3>
            <h3 class="falseusername" hidden="true">Username already in use</h3> <br>
            <label for="password">Password:</label>
            <input type="password" id="password" name="password" required>
            <br>
            <label for="profilepicture">Profile Picture:</label>
            <input type="file" id="profilepicture" name="profilepicturefile">
            <br>
            <label for="firstname">First Name:</label>
            <input type="text" id="firstname" name="firstName" required>
            <br>
            <label for="lastname">Last Name:</label>
            <input type="text" id="lastname" name="lastName" required>
            <br>
            <label for="gender">Gender:</label>
            <select id="gender" name="gender">
                <option value="male">Male</option>
                <option value="female">Female</option>
                <option value="other">Other</option>
            </select>
            <br>
            <label for="dob">Date of Birth:</label>
            <input type="date" id="dob" name="dob">
            <br>
            <label for="phone">Phone:</label>
            <input type="text" id="phone" name="phone" required>
            <br>
            <label for="email">Email:</label>
            <input type="email" id="email" name="email" required>
            <br>
            <label for="category">Category:</label>
            <select id="category" name="category">
                <option value="student">Student</option>
                <option value="teacher">Teacher</option>
                <option value="researcher">Researcher</option>
                <option value="regular" selected>Regular</option>
            </select>
        </div>
        <br>
        <div class="paymentform" hidden>
            <label for="paymentmode">Payment Mode</label>
            <select id="paymentmode" name="paymentmode">
                <option value="online">online</option>
                <option value="offline" selected>offline</option>
            </select>
            <br>
            <input type="text" id="paid" name="paid" value="unpaid" hidden>
            <br>
            <div class="Transactionform" hidden>
                <label for="transaction">Transaction:</label>
                <input type="text" id="transaction" name="transaction">
                <br>
            </div>
        </div>
        <input type="text" id="approved" name="approved" hidden="true" value="pending">
        <input type="submit" value="Submit and Visit Admin For Payment" class="ultimateSubmit" hidden="true">
    </form>
    <button class="Proceed">Proceed</button>
</body>
<script>
    // const username = document.querySelector('#username')
    // const password = document.querySelector('#password')
    // const firstname = document.querySelector('#firstname')
    // const lastname = document.querySelector('#lastname')
    // const phone = document.querySelector('#phone')
    // const proceed = document.querySelector('.Proceed')
    // const beforepayment = document.querySelector('.beforepayment')
    // const paymentform = document.querySelector('.paymentform')
    // const paymentmode = document.querySelector('#paymentmode')
    // const Transactionform = document.querySelector('.Transactionform')
    // const ultimateSubmit = document.querySelector('.ultimateSubmit')
    // const paid = document.querySelector('#paid')
    // const transaction = document.querySelector('#transaction')

    // function checkProceed() {
    //     if (username.value.length == 0 || password.value.length == 0 || firstname.value.length == 0 || lastname.value.length == 0 || phone.value.length == 0) {
    //         proceed.disabled = true
    //     } else {
    //         proceed.disabled = false
    //     }
    // }

    // checkProceed()



    // const requiredFields = [username, password, firstname, lastname, phone]

    // requiredFields.forEach(item => {
    //     item.addEventListener('input', () => {
    //         checkProceed()
    //     })
    // })

    // proceed.addEventListener('click', () => {
    //     beforepayment.hidden = beforepayment.hidden ? false : true
    //     paymentform.hidden = beforepayment.hidden ? false : true
    //     ultimateSubmit.hidden = ultimateSubmit.hidden ? false : true
    //     proceed.innerHTML = proceed.innerHTML == "Proceed" ? "Back" : "Proceed"
    // })

    // paymentmode.addEventListener('input', () => {
    //     Transactionform.hidden = paymentmode.value == "online" ? false : true
    //     transaction.required = paymentmode.value == "online" ? true : false
    //     paid.value = paymentmode.value == "online" ? "paid" : "unpaid"
    //     ultimateSubmit.value = paymentmode.value == "online" ? "Submit" : "Submit and Visit Admin For Payment"
    // })

    // const usernameinput = document.querySelector('.usernameinput')
    // const trueusername = document.querySelector('.trueusername')
    // const falseusername = document.querySelector('.falseusername')
    // // const proceed = document.querySelector('.proceed')
    // usernameinput.addEventListener('input', () => {
    //     let username = new URLSearchParams()
    //     username.append('username', usernameinput.value)
    //     var uri = "http://localhost:8080/registration/checkusername"
    //     fetch(uri, {
    //         method: 'POST',
    //         body: username,
    //     })
    //         .then(response => response.json())
    //         .then(data => {
    //             if (data) {
    //                 console.log(data)
    //                 trueusername.hidden = false
    //                 falseusername.hidden = true
    //                 checkProceed()
    //             } else {
    //                 trueusername.hidden = true
    //                 falseusername.hidden = false
    //                 proceed.disabled = true
    //             }
    //             if (usernameinput.value.length == 0) {
    //                 trueusername.hidden = true
    //                 falseusername.hidden = true
    //             }
    //         })
    //         .catch(error => console.error(error))
    // })
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

    var validEmailRegex = /^[a-zA-Z0-9.!#$%&'*+/=?^_`{|}~-]+@[a-zA-Z0-9-]+(?:\.[a-zA-Z0-9-]+)*$/;

    const checkProceed = () => {
        proceed.disabled = !(username.value.length > 0 && password.value.length > 0 && firstname.value.length > 0 && lastname.value.length > 0 && email.value.length> 0 && email.value.match(validEmailRegex) && phone.value.length > 0);
    };

    checkProceed();

    const requiredFields = [username, password, firstname, lastname,email, phone];

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
                    proceed.disabled = true;
                }
                if (usernameinput.value.length === 0) {
                    trueusername.hidden = true;
                    falseusername.hidden = true;
                }
            })
            .catch(error => console.error(error));
    });

</script>

</html>