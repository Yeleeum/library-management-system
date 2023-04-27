<!DOCTYPE html>
<%@ page import="com.lms.librarymanagementsystem.models.Users" %>
<%@ page import="java.util.List" %>
<html lang="en">
    <head>
        <meta charset="UTF-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <link rel="stylesheet" href="/css/user.css">
        <link rel="stylesheet" href="/css/payment.css">
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css"
            integrity="sha512-iecdLmaskl7CVkqkXNQ/ZH/XLlvWZOJyj7Yy7tcenmpD1ypASozpmT/E0iPtmFIB46ZmdtAc9eNBvH0H/ZpiBw=="
            crossorigin="anonymous" referrerpolicy="no-referrer" />
        <title>user</title>
    </head>
    <% Users user=(Users)request.getAttribute("user"); %>
    <body>
        <div class="container">
            <div class="inner-wrapper">
               <%@include file="userSidebar.jsp"%>
    
                <div class="main-container">
                    <%@include file="userPanelHeaderComponent.jsp"%>
                    <div class="payment-container">
                        <div class="payment-wrapper">
                            <div class="payment-buttons">
                                <button><i class="fa-solid fa-money-check-dollar"></i> Pay Fine</button>
                                <button><i class="fa-solid fa-money-check"></i> Pay Renewal</button>
                            </div>
                            <div class="payment-details">
                                <h3>Your Due Fine is</h3>
                                <h1><i style="font-size: 5rem;" class="fa-solid fa-indian-rupee-sign"></i>100</h1>
                                <form method="post" class="payment-options">
                                    <div class="online-payment">
                                        <img src="/img/QR.jpg" class="Qr_Code" alt="online-payment" />
                                        <div class="transaction">
                                            <input type="text" id="tid" placeholder="Enter Transaction ID...">
                                        </div>
                                        <button formaction=""><i class="fa-solid fa-credit-card"></i> Pay Online</button>
                                    </div>
                                    <div class="offline-payment">
                                        <img src="/img/payment-offline.png" class="admin-payment" alt="offline-payment">
                                        <div class="transaction">
                                            <input style="text-align: center; font-weight: bold;" type="text" id="tid" value="Visit Admin and Pay" readonly>
                                        </div>
                                        <button formaction=""><i class="fa-solid fa-wallet"></i> Pay Offline</button>
                                    </div>
                                </form>
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