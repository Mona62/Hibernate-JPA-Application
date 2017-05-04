<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html xmlns:c="http://java.sun.com/jsp/jstl/core"
    xmlns:fn="http://java.sun.com/jsp/jstl/functions" >
    <head><title>Hello ${userName}</title></head>
    <body style="text-align: center;">

   	
	    <h2>Welcome ${userName} </h2>
		
	    <table align="center">
		    <tr><td>
	   		<a href="/Jpa/addDepartment.jsp">Add Department</a>
		    </td></tr>
		    <tr><td>
	   		<a href="/Jpa/addEmployee.jsp">Add Employee</a>
		    </td></tr>
		    
	    </table>

	    	<form name="form1" method="get" action="Logout.jsp">
		<label class="logoutLblPos"> <input name="logout"
			type="submit" value="log out">
		</label>
	</form>
	    
				<h4>Existing Department</h4>
			    <table align="center" border="1">
			    	<tr><th>Dept Name</th><th>Email</th><th>Employee</th></th>
				    <c:forEach items="${dlist}" var="dlist">
				    <tr>
				    	<td>${dlist.name}</td>
				    	<td>${dlist.email}</td>
				    	<td>
				    	<c:forEach items="${dlist.employeeList}" var="emp">
					    	${emp.firstName} ${emp.lastName} ${emp.age}<br>
				    	</c:forEach>
				    	</td>
				    </tr>
				    </c:forEach>
			    </table>
	   
 

 
   </body>
</html>