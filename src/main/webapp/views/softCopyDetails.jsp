<!DOCTYPE html>
<%@page import="com.lms.librarymanagementsystem.models.*" %>
    <%@page import="java.util.List" %>
        <html lang="en">

        <head>
            <meta charset="UTF-8">
            <title>Book Details Page</title>
            <link rel="stylesheet" href="/css/style.css">
            <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css"
                integrity="sha512-iecdLmaskl7CVkqkXNQ/ZH/XLlvWZOJyj7Yy7tcenmpD1ypASozpmT/E0iPtmFIB46ZmdtAc9eNBvH0H/ZpiBw=="
                crossorigin="anonymous" referrerpolicy="no-referrer" />
        </head>

        <body>
            <div class="mainArea">
                <% SoftCopy softcopy=(SoftCopy) request.getAttribute("softcopy"); %>
                    <header style="width: 100%; display: flex; justify-content: space-between; align-items: center;">
                        <h1>SoftCopy Details</h1>
                        <%@include file="mainSearchComponent.jsp" %>
                    </header>

                    <div class="book-details">
                        <img src="/uploads/thumbnails/book.jpg" alt="Book Cover">
                        <div>
                            <h2>
                                <%= softcopy.getTitle() %>
                            </h2>
                            <p>Publisher: <%= softcopy.getPublisher() %>
                            </p>
                            <p>Owner: <%= softcopy.getOwner() %>
                            </p>
                            <p>Page No: <%= softcopy.getPageno() %>
                            </p>

                            <div>
                                <button id="clickToView">View Pdf</button>
                                <a href="/uploads/SoftCopy/<%= softcopy.getFilename() %>" download=""><button>Download
                                        Pdf</button></a>
                            </div>
                        </div>
                    </div>
                    <div class="description">
                        <h1><u>Description</u></h1>
                        <div class="descArea" readonly>
                            <%= softcopy.getDescription() %>

                                <pre>#<%= softcopy.getKeywords() %></pre>
                        </div>
                    </div>
            </div>
            <div id="pdfViewArea">
                <i class="fa-solid fa-multiply" id="Cross"></i>
                <div id="object">
                    <!-- <object data="/uploads/SoftCopy/<%= softcopy.getFilename() %>#toolbar=0"
                        oncontextmenu="return false;" type="application/pdf">
                        <p>Unable to display PDF file. <a href="/uploads/SoftCopy/<%= softcopy.getFilename() %>"
                                download>Hello</a> instead.</p>
                    </object> -->
                    <iframe id="myiframe" contextmenu="return false;" src="http://localhost:8080/uploads/SoftCopy/<%= softcopy.getFilename() %>#toolbar=0"></iframe>
                </div>
            </div>
        </body>
        <script>
            let mainArea = document.querySelector('.mainArea');
            let pdfViewArea = document.getElementById('pdfViewArea');
            let ObjectElement = document.getElementById('object');
            let clickToView = document.getElementById('clickToView');
            let iframecontent = document.getElementById('myiframe').contentWindow.document;
            let Cross = document.getElementById('Cross');

            console.log(iframecontent)

            // document.onmousedown = disableRightclick;
            // var message = "Right click not allowed !!";
            // function disableRightclick(evt) {
            //     if (evt.button == 2) {
            //         alert(message);
            //         return false;
            //     }
            // }
            // window.onload = function() {
            //     document.addEventListener("contextmenu", function(e) {
            //         e.preventDefault();
            //     }, false);
            // }

            

            clickToView.addEventListener('click', (e) => {
                mainArea.style.display = "none";
                pdfViewArea.style.display = "block"
            });

            Cross.addEventListener('click', (e) => {
                pdfViewArea.style.display = "none"
                mainArea.style.display = "block";
            });

            ObjectElement.addEventListener('contextmenu', (e) => {
                e.preventDefault();
            })

        </script>

        </html>