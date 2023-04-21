<!DOCTYPE html>
<html lang="en">
    <%@page import="com.lms.librarymanagementsystem.models.Registration"%>
    <%@page import="com.lms.librarymanagementsystem.models.Borrow"%>
    <%@page import="java.util.List"%>
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Admin Dashboard</title>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css"
        integrity="sha512-iecdLmaskl7CVkqkXNQ/ZH/XLlvWZOJyj7Yy7tcenmpD1ypASozpmT/E0iPtmFIB46ZmdtAc9eNBvH0H/ZpiBw=="
        crossorigin="anonymous" referrerpolicy="no-referrer" />
    <link rel="stylesheet" href="/css/admin.css">
</head>
<%
        List<Registration> registrations=(List<Registration>)request.getAttribute("registrations");
        int noOfRegistrations=(int)request.getAttribute("noOfRegistrations");
        int noOfPendingBorrow=(int)request.getAttribute("noOfPendingBorrow");
        
%>
<body>
    <div class="container">
        <%@ include file="adminPanelLeftSidePanelComponent.jsp"%>
        <!-- sidebar ends -->

        <div class="rightContainer">
            <!-- Admin Panel header -->
            <%@include file="adminPanelHeaderComponent.jsp"%>

            <!-- Admin Panel Details -->
            <!-- 
                * Pending Registrations
                * Users Enrolled today
                * today Borrowed Books
                * today returned Books
                * pending borrowed requests
                * pending return requests
             -->
            <main>
                <div class="breadCrumbs">
                    <p>
                        <a href="#">Home</a>
                        <i class="fa-solid fa-angle-right"></i>
                        <span>Dashboard</span>
                    </p>
                </div>

                <div class="details">
                    <div class="detail-inner-wrapper">
                        <!-- details mentioned above -->

                        <div class="details-card">
                            <div>
                                <img src="/img/admin/pending.png" class="icons" alt="">
                            </div>
                            <div>
                                <h1><%=noOfRegistrations%></h1>
                                <p>Pending Registrations</p>
                            </div>
                        </div>

                        <div class="details-card">
                            <div>
                                <img src="/img/admin/borrow.png" class="icons" alt="">
                            </div>
                            <div>
                                <h1><%=noOfPendingBorrow%></h1>
                                <p>Pending Borrows</p>
                            </div>
                        </div>

                        <div class="details-card">
                            <div>
                                <img src="/img/admin/return.png" class="icons" alt="">
                            </div>
                            <div>
                                <h1>10</h1>
                                <p>Pending Returns</p>
                            </div>
                        </div>

                        <div class="details-card">
                            <div>
                                <img src="/img/admin/user.png" class="icons" alt="">
                            </div>
                            <div>
                                <h1>15</h1>
                                <p>Pending Renewals</p>
                            </div>
                        </div>

                    </div>
                </div>

                <div class="registrations">
                    <div class="registrations-inner-wrapper">
                        <h1>New Registrations</h1>
                        <table class="registrations">
                            <tr>
                                <th>USERNAME</th>
                                <th>FIRSTNAME</th>
                                <th>LASTNAME</th>
                                <th>GENDER</th>
                                <th>PHONE</th>
                                <th>EMAIL</th>
                                <th>CATEGORY</th>
                                <th>PAID</th>
                            </tr>
                            <% if( !(registrations == null || registrations.isEmpty()) ) { %>
                                <%for(Registration registration:registrations){%>
                                <tr>
                                <td><%=registration.getUsername()%></td>
                                <td><%=registration.getFirstName()%></td>
                                <td><%=registration.getLastName()%></td>
                                <td><%=registration.getGender()%></td>
                                <td><%=registration.getPhone()%></td>
                                <td><%=registration.getEmail()%></td>
                                <td><%=registration.getCategory()%></td>
                                <td>
                                    <button class='btn btn-<%=registration.getPaid().equals("paid")?"green":"red"%>'>
                                        <%=registration.getPaid()%>
                                    </button>
                                </td>
                            </tr>
                            <%}%>
                            <% } else { %>
                                <td colspan="8" style="text-align: left; font-weight: bolder; color: rgb(214, 6, 6);">No Data Found!</td>
                            <% } %>
                        </table>
                        <br>
                        <a style="margin-right: 10px;" href="/admin/viewpending/paid" class="btn">
                            View all Paid 
                        </a> 
                        <a href="/admin/viewpending/unpaid" class="btn">
                            View all Unpaid
                        </a>
                    </div>
                </div>
            </main>
        </div>
    </div>
</body>
<script src="/js/adminPanel.js"></script>

</html>
