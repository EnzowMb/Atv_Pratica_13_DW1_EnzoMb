package controller;

import java.io.IOException;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;

import dao.TarefaDao;
import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import model.Tarefa;

/**
 * Servlet implementation class AlteraTarefaServlet
 */
@WebServlet("/alteraTarefa")
public class AlteraTarefaServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	
	TarefaDao tarefaDao = new TarefaDao();
	Tarefa tarefa = new Tarefa();

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		System.out.println("Alterando Tarefa");
		
		String paramId_tarefa = request.getParameter("id_tarefa");
		int id_tarefa = Integer.valueOf(paramId_tarefa);
		
		String paramId_usuario = request.getParameter("id_usuario");
		int id_usuario = Integer.valueOf(paramId_usuario);
		
		String titulo = request.getParameter("titulo");
		String descricao = request.getParameter("descricao");
		String data_criacao = request.getParameter("data_criacao");
		String data_conclusao = request.getParameter("data_conclusao");
		String status = request.getParameter("status");
		
		tarefa.setId_tarefa(id_tarefa);
		tarefa.setTitulo(titulo);
		tarefa.setDescricao(descricao);
		tarefa.setData_criacao(data_criacao);
		tarefa.setData_conclusao(data_conclusao);
		
		if(status == null) {
			tarefa.setStatus(false);
		} else {
			tarefa.setStatus(true);
		}
		
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
		
		try {
			tarefaDao.alterarTarefa(tarefa);
		} catch (ClassNotFoundException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		request.setAttribute("id_usuario", id_usuario);
		
		RequestDispatcher dispatcher = request.getRequestDispatcher("/tarefaListagem");
		dispatcher.forward(request, response);
	}

}
