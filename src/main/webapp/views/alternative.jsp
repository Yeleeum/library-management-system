<!DOCTYPE html>
<%@page import="com.lms.librarymanagementsystem.models.Books"%>
<%@page import="java.util.List"%>
<%@page import="com.lms.librarymanagementsystem.models.Registration"%>
<html>
<head>
	<title>Books</title>
	<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css"
	integrity="sha512-iecdLmaskl7CVkqkXNQ/ZH/XLlvWZOJyj7Yy7tcenmpD1ypASozpmT/E0iPtmFIB46ZmdtAc9eNBvH0H/ZpiBw=="
	crossorigin="anonymous" referrerpolicy="no-referrer" />
	<link rel="stylesheet" href="/css/forms/books.css">
	<link rel="stylesheet" href="/css/admin.css">
	
</head>
<%
        List<Registration> registrations=(List<Registration>)request.getAttribute("registrations");
        Integer noOfRegistrations=(Integer)request.getAttribute("noOfRegistrations");
%>
<body>
	<% String itid = (String) request.getAttribute("itid"); %>
	<% String activity=(String) request.getAttribute("activity"); %>
	<% List<String> sids=(List<String>) request.getAttribute("sids"); %>
	<section class="mainContainer">
	<%@include file="adminPanelLeftSidePanelComponent.jsp"%>
	<div class="rightContainer">
		<%@include file="adminPanelHeaderComponent.jsp"%>
		<div class="breadCrumbs" style="margin-left:30px;">
			<p>
				<a href="#">Home</a>
				<i class="fa-solid fa-angle-right"></i>
				<span>Dashboard</span>
				<% if(activity.equals("edit")) { %>
					<i class="fa-solid fa-angle-right"></i>
					<span>Edit Items</span>
					<i class="fa-solid fa-angle-right"></i>
					<span>Edit Alternative</span>
					<i class="fa-solid fa-angle-right"></i>
					<span><%= (itid == null) ? null : itid %></span>
				<%}else{%>
					<i class="fa-solid fa-angle-right"></i>
					<span>Add Items</span>
					<i class="fa-solid fa-angle-right"></i>
					<span>Add Alternative</span>
				<%}%>
			</p>
		</div>
		<form action='/admin<%=activity.equals("edit")?"/edit/books":"/addbook"%>' method="POST" enctype="multipart/form-data" class="bookForm">
		<div class="right-container">
			<% if(activity.equals("edit")) { %>
				<input type="number" hidden id="bid" name="bid" value='<%= (book == null) ? null : book.getBid() %>'>
			<% }else{ %>
                <label for="itid">ITID:</label>
                <input type="text" id="itid" name="itid" required>

                <label for="sid">SID:</label>
                <input type="text" id="sid" name="sid" required>
            <%}%>
			<input type="submit" value='<%= activity.equals("edit") ? "Update" : "Submit" %>'>
		</div>
	</form>
    <button >ADD ANOTHER SOFTCOPY</button>
</div>
</section>
</body>
<script src="/js/imagehandler.js"></script>
<script src="/js/adminPanel.js"></script>
<script>
    let container=document.querySelector(".right-container")
    function addAnotherSoftcopy(){
        container.innerHTML+=`<label for="sid">SID:</label>
                              <input type="text" id="sid" name="sid" required>`
    }
</script>
</html>
