<%@ include file="templates/header.jsp"%>
	<link rel="stylesheet" type="text/css" href="./CSS/style.css">
	<div class="container-connection">
		<h1>Connexion</h1>
	
		<form action="${pageContext.request.contextPath}/Connection" method="post">
		<div>
			<!-- <label for="username">Identifiant:</label> -->
			<input type="text" id="username" name="username" required placeholder="Identifiant">
		</div>
		<div>
			<!-- <label for="password">Mot de passe:</label> -->
			<input type="password" id="password" name="password" required placeholder="Mot de passe">
		</div>
		<div>
			<input type="submit" value="Connexion">
		</div>
		<!-- <div>
			<div class="section-password">
				<div>
					<input type="checkbox" id="rememberme" name="rememberme">
					<label for="rememberme">Se souvenir de moi:</label>
				</div>
				<a href="motDePasseOublie.jsp">Mot de passe oublié</a>
			</div>
		</div> -->
			
		</form>
	
		<br>
	
		<a href="/">Créer un compte</a>
	</div>
<%@ include file="templates/footer.jsp"%>
