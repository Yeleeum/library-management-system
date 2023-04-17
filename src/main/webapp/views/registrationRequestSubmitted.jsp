<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Document</title>
    <style>
        * {
            margin: 0;
            padding: 0;
            box-sizing: border-box;
            font-family: Arial, Helvetica, sans-serif;
        }

        .view {
            width: 100%;
            /* height: 100%; */
            background-color: #202124;
            color: aliceblue;
            height: 100vh;
            display: flex;
            justify-content: center;
            align-items: center;
            flex-direction: column;
            gap: 5vh;
            padding: 0 5vw;
        }

        .imageContainer {
            width: 350px;
            /* height: 300px; */
            aspect-ratio: 1/1;
            display: flex;
            justify-content: center;
            align-items: center;
            /* box-shadow: rgba(33, 121, 176, 0.25) 0px 50px 100px -10px, rgba(64, 63, 63, 0.3) 0px 30px 60px -20px, rgba(19, 98, 177, 0.35) 0px -2px 6px 0px inset; */
            box-shadow: rgba(28, 51, 225, 0.25) 0px 22px 70px 4px;
            border-radius: 50%;
            overflow: hidden;
        }

        .imageContainer>img {
            object-fit: cover;
            height: 350px;

        }

        h1 {
            text-align: center;
        }

        .redirectEle {
            font-size: 25px;
        }
    </style>
</head>
<% String message=(String) request.getAttribute("message"); %>

    <body>
        <div class="view">
            <div class="imageContainer">
                <img src="/img/sendToAdmin.gif" alt="">
            </div>
            <h1>
                <%=message%>
            </h1>
            <p class="redirectEle">Redirecting to the login page in <span id="redirect">10</span> seconds</p>
        </div>
    </body>
    <script>
        let redirectElement = document.getElementById('redirect');
        let counter = 10;

        setInterval(() => {
            redirectElement.innerText = counter--
        }, 1000)

        setTimeout(() => {
            window.location.href = "http://localhost:8080/login"
        }, 10000)
    </script>
</html>