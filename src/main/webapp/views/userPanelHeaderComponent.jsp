<header class="header">
    <h2>Library management system</h2>
    <%@include file="mainSearchComponent.jsp" %>
        <div class="user-profile-piture">
            <img src="/uploads/profilePictures/<%=user.getProfilePicture()%>" alt="">
            <form class="hover-dropdown">
                <button formaction="/user" formmethod="get"><i class="fa-solid fa-user" style="margin-right: 10px;"></i>Account</button>
                <hr>
                <button id="clickToLogout" formaction="/logout" formmethod="post"><i class="fa-solid fa-right-from-bracket"
                        style="margin-right: 10px;"></i>Logout</button>
            </form>
        </div>
</header>