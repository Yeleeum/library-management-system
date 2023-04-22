<%@page import="com.lms.librarymanagementsystem.Handlers.SessionHandler"%>
<% if(SessionHandler.getAccessSession(request).equals("admin")) {%>
    <form method="get">
        <button formaction="/admin/edit/<%= type %>/<%= id %>">Edit</button>
        <button formaction="/admin/delete/<%= type %>/<%= id %>">Delete</button>
    </form>
<% } else { %>
    <button onclick="performborrow()" class="Borrow" >Borrow</button>
    <button onclick="javascript(void(0))" class="Return">Return</button>
<% } %>
<script>
    let Borrow=document.querySelector(".Borrow")
    let Return=document.querySelector(".Return")
    if('<%=stock>0%>'=='true'){

        function convertToMySQLDate(newdateObj) {
            const year = newdateObj.getFullYear();
            const month = (newdateObj.getMonth() + 1).toString().padStart(2, '0');
            const day = newdateObj.getDate().toString().padStart(2, '0');
            return year+"-"+month+"-"+day;
        }

        function add15DaysAndConvertToMySQLDate(dateObj) {
            const newDateObj = new Date(dateObj.getTime() + (15 * 24 * 60 * 60 * 1000));
            return convertToMySQLDate(newDateObj);
        }
     
        let checkborrowparam=new URLSearchParams();
        checkborrowparam.append("itid",'<%=itid%>')

        const borrowcheckoptions = {
            method: 'POST',
            body: checkborrowparam
        };
        let performborrowparam=new URLSearchParams();
        performborrowparam.append("itid",'<%=itid%>')
        performborrowparam.append("borrowDate",convertToMySQLDate(new Date()))
        performborrowparam.append("returnDate",add15DaysAndConvertToMySQLDate(new Date()))
        performborrowparam.append("status","notreturned")
        performborrowparam.append("approved","pending")

        const borrowperformoptions = {
            method: 'POST',
            body: performborrowparam
        };

        console.log(performborrowparam)

        function checkBorrow(itid){
        fetch("http://localhost:8080/user/checkborrow",borrowcheckoptions)
        .then(response => response.json())
        .then(data=> {
            console.log(data)
                Borrow.disabled=!(data.status==='true')
                Borrow.style.opacity=(data.status==='true')?"1":"0.4"
                if(data.message==="You have already Borrowed this item."){
                    Return.disabled=!Borrow.disabled
                }else{
                    Return.disabled=true
                }
                Return.style.opacity=Return.disabled?"0.4":"1"
        })
        }
        
        function  performborrow(){
            fetch("http://localhost:8080/user/borrow",borrowperformoptions)
            .then(response => response.json())
            .then(data=> {
                    checkBorrow('<%=itid%>')
                })
        }
        checkBorrow('<%=itid%>')
    }else{
        Borrow.disabled=true
        Borrow.style.opacity="0.4"
        Return.disabled=!Borrow.disabled
        Return.style.opacity=Return.disabled?"0.4":"1"
    }
</script>