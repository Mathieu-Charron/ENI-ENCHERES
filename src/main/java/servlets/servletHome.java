package servlets;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import bll.BidManager;
import bll.UserManager;

/**
 * Servlet implementation class servletHome
 */
@WebServlet("")
public class servletHome extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private String title = "Accueil";
	private BidManager manager;
	
	
    public void init() throws ServletException{
    	super.init();
    	manager = BidManager.getInstance();
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		request.setAttribute("categories", manager.getCategories());
		request.setAttribute("title", title);
		
		request.getRequestDispatcher("/WEB-INF/home.jsp").forward(request, response);
	}


}
