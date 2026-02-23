package cl.Servelets;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;

/**
 * Servlet implementation class Registrar
 */
@WebServlet("/Registrar")
public class Registrar extends HttpServlet {
    private static final long serialVersionUID = 1L;

    public Registrar() {
        super();
    }

    /**
     * GET: muestra el formulario de registro
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        request.getRequestDispatcher("/registro.jsp").forward(request, response);
    }

    /**
     * POST: procesa los datos del formulario
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        String nick     = request.getParameter("nick");
        String email    = request.getParameter("email");
        String password = request.getParameter("password");

        System.out.println("Nick: "     + nick);
        System.out.println("Email: "    + email);
        System.out.println("Password: " + password);

        // Aquí puedes agregar la lógica para guardar en base de datos

        // Redirige de vuelta al formulario (o a otra página)
        response.sendRedirect(request.getContextPath() + "/registro.jsp");
    }
}
