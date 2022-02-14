<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<script src="https://cdn.tailwindcss.com"></script>
<%-- <link rel="stylesheet" href="${pageContext.request.contextPath}/styles.css"/> --%>
<%-- <link href="<c:url value="/resources/theme1/css/styles.css" />" rel="stylesheet"> --%>

<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Add To Do Item</title>
</head>
<body class="bg-blue-500">

	<div
		class="bg-white mx-auto text-center w-1/2 py-5 shadow-xl rounded-3xl my-12 max-w-2xl" id="add">

		<h2 class="text-4xl font-semibold border-b pb-2 mx-6">Add To Do
			Item</h2>

		<!--  If error is present in the forwarded request, display it -->
		<h3
			class="bg-red-300 text-red-900 font-semibold text-xl w-80 rounded-lg my-2 mx-auto">${error}</h3>


		<form action="TodoItemController" method="GET">

			<div class="grid grid-cols-1 my-5 mx-8">
				<input type="text" id="description" name="description" placeholder="Details" autofocus
					class="text-center w-full p-1 border-2 placeholder-blue-800 border-blue-700 appearance-none rounded-lg focus:outline-none focus:ring-2">

			</div>

			<button type="submit" name="addTodoItem"
				class="bg-blue-100 text-xl font-semibold px-4 py-1 rounded-lg hover:bg-blue-800 hover:text-white">Add
				Item</button>

		</form>

		<form action="TodoItemController" method="POST">
			<br>
			<button type="submit" name="showTodoItem"
				class="bg-blue-100 text-xl font-semibold px-4 py-1 rounded-lg hover:bg-blue-800 hover:text-white">Show To Do List</button>

		</form>

	</div>

</body>

</html>