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
import bll.BidManager;
import bll.UserManager;
import bo.User;

/**
 * Servlet implementation class servletNewSold
 */
@WebServlet("/NewSold")
public class servletNewSold extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private String title = "Nouvelle vente";
	private BidManager manager;
       
    public void init() throws ServletException {
        super.init();
        manager = BidManager.getInstance();
    }
    
	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		try {
			request.getSession().setAttribute("categories", manager.getCategories());
			request.setAttribute("title", title);
			request.getRequestDispatcher("/WEB-INF/newSold.jsp").forward(request, response);
		} catch (BLLException e) {
			e.printStackTrace();
			response.sendRedirect(request.getContextPath()+"/NewSold");
		}

	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		Map<String, String> form = new HashMap<>();
		form.put("itemName", request.getParameter("itemName"));
		form.put("categoryId", request.getParameter("categoryId"));
		form.put("description", request.getParameter("description"));
		form.put("initialPrice", request.getParameter("initialPrice"));
		form.put("startDate", request.getParameter("startDate"));
		form.put("endDate", request.getParameter("endDate"));
		form.put("street", request.getParameter("street"));
		form.put("postalCode", request.getParameter("postalCode"));
		form.put("city", request.getParameter("city"));
		try {
			manager.insertItem(
					(User) request.getSession().getAttribute("user"), 
					(String) request.getParameter("itemName"), 
					Integer.parseInt((String) request.getParameter("categoryId")),
					(String) request.getParameter("description"),
					Integer.parseInt((String) request.getParameter("initialPrice")),
					(String) request.getParameter("startDate"),
					(String) request.getParameter("endDate"),
					(String) request.getParameter("street"),
					(String) request.getParameter("postalCode"),
					(String) request.getParameter("city"));
			
			request.getSession().setAttribute("success", "Vente créée avec succès");
			response.sendRedirect(request.getContextPath());

		} catch (NumberFormatException e) {
			e.printStackTrace();
			request.getSession().setAttribute("error", "Une erreur est survenue");
			request.getSession().setAttribute("form", form);

			response.sendRedirect(request.getContextPath()+"/NewSold");
		}catch(BLLException e) {
			request.getSession().setAttribute("error", e.getSimpleMessage());
			request.getSession().setAttribute("form", form);

			response.sendRedirect(request.getContextPath()+"/NewSold");
		}
	}

}
