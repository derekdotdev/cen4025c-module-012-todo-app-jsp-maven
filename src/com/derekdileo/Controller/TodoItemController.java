package com.derekdileo.Controller;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import com.derekdileo.DAO.TodoItemDao;
import com.derekdileo.TodoItemDAOImpl.TodoItemDaoImpl;
import com.derekdileo.pojo.TodoItem;

import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class TodoItemController
 */
@SuppressWarnings("serial")
public class TodoItemController extends HttpServlet {
//	private static final long serialVersionUID = 1L;
       
	TodoItem todoItem = new TodoItem();
	TodoItemDaoImpl todoItemDaoImpl = new TodoItemDaoImpl();
	TodoItemDao todoItemDao;

    /**
     * @see HttpServlet#HttpServlet()
     */


	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		if (request.getParameter("addTodoItem") != null) {
			String description = request.getParameter("description");
			todoItem.setDescription(description);
			todoItemDaoImpl.saveTodoItem(todoItem);
			RequestDispatcher rd = request.getRequestDispatcher("AddTodoItem.jsp");
			rd.forward(request, response);

		}

//		response.getWriter().append("Served at: ").append(request.getContextPath());
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		if (request.getParameter("showTodoItem") != null) {
			List<TodoItem> todoItemList = new ArrayList<>();
			todoItemList = todoItemDaoImpl.showAllTodoItems();
			request.setAttribute("todoItemList", todoItemList);
			RequestDispatcher rd = request.getRequestDispatcher("ShowAll.jsp");
			rd.forward(request, response);
		}

//		if (request.getParameter("updateEmployee") != null) {
//			int id1 = Integer.parseInt(request.getParameter("id"));
//			todoItem.setId(id1);
//			todoItem.setDescription(request.getParameter("description"));
//			todoItemDaoImpl.updateTodoItem(todoItem);
//			RequestDispatcher rd = request.getRequestDispatcher("AddTodoItem.jsp");
//			rd.forward(request, response);
//		}

		if (request.getParameter("updateEmployee") != null) {
			int id1 = Integer.parseInt(request.getParameter("id"));
			String descriptionupdate = request.getParameter("descriptionupdate");
			todoItemDaoImpl.updateTodoItem(id1, descriptionupdate);

			RequestDispatcher rd = request.getRequestDispatcher("AddTodoItem.jsp");
			rd.forward(request, response);
		}

		if (request.getParameter("deleteEmployee") != null) {
			int id2 = Integer.parseInt(request.getParameter("id"));
			todoItem.setId(id2);
			todoItemDaoImpl.deleteTodoItem(todoItem);
			RequestDispatcher rd = request.getRequestDispatcher("EmployeeAdd.jsp");
			rd.forward(request, response);
		}

//		doGet(request, response);
	}

	@Override
	public String getServletInfo() {
		return "Short description";
	} // </editor-fold>


}
