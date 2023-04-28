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
        <div class="alertContainer modal hide">
            <h1 id="myAlertBox" class="message"></h1>
            <button id="close" onclick="clickToRemove()"><i class="fa-solid fa-multiply"></i> Close</button>
            <div id="line"></div>
        </div>
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
                                            <input type="text" id="transaction" name="transaction" placeholder="Enter Transaction ID...">
                                        </div>
                                        <button onclick="postAmount('online')"><i class="fa-solid fa-credit-card"></i> Pay Online</button>
                                    </div>
                                    <div class="offline-payment">
                                        <img src="/img/payment-offline.png" class="admin-payment" alt="offline-payment">
                                        <div class="transaction">
                                            <input style="text-align: center; font-weight: bold;" type="text" id="tid" value="Visit Admin and Pay" readonly>
                                        </div>
                                        <button onclick="postAmount('offline')"><i class="fa-solid fa-wallet"></i> Pay Offline</button>
                                    </div>
                                </div>
                                <div class="nofine">
                                    <img src="/img/thumbsup.gif" style="-webkit-clip-path: polygon(0 0, 96% 0, 97% 100%, 0% 100%);
                                    clip-path: polygon(0 0, 96% 0, 97% 100%, 0% 100%)" alt="">
                                </div>     
                            </div>
                        </div>
                        <!-- <h1 class="message"></h1> -->
                    </div>
                </div>
            </div>
        </div>
    </body>
    
    <script>
        var clickToLogout = document.querySelector('#clickToLogout');
        let message=document.querySelector('.message')

        let paymentOptions=document.querySelector('.payment-options')
        let nofine=document.querySelector('.nofine')

        function hidePaymentOptions(){
            console.log(paymentOptions)
            if(parseInt('<%=fine%>')===0){
                paymentOptions.style.display="none"
                nofine.style.display=""
            } else {
                nofine.style.display="none"
            }
        }

        hidePaymentOptions()
    
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
        let modal = document.querySelector('.modal');

        let amount = parseInt('<%=fine%>');
        function togglePayment(type){
            if(type==='fine'){
                headingfine.hidden=false
                amountfine.hidden=false
                headingrenew.hidden=true
                amountrenew.hidden=true
                amount=parseInt('<%=fine%>')
                hidePaymentOptions()
            }else{
                headingfine.hidden=true
                amountfine.hidden=true
                headingrenew.hidden=false
                amountrenew.hidden=false
                amount=parseInt('<%=renewal%>')+parseInt('<%=fine%>')
                paymentOptions.style.display=""
                nofine.style.display="none"
            }
        }
        
        let transaction = document.querySelector('input[name="transaction"]');
        function postAmount(mode) {
            const formData = new FormData();
            formData.append('transaction', mode==="online"?transaction.value:null);
            formData.append('amount', amount);
            formData.append('paid', mode==="online"?true:false);
            if(amountrenew.hidden){
                fetch('http://localhost:8080/user/payment/fine', {
                    method: 'POST',
                    body: formData
                })
                .then(response => {
                    if (!response.ok) {
                    throw new Error('Network response was not ok');
                    }
                    return response.json();
                })
                .then(data => {
                    console.log(data);
                    modal.classList.remove('hide');
                    message.innerHTML="Your Payment Request is Submitted"
                })
                .catch(error => {
                    console.error('There was a problem with the fetch operation:', error);
                });
            }else{
                fetch('http://localhost:8080/user/payment/renewal', {
                    method: 'POST',
                    body: formData
                })
                .then(response => {
                    if (!response.ok) {
                    throw new Error('Network response was not ok');
                    }
                    return response.json();
                })
                .then(data => {
                    console.log(data);
                    modal.classList.remove('hide');
                    message.innerHTML="Your Payment Request is Submitted"
                })
                .catch(error => {
                    console.error('There was a problem with the fetch operation:', error);
                });
            }
        }

        function clickToRemove() {
            modal.classList.add('hide');
        }

        setTimeout(()=>{
            clickToRemove();
        }, 12000)

    </script>
    
    </html>