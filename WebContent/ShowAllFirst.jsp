<%@page import="net.todoapp.model.TodoItem"%>
<%@page import="java.util.List"%>
<%@page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@taglib prefix = "c" uri = "http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>

<html>

	<head>
		<%-- <link href="<c:url value="/resources/theme1/css/styles.css" />" rel="stylesheet"> --%>
		<link rel="stylesheet" href="/context/resources/theme1/css/styles.css" />
		
		<style type="text/css">
		
			#button1, #button2, #button3 {
				display: inline-block;
			}
		
		</style>
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
	<form action="TodoItemController" method="POST" id="itemlist">
	
		<c:forEach var="item" items="${todoItemList}">
		
			Item ID: ${item.id} <br>
			
			Item Description: ${item.description} <br>
			
			-------------------------------------------<br> 
		
		</c:forEach> 
		
		<input type="submit" name="showTodoItem"> &nbsp; &nbsp; <br>
	
	</form>
	
	<script>document.getElementById("itemlist".submit()</script>	
		
		<form action="TodoItemController" method="POST">
		
			Update: <input type="checkbox" id="update"> Delete: <input type="checkbox" id="delete"  onclick="document.getElementById('descriptionupdate').disabled=this.checked;"><br><br>
			
			<select name="id">
			
				<c:forEach items="${todoItemList}" var="todoItem">
				
					<option value="${todoItem.id}">${todoItem.id}</option>
				
				</c:forEach>
			
			</select>
			
			<br>
			
			Update Description: <input id="descriptionupdate" type="text" name="descriptionupdate"> <br><br>
			<div id="buttoncontainer" style="display: inline-block">
				<button type="submit" id="updatebn" name="updateTodoItem"> Update</button> <br><br>			
				<button type="submit" id="button2" name="deleteTodoItem"> Delete </button> <br><br>
				<button type="submit" id="button3" name="addTodoItem"> Add Item</button>		
			</div>
		</form>

	</body>

</html>