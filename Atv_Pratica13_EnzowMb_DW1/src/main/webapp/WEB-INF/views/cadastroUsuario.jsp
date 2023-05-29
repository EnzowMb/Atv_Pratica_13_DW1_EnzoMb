<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Cadastrar novo Usuario!</title>
</head>
<body>

<div align="center">
	<h1>Registro de Novo Usuario</h1>
	  <form action="<%= request.getContextPath() %>/registerUsuario" method="post">
	   <table style="witdh: 80%">
	    <tr>
	     <td>Nome</td>
	     <td><input type="text" name="nome" required/></td>
	    </tr>
	    <tr>
	     <td>Login</td>
	     <td><input type="text" name="login" required/></td>
	    </tr>
	    <tr>
	     <td>Senha</td>
	     <td><input type="password" name="senha" required/></td>
	    </tr>
	    <tr>
	     <td>Email</td>
	     <td><input type="email" name="email" required/></td>
	    </tr>
	   </table>
	   <br>
	   <input type="submit" value="Cadastrar!!" style="border-radius: 10px; font-size: 20px; padding: 10px"/>
	  </form>
</div>

</body>
</html>