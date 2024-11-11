<%@page contentType="text/html" pageEncoding="utf-8"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="utf-8" />
		<title>Murach's Java Servlets and JSP</title>
		<link
			rel="stylesheet"
			href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css"
		/>
		<link rel="stylesheet" href="styles/main.css" type="text/css" />
	</head>

	<body class="container">
		<h1 class="mt-5">${message}</h1>

		<p>Here is the information that you entered:</p>

		<div class="form-group">
			<label>Email:</label>
			<span>${user.email}</span>
		</div>
		<div class="form-group">
			<label>First Name:</label>
			<span>${user.firstName}</span>
		</div>
		<div class="form-group">
			<label>Last Name:</label>
			<span>${user.lastName}</span>
		</div>

		<p>
			To enter another email address, click on the Back button in your browser or the Return button
			shown below.
		</p>

		<form action="index.html" method="get">
			<input type="hidden" name="action" value="join" />
			<button type="submit" class="btn btn-secondary">Return</button>
		</form>

		<script src="https://code.jquery.com/jquery-3.3.1.slim.min.js"></script>
		<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js"></script>
		<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"></script>
	</body>
</html>
