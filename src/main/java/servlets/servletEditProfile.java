package servlets;

import java.io.IOException;
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
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public servletEditProfile() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
//		response.getWriter().append("Served at: ").append(request.getContextPath());
	    request.setAttribute("servletPath", request.getServletPath());

		request.setAttribute("title", title);
	    String action = request.getParameter("action");
	    if (action != null && action.equals("delete")) {
	        User currentUser = (User) request.getSession().getAttribute("user");
	        if (currentUser != null) {
	            int userId = currentUser.getUserId();
	            UserManager userManager = UserManager.getInstance();
	            try {
					userManager.deleteUser(userId);
		            // Déconnecter l'utilisateur et rediriger vers une page appropriée
		            request.getSession().invalidate();
		            response.sendRedirect(request.getContextPath());

				} catch (BLLException e) {
					e.printStackTrace();
		            response.sendRedirect(request.getContextPath() + "/EditProfile");

				}
	            
	        } else {
	            // L'utilisateur n'est pas connecté, gérer l'erreur ou la redirection
	            response.sendRedirect(request.getContextPath() + "/Connection");
	        }
	    }else {
			request.getRequestDispatcher("/WEB-INF/editProfile.jsp").forward(request, response);

	    }
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	    String action = request.getParameter("action");
	    if (action != null && action.equals("delete")) {
	        User currentUser = (User) request.getSession().getAttribute("user");
	        if (currentUser != null) {
	            int userId = currentUser.getUserId();
	            UserManager userManager = UserManager.getInstance();
	            try {
					userManager.deleteUser(userId);
		            // Déconnecter l'utilisateur et rediriger vers une page appropriée
		            request.getSession().invalidate();
		            response.sendRedirect(request.getContextPath());

				} catch (BLLException e) {
					e.printStackTrace();
		            response.sendRedirect(request.getContextPath() + "/EditProfile");

				}
	            
	        } else {
	            // L'utilisateur n'est pas connecté, gérer l'erreur ou la redirection
	            response.sendRedirect(request.getContextPath() + "/Connection");
	        }
	    } else {
	        doGet(request, response);
	    }
	}



}
