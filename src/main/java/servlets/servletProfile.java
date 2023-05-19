package servlets;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

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

		    User userProfile = manager.selectById(Integer.valueOf(request.getParameter("userId")));

		    request.setAttribute("user", userProfile);

			request.setAttribute("title", title);
			request.getRequestDispatcher("/WEB-INF/profile.jsp").forward(request, response);
		}else {
	        response.sendRedirect(request.getContextPath());
		}

    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        doGet(request, response);
    }
}
