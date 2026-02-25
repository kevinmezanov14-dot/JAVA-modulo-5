package cl.servlets;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;
import java.io.IOException;

@WebServlet("/dashboard")
public class DashboardServlets extends HttpServlet {
    private static final long serialVersionUID = 1L;

    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        HttpSession session = request.getSession(false);

        // Verificar si existe sesión y si el usuario está autenticado
        if(session == null || session.getAttribute("emailSession") == null){
            response.sendRedirect(request.getContextPath() + "/login");
            return;
        }

        // Pasar los atributos de sesión al request para el JSP
        request.setAttribute("usuario", session.getAttribute("usuario"));
        request.setAttribute("email", session.getAttribute("emailSession"));
        request.setAttribute("edad", session.getAttribute("edad"));
        request.setAttribute("sexo", session.getAttribute("sexo"));

        request.getRequestDispatcher("/dashboard.jsp").forward(request, response);
    }
    
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        doGet(request, response);
    }
}
