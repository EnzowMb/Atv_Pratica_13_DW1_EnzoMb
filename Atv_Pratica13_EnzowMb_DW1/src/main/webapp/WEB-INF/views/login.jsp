<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ page import="model.Usuario"%>
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Login</title>
</head>
<body>

	<div align="center">
		<h1>Login usuário</h1>
		<form action="<%= request.getContextPath() %>/Login" method="post">
		Usuario:
		<input type="text" name="usuario" required/><br><br>
		Senha:
		<input type="password" name="senha" required/><br><br>
		<input type="submit" value="Logar!" style="font-size: 20px; border-radius: 30px, padding: 30px"/><br><br>
		Não tem Cadastro? <a href="/Atv_Pratica13_EnzowMb_DW1/registerUsuario" >Cadastrar</a>
		</form>
		<br><br>
	</div>
	
</body>
</html>