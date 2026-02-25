package cl.servlets;

import jakarta.servlet.ServletContext;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;
import java.io.IOException;
import java.time.LocalDate;
import java.time.Period;
import java.util.HashMap;
import java.util.Map;
import java.util.regex.Pattern;

@WebServlet("/Registrar")
public class Registrar extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private static final Pattern EMAIL_PATTERN = Pattern.compile("^[A-Za-z0-9+_.-]+@(.+)$");
	private static final int EDAD_MINIMA = 13;

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		request.getRequestDispatcher("/registro.jsp").forward(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		String nick = request.getParameter("nick");
		String email = request.getParameter("email");
		String password = request.getParameter("password");
		String fechaNac = request.getParameter("fechaNacimiento");
		String sexo = request.getParameter("sexo");

		// Validación de campos vacíos
		if (nick == null || email == null || password == null || fechaNac == null || sexo == null ||
			nick.trim().isEmpty() || email.trim().isEmpty() || password.trim().isEmpty() || 
			fechaNac.trim().isEmpty() || sexo.trim().isEmpty()) {
			request.setAttribute("error", "Todos los campos son obligatorios");
			request.getRequestDispatcher("/registro.jsp").forward(request, response);
			return;
		}

		// Validación de formato de email
		if (!EMAIL_PATTERN.matcher(email).matches()) {
			request.setAttribute("error", "El formato del email no es válido");
			request.getRequestDispatcher("/registro.jsp").forward(request, response);
			return;
		}

		// Validación de longitud de contraseña
		if (password.length() < 6) {
			request.setAttribute("error", "La contraseña debe tener al menos 6 caracteres");
			request.getRequestDispatcher("/registro.jsp").forward(request, response);
			return;
		}

		// Validación de fecha de nacimiento
		LocalDate nacimiento;
		try {
			nacimiento = LocalDate.parse(fechaNac);
		} catch (Exception e) {
			request.setAttribute("error", "Formato de fecha inválido");
			request.getRequestDispatcher("/registro.jsp").forward(request, response);
			return;
		}

		// Validar que la fecha no sea futura
		if (nacimiento.isAfter(LocalDate.now())) {
			request.setAttribute("error", "La fecha de nacimiento no puede ser futura");
			request.getRequestDispatcher("/registro.jsp").forward(request, response);
			return;
		}

		int edad = Period.between(nacimiento, LocalDate.now()).getYears();

		// Validación de edad mínima
		if (edad < EDAD_MINIMA) {
			request.setAttribute("error", "Debes tener al menos " + EDAD_MINIMA + " años para registrarte");
			request.getRequestDispatcher("/registro.jsp").forward(request, response);
			return;
		}

		// Obtener o crear el mapa de usuarios en el contexto de la aplicación
		ServletContext context = getServletContext();
		@SuppressWarnings("unchecked")
		Map<String, LoginServlets.UserData> usuarios = 
			(Map<String, LoginServlets.UserData>) context.getAttribute("usuarios");
		
		if (usuarios == null) {
			usuarios = new HashMap<>();
			context.setAttribute("usuarios", usuarios);
		}

		// Verificar si el email ya está registrado
		if (usuarios.containsKey(email)) {
			request.setAttribute("error", "El email ya está registrado");
			request.getRequestDispatcher("/registro.jsp").forward(request, response);
			return;
		}

		LoginServlets.UserData userData = new LoginServlets.UserData(nick, password, edad, sexo);
		usuarios.put(email, userData);

		// Crear sesión para el usuario recién registrado
		HttpSession session = request.getSession();
		session.setAttribute("usuario", nick);
		session.setAttribute("emailSession", email);
		session.setAttribute("edad", edad);
		session.setAttribute("sexo", sexo);
		
		// Configurar timeout de sesión (30 minutos)
		session.setMaxInactiveInterval(1800);

		response.sendRedirect(request.getContextPath() + "/dashboard");
	}
}

