package servlets;

import java.io.IOException;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import bll.BLLException;
import bll.UserManager;
import bo.User;

/**
 * Servlet implementation class servletEditProfile
 */
@WebServlet("/EditProfile")
public class servletEditProfile extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private String title = "EditProfile";
	private UserManager manager;
    
    public void init() throws ServletException {
        super.init();
        manager = UserManager.getInstance();
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	    request.setAttribute("servletPath", request.getServletPath());
	    
	    
		request.setAttribute("title", title);
	    String action = request.getParameter("action");
	    if (action != null && action.equals("delete")) {
	        User currentUser = (User) request.getSession().getAttribute("user");
	        
            int userId = currentUser.getUserId();
            UserManager userManager = UserManager.getInstance();
            try {
				userManager.deleteUser(userId);
	            // Déconnecter l'utilisateur et rediriger vers une page appropriée
	            request.getSession().invalidate();
	            response.sendRedirect(request.getContextPath());

			} catch (BLLException e) {
	            response.sendRedirect(request.getContextPath() + "/EditProfile");

			}
	            
	    }else {
			request.getRequestDispatcher("/WEB-INF/editProfile.jsp").forward(request, response);

	    }
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		try {
			User user = manager.updateUser(
					(User) request.getSession().getAttribute("user")
					, request.getParameter("username")
					, request.getParameter("lastName")
					, request.getParameter("firstName")
					, request.getParameter("email")
					, request.getParameter("phone")
					, request.getParameter("street")
					, request.getParameter("postalCode")
					, request.getParameter("city")
					, request.getParameter("oldPassword")
					, request.getParameter("password")
					, request.getParameter("confirmationPassword"));
			
			request.getSession().setAttribute("user", user);
			request.getSession().setAttribute("success", "Profile modifier avec succès");

	        response.sendRedirect(request.getContextPath());
		} catch (BLLException e) {
			request.getSession().setAttribute("error", e.getSimpleMessage());
			
			Map<String, String> form = new HashMap<>();
			form.put("username", request.getParameter("username"));
			form.put("lastName", request.getParameter("lastName"));
			form.put("firstName", request.getParameter("firstName"));
			form.put("email", request.getParameter("email"));
			form.put("phone", request.getParameter("phone"));
			form.put("street", request.getParameter("street"));
			form.put("postalCode", request.getParameter("postalCode"));
			form.put("city", request.getParameter("city"));
			request.getSession().setAttribute("form", form);
			
	        response.sendRedirect(request.getContextPath()+"/EditProfile");
		}
	}



}
