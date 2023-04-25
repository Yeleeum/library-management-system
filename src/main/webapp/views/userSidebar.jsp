<div class="sidebar">
    <div class="sidebar-inner-wrapper">
        <div class="image-container">
            <img src="/uploads/profilePictures/<%=user.getProfilePicture()%>" alt="">
        </div>
        <div class="profile">
            <div class="profile-dropdown">
                <span>
                    <%=user.getUsername()%>
                </span>
                <i class="fa-solid fa-caret-down arrow" style="cursor: pointer;" onclick="toggleDropdown()"></i>
            </div>
            <div class="hidden-dropdown">
                <ul>
                    <li><i class="fa-solid fa-user" style="margin-right: 10px;"></i>Account</li>
                    <li>
                        <form action="/logout" method="post">
                            <button id="logout"><i class="fa-solid fa-right-from-bracket"
                                    style="margin-right: 10px;"></i>Logout</button>
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