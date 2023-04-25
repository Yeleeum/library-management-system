<!DOCTYPE html>
<html lang="en">
<%@ page import="com.lms.librarymanagementsystem.models.Users" %>
<%@ page import="com.lms.librarymanagementsystem.models.Fine" %>
<%@ page import="java.util.List" %>
<%@page import="com.lms.librarymanagementsystem.models.SoftCopy"%>
<%@page import="com.lms.librarymanagementsystem.models.Theses"%>
<%@page import="com.lms.librarymanagementsystem.models.Magazines"%>
<%@page import="com.lms.librarymanagementsystem.models.Journals"%>
<%@page import="com.lms.librarymanagementsystem.models.Books"%>
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
    Integer fine=(Integer)request.getAttribute("fine");
    List<Books> books=(List<Books>) request.getAttribute("books");
    List<Journals> journals=(List<Journals>) request.getAttribute("journals");
    List<Magazines> magazines=(List<Magazines>) request.getAttribute("magazines");
    List<Theses> theses=(List<Theses>) request.getAttribute("theses");
    List<SoftCopy> softcopies=(List<SoftCopy>) request.getAttribute("softcopies");

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
                            <h2>Membership Status</h2>
                            <h3>Expires on <%=user.getMembershipexpire()%></h3>
                            <div class="status">
                                <p>
                                   <% if(user.getMembership().equals("active")){%>
                                        <span class="fa-solid fa-dot-circle" style="color: rgb(0, 250, 0);"></span>
                                    <%}else{%>
                                        <span class="fa-solid fa-dot-circle" style="color: rgb(255, 0, 0);"></span>
                                    <%}%>
                                    <span><%=user.getMembership().toUpperCase()%></span>
                                </p>
                            </div>
                        </div>
                        <div class="fine-status">
                            <h2>Fine Status</h2>
                            <h3><i class="fa-solid fa-indian-rupee-sign"></i> <%=fine%></h3>
                            <div class="status">
                                <p>
                                    <% if(fine==0){%>
                                        <span class="fa-solid fa-dot-circle" style="color: rgb(0, 250, 0);"></span>
                                        <span>Clear</span>
                                    <%}else{%>
                                        <span class="fa-solid fa-dot-circle" style="color: rgb(255, 0, 0);"></span>
                                        <span>Due</span>
                                    <%}%>
                                    
                                </p>
                            </div>
                        </div>
                    </div>
                    <div class="suggestions">
                        <h1>Suggestions</h1>
                        
                        <div class="card-container">
                            <% for(Books book : books){ %>
                                <div class="card">
                                    <a href="/search/books/<%= book.getBid() %>" >
                                        <div>
                                            <img src="/uploads/thumbnails/<%=book.getThumbnail()%>" alt="<%= book.getTitle() %>" width="300" height="300">
                                        </div>
                                    </a>
                                    <h1><%= book.getTitle() %></h1>
                                    <div class="details">
                                        <h2>Details</h2>
                                        <p><%= book.getDescription() %></p>
                                    </div>
                                </div>
                            <%}%>
                            <% for(Journals journal : journals){ %>
                                <div class="card">
                                    <a href="/search/journals/<%= journal.getJid() %>" >
                                        <div>
                                            <img src="/uploads/thumbnails/<%=journal.getThumbnail()%>" alt="<%= journal.getTitle() %>" width="300" height="300">
                                        </div>
                                    </a>
                                    <h1><%= journal.getTitle() %></h1>
                                    <div class="details">
                                        <h2>Details</h2>
                                        <p><%= journal.getDescription() %></p>
                                    </div>
                                </div>
                            <%}%>
                            <% for(Theses thesesItem : theses){ %>
                                <div class="card">
                                    <a href="/search/theses/<%= thesesItem.getTid() %>" >
                                        <div>
                                            <img src="/uploads/thumbnails/<%=thesesItem.getThumbnail()%>" alt="<%= thesesItem.getTitle() %>" width="300" height="300">
                                        </div>
                                    </a>
                                    <h1><%= thesesItem.getTitle() %></h1>
                                    <div class="details">
                                        <h2>Details</h2>
                                        <p><%= thesesItem.getDescription() %></p>
                                    </div>
                                </div>
                            <%}%>
                            <% for(Magazines magazine : magazines){ %>
                                <div class="card">
                                    <a href="/search/theses/<%= magazine.getMid() %>" >
                                        <div>
                                            <img src="/uploads/thumbnails/<%=magazine.getThumbnail()%>" alt="<%= magazine.getTitle() %>" width="300" height="300">
                                        </div>
                                    </a>
                                    <h1><%= magazine.getTitle() %></h1>
                                    <div class="details">
                                        <h2>Details</h2>
                                        <p><%= magazine.getDescription() %></p>
                                    </div>
                                </div>
                            <%}%>
                            <% for(SoftCopy softcopy : softcopies){ %>
                                <div class="card">
                                    <a href="/search/theses/<%= softcopy.getSid() %>" >
                                        <div>
                                            <img src="/uploads/thumbnails/<%=softcopy.getThumbnail()%>" alt="<%= softcopy.getTitle() %>" width="300" height="300">
                                        </div>
                                    </a>
                                    <h1><%= softcopy.getTitle() %></h1>
                                    <div class="details">
                                        <h2>Details</h2>
                                        <p><%= softcopy.getDescription() %></p>
                                    </div>
                                </div>
                            <%}%>
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
        let containerElement = document.querySelector("." + container);
        containerElement.style.display = "none";
    }

    clickToLogout.addEventListener("click", (e) => {
        document.getElementById("logout").click();
    })
</script>

</html>