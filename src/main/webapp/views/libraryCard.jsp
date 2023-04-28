

<!DOCTYPE html>
<%@ page import="com.lms.librarymanagementsystem.models.Users" %>
<%@ page import="java.util.List" %>
<html lang="en">
    <head>
        <meta charset="UTF-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <link rel="stylesheet" href="/css/user.css">
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css"
            integrity="sha512-iecdLmaskl7CVkqkXNQ/ZH/XLlvWZOJyj7Yy7tcenmpD1ypASozpmT/E0iPtmFIB46ZmdtAc9eNBvH0H/ZpiBw=="
            crossorigin="anonymous" referrerpolicy="no-referrer" />
            <link rel="stylesheet" href="/css/libraryID.css">
        <title>user</title>
    </head>
    <% Users user=(Users)request.getAttribute("user"); %>

    <body>
        <div class="container">
            <div class="inner-wrapper">
               <%@include file="userSidebar.jsp"%>
    
                <div class="main-container">
                    <%@include file="userPanelHeaderComponent.jsp"%>
    
                    <div class="dismissible-alert shadow-md">
                        <p><strong>welcome Back</strong> <span><%=user.getFirstName()%> <%=user.getLastName()%></span></p>
                        <i class="fa-solid fa-multiply" onclick="hideContainer('dismissible-alert')"></i>
                    </div>
                    
                        <div class="IDcontainer" id="myDiv">
                            <div class="main-image">
                                <img src="/img/card.png" style="border-radius: 20px;" alt="">
                            </div>
                            <h1 class="name">Sinchan Nandy</h1>
                            <h1 class="designation">Student</h1>
                            <div class="left-inner-wrapper">
                                <ul>
                                    <li>
                                        <h2>Username: sinchan@2002 </h2>
                                    </li>
                                    <li>
                                        <h2>Email: sinchannandy54@gmail.com </h2>
                                    </li>
                                    <li>
                                        <h2>Phone: 7003512645 </h2>
                                    </li>
                                </ul>
                            </div>
                            <div class="right-inner-wrapper">
                                <img src="/uploads/profilePictures/<%= user.getProfilePicture() %>" alt="">
                            </div>
                            <h1 class="officalname">Library Authorities</h1>

                        </div>
                        <button onclick="downloadImage()" id="btn">Download Image</button>
                    </div>
            </div>
        </div>
    </body>
    
    <script src="https://html2canvas.hertzen.com/dist/html2canvas.min.js"></script>
    <script>
        var clickToLogout = document.querySelector('#clickToLogout');
    
        const toggleDropdown = () => {
            let dropdown = document.querySelector('.hidden-dropdown > ul');
            let arrow = document.querySelector('.arrow');
            dropdown.style.height = (dropdown.style.height === "auto") ? "0" : "auto";
            arrow.classList.toggle("fa-flip-vertical")
        }
    
        const hideContainer = (container) => {
            let containerElement = document.querySelector("." + container);
            containerElement.style.display = "none";
        }
    
        clickToLogout.addEventListener("click", (e) => {
            document.getElementById("logout").click();
        })

        function downloadImage() {
            // Get the div element to be downloaded
            const element = document.getElementById("myDiv");

            // Use html2canvas to convert the div and all its children to a canvas
            html2canvas(element, { useCORS: true, allowTaint: true, scrollX: 0, scrollY: -window.scrollY, scale: 1 }).then(function (canvas) {
                // Create a new image element
                const img = new Image();

                // Set the image source to the canvas data URL
                img.src = canvas.toDataURL("image/png");

                // Create a new download link
                const link = document.createElement('a');
                link.download = 'myImage.png';
                link.href = img.src;

                // Trigger the download
                link.click();
            });
        }

    </script>
    
    </html>