package servlets;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.websocket.Session;

import bll.BLLException;
import bll.UserManager;
import bo.User;

/**
 * Servlet implementation class servletRegister
 */
@WebServlet("/Register")
public class servletRegister extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private String title = "Register";
	private UserManager manager;
       
    public void init() throws ServletException {
        super.init();
        manager = UserManager.getInstance();
    }
    
    
	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		request.setAttribute("title", title);
	    request.setAttribute("servletPath", request.getServletPath());
		request.getRequestDispatcher("/WEB-INF/editProfile.jsp").forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		try {
			manager.insertUser(
					request.getParameter("username")
					, request.getParameter("lastName")
					, request.getParameter("firstName")
					, request.getParameter("email")
					, request.getParameter("phone")
					, request.getParameter("street")
					, request.getParameter("postalCode")
					, request.getParameter("city")
					, request.getParameter("password")
					, request.getParameter("confirmationPassword"));
			try {
				User user = manager.authentication(request.getParameter("username"), request.getParameter("password"));
				request.getSession().setAttribute("user", user);
			} catch (BLLException e) {
				request.getSession().setAttribute("error", e.getSimpleMessage());
			}
	        response.sendRedirect(request.getContextPath());
		} catch (BLLException e) {
			request.getSession().setAttribute("error", e.getSimpleMessage());
	        response.sendRedirect(request.getContextPath()+"/Register");
		}
		
	}

}
