<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<html xmlns:c="http://java.sun.com/jsp/jstl/core"
	xmlns:fn="http://java.sun.com/jsp/jstl/functions">
<head>
<title>Hello ${userName}</title>
</head>
<body style="text-align: center;">


	<h2>Welcome ${userName}</h2>

	<h2>Add new department</h2>
	<form action="/Jpa/AddDeptServlet" method="post">
		<table align="center">
			<tr>
				<td>Dept Name:</td>
				<td><input type="text" name="deptName" required="required" /></td>
			</tr>
			<tr>
				<td>Dept Email:</td>
				<td><input type="email" name="deptEmail" /></td>
			</tr>
			<tr>
				<td><input type="submit"> <a href="/Jpa/success.jsp">Back</a>
				</td>
			</tr>
		</table>
	</form>
	<form name="form1" method="get" action="Logout.jsp">
		<label class="logoutLblPos"> <input name="logout"
			type="submit" value="log out">
		</label>
	</form>


	<h4>Existing Department</h4>
	<table align="center" border="1">
		<tr>
			<th>Dept Name</th>
			<th>Email</th>
			<th>Employee</th>
			</th>
			<c:forEach items="${deptList}" var="dept">
				<tr>
					<td>${dept.name}</td>
					<td>${dept.email}</td>
					<td><c:forEach items="${dept.employeeList}" var="emp">
					    	${emp.firstName} ${emp.lastName} ${emp.age}<br>
						</c:forEach></td>
				</tr>
			</c:forEach>
	</table>



</body>
</html>