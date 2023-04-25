<link rel="stylesheet" href="/css/headerComponent.css">
<%@page import="com.lms.librarymanagementsystem.Handlers.SessionHandler"%>
<% if(SessionHandler.getAccessSession(request).equals("admin")) {%>
    <header class="header">
        <div class="header-inner-wrapper">
            <h1>Library Management System</h1>
            <div class="header-right-content">
                <div class="adminAccount">
                    <img src="/img/admin/admin.png" id="adminAccount-icon" alt="">
                    <i class="fa-solid fa-play fa-rotate-270 arrow"></i>
                    <ul class="account-options">
                        <li><a href="/admin"><i class="fa-solid fa-user"></i>&nbsp; Account</a></li>
                        <li>
                            <form action="/logout" method="post" style="width: 100%; display: flex; flex-direction: row; align-items: center; justify-content: flex-start; height: fit-content;" >
                                <i class="fa-solid fa-right-from-bracket"></i> &nbsp;
                                <button style="border: none; background-color: transparent; cursor: pointer;">Logout</button>
                            </form>
                        </li>
                    </ul>
                </div>
            </div>
        </div>
    </header>
<% } else { %>
    <%@ page import="com.lms.librarymanagementsystem.models.Users" %>
    <%Users user=(Users)request.getAttribute("user");%>
    <header class="header">
        <h2>Library management system</h2>
            <div class="user-profile-piture">
                <img src="/uploads/profilePictures/<%=user.getProfilePicture()%>" alt="">
                <form class="hover-dropdown">
                    <button formaction="/user" formmethod="get"><i class="fa-solid fa-user" style="margin-right: 10px;"></i>Account</button>
                    <hr>
                    <button formaction="/logout" formmethod="post"><i class="fa-solid fa-right-from-bracket"
                            style="margin-right: 10px;"></i>Logout</button>
                </form>
            </div>
    </header>
<% } %>