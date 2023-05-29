package controller;

import java.io.IOException;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;

import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import model.Tarefa;
import dao.TarefaDao;

/**
 * Servlet implementation class TarefaServlet
 */
@WebServlet("/registerTarefa")
public class TarefaServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	
	TarefaDao tarefaDao = new TarefaDao();
	Tarefa tarefa = new Tarefa();

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		String paramId = request.getParameter("id_usuario");
		int id_usuario = Integer.valueOf(paramId);
		
		System.out.println(id_usuario);
		
		tarefa.setId_usuario(id_usuario);
		
		RequestDispatcher dispatcher = request.getRequestDispatcher("/WEB-INF/views/cadastroTarefa.jsp");
		dispatcher.forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {	
		String titulo = request.getParameter("titulo");
		String descricao = request.getParameter("descricao");
		String data_criacao = request.getParameter("data_criacao");
		String data_conclusao = request.getParameter("data_conclusao");
		String status = request.getParameter("status");
		
		tarefa.setTitulo(titulo);
		tarefa.setDescricao(descricao);
		
		Date dataCriacao = null;
		Date dataConclusao = null;
		
		//Verifica se o formato esta correto!!!
		try {
			SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
			dataCriacao = sdf.parse(data_criacao);
			dataConclusao = sdf.parse(data_conclusao);
		} catch (ParseException e) {
			throw new ServletException(e);
		}
		
		tarefa.setData_criacao(data_criacao);
		tarefa.setData_conclusao(data_conclusao);
		
		if(status == null) {
			tarefa.setStatus(false);
		} else {
			tarefa.setStatus(true);
		}
		
		try {
			tarefaDao.registerTarefa(tarefa);
		} catch (ClassNotFoundException e) {
			// TODO Auto-generasted catch block
			e.printStackTrace();
		}
		
		request.setAttribute("id_usuario", tarefa.getId_usuario());
		
		RequestDispatcher dispatcher = request.getRequestDispatcher("/tarefaListagem");
		dispatcher.forward(request, response);
	}

}
