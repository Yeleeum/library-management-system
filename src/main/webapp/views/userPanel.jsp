<!DOCTYPE html>
<html lang="en">
<%@ page import="com.lms.librarymanagementsystem.models.Users" %>
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="/css/user.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css"
        integrity="sha512-iecdLmaskl7CVkqkXNQ/ZH/XLlvWZOJyj7Yy7tcenmpD1ypASozpmT/E0iPtmFIB46ZmdtAc9eNBvH0H/ZpiBw=="
        crossorigin="anonymous" referrerpolicy="no-referrer" />
    <title>user</title>
</head>
<%
    Users user=(Users)request.getAttribute("user");
%>
<body>
    <div class="container">
        <div class="inner-wrapper">
            <div class="sidebar">
                <div class="sidebar-inner-wrapper">
                    <div class="image-container">
                        <img src="/uploads/profilePictures/<%=user.getProfilePicture()%>" alt="">
                    </div>
                    <div class="profile">
                        <div class="profile-dropdown">
                            <span><%=user.getUsername()%></span>
                            <i class="fa-solid fa-caret-down arrow" style="cursor: pointer;"
                                onclick="toggleDropdown()"></i>
                        </div>
                        <div class="hidden-dropdown">
                            <ul>
                                <li><i class="fa-solid fa-user" style="margin-right: 10px;"></i>Account</li>
                                <li>
                                    <form action="/logout" method="post">
                                        <button id="logout"><i class="fa-solid fa-right-from-bracket" style="margin-right: 10px;"></i>Logout</button>
                                    </form>
                                </li>
                            </ul>
                        </div>
                    </div>
                    <div class="user-links">
                        <ul>
                            <li><i class="fa-solid fa-bookmark" style="margin-right: 10px;"></i>Currently Borrowed Books
                            </li>
                            <li><i class="fa-solid fa-book" style="margin-right: 10px;"></i>Previously Borrowed Books
                            </li>
                            <li><i class="fa-solid fa-file-pdf" style="margin-right: 10px;"></i>Downloaded PDF</li>
                            <li><i class="fa-solid fa-id-card-clip" style="margin-right: 10px;"></i>Renew Membership
                            </li>
                            <li><i class="fa-regular fa-id-card" style="margin-right: 10px;"></i>Library Card</li>
                        </ul>
                    </div>
                </div>
            </div>

            <div class="main-container">
                <header class="header">
                    <h2>Library management system</h2>
                    <%@include file="mainSearchComponent.jsp"%>
                    <div class="user-profile-piture">
                        <img src="/uploads/profilePictures/<%=user.getProfilePicture()%>" alt="">
                        <div class="hover-dropdown">
                            <span><i class="fa-solid fa-user" style="margin-right: 10px;"></i>Account</span>
                            <hr>
                            <span id="clickToLogout"><i class="fa-solid fa-right-from-bracket"
                                    style="margin-right: 10px;"></i>Logout</span>
                        </div>
                    </div>
                </header>

                <div class="dismissible-alert shadow-md">
                    <p><strong>welcome Back</strong> <span><%=user.getFirstName()%> <%=user.getLastName()%></span></p>
                    <i class="fa-solid fa-multiply" onclick="hideContainer('dismissible-alert')"></i>
                </div>

                <div class="user-cards">
                    <div class="user-inner-container">
                        <div class="membership-details">
                            <h1>Membership Status</h1>
                            <small class="small-text">Expires on <%=user.getMembershipexpire()%></small>
                            <div class="status">
                                <p>
                                    <span class="fa-solid fa-dot-circle" style="color: rgb(0, 250, 0);"></span>
                                    <span>Active</span>
                                </p>
                            </div>
                        </div>
                        <div class="fine-status">
                            <h1>Fine Status</h1>
                            <small class="small-text"><i class="fa-solid fa-indian-rupee-sign"></i> 654</small>
                            <div class="status">
                                <p>
                                    <span class="fa-solid fa-dot-circle" style="color: rgb(255, 0, 0);"></span>
                                    <span>Due</span>
                                </p>
                            </div>
                        </div>
                    </div>
                    <div class="suggestions">
                        <h1>Suggestions</h1>
                        <div class="card-container">
                            <div class="card">
                                <img src="/uploads/thumbnails/kathakali.png" alt="">
                                <h1>Title</h1>
                                <div class="details">
                                    <h2>Details</h2>
                                    <p>Lorem ipsum dolor sit amet consectetur adipisicing.</p>
                                </div>
                            </div>
                            <div class="card">
                                <img src="/uploads/thumbnails/kathakali.png" alt="">
                                <h1>Title</h1>
                                <div class="details">
                                    <h2>Details</h2>
                                    <p>Lorem ipsum dolor sit amet consectetur adipisicing.</p>
                                </div>
                            </div>
                            <div class="card">
                                <img src="/uploads/thumbnails/kathakali.png" alt="">
                                <h1>Title</h1>
                                <div class="details">
                                    <h2>Details</h2>
                                    <p>Lorem ipsum dolor sit amet consectetur adipisicing.</p>
                                </div>
                            </div>
                            <div class="card">
                                <img src="/uploads/thumbnails/kathakali.png" alt="">
                                <h1>Title</h1>
                                <div class="details">
                                    <h2>Details</h2>
                                    <p>Lorem ipsum dolor sit amet consectetur adipisicing.</p>
                                </div>
                            </div>
                            <div class="card">
                                <img src="/uploads/thumbnails/kathakali.png" alt="">
                                <h1>Title</h1>
                                <div class="details">
                                    <h2>Details</h2>
                                    <p>Lorem ipsum dolor sit amet consectetur adipisicing.</p>
                                </div>
                            </div>
                            <div class="card">
                                <img src="/uploads/thumbnails/kathakali.png" alt="">
                                <h1>Title</h1>
                                <div class="details">
                                    <h2>Details</h2>
                                    <p>Lorem ipsum dolor sit amet consectetur adipisicing.</p>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</body>

<script>
    var clickToLogout = document.querySelector('#clickToLogout');

    const toggleDropdown = () => {
        let dropdown = document.querySelector('.hidden-dropdown > ul');
        let arrow = document.querySelector('.arrow');
        dropdown.style.height = (dropdown.style.height === "auto") ? "0" : "auto";
        arrow.classList.toggle("fa-flip-vertical")
    }

    const hideContainer = (container) => {
        let containerElement = document.querySelector(`.${container}`);
        containerElement.style.display = "none";
    }

    clickToLogout.addEventListener("click", (e) => {
        document.getElementById("logout").click();
    })
</script>

</html>