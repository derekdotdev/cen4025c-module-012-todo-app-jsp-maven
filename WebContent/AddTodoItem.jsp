<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
	<head>

		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
		<title>Todo Item</title>
	</head>
	<body>

		<div id="add">
		
		<h1> Add To Do Item</h1>
			
		<form action="TodoItemController" method="GET">
			
			<table>
			
				<tr>
					
					<td> To Do Item Description</td>
					<td><input type ="text" name="description"></td>
						
				</tr>
					
				<tr>
					
					<td><input type="submit" name="addTodoItem" value="Add Item"></td>
					
				</tr>
			
				
			</table>
		</form>
		</div>
		<form action="TodoItemController" method="POST">
		
			<input type="submit" name="showTodoItem" value="Show Items"> &nbsp; &nbsp;<br>
		
		</form>
		
	</body>
	
</html>