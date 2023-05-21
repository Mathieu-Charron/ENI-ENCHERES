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
import dal.DALException;
import dal.IUserDAO;
import dal.jdbc.UserDAOJdbcImpl;

@WebServlet("/Profile")
public class servletProfile extends HttpServlet {
    private static final long serialVersionUID = 1L;
    private String title = "Profile";
    private UserManager manager;

    public void init() throws ServletException {
        super.init();
        manager = UserManager.getInstance();
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        if (request.getParameter("userId") != null) {

		    User user = null;
			try {
				user = manager.selectById(Integer.valueOf(request.getParameter("userId")));
				
				if(user == null) {
					response.sendRedirect(request.getContextPath());
				} else {
				    request.setAttribute("user", user);

				    request.setAttribute("title", title);
				    request.getRequestDispatcher("/WEB-INF/profile.jsp").forward(request, response);
				}
			} catch (NumberFormatException e) {
				
		        response.sendRedirect(request.getContextPath());
		        
			}catch(BLLException e){
				e.printStackTrace();
		        response.sendRedirect(request.getContextPath());
			}
		}else {
	        response.sendRedirect(request.getContextPath());
		}

    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        doGet(request, response);
    }
}
