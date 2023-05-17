<%@ include file="templates/header.jsp"%>
	<h1>Mon profil</h1>
	<div class="form">
		<form action="${pageContext.request.contextPath}/Profile">
	
			<label for="username">Pseudo :</label>
			<input type="text" id="username" name="username"><br><br>
			
			<label for="lastName">Nom :</label>
			<input type="text" id="lastName" name="lastName"><br><br>
			
			<label for="firstName">Prenom :</label>
			<input type="text" id="firstName" name="firstName"><br><br>
			
			<label for="email">Email :</label>
			<input type="email" id="email" name="email"><br><br>
		
			<label for="phone">Téléphone :</label>
			<input type="tel" id="phone" name="phone"><br><br>
		
			<label for="street">Rue :</label>
			<input type="text" id="street" name="street"><br><br>
		
			<label for="postalCode">Code Postal :</label>
			<input type="text" id="postalCode" name="postalCode"><br><br>
		
			<label for="city">Ville :</label>
			<input type="text" id="city" name="city"><br><br>
		
			<label for="password">Mot de passe :</label>
			<input type="password" id="password" name="password"><br><br>
		
			<label for="confirmationPassword">Confirmation du mot de passe :</label>
			<input type="password" id="confirmationPassword" name="confirmationPassword" required><br><br>
			
			<input type="submit" value="Enregistrer">
		    <input type="button" value="Annuler">
		</form>
	</div>
<%@ include file="templates/footer.jsp"%>
