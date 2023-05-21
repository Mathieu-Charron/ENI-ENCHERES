package servlets;

import java.io.IOException;
import java.util.ArrayList;
import java.util.Arrays;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import bll.BLLException;
import bll.BidManager;
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
	private BidManager manager2;
	
    public void init() throws ServletException{
    	super.init();
    	manager = UserManager.getInstance();
    	manager2 = BidManager.getInstance();
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
//		System.out.println(manager2.SearchBidsWithFilters("Ipho", 1, true, new ArrayList<>()/*Arrays.asList("Valeur 1", "Valeur 2", "Valeur 3")*/,(User) request.getSession().getAttribute("user")));
		request.setAttribute("title", title);
		request.getRequestDispatcher("/WEB-INF/connection.jsp").forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		User user = null;
		try {
			user = manager.authentication(request.getParameter("username"), request.getParameter("password"));
		} catch (BLLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		if(user != null) {
			HttpSession session = request.getSession();
			session.setAttribute("user", user);
	        response.sendRedirect(request.getContextPath());
		}else {
            request.setAttribute("error", "Identifiants incorrects");
            doGet(request, response);
		}
	}

}
