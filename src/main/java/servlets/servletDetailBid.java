package servlets;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import bll.BLLException;
import bll.BidManager;
import bll.UserManager;
import bo.SoldItem;
import bo.User;

/**
 * Servlet implementation class servletNewSold
 */
@WebServlet("/DetailBid")
public class servletDetailBid extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private String title = "Detail vente";
	private BidManager manager;
       
	public void init() throws ServletException {
        super.init();
        manager = BidManager.getInstance();
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		if (request.getParameter("itemId") != null) {
			try {
				SoldItem item = manager.getSoldItemById(Integer.valueOf(request.getParameter("itemId")));
				if(item == null) {
					response.sendRedirect(request.getContextPath());
				} else {
				    request.setAttribute("item", item);
	
				    request.setAttribute("title", title);
				    request.getRequestDispatcher("/WEB-INF/detailBid.jsp").forward(request, response);
				}
			} catch (NumberFormatException e) {
		        response.sendRedirect(request.getContextPath());
			}catch(BLLException e){
				request.getSession().setAttribute("error", e.getSimpleMessage());
		        response.sendRedirect(request.getContextPath());
			}
		}else {
	        response.sendRedirect(request.getContextPath());
		}
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		try {
			manager.insertBid((User) request.getSession().getAttribute("user"),Integer.parseInt(request.getParameter("itemId")), Integer.parseInt(request.getParameter("bidAmount")));
			request.getSession().setAttribute("success", "Vous avez surenchéri avec succès");
			response.sendRedirect(request.getContextPath());
		} catch (NumberFormatException e) {
			request.getSession().setAttribute("error", "Une erreur survenue");
	        response.sendRedirect(request.getContextPath());
		}catch(BLLException e){
			request.getSession().setAttribute("error", e.getSimpleMessage());
	        response.sendRedirect(request.getContextPath()+"/DetailBid?itemId="+Integer.parseInt(request.getParameter("itemId")));
		}
		
	}

}
