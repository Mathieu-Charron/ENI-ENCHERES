package servlets;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import bo.User;
import dal.DALException;
import dal.IUserDAO;
import dal.jdbc.UserDAOJdbcImpl;

@WebServlet("/Profile")
public class servletProfile extends HttpServlet {
    private static final long serialVersionUID = 1L;
    private String title = "Profile";
    private IUserDAO userDAO;

    public void init() throws ServletException {
        super.init();
        userDAO = new UserDAOJdbcImpl();
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        User user = (User) request.getSession().getAttribute("user");

        try {
            if (user != null) {
                int userId = user.getUserId();

                User userProfile = userDAO.selectById(userId);

                request.setAttribute("user", userProfile);
            }

            request.setAttribute("title", title);
            request.getRequestDispatcher("/WEB-INF/profile.jsp").forward(request, response);
        } catch (DALException e) {
            e.printStackTrace();
        }
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        doGet(request, response);
    }
}
