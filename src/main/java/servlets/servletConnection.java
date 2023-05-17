package servlets;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import bll.UserManager;
import bo.User;

/**
 * Servlet implementation class servletConnection
 */
@WebServlet("/Connection")
public class servletConnection extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private String title = "Connection";
	private UserManager manager;
	
    public void init() throws ServletException{
    	super.init();
    	manager = UserManager.getInstance();
    }
	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
//		System.out.println(manager.authentication("johnDoe", "password123"));
//		User user = new User("a", "a", "a", "a", "a", "a", "a", "a", 0, false, "test");
//		user = manager.insertUser(user);
//		user = new User(user.getUserId(),"a", "b", "c", "d", "e", "f", "g", "h", 0, false, "i");
//		manager.updateUser(user);
		request.setAttribute("title", title);
		request.getRequestDispatcher("/WEB-INF/connection.jsp").forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		System.out.println(request.getParameter("username"));
		System.out.println(request.getParameter("password"));
//		doGet(request, response);
//		manager.authentication(getServletName(), getServletInfo());
		request.getRequestDispatcher("/WEB-INF/connection.jsp").forward(request, response);
	}

}
