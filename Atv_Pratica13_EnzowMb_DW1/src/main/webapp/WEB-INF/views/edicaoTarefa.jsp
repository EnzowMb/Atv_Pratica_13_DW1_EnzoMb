<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ page import="model.Tarefa"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Editando a tarefa!!</title>
</head>
<body>

<div align="center">
	<h1>Alterando tarefa</h1>
	  <form action="<%= request.getContextPath() %>/alteraTarefa" method="post">
	   <table style="witdh: 80%">
	    <tr>
	     <td>Titulo</td>
	     <td><input type="text" name="titulo" value="${ tarefa.titulo }" /></td>
	    </tr>
	    <tr>
	     <td>Descricao</td>
	     <td><input type="text" name="descricao" value="${ tarefa.descricao }"/></td>
	    </tr>
	    <tr>
	     <td>Data criação</td>
	     <td><input type="date" name="data_criacao" value="${ tarefa.data_criacao }"/></td>
	    </tr>
	    <tr>
	     <td>Data conclusão</td>
	     <td><input type="date" name="data_conclusao" value="${ tarefa.data_conclusao }"/></td>
	    </tr>
	    <tr>
	     <td>Status</td>
	     <%
	     	Tarefa tarefa = (Tarefa) request.getAttribute("tarefa");
	     
	     	if(tarefa.isStatus()) {
	     %>
	     <td><input type="checkbox" name="status" checked/>Concluido</td>
	     <%
	     	} else {
	     %>
	     <td><input type="checkbox" name="status" />Concluido</td>
	     <%
	     	}
	     %>
	    </tr>
	    <tr>
	     <td><input type="hidden" name="id_tarefa" value="${ tarefa.id_tarefa }" /></td>
	    </tr>
	    <tr>
	     <td><input type="hidden" name="id_usuario" value="${ tarefa.id_usuario }" /></td>
	    </tr>
	   </table><br>
	   <input type="submit" value="Alterar" style="font-size: 20px; border-radius: 10px; padding: 10px"/>
	  </form>
</div>

</body>
</html>