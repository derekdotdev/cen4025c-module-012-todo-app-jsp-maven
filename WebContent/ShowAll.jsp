<%@page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>

<html>

<head>

<script src="https://cdn.tailwindcss.com"></script>

<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

<title>Show All Todo Items</title>

<!-- Changed jquery version 1.12.4 to newest stable release of 3.6.0 -->
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js>"></script>
<script>
	$(document).ready(function() {
		$("#deleteTodoItemBtn").hide();
		$("#updateTodoItemBtn").hide();

		$("#update").click(function() {
			$("#updateTodoItemBtn").show();
			$("#deleteTodoItemBtn").hide();

		});

		$("#delete").click(function() {
			$("#deleteTodoItemBtn").show();
			$("#updateTodoItemBtn").hide();
		});
	});
</script>

</head>

<body class="bg-blue-700">

	<div class="bg-white mx-auto w-1/2 py-5 shadow-xl rounded-3xl my-24 max-w-2xl" id="showAllPage">
		
		<div class="bg-white mx-auto text-center px-1 py-1" id="todoListH2">
			<h2 class="text-4xl font-semibold border-b pb-2 mx-6">To Do List</h2>	
		</div> <!-- todoListH2 -->
		
		
		<div class="bg-white mx-full py-5 pl-5 text-center">
		
			<form action="TodoItemController" method="POST">

			
			Item to Manage:
			<select class="text-left" name="id">

				<c:forEach items="${todoItemList}" var="todoItem">

					<option value="${todoItem.id}">${todoItem.id}</option>

				</c:forEach>

			</select> 
			
			<span class="mx-2"></span>
			
			Update: 
			<input type="checkbox" id="update" onclick="document.getElementById('deleteTodoItemBtn').hidden=this.checked;">
			
			<span class="mx-2"></span> 
			
			Delete: 
			<input type="checkbox" id="delete" onclick="document.getElementById('updateTodoItemBtn').hidden=this.checked; document.getElementById('descriptionupdate').disabled=this.checked;"><br><br> 
			
			Update Description: 
			<input type="text" class="w-1/2 p-1 border-2 placeholder-blue-800 border-blue-700 appearance-none rounded-lg focus:outline-none focus:ring-2" id="descriptionupdate" name="descriptionupdate"><br><br>
			
			
			<div class="text-4xl font-semibold border-b pb-2 mx-6 text-center items-center" id="buttonContainer" style="display: inline-block">
				<button type="submit" id="updateTodoItemBtn" name="updateTodoItem" class="bg-blue-300 text-xl font-semibold px-4 py-1 rounded-lg hover:bg-blue-800 hover:text-white">Update Item</button>
				
				<button type="submit" id="deleteTodoItemBtn" name="deleteTodoItem" class="bg-blue-300 text-xl font-semibold px-4 py-1 rounded-lg hover:bg-blue-800 hover:text-white">Delete Item</button><br>
				
				<button type="submit" id="addTodoItemBtn" name="addTodoItem" class="bg-blue-300 text-xl font-semibold px-4 py-1 rounded-lg hover:bg-blue-800 hover:text-white">Add New Item</button>
			</div> <!-- buttonContainer -->
			
		</form>
		
		</div>

		<div class="bg-white mx-auto text-left text-1xl font-semibold py-5 pl-5" id="completeList">

			<c:forEach var="item" items="${todoItemList}">
		
			${item.id}) <span class="mx-1"></span> ${item.description} <br>
			--------------------------------------------------<br>

			</c:forEach>

		</div> <!-- completeList -->

	</div> <!--  showAllPage -->

</body>

</html>