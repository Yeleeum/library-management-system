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
		<form action='/admin<%=activity.equals("edit")?"/edit/alternative":"/addalternative"%>' method="POST" enctype="multipart/form-data" class="bookForm">
		<div style="width: 100%;display: flex;flex-direction: column; justify-content: center;align-items: center;">
			<div class="right-container" >
			<%if(activity.equals("edit")) { %>
				<input type="number" hidden id="bid" name="bid" value='<%= (itid == null) ? null : itid %>'>
			<% }else{ %>
                <label for="itid">ITID:</label>
                <input type="text" id="itid" name="itid" required>
				<p class="title" style="margin-bottom: 10px;font-size: 20px; font-weight: 700;"></p>

				<div class="sid-container">
                <label for="sid">SID:</label>
                <input type="text" id="sid" class="sid" name="sids" required>
				<p class="softcopytitle" style="margin-bottom: 10px;font-size: 20px; font-weight: 700;"></p>
			</div>
            <%}%>
			<input type="submit" value='<%= activity.equals("edit") ? "Update" : "Submit" %>'>
			<button onclick="addAnotherSoftcopy()" name="add" style="width: 100%;margin-top: 10px; background-color: cornflowerblue;">ADD ANOTHER SOFTCOPY</button>
		</div>
	</div>
	</form>
</div>
</section>
</body>
<script src="/js/adminPanel.js"></script>
<script>
	let container = document.querySelector(".sid-container");
	let sidInputs = document.querySelectorAll(".sid");
	let softcopyTitles = document.querySelectorAll(".softcopytitle");

	function addAnotherSoftcopy() {
	let sids = document.querySelectorAll(".sid");
	event.preventDefault();
	console.log("hello");

	let label = document.createElement("label");
	label.setAttribute("for", "sid");
	label.textContent = "SID:";

	let input = document.createElement("input");
	input.setAttribute("type", "text");
	input.setAttribute("class", "sid");
	input.setAttribute("id", "sid");
	input.setAttribute("name", "sids");
	input.setAttribute("required", "");

	const titleElement = document.createElement("p");
	titleElement.classList.add("softcopytitle");
	titleElement.style.marginBottom = "10px";
	titleElement.style.fontSize = "20px";
	titleElement.style.fontWeight = "700";

	container.appendChild(label);
	container.appendChild(input);
	container.appendChild(titleElement);
	sidInputs = document.querySelectorAll(".sid");
	softcopyTitles = document.querySelectorAll(".softcopytitle");
	sidInputs.forEach((input, index) => {
	input.addEventListener("input", () => {
		const formData = new FormData();
		formData.append("sid", input.value);

		fetch("http://localhost:8080/admin/checksid", {
		method: "POST",
		body: formData
		})
		.then(response => response.text())
		.then(data => {
		if (data === "false") {
			softcopyTitles[index].textContent = "No data found";
			softcopyTitles[index].style.color = "red";
		} else {
			softcopyTitles[index].textContent = data;
			softcopyTitles[index].style.color = "black";
		}
		})
		.catch(error => console.error(error));
	});
	});
	}

	let itidinput=document.querySelector("#itid")
	itidinput.addEventListener('input',()=>{
		let formData = new FormData();
		formData.append("itid", itidinput.value);

		fetch("http://localhost:8080/admin/checkitid", {
		method: "POST",
		body: formData
		})
		.then(response => response.text())
		.then(data => {
			const titleElement = document.querySelector('.title');
			if (data !== "false") {
				titleElement.textContent = data;
				titleElement.style.color = "black";
			} else {
				titleElement.textContent = "No data found";
				titleElement.style.color = "red";
			}
		})
		.catch(error => console.error(error));
	})
	sidInputs.forEach((input, index) => {
	input.addEventListener("input", () => {
		const formData = new FormData();
		formData.append("sid", input.value);

		fetch("http://localhost:8080/admin/checksid", {
		method: "POST",
		body: formData
		})
		.then(response => response.text())
		.then(data => {
		if (data === "false") {
			softcopyTitles[index].textContent = "No data found";
			softcopyTitles[index].style.color = "red";
		} else {
			softcopyTitles[index].textContent = data;
			softcopyTitles[index].style.color = "black";
		}
		})
		.catch(error => console.error(error));
	})});





</script>
</html>
