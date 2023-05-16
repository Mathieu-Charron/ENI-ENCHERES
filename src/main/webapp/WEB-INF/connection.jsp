<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>Connexion</title>
</head>
<body>
	<h1>Connexion</h1>
	
	<form action="/" method="post">
		<label for="username">Identifiant:</label>
		<input type="text" id="username" name="username"><br><br>
		
		<label for="password">Mot de passe:</label>
		<input type="password" id="password" name="password"><br><br>
		
		<label for="rememberme">Se souvenir de moi:</label>
		<input type="checkbox" id="rememberme" name="rememberme"><br><br>
		
		<input type="submit" value="Connexion">
		
		<br>
		
		<a href="motDePasseOublie.jsp">Mot de passe oublié</a>
	</form>
	
	<br>
	
	<a href="/">Créer un compte</a>
	
</body>
</html>