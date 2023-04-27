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
    <% Integer fine=(Integer)request.getAttribute("fine"); %>
    <% Integer renewal=(Integer)request.getAttribute("renewal"); %>
    <body>
        <div class="container">
            <div class="inner-wrapper">
               <%@include file="userSidebar.jsp"%>
    
                <div class="main-container">
                    <%@include file="userPanelHeaderComponent.jsp"%>
                    <div class="payment-container">
                        <div class="payment-wrapper">
                            <div class="payment-buttons">
                                <button onclick="togglePayment('fine')"><i class="fa-solid fa-money-check-dollar"></i> Pay Fine</button>
                                <button onclick="togglePayment('renwal')"><i class="fa-solid fa-money-check"></i> Pay Renewal</button>
                            </div>
                            <div class="payment-details">
                                <h3 class="headingfine">Your Due Fine is</h3>
                                <h1 class="amountfine" <%if(fine==0){%>style="color:green"<%}%>><i style="font-size: 5rem;" class="fa-solid fa-indian-rupee-sign"></i><%=fine%></h1>
                                <h3 class="headingrenew" hidden>Renewal Amount is</h3>
                                <h1 class="amountrenew" hidden><i style="font-size: 5rem;" class="fa-solid fa-indian-rupee-sign"></i><%=renewal%><%if(fine>0){%><sup style="font-size: 25px;">+ <i class="fa-solid fa-indian-rupee-sign"></i> <%=fine%> (Due Fine)</sup><%}%></h1>
                                <div class="payment-options">
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
            let containerElement = document.querySelector("." + container);
            containerElement.style.display = "none";
        }

        clickToLogout.addEventListener("click", (e) => {
            document.getElementById("logout").click();
        })

        let headingfine=document.querySelector('.headingfine')
        let amountfine=document.querySelector('.amountfine')
        let headingrenew=document.querySelector('.headingrenew')
        let amountrenew=document.querySelector('.amountrenew')

        function togglePayment(type){
            if(type==='fine'){
                headingfine.hidden=false
                amountfine.hidden=false
                headingrenew.hidden=true
                amountrenew.hidden=true
            }else{
                headingfine.hidden=true
                amountfine.hidden=true
                headingrenew.hidden=false
                amountrenew.hidden=false
            }
        }

    </script>
    
    </html>