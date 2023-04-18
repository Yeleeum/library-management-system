<!DOCTYPE html>
<html lang="en">
    <%@page import="com.lms.librarymanagementsystem.models.Registration"%>
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
%>
<body>
    <div class="container">
        <div class="leftContainer" id="sidebar">
            <div class="sidebar-inner-wrapper">
                <div class="logo">
                    <!-- goes organisation logo -->
                    <img src="/img/admin/mmcc.jpg" alt="organisation-logo">
                </div>

                <div class="links">
                    <ul class="inner-links">
                        <li>Dashboard</li>
                        <li>Borrowed Books</li>
                        <li>Returned Books</li>
                        <li>
                            <div class="sublinks-Container">
                                <span>Manage Registrations</span>
                                <i class="fa-solid fa-angle-down" id="clickToExpand"></i>
                            </div>
                            <ul id="sublinks" class="submenulinks">
                                <li>Paid</li>
                                <li>UnPaid</li>
                            </ul>
                        </li>
                        <li>Manage Renewals</li>
                        <li>
                            <div class="sublinks-Container">
                                <span>Forms</span>
                                <i class="fa-solid fa-angle-down" id="clickToExpand"></i>
                            </div>
                            <ul id="sublinks" class="submenulinks">
                                <li>Form 1</li>
                                <li>Form 2</li>
                                <li>Form 3</li>
                                <li>Form 4</li>
                            </ul>
                        </li>
                        <li>
                            <div class="sublinks-Container">
                                <span>Edit Items</span>
                                <i class="fa-solid fa-angle-down" id="clickToExpand"></i>
                            </div>
                            <ul id="sublinks" class="submenulinks">
                                <li>Edit 1</li>
                                <li>Edit 2</li>
                                <li>Edit 3</li>
                                <li>Edit 4</li>
                            </ul>
                        </li>
                        <li>Manage Donations</li>
                    </ul>
                </div>
            </div>
        </div>
        <!-- sidebar ends -->

        <div class="rightContainer">
            <!-- Admin Panel header -->
            <header class="header">
                <div class="header-inner-wrapper">
                    <h1>Library Management System</h1>
                    <div class="header-right-content">
                        <div class="notifications">
                            <i class="fa-solid fa-bell" id="notifications-icon"></i>
                            <span id="notifications-dot"></span>
                            <div class="notifications-area">
                                <div id="notifications-content">
                                    Lorem ipsum dolor sit amet consectetur, adipisicing elit. Quis cumque itaque
                                </div>
                                <div id="notifications-content">
                                    Lorem ipsum dolor sit amet consectetur, adipisicing elit. Quis cumque itaque
                                </div>
                                <div id="notifications-content">
                                    Lorem ipsum dolor sit amet consectetur, adipisicing elit. Quis cumque itaque
                                </div>
                                <div id="notifications-content">
                                    Lorem ipsum dolor sit amet consectetur, adipisicing elit. Quis cumque itaque
                                </div>
                            </div>
                        </div>
                        <div class="adminAccount">
                            <img src="/img/admin/admin.png" id="adminAccount-icon" alt="">
                            <i class="fa-solid fa-play fa-rotate-270 arrow"></i>
                            <ul class="account-options">
                                <li><a href=""><i class="fa-solid fa-user"></i> Account</a></li>
                                <li>
                                    <form action="/logout" method="post">
                                        <button style="border: none; background-color: transparent; cursor: pointer;"><i class="fa-solid fa-right-from-bracket"></i> Logout</button>
                                    </form>
                                </li>
                            </ul>
                        </div>
                    </div>
                </div>
            </header>

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
                                <h1>8</h1>
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
                            <!-- <tr>
                                <td>ayushSingh123</td>
                                <td>Ayush</td>
                                <td>Singh</td>
                                <td>Male</td>
                                <td>6291769942</td>
                                <td>ayush@gmail.com</td>
                                <td>Book</td>
                                <td>
                                    <button class="btn btn-red">
                                        Unpaid
                                    </button>
                                </td>
                            </tr>
                            <tr>
                                <td>sinchanNandi</td>
                                <td>Sinchan</td>
                                <td>Nandi</td>
                                <td>Male</td>
                                <td>1234567891</td>
                                <td>sinchan@gmail.com</td>
                                <td>Journal</td>
                                <td>
                                    <button class="btn btn-green">
                                        Paid
                                    </button>
                                </td>
                            </tr>
                            <tr>
                                <td>MayaBoudi123</td>
                                <td>Maya</td>
                                <td>Boudi</td>
                                <td>Female</td>
                                <td>4736327883</td>
                                <td>maya.boudi@gmail.com</td>
                                <td>magazine</td>
                                <td>
                                    <button class="btn btn-green">
                                        Paid
                                    </button>
                                </td>
                            </tr>
                            <tr>
                                <td>Biswajit@123</td>
                                <td>Biswajit</td>
                                <td>Saha</td>
                                <td>Male</td>
                                <td>7388278822</td>
                                <td>AndreaBiswa@gmail.com</td>
                                <td>theses</td>
                                <td>
                                    <button class="btn btn-red">
                                        Unpaid
                                    </button>
                                </td>
                            </tr>
                            <tr>
                                <td>AhanaBacchu100</td>
                                <td>Ahana</td>
                                <td>Munna</td>
                                <td>Male</td>
                                <td>8745324576</td>
                                <td>souhana@gmail.com</td>
                                <td>100men</td>
                                <td>
                                    <button class="btn btn-green">
                                        Paid
                                    </button>
                                </td>
                            </tr> -->
                            <%}%>
                        </table>
                        <a href="/admin/viewpending/paid" class="btn">
                            view all
                        </a>
                    </div>
                </div>
            </main>
        </div>
    </div>
</body>
<script>  
    let clickToExpand = Array.from(document.querySelectorAll('#clickToExpand'));
    let collapseMenu = Array.from(document.querySelectorAll(".submenulinks"));
    var isExpanded = Array(collapseMenu.length).fill(false);
    var collapseActionCombine = clickToExpand.map((clickToExpand, index) => {
        return [clickToExpand, collapseMenu[index], isExpanded[index]]
    })

    collapseActionCombine.forEach(Element => {
        Element[0].addEventListener("click", (e) => {
            Element[1].style = Element[2] ? "" : "overflow: visible";
            Element[1].style = Element[2] ? "" : "height: fit-content";
            Element[2] = !Element[2];
            Element[2] ? Element[0].classList.replace("fa-angle-down", "fa-angle-up") : Element[0].classList.replace("fa-angle-up", "fa-angle-down");

            collapseActionCombine.forEach(element => {
                if (element != Element) {
                    element[1].style = "";
                    element[1].style = "";
                    element[2] = false;
                    element[2] ? element[0].classList.replace("fa-angle-down", "fa-angle-up") : element[0].classList.replace("fa-angle-up", "fa-angle-down");
                }
            })
        })
    })
</script>

</html>



<!-- <!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Document</title>
</head>

<body>
    <form action="/logout" method="post">
        <button>Log Out</button>
    </form>
</body>

</html> -->