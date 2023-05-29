package controller;

import java.io.IOException;
import java.io.PrintWriter;

import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import model.Usuario;
import dao.UsuarioDao;

/**
 * Servlet implementation class LoginServlet
 */
@WebServlet(urlPatterns = {"/Login", "/"})
public class LoginServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	
	UsuarioDao userDao = new UsuarioDao();
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public LoginServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		RequestDispatcher dispatcher = request.getRequestDispatcher("/WEB-INF/views/login.jsp");
		dispatcher.forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String username = request.getParameter("usuario");
        String password = request.getParameter("senha");
        
        Usuario user = null;
        
        try {
            user = userDao.LoginUsuario(username, password);
        } catch (Exception e) {
            // TODO Auto-generated catch block
            e.printStackTrace();
        }
        
        if(user != null) {
        	//Pendurando os parametros recebidos para o JSP
            request.setAttribute("id_usuario", user.getId());
        	
            RequestDispatcher dispatcher = request.getRequestDispatcher("/tarefaListagem");
    		dispatcher.forward(request, response);
        } else {
        	System.out.println("Usuario ou senha incorretos!!");
        	
        	RequestDispatcher dispatcher = request.getRequestDispatcher("/WEB-INF/views/login.jsp");
    		dispatcher.forward(request, response);
        }
        
	}

}
