package cl.servlets;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.Cookie;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.PrintWriter;

/**
 * Servlet para demostración de manejo de cookies
 */
@WebServlet("/Cookie")
public class CookieServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * Muestra las cookies existentes y permite crear nuevas
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) 
			throws ServletException, IOException {
		
		response.setContentType("text/html;charset=UTF-8");
		PrintWriter out = response.getWriter();
		
		out.println("<!DOCTYPE html>");
		out.println("<html>");
		out.println("<head><title>Manejo de Cookies</title></head>");
		out.println("<body>");
		out.println("<h1>Cookies Actuales</h1>");
		
		// Leer y mostrar cookies existentes
		Cookie[] cookies = request.getCookies();
		if (cookies != null && cookies.length > 0) {
			out.println("<table border='1'>");
			out.println("<tr><th>Nombre</th><th>Valor</th><th>Edad Máxima</th></tr>");
			for (Cookie cookie : cookies) {
				out.println("<tr>");
				out.println("<td>" + cookie.getName() + "</td>");
				out.println("<td>" + cookie.getValue() + "</td>");
				out.println("<td>" + cookie.getMaxAge() + " segundos</td>");
				out.println("</tr>");
			}
			out.println("</table>");
		} else {
			out.println("<p>No hay cookies almacenadas</p>");
		}
		
		// Formulario para crear una nueva cookie
		out.println("<h2>Crear Nueva Cookie</h2>");
		out.println("<form method='post' action='Cookie'>");
		out.println("Nombre: <input type='text' name='cookieName' required><br>");
		out.println("Valor: <input type='text' name='cookieValue' required><br>");
		out.println("Duración (segundos): <input type='number' name='maxAge' value='3600'><br>");
		out.println("<input type='submit' value='Crear Cookie'>");
		out.println("</form>");
		
		out.println("<br><a href='" + request.getContextPath() + "/dashboard'>Volver al Dashboard</a>");
		out.println("</body>");
		out.println("</html>");
	}

	/**
	 * Crea una nueva cookie con los parámetros recibidos
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) 
			throws ServletException, IOException {
		
		String cookieName = request.getParameter("cookieName");
		String cookieValue = request.getParameter("cookieValue");
		String maxAgeStr = request.getParameter("maxAge");
		
		if (cookieName != null && !cookieName.trim().isEmpty() && 
			cookieValue != null && !cookieValue.trim().isEmpty()) {
			
			Cookie newCookie = new Cookie(cookieName, cookieValue);
			
			// Configurar edad máxima de la cookie
			try {
				int maxAge = Integer.parseInt(maxAgeStr);
				newCookie.setMaxAge(maxAge);
			} catch (NumberFormatException e) {
				newCookie.setMaxAge(3600); // 1 hora por defecto
			}
			
			// Configurar path
			newCookie.setPath(request.getContextPath());
			
			// Agregar la cookie a la respuesta
			response.addCookie(newCookie);
			
			// Registrar en consola para debugging
			System.out.println("Cookie creada: " + cookieName + " = " + cookieValue);
		}
		
		// Redirigir de vuelta al GET para mostrar las cookies
		response.sendRedirect(request.getContextPath() + "/Cookie");
	}
}
