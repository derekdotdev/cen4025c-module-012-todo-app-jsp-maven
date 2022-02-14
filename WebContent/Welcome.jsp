<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<script src="https://cdn.tailwindcss.com"></script>
<%-- <link rel="stylesheet" href="${pageContext.request.contextPath}/styles.css"/> --%>
<%-- <link href="<c:url value="/resources/theme1/css/styles.css" />" rel="stylesheet"> --%>

<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Welcome</title>
</head>
<body class="bg-blue-500">

	<div
		class="bg-white mx-auto text-center w-1/2 py-5 shadow-xl rounded-3xl my-12 max-w-2xl" id="add">

		<%-- <img src="<c:url value="${list.jpeg}"/>"/>
			
		<img src="${pageContext.request.contextPath}/resources/images/list.jpeg"/>
		<img src="${pageContext.request.contextPath}/list.jpeg"/>
			
		<img src="../resources/images/list.jpeg" /> --%>
		<h2 class="text-4xl font-semibold border-b pb-2 mx-6">Welcome To TDL</h2>
		<h3 class="text-xl border-b pb-2 mx-6 py-2">Your Premiere To Do List Application</h3>

		<form action="TodoItemController" method="POST">
			<br>
			<button type="submit" name="showTodoItem"
				class="bg-blue-100 text-xl font-semibold px-4 rounded-lg hover:bg-blue-500 hover:text-white">Show
				Items</button>

		</form>

	</div>

</body>

</html>