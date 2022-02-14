<%@page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>

<html>

<head>

<script src="https://cdn.tailwindcss.com"></script>

<%-- <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/styles.css"/> --%>
<%-- <link href="<c:url value="/resources/css/styles.css" />" rel="stylesheet"> --%>

<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

<title>Show All Todo Items</title>

<!-- Changed jquery version 1.12.4 to newest stable release of 3.6.0 -->
<script
	type="text/javascript" src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js>">
</script>
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

<body class="bg-blue-500">

	<div class="bg-white mx-auto w-1/2 py-5 shadow-xl rounded-3xl my-12 max-w-2xl" id="showAllPage">
		
		<div class="bg-white mx-auto text-center px-1 py-1" id="todoListH2">
			
			<%-- <img src="<c:url value="${list.jpeg}"/>"/>
			<img src="${pageContext.request.contextPath}/resources/images/list.jpeg">
			<img src="${pageContext.request.contextPath}/list.jpeg"> --%>
			<!-- <img src="../resources/images/list.jpeg" /> -->
			
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
			
			<span class="mx-1"></span>
			
			Update: 
			<input type="radio" name="selection" id="update" onclick="document.getElementById('deleteTodoItemBtn').hidden=this.checked; document.getElementById('updateDescription').hidden=!this.checked; document.getElementById('updateTodoItemBtn').hidden=!this.checked;">
			
			<span class="mx-2"></span> 
			
			Delete: 
			<input type="radio" name="selection" id="delete" onclick="document.getElementById('updateTodoItemBtn').hidden=this.checked; document.getElementById('updateDescription').hidden=this.checked; document.getElementById('deleteTodoItemBtn').hidden=!this.checked;"><br><br> 
			
			<div hidden="true" id="updateDescription">
				<p id="updateDescriptionLabel">Update Description: </p>
				<input type="text" placeholder="New Details" class="text-center w-1/2 p-1 border-2 placeholder-blue-800 border-blue-700 appearance-none rounded-lg focus:outline-none focus:ring-2" id="descriptionupdate" name="descriptionupdate"><br><br>
			</div>
			
			
			<div class="text-4xl font-semibold border-b pb-2 mx-6 text-center items-center" id="buttonContainer" style="display: inline-block">
				<button hidden="true" type="submit" id="updateTodoItemBtn" name="updateTodoItem" class="bg-blue-100 text-xl font-semibold px-4 py-1 rounded-lg hover:bg-blue-500 hover:text-white disabled:bg-white disabled:text-white">Update Item</button>
				
				<button hidden="true" type="submit" id="deleteTodoItemBtn" name="deleteTodoItem" class="bg-blue-100 text-xl font-semibold px-4 py-1 rounded-lg hover:bg-blue-500 hover:text-white disabled:bg-white disabled:text-white">Delete Item</button><br>
				
				<button type="submit" id="addNewTodoItemBtn" name="addNewTodoItem" class="bg-blue-100 text-xl font-semibold px-4 py-1 rounded-lg hover:bg-blue-500 hover:text-white">Add New Item</button>
			</div> <!-- buttonContainer -->
			
		</form> <!-- TodoItemController POST -->
		
		</div>

		<div style="overflow: scroll; height: 500px;" class="overflow-auto bg-white mx-auto text-center text-1xl font-semibold py-5 pl-5" id="completeList">

			<c:forEach var="item" items="${todoItemList}">
		
			${item.id}) <span class="mx-1"></span> ${item.description} <br>
			--------------------------------------------------<br>

			</c:forEach>

		</div> <!-- completeList -->

	</div> <!--  showAllPage -->

</body>

</html>