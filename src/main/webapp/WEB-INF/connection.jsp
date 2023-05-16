<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>Connexion</title>
	 <link rel="stylesheet" type="text/css" href="./CSS/style.css">
</head>
<body>
	<div class="container-connection">
		<h1>Connexion</h1>
	
		<form action="${pageContext.request.contextPath}/Connection" method="post">
		<div>
			<label for="username">Identifiant:</label>
			<input type="text" id="username" name="username">
		</div>
		<div>
			<label for="password">Mot de passe:</label>
			<input type="password" id="password" name="password">
		</div>
		<div>
			<input type="submit" value="Connexion">
			<div>
				<div>
					<input type="checkbox" id="rememberme" name="rememberme">
					<label for="rememberme">Se souvenir de moi:</label>
				</div>
				<a href="motDePasseOublie.jsp">Mot de passe oublié</a>
			</div>
		</div>
			
		</form>
	
		<br>
	
		<a href="/">Créer un compte</a>
	</div>
</body>
</html>