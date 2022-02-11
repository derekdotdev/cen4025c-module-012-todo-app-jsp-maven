<%@page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@taglib prefix = "c" uri = "http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>

<html>

	<head>
	
		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
		
		<title>Show All Todo Items</title>
		
		<!-- Changed jquery version 1.12.4 to newest stable release of 3.6.0 -->
		<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js>"></script>
		<script>
$(document).ready(function(){
	$("#deleteTodoItem").hide();
	 $("#updateTodoItem").hide();

	$("#update").click(function(){
		$("#updateTodoItem").show();
		$("#deleteTodoItem").hide();

	});

	$("#delete").click(function(){
		$("#deleteTodoItem").show();
	     $("#updateTodoItem").hide();	
	});
});
</script>

	</head>
	
	<body>

	All To Do Items: <br>
	
		<c:forEach var="item" items="${todoItemList}">
		
			Item ID: ${item.id} <br>
			
			Item Description: ${item.description} <br>
			
			-------------------------------------------<br> 
		
		</c:forEach> 
		
		<form action="TodoItemController" method="POST">
		
			Update: <input type="checkbox" id="update"> Delete: <input type="checkbox" id="delete"  onclick="document.getElementById('descriptionupdate').disabled=this.checked;"><br><br>
			
			<select name="id">
			
				<c:forEach items="${todoItemList}" var="todoItem">
				
					<option value="${todoItem.id}">${todoItem.id}</option>
				
				</c:forEach>
			
			</select>
			
			<br>
			
			Update Description: <input id="descriptionupdate" type="text" name="descriptionupdate"> <br><br>

			<button type="submit" name="updateTodoItem"> Update</button> <br>			
			<button type="submit" name="deleteTodoItem"> Delete </button>		
		
		</form>

	</body>

</html>