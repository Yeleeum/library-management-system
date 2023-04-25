<header class="header">
    <h2>Library management system</h2>
    <%@include file="mainSearchComponent.jsp" %>
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