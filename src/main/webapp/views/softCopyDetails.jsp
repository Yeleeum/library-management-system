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
            <link rel="stylesheet" href="/css/pdf.css">
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
                <!--  <i class="fa-solid fa-multiply" id="Cross"></i>
                <div id="object">
                     <object data="/uploads/SoftCopy/<%= softcopy.getFilename() %>#toolbar=0"
                        oncontextmenu="return false;" type="application/pdf">
                        <p>Unable to display PDF file. <a href="/uploads/SoftCopy/<%= softcopy.getFilename() %>"
                                download>Hello</a> instead.</p>
                    </object>
                    <iframe id="myiframe" contextmenu="return false;" src="http://localhost:8080/uploads/SoftCopy/<%= softcopy.getFilename() %>#toolbar=0"></iframe>
                </div> -->
                <div id="buttons">
                    <!-- Navigate to the Previous and Next pages -->
                    <a href="#" class="previous round" id="prev_page">
                        <span class="fas fa-arrow-alt-circle-left"></span>
                    </a>

                    <a href="#" class="next round" id="next_page">
                        <span class="fas fa-arrow-alt-circle-right"></span>
                    </a>
                </div>
                <div class="pdfViewer">
                    <i class="fa-solid fa-multiply" id="Cross"></i>
                    <header id="header">
                        <ul class="navigation">
                            <li class="navigation__item">
                                <!-- Navigate to a specific page -->
                                <input type="number" value="1" style="display: none;" id="current_page" />

                                <!-- Page Info -->
                                Page
                                <span id="page_num"></span>
                                of
                                <span id="page_count"></span>
                            </li>

                            <!-- Zoom In and Out -->
                            <!-- <li class="navigation__item">
                            <a class="zoom" id="zoom_in">
                                <i class="fas fa-search-plus"></i>
                            </a>

                            <a class="zoom" id="zoom_out">
                                <i class="fas fa-search-minus"></i>
                            </a>
                        </li> -->
                        </ul>
                    </header>

                    <!-- Canvas to place the PDF -->
                    <canvas id="canvas" class="canvas__container"></canvas>

                </div>
                <!-- Load PDF.js -->
                <!-- <script src="./pdf.js"></script> -->
                <script src="https://cdnjs.cloudflare.com/ajax/libs/pdf.js/3.5.141/pdf.min.js"
                    integrity="sha512-BagCUdQjQ2Ncd42n5GGuXQn1qwkHL2jCSkxN5+ot9076d5wAI8bcciSooQaI3OG3YLj6L97dKAFaRvhSXVO0/Q=="
                    crossorigin="anonymous" referrerpolicy="no-referrer"></script>


            </div>
        </body>
        <script>
            const pdf = "/uploads/SoftCopy/<%= softcopy.getFilename() %>";

            const pageNum = document.querySelector('#page_num');
            const pageCount = document.querySelector('#page_count');
            const currentPage = document.querySelector('#current_page');
            const previousPage = document.querySelector('#prev_page');
            const nextPage = document.querySelector('#next_page');
            const zoomIn = document.querySelector('#zoom_in');
            const zoomOut = document.querySelector('#zoom_out');
            let mainArea = document.querySelector('.mainArea');
            let pdfViewArea = document.getElementById('pdfViewArea');
            let clickToView = document.getElementById('clickToView');
            let Cross = document.getElementById('Cross');

            const initialState = {
                pdfDoc: null,
                currentPage: 1,
                pageCount: 0,
                zoom: 1,
            };


            clickToView.addEventListener('click', (e) => {
                mainArea.style.display = "none";
                pdfViewArea.style.display = "block"
            });

            Cross.addEventListener('click', (e) => {
                pdfViewArea.style.display = "none"
                mainArea.style.display = "block";
            });

            // Load the document.
            pdfjsLib
                .getDocument(pdf)
                .promise.then((data) => {
                    initialState.pdfDoc = data;
                    console.log('pdfDocument', initialState.pdfDoc);

                    pageCount.textContent = initialState.pdfDoc.numPages;

                    renderPage();
                })
                .catch((err) => {
                    alert(err.message);
                });


            // Render the page.
            const renderPage = () => {
                // Load the first page.
                console.log(initialState.pdfDoc, 'pdfDoc');
                initialState.pdfDoc
                    .getPage(initialState.currentPage)
                    .then((page) => {
                        console.log('page', page);

                        const canvas = document.querySelector('#canvas');
                        const ctx = canvas.getContext('2d');
                        const viewport = page.getViewport({
                            scale: initialState.zoom,
                        });

                        canvas.height = viewport.height;
                        canvas.width = viewport.width;

                        // Render the PDF page into the canvas context.
                        const renderCtx = {
                            canvasContext: ctx,
                            viewport: viewport,
                        };

                        page.render(renderCtx);

                        pageNum.textContent = initialState.currentPage;
                    });
            };

            const showPrevPage = () => {
                if (initialState.pdfDoc === null || initialState.currentPage <= 1)
                    return;
                initialState.currentPage--;
                // Render the current page.
                currentPage.value = initialState.currentPage;
                renderPage();
            };

            const showNextPage = () => {
                if (
                    initialState.pdfDoc === null ||
                    initialState.currentPage >= initialState.pdfDoc._pdfInfo.numPages
                )
                    return;

                initialState.currentPage++;
                currentPage.value = initialState.currentPage;
                renderPage();
            };

            // Button events.
            previousPage.addEventListener('click', showPrevPage);
            nextPage.addEventListener('click', showNextPage);

            // Keypress event.
            currentPage.addEventListener('keypress', (event) => {
                if (initialState.pdfDoc === null) return;
                // Get the key code.
                const keycode = event.keyCode ? event.keyCode : event.which;

                if (keycode === 13) {
                    // Get the new page number and render it.
                    let desiredPage = currentPage.valueAsNumber;
                    initialState.currentPage = Math.min(
                        Math.max(desiredPage, 1),
                        initialState.pdfDoc._pdfInfo.numPages,
                    );

                    currentPage.value = initialState.currentPage;
                    renderPage();
                }
            });

            // Zoom events.
            zoomIn.addEventListener('click', () => {
                if (initialState.pdfDoc === null) return;
                initialState.zoom *= 4 / 3;
                renderPage();
            });

            zoomOut.addEventListener('click', () => {
                if (initialState.pdfDoc === null) return;
                initialState.zoom *= 2 / 3;
                renderPage();
            });
        </script>

        </html>