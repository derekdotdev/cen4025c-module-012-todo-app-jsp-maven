package net.todoapp.utl;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;


public class Database {

	protected static Connection conn;

	protected static ResultSet result;

	public static Connection getConnection() throws Exception {
		
		try {
			String driver = "com.mysql.cj.jdbc.Driver";
			String url = "jdbc:mysql://localhost:3306/todo_app";
			String username = "root";
			String password = "password";
			
			Class.forName(driver);
			conn = DriverManager.getConnection(url, username, password);
			
			return conn;

		} catch (Exception e) {
			System.out.println(e.getMessage());
			e.printStackTrace();
		}
		
		// If not successful
		return null;
	}

	public static void createTable() throws Exception {

		try {
			// Establish a database connection
			conn = getConnection();

			// Create PreparedStatement and Execute
			String create = "CREATE TABLE IF NOT EXISTS todo_items_2 (id int NOT NULL AUTO_INCREMENT, description varchar(255) NOT NULL, PRIMARY KEY(id))";
			PreparedStatement pstmt = conn.prepareStatement(create);
			pstmt.executeUpdate();

			// Close the connection
			conn.close();
		} catch (Exception e) {
			System.out.println(e.getMessage());
			e.printStackTrace();
		} finally {
			System.out.println("Database.createTable(): complete!");
		}

	}

//	public static int post(String description) throws Exception {
//
//		try {
//			conn = getConnection();
//			
//			String post = "INSERT INTO todo_items_2 (description) OUTPUT Inserted.ID VALUES ('" + description + "')";
//			
//			Statement stmt = conn.createStatement();
//			
//			result = stmt.getGeneratedKeys();
//			
//			if(result.next() && result != null) {
//				
//			} else {
//				return -1;
//			}
//			
//		} catch (Exception e) {
//			System.out.println(e.getMessage());
//			e.printStackTrace();
//		}
//
//	}

	/*
	 * 
	 * 
	 * try {
	 * 
	 * } catch (Exception e) { System.out.println(e.getMessage());
	 * e.printStackTrace(); }
	 * 
	 */

}
