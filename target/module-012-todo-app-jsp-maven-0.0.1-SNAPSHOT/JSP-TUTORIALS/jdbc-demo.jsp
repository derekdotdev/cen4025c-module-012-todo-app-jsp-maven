<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<!-- 1). Import package -->
<%@ page import="java.sql.*" %>
<%@ page import="java.util.ArrayList" %>
<%@ page import="org.hibernate.*" %>


<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

	<%
		// Declare variables for jdbc connection
		String jdbcUrl = "jdbc:mysql://localhost:3306/todo_app";
		String user = "root";
		String pass = "password";
		String sql = "SELECT * FROM todo_items";
	
	
		// 2). Load and register driver
		Class.forName("com.mysql.jdbc.Driver");
		
		// 3). Create connection
		Connection conn = DriverManager.getConnection(jdbcUrl, user, pass);
	
	
		// 4). File a query
		Statement st = conn.createStatement();
		
		ResultSet rs = st.executeQuery(sql);
		
		ArrayList<String> items = new ArrayList<String>();
		StringBuilder sb = new StringBuilder();
		
		while(rs.next()) {
			sb.append(rs.getString(2));
			sb.append(",\n");
			//items.add(rs.getString(0));
		}
		
	%>


	<%-- Todo Item: <%= rs.getString(1) %> <br> --%>
	
	
	TodoItems: <%= sb.toString() %> <br>
	



</body>
</html>