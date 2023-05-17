package servlets;

import javax.servlet.*;
import javax.servlet.annotation.WebFilter;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
@WebFilter(
	    filterName = "AuthenticationFilter",
	    urlPatterns = {"/*"}
	)
public class AuthenticationFilter implements Filter {

//    @Override
//    public void init(FilterConfig filterConfig) throws ServletException {
//        // Méthode d'initialisation du filtre (optionnelle)
//    }

    @Override
    public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain)
            throws IOException, ServletException {
        HttpServletRequest httpRequest = (HttpServletRequest) request;
        HttpServletResponse httpResponse = (HttpServletResponse) response; 
        String requestURI = httpRequest.getRequestURI(); 
        String contextPath = httpRequest.getContextPath(); 

        String link = requestURI.substring(contextPath.length());

        if (httpRequest.getSession().getAttribute("user") == null 
        		&& !link.contains("Connection")
        		&& !link.equals("/")
        		&& !link.contains("public")) {
        	
            httpResponse.sendRedirect(httpRequest.getContextPath());
        } else {
            chain.doFilter(request, response);
        }
    }

//    @Override
//    public void destroy() {
//        // Méthode de destruction du filtre (optionnelle)
//    }
}