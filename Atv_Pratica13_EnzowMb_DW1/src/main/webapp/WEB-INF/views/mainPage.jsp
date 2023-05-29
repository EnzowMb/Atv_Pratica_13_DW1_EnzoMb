<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ page import="java.util.List, model.Tarefa"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Pagina Principal</title>
</head>
<body>
	<div align="center">
		<h1>Tarefas:</h1>
	</div>
	
	<% 
	List<Tarefa> lista = (List<Tarefa>) request.getAttribute("tarefas");
	
	if(lista != null) {
	
	for(Tarefa tarefa : lista) {
	
	%>
	
	<div align="center">
		<table border="1" style="with: 80%">
			<tr>
				<td>Titulo</td>
				<td><%= tarefa.getTitulo() %></td>
			</tr>
			<tr>
				<td>Descricao</td>
				<td><%= tarefa.getDescricao() %></td>
			</tr>
			<tr>
				<td>Data Criação</td>
				<td><%= tarefa.getData_criacao() %></td>
			</tr>
			<tr>
				<td>Data Conclusão</td>
				<td><%= tarefa.getData_conclusao() %></td>
			</tr>
			<tr>
				<td>Status</td>
				<% 
					if(tarefa.isStatus()) {
				%>
				<td>Concluido</td>
				<%
					} else {
				%>
				<td>Em andamento</td>
				<%
					}
				%>
			</tr>
		</table>
		<a href="/Atv_Pratica13_EnzowMb_DW1/mostraTarefa?id_tarefa=<%= tarefa.getId_tarefa() %>">Editar</a> |
		<a href="/Atv_Pratica13_EnzowMb_DW1/removeTarefa?id_tarefa=<%= tarefa.getId_tarefa() %>&id_usuario=${ id_usuario }">Remover</a>
	</div>
	<br>
	<% 
	}
	} else {
	%>
		<div>
			Sem tarefas Cadastradas !!
		</div>
	<%
	}
	%>
	
	<div align="center">
		<a href="/Atv_Pratica13_EnzowMb_DW1/registerTarefa?id_usuario=${ id_usuario }" style="font-size: 80px; text-decoration: none" >+</a>
		<br>
		Usuario: ${ id_usuario }
	</div>
	
	<div align="center">
		<a href="/Atv_Pratica13_EnzowMb_DW1/logout" style="font-size: 40px; text-decoration: none" >Deslogar!</a>
	</div>
</body>
</html>