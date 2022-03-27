<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Basic Index Form</title>
</head>
<body>
<h1>Simple Form Demo</h1>

	<form name="myForm" action="basic-results.jsp" method="post">
	
		<table>
		
			<tbody>
			
				<tr>
					<td>First Name</td>
					<td><input type="text" name="first" value="" size="50" /></td>
				</tr>
				
				<tr>
					<td>Last Name</td>
					<td><input type="text" name="last" value="" size="50" /></td>
				</tr>
				
				<tr>
					<td>Email Address</td>
					<td><input type="text" name="email" value="" size="50" /></td>
				</tr>
			
				<tr>
					<td>Gender</td>
					<td>
						<input type="radio" name="gender" value="Male" />Male
						<input type="radio" name="gender" value="Female" />Female
					</td>
				</tr>
			
				<tr>
					<td>Where were you born?</td>
					<td>
						<select name="state">
							<option value="">Choose a state...</option>
							<option value="CA">California</option>
							<option value="FL">Florida</option>
							<option value="GA">Georgia</option>
							<option value="NH">New Hampshire</option>
							<option value="NV">Nevada</option>						
							<option value="MA">Massachusetts</option>
						</select>
					</td>
				</tr>
			
			</tbody>
		
		</table>
		
		<input type="reset" value="Clear" name="clear" />
		<input type="submit" value="Submit" name="submit" />
	
	</form>


</body>
</html>