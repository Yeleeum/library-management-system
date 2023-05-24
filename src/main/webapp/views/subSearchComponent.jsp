<body>
    <% 
        String searchValue=((String) request.getAttribute("searchValue"))==null?"":(String) request.getAttribute("searchValue");
        String type=(String) request.getAttribute("type");
    %>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css" integrity="sha512-iecdLmaskl7CVkqkXNQ/ZH/XLlvWZOJyj7Yy7tcenmpD1ypASozpmT/E0iPtmFIB46ZmdtAc9eNBvH0H/ZpiBw==" crossorigin="anonymous" referrerpolicy="no-referrer" />
    <section class="headerview">
        
        <p>Choose Type</p>
        <div>
            <button type="submit" name="itemtype" formaction="/search/filter" form="search" value="books">Books</button>
            <button type="submit" name="itemtype" formaction="/search/filter" form="search" value="journals">Journals</button>
            <button type="submit" name="itemtype" formaction="/search/filter" form="search" value="magazines">Magazines</button>
            <button type="submit" name="itemtype" formaction="/search/filter" form="search" value="theses">Theses</button>
            <button type="submit" name="itemtype" formaction="/search/filter" form="search" value="softcopy">SoftCopy</button>
            <%if(type!=null){%>
                <br><br>
                <div class="exclusivfilter">
                    <p>Exclusive filters on <%= type %></p>
                    
                        <%if(type.equals("books")){%>
                            <form action="/search/filter" method="Get" id="book_filter">
                                <div>
                                    <label>Title</label>
                                    <input id="title" name="title" class="filter" type="text" placeholder="Enter Title">
                                
                                    <label>Author</label>
                                    <input id="author" name="author" class="filter" type="text" placeholder="Enter Author">
                                    
                                    <label>Publisher</label>
                                    <input id="publisher" name="publisher" class="filter" type="text" placeholder="Enter Publisher">
                    
                                    <label>Category</label>
                                    <input id="category" name="category" class="filter" type="text" placeholder="Enter Category">
                    
                                    <label>Keywords</label>
                                    <input id="keywords" name="keywords" class="filter" type="text" placeholder="Enter Keywords">
                    
                                    <label>Edition</label>
                                    <input id="edition" name="edition" class="filter" type="text" placeholder="Enter Edition">
                                    
                                    <input id="edition" name="itemtype" class="filter" type="text" value="<%=type%>" hidden>
            
                                    <button type="submit" form="book_filter">Apply Filter</button>
                                </div>
                            </form>
                        <%}else if(type.equals("journals")){%>
                            <form action="/search/filter" method="Get" id="journals_filter">
                                <div>
                                    <label>Title</label>
                                    <input id="title" name="title" class="filter" type="text" placeholder="Enter Title">
                                
                                    <label>Publisher</label>
                                    <input id="publisher" name="publisher" class="filter" type="text" placeholder="Enter Publisher">
                    
                                    <label>Editor</label>
                                    <input id="editor" name="editor" class="filter" type="text" placeholder="Enter Editor">
                                    
                                    <label>Category</label>
                                    <input id="category" name="category" class="filter" type="text" placeholder="Enter Category">
                                    
                                    <label>Keywords</label>
                                    <input id="keywords" name="keywords" class="filter" type="text" placeholder="Enter Keywords">
                                    
                                    <label>Start Year</label>
                                    <input id="startyear" name="startyear" class="filter" type="text" placeholder="Enter Start Year">
                    
                                    <label>End Year</label>
                                    <input id="endyear" name="endyear" class="filter" type="text" placeholder="Enter End Year">
                                    <input id="edition" name="itemtype" class="filter" type="text" value="<%=type%>" hidden>
                                    <button type="submit" form="journals_filter">Apply Filter</button>
                                </div>
                            </form>
                        <%}else if(type.equals("magazines")){%>
                            <form action="/search/filter" method="Get" id="magazine_filter">
                                <div>
                                    <label>Title</label>
                                    <input id="title" name="title" class="filter" type="text" placeholder="Enter Title">
                                
                                    <label>Publisher</label>
                                    <input id="publisher" name="publisher" class="filter" type="text" placeholder="Enter Publisher">
                    
                                    <label>Issue Date</label>
                                    <input id="issuedate" name="issuedate" class="filter" type="text" placeholder="Enter Issue Date">
                                    
                                    <label>Issue Number</label>
                                    <input id="issuenumber" name="issuenumber" class="filter" type="text" placeholder="Enter Issue Number">
                                    
                                    <label>Frequency</label>
                                    <input id="frequency" name="frequency" class="filter" type="text" placeholder="Enter Frequency">
                                    
                                    <label>Keywords</label>
                                    <input id="keywords" name="keywords" class="filter" type="text" placeholder="Enter Keywords">
                    
                                    <label>Special Issue</label>
                                    <input id="specialissue" name="specialissue" class="filter" type="text" placeholder="Enter Special Issue">
                                    
                                    <label>Category</label>
                                    <input id="category" name="category" class="filter" type="text" placeholder="Enter Category">
                                    <input id="edition" name="itemtype" class="filter" type="text" value="<%=type%>" hidden>
                                    
                                    <button type="submit" form="magazine_filter">Apply Filter</button>
                                </div>
                            </form>
                        <%}else if(type.equals("theses")){%>
                            <form action="/search/filter" method="Get" id="theses_filter">
                                <div>
                                    <label>Title</label>
                                    <input id="title" name="title" class="filter" type="text" placeholder="Enter Title">
                                
                                    <label>Researcher</label>
                                    <input id="researcher" name="researcher" class="filter" type="text" placeholder="Enter Researcher">
                    
                                    <label>Guides</label>
                                    <input id="guides" name="guides" class="filter" type="text" placeholder="Enter Guides">
                                    
                                    <label>Category</label>
                                    <input id="category" name="category" class="filter" type="text" placeholder="Enter Category">
                                    
                                    <label>Keywords</label>
                                    <input id="keywords" name="keywords" class="filter" type="text" placeholder="Enter Keywords">
                                    
                                    <label>Complete Date</label>
                                    <input id="completedate" name="completedate" class="filter" type="text" placeholder="Enter Complete Date">
                    
                                    <label>Place</label>
                                    <input id="place" name="place" class="filter" type="text" placeholder="Enter Place">
                                    <input id="edition" name="itemtype" class="filter" type="text" value="<%=type%>" hidden>
            
                                    <button type="submit" form="theses_filter">Apply Filter</button>
                                </div>
                            </form>
                        <%}else if(type.equals("softcopy")){%>
                            <form action="/search/filter" method="Get" id="softcopy_filter" >
                                <div>
                                    <label>Title</label>
                                    <input id="title" name="title" class="filter" type="text" placeholder="Enter Title">
                                
                                    <label>Owner</label>
                                    <input id="owner" name="owner" class="filter" type="text" placeholder="Enter Owner">
                    
                                    <label>Publisher</label>
                                    <input id="publisher" name="publisher" class="filter" type="text" placeholder="Enter Publisher">
                                    
                                    <label>Category</label>
                                    <input id="category" name="category" class="filter" type="text" placeholder="Enter Category">
                                    
                                    <label>Keywords</label>
                                    <input id="keywords" name="keywords" class="filter" type="text" placeholder="Enter Keywords">
                                    <input id="edition" name="itemtype" class="filter" type="text" value="<%=type%>" hidden>
            
                                    <button type="submit" form="softcopy_filter">Apply Filter</button>
                                </div>
                            </form>
                        <%}%>
                </div>
            <%}%>
        </div>
        <br>
        <div class="filter">
            <p>Filters</p>
            <div>
                <button type="submit" formaction="/search/author" form="search">Author</button>
                <button type="submit" formaction="/search/researcher" form="search">Researcher</button>
                <button type="submit" formaction="/search/editor" form="search">Editor</button>
                <button type="submit" formaction="/search/owner" form="search">Owner</button>
                <button type="submit" formaction="/search/publisher" form="search">Publisher</button>
                <button type="submit" formaction="/search/category" form="search">Category</button>
                <button type="submit" formaction="/search/title" form="search">Title</button>
            </div>
        </div>
    </section>
</body>