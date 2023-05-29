<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Cadastrar nova tarefa!</title>
</head>
<body>
	<div align="center">
		<h1>Nova Tarefa</h1>
		<form action="<%= request.getContextPath() %>/registerTarefa" method="post">
	   <table style="witdh: 80%">
	    <tr>
	     <td>Titulo</td>
	     <td><input type="text" name="titulo" required/></td>
	    </tr>
	    <tr>
	     <td>Descricao</td>
	     <td><input type="text" name="descricao" /></td>
	    </tr>
	    <tr>
	     <td>Data criação</td>
	     <td><input type="date" name="data_criacao" required/></td>
	    </tr>
	    <tr>
	     <td>Data conclusão</td>
	     <td><input type="date" name="data_conclusao" required/></td>
	    </tr>
	    <tr>
	     <td>Status</td>
	     <td><input type="checkbox" name="status" />Concluido</td>
	    </tr>
	   </table><br>
	   <input type="submit" value="Cadastrar" style="font-size: 20px; border-radius: 10px; padding: 10px"/>
	  </form>
	</div>
	
</body>
</html>