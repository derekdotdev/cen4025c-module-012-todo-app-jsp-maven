<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Basic Results</title>
</head>

<% 
	String firstName = request.getParameter("first");
	String lastName = request.getParameter("last");
	String emailAddress = request.getParameter("email");
	String gender = request.getParameter("gender");
	String state = request.getParameter("state");

%>

<body>
	<h1>User Information</h1>

<table border="1">

	<tbody>
		<tr>
			<td>First Name</td>
			<td><%= firstName %></td>
		
		</tr>
		<tr>
			<td>Last Name</td>
			<td><%= lastName %></td>
		</tr>
		<tr>
			<td>Email</td>
			<td><%= emailAddress %></td>
		</tr>
		<tr>
			<td>Gender</td>
			<td><%= gender %></td>
		</tr>
		<tr>
			<td>State Born</td>
			<td><%=state %></td>
		</tr>
	</tbody>
</table>


</body>
</html>