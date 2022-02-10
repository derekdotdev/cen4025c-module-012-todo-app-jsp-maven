<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>

<%@ taglib prefix = "c" uri = "http://java.sun.com/jsp/jstl/core" %>


<html>

	<head>
	
		<meta charset="UTF-8">
		
		<title>Show All Todo Items</title>
		
		<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js>"></script>
		<script>

			$(document).ready(function() {

				$("#deleteTodoItem").hide();

				$("#updateTodoItem").hide();

				$("#update").click(function() {

					$("updateTodoItem").show();
					$("#deleteTodoItem").hide();

				});

				$("#delete").click(function() {

					$("deleteTodoItem").show();
					$("#updateTodoItem").hide();	

				});


			});

		</script>

	</head>
	
	<body>

	All Todo Items: <br>
	
		<c:forEach var="item" items="${todoItemList}">
		
			Item ID: ${item.id} <br>
			
			Item Description: ${item.description} <br>
			
			-------------------------------------------<br> 
		
		</c:forEach> 
		
		<form action="TodoItemController" method="POST">
		
			Update: <input type="checkbox" id="update"> Delete: <input type="checkbox" id="delete" onclick="document.getElementById('description').disabled=this.checked;document.getElementById('id').disabled=this.checked;"><br><br>
			
			<select name="id">
			
				<c:forEach items="${todoItemList}" var="todoItem">
				
					<option value="${todoItem.id}">${todoItem.id}</option>
				
				</c:forEach>
			
			</select>
			
			<br>
			
			Update Description: <input id="description" type="text" name="description"><br>

			<button type="submit" id="updateTodoItem" name="updateTodoItem"> Update</button> <br> <br>
			
			<button type="submit" id="deleteTodoItem" name="deleteTodoItem"> Delete </button>		
		
		</form>

	</body>


</html>