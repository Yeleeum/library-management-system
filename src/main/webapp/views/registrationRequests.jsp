<!DOCTYPE html>
<%@page import="com.lms.librarymanagementsystem.models.Registration"%>
<%@page import="java.util.List"%>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Document</title>
</head>
<% 
    List<Registration> registrations=(List<Registration>) request.getAttribute("registrations");
	String category="Pending "+(String)request.getAttribute("category")+" Requests";
%>
<body>
    <h1><%=category%></h1>
	<table border="1">
		<tr>
            <th>RSID</th>
            <th>USERNAME</th>
            <th>PROFILEPICTURE</th>
            <th>FIRSTNAME</th>
            <th>LASTNAME</th>
            <th>GENDER</th>
            <th>DOB</th>
            <th>PHONE</th>
            <th>EMAIL</th>
            <th>CATEGORY</th>
            <th>PAID</th>
            <th>TRANSACTION</th>
            <th>APPROVE</th>
            <th>REJECT</th>
		</tr>
        <%for(Registration registration:registrations){ %>
			<tr>
	            <td><%=registration.getRsid()%></td>
	            <td><%=registration.getUsername()%></td>
	            <td><img src="/uploads/profilePictures/<%=registration.getProfilePicture()%>" alt="image" width="100" height="100"></td>
	            <td><%=registration.getFirstName()%></td>
	            <td><%=registration.getLastName()%></td>
	            <td><%=registration.getGender() %></td>
	            <td><%=registration.getDob() %></td>
	            <td><%=registration.getPhone() %></td>
	            <td><%=registration.getEmail() %></td>
	            <td><%=registration.getCategory() %></td>
	            <td><%=registration.getPaid() %></td>
	            <td><%=registration.getTransaction() %></td>
	            <td>
                    <form action="/admin/approveuser" method="post">
                        <input type="number" value="<%=registration.getRsid()%>" name="rsid" hidden>
                        <input type="text" value="<%=(String)request.getAttribute("category")%>" name="pay" hidden>
                        <button>APPROVE</button>
                    </form>
                </td>
	            <td>
                    <button class="rejectbtn" onclick="createRejectForm('<%=registration.getRsid()%>','<%=registration.getUsername()%>')">REJECT</button>
                </td>
			</tr>
        <%} %>
	</table>
    <form action="/admin/rejectuser" method="post" class="rejection" hidden>
        <input type="number"  name="rsid" class="rejectionrsid" hidden >
        <!-- <input type="text"  name="username" class="username" hidden > -->
        <input type="text" value="<%=(String)request.getAttribute("category")%>" name="pay" hidden>
        <textarea name="message"></textarea>
        <button>Send Message</button>
    </form>
    <button onclick="hideForm()"  class="Cancelbtn"hidden >Cancel</button>
    
</body>
<script defer>
    const rejection=document.querySelector('.rejection');
    // const user=document.querySelector('.username');
    const rejectionrsid=document.querySelector('.rejectionrsid')
    const cancelbtn=document.querySelector('.Cancelbtn')

    function createRejectForm(rsid,username){
        rejectionrsid.value=parseInt(rsid)
        // user.value=username
        rejection.hidden=false
        cancelbtn.hidden=false
    }

    function hideForm(){
        rejection.hidden=true
        cancelbtn.hidden=true
    }
</script>
</html>