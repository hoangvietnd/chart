<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%>

<html>

<head>
<title>First Web Application</title>
<link href="webjars/bootstrap/3.3.6/css/bootstrap.min.css"
	rel="stylesheet">

</head>

<body>
<script>
	// $.ajax('restapi').then(data => {
	// })
</script>

<div class="container">
	<table class="table table-striped">
		<caption>Your coil are</caption>
		<thead>
			<tr>
				<th>Id</th>
				<th>First Name</th>
				<th>Last Name</th>
				<th>Email</th>
				<th></th>
				<th></th>
			</tr>
		</thead>
		<tbody>
			<c:forEach items="${coil}" var="c">
				<tr>
					<td>${c.id}</td>
					<td>${c.coilNo}"</td>
					<td>${c.coilNo}</td>
					<td><a type="button" class="btn btn-success" href="/update-todo?id=${c.id}">Update</a></td>
					<td><a type="button" class="btn btn-warning" href="/delete-todo?id=${c.id}">Delete</a></td>
				</tr>
			</c:forEach>
		</tbody>
	</table>
	<div>
		<a class="button" href="/addEmployee">Add Employee</a>
	</div>
</div>
	<script src="webjars/jquery/1.9.1/jquery.min.js"></script>
	<script src="webjars/bootstrap/3.3.6/js/bootstrap.min.js"></script>
	<script src="webjars/bootstrap-datepicker/1.0.1/js/bootstrap-datepicker.js"></script>
</body>
</html>