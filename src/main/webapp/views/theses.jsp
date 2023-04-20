<!-- <!DOCTYPE html>
<html>
<head>
	<title>Theses</title>
	<link rel="stylesheet" href="/css/forms/theses.css">
</head>
<body>
	<form action="/admin/addtheses" method="POST" enctype="multipart/form-data">
		<label for="itid">ITID:</label>
		<input type="text" id="itid" name="itid" required>

		<label for="title">Title:</label>
		<input type="text" id="title" name="title">

		<label for="researcher">Researcher:</label>
		<input type="text" id="researcher" name="researcher">

		<label for="guides">Guides:</label>
		<input type="text" id="guides" name="guides">

		<label for="description">Description:</label>
		<input type="text" id="description" name="description">

		<label for="thumbnail">Thumbnail:</label>
		<input type="file" id="thumbnail" name="thumbnailfile">

		<label for="category">Category:</label>
		<select id="category" name="category">
			<option value="option1">Option 1</option>
			<option value="option2">Option 2</option>
			<option value="option3">Option 3</option>
		</select>

		<label for="keywords">Keywords:</label>
		<input type="text" id="keywords" name="keywords">

		<label for="completeddate">Completed Date:</label>
		<input type="text" id="completeddate" name="completeddate">

		<label for="place">Place:</label>
		<input type="text" id="place" name="place">

		<label for="abstract">Abstract:</label>
		<input type="text" id="abstract" name="abstract">

		<label for="pageno">Page No:</label>
		<input type="text" id="pageno" name="pageno">

		<label for="stock">Stock:</label>
		<input type="text" id="stock" name="stock">

		<input type="submit" value="Submit">
	</form>
</body>
</html> -->
<!DOCTYPE html>
<%@page import="com.lms.librarymanagementsystem.models.*"%>
<%@page import="java.util.List"%>
<%@page import="com.lms.librarymanagementsystem.models.Registration"%>
<%@page import="java.util.List"%>
<html>

<head>
	<title>Theses</title>
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
	<% Theses theses = (Theses) request.getAttribute("theses"); %>
	<% String activity=(String) request.getAttribute("activity"); %>
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
						<span>Edit Theses</span>
						<i class="fa-solid fa-angle-right"></i>
						<span><%= (theses == null) ? null : theses.getTid() %></span>
					<%}else{%>
						<i class="fa-solid fa-angle-right"></i>
						<span>Add Items</span>
						<i class="fa-solid fa-angle-right"></i>
						<span>Add Theses</span>
					<%}%>
				</p>
			</div>
	<form action='/admin<%=activity.equals("edit")?"/edit/theses":"/addtheses"%>' method="POST" enctype="multipart/form-data" class="bookForm">
		
		<div class="left-container">
			<% if(activity.equals("edit")) { %>
				<input id="prevthumbnail" value='<%= (theses == null) ? "" : theses.getThumbnail() %>' name="thumbnail" hidden/>
			<% } %>
			<label for="thumbnail">Thumbnail:</label>
			<img id="imageContainer" src='/uploads/thumbnails/<%= (theses == null) ? "" : theses.getThumbnail() %>' alt="">
			<input type="file" class="fileInput" id="thumbnail" name="thumbnailfile">
		</div>
		<div class="right-container">
			<% if(activity.equals("edit")) { %>
				<input type="number" hidden id="tid" name="tid" value='<%= (theses == null) ? null : theses.getTid() %>'>
			<% } %>

			<label for="itid">ITID:</label>
			<input type="text" id="itid" name="itid" value='<%= (theses == null) ? "" : theses.getItid() %>' required>

			<label for="title">Title:</label>
			<input type="text" id="title" value='<%= (theses == null) ? "" : theses.getTitle() %>' name="title">

			<label for="researcher">Researcher:</label>
			<input type="text" id="researcher" value='<%= (theses == null) ? "" : theses.getResearcher() %>' name="researcher">

			<label for="guides">Guides:</label>
			<input type="text" id="guides" value='<%= (theses == null) ? "" : theses.getGuides() %>' name="guides">

			<label for="description">Description:</label>
			<input type="text" id="description" value='<%= (theses == null) ? "" : theses.getDescription() %>' name="description">
			
			<label for="keywords">Keywords:</label>
			<input type="text" id="keywords" value='<%= (theses == null) ? "" : theses.getKeywords() %>' name="keywords">

			<label for="completedDate">Completion Date:</label>
			<input type="text" id="completedDate" value='<%= (theses == null) ? "" : theses.getCompletedDate() %>' name="completedDate">

			<label for="category">Category:</label>
			<input type="text" id="category" value='<%= (theses == null) ? "" : theses.getCategory() %>' name="category">
			
			<label for="place">Place:</label>
			<input type="text" id="place" value='<%= (theses == null) ? "" : theses.getPlace() %>' name="place">
	
			<label for="abstract">Abstract:</label>
			<input type="text" id="abstract" value='<%= (theses == null) ? "" : theses.getAbstractContent() %>' name="abstractContent">
	
			<label for="pageno">Page No:</label>
			<input type="number" id="pageno" value='<%= (theses == null) ? "" : theses.getPageNo() %>' name="pageNo">

			<label for="stock">Stock:</label>
			<input type="number" id="stock" value='<%= (theses == null) ? null: theses.getStock() %>' name="stock">

			<input type="submit" value='<%= activity.equals("edit") ? "Update" : "Submit" %>'>
		</div>
	</form>
</div>
</section>
</body>
<script src="/js/imagehandler.js"></script>
<script src="/js/adminPanel.js"></script>
</html>
</body>

</html>
