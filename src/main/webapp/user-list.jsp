<%@ taglib prefix="c" uri="jakarta.tags.core" %> <%@page contentType="text/html"
pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="utf-8" />
		<title>User List</title>
		<link rel="stylesheet" href="styles/main.css" type="text/css" />
	</head>
	<body>
		<h1>List of Users</h1>
		<table>
			<tr>
				<th>First Name</th>
				<th>Last Name</th>
				<th>Email</th>
			</tr>
			<c:forEach var="user" items="${users}">
				<tr>
					<td>${user.firstName}</td>
					<td>${user.lastName}</td>
					<td>${user.email}</td>
				</tr>
			</c:forEach>
		</table>
		<form action="index.html" method="get">
			<input type="submit" value="Return to Home" />
		</form>
	</body>
</html>
