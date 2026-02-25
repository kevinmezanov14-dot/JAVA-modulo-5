package cl.servlets;

import jakarta.servlet.ServletContext;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;
import java.io.IOException;
import java.util.regex.Pattern;

@WebServlet("/login")
public class LoginServlets extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private static final Pattern EMAIL_PATTERN = Pattern.compile("^[A-Za-z0-9+_.-]+@(.+)$");

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// Si ya hay sesión activa, redirigir al dashboard
		HttpSession session = request.getSession(false);
		if (session != null && session.getAttribute("emailSession") != null) {
			response.sendRedirect(request.getContextPath() + "/dashboard");
			return;
		}
		request.getRequestDispatcher("/login.jsp").forward(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		String email = request.getParameter("email");
		String password = request.getParameter("password");

		// Validación de campos vacíos
		if (email == null || password == null || email.trim().isEmpty() || password.trim().isEmpty()) {
			request.setAttribute("error", "Debe ingresar credenciales válidas");
			request.getRequestDispatcher("/login.jsp").forward(request, response);
			return;
		}

		// Validación de formato de email
		if (!EMAIL_PATTERN.matcher(email).matches()) {
			request.setAttribute("error", "El formato del email no es válido");
			request.getRequestDispatcher("/login.jsp").forward(request, response);
			return;
		}
		
		// Verificar si el usuario existe en la sesión de aplicación (simulación simple)
		// En un caso real, esto debería ser una consulta a base de datos
		ServletContext context = getServletContext();
		@SuppressWarnings("unchecked")
		java.util.Map<String, UserData> usuarios = 
			(java.util.Map<String, UserData>) context.getAttribute("usuarios");
		
		if (usuarios == null || !usuarios.containsKey(email)) {
			request.setAttribute("error", "Credenciales incorrectas");
			request.getRequestDispatcher("/login.jsp").forward(request, response);
			return;
		}
		
		UserData userData = usuarios.get(email);
		// En producción, deberías comparar el hash de la contraseña
		if (!userData.getPassword().equals(password)) {
			request.setAttribute("error", "Credenciales incorrectas");
			request.getRequestDispatcher("/login.jsp").forward(request, response);
			return;
		}

		// Crear sesión con los datos del usuario
		HttpSession session = request.getSession();
		session.setAttribute("emailSession", email);
		session.setAttribute("usuario", userData.getNick());
		session.setAttribute("edad", userData.getEdad());
		session.setAttribute("sexo", userData.getSexo());
		
		// Configurar timeout de sesión (30 minutos)
		session.setMaxInactiveInterval(1800);

		response.sendRedirect(request.getContextPath() + "/dashboard");
	}
	
	// Clase interna para almacenar datos de usuario
	public static class UserData {
		private String nick;
		private String password;
		private int edad;
		private String sexo;
		
		public UserData(String nick, String password, int edad, String sexo) {
			this.nick = nick;
			this.password = password;
			this.edad = edad;
			this.sexo = sexo;
		}
		
		public String getNick() { return nick; }
		public String getPassword() { return password; }
		public int getEdad() { return edad; }
		public String getSexo() { return sexo; }
	}
}
