<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<html xmlns:c="http://java.sun.com/jsp/jstl/core"
	xmlns:fn="http://java.sun.com/jsp/jstl/functions">
<head>
<title>Hello ${userName}</title>
</head>
<body style="text-align: center;">

	<h2>Welcome ${userName}</h2>


	<h2>Add new employee</h2>
	<form action="/Jpa/AddEmpServlet" method="post">

		<table align="center">
			<tr>
				<td>First Name:</td>
				<td><input type="text" name="firstName" required="required" />
				</td>
			</tr>
			<tr>
				<td>Last Name:</td>
				<td><input type="text" name="lastName" required="required" />
			<tr>
				<td>Age:</td>
				<td><input type="number" name="age" /></td>
			</tr>
			<tr>
				<td>Department:</td>
				<td><select name="department" required="required">
						<option value="">Please select</option>
						<c:forEach var="item" items="${dlist}">
							<option value="${item.id}">${item.name}-${item.email}</option>
						</c:forEach>
				</select></td>
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

	<h4>Existing Employee</h4>
	<table align="center" border="1">
		<tr>
			<th>First Name</th>
			<th>Last Name</th>
			<th>Department</th>
			<th>Age</th>
		</tr>
		<c:forEach items="${empList}" var="emp">
			<tr>
				<td>${emp.firstName}</td>
				<td>${emp.lastName}</td>
				<td>${emp.department.name}</td>
				<td>${emp.age}</td>
			</tr>
		</c:forEach>
	</table>


</body>
</html>