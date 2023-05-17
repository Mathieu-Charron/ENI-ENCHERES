<%@ include file="templates/header.jsp"%>
<style>
		<%@ include file="../public/css/profile.css"%>
</style>
	<div class="container-profile">
	<h1>Mon profil</h1>
	<div class="form">
		<form action="${pageContext.request.contextPath}/Profile">
	
			<div class="form-element">
			<label for="username">Pseudo :</label>
			<input type="text" id="username" name="username">
			</div>
			
			<div class="form-element">
			<label for="lastName">Nom :</label>
			<input type="text" id="lastName" name="lastName">
			</div>
			
			<div class="form-element">
			<label for="firstName">Prenom :</label>
			<input type="text" id="firstName" name="firstName">
			</div>
			
			<div class="form-element">
			<label for="email">Email :</label>
			<input type="email" id="email" name="email">
			</div>
			
			<div class="form-element">
			<label for="phone">Téléphone :</label>
			<input type="tel" id="phone" name="phone">
			</div>
			
			<div class="form-element">
			<label for="street">Rue :</label>
			<input type="text" id="street" name="street">
			</div>
		
			<div class="form-element">
			<label for="postalCode">Code Postal :</label>
			<input type="text" id="postalCode" name="postalCode">
			</div>
		
			<div class="form-element">
			<label for="city">Ville :</label>
			<input type="text" id="city" name="city">
			</div>
		
			<div class="form-element">
			<label for="password">Mot de passe :</label>
			<input type="password" id="password" name="password">
			</div>
		
			<div class="form-element">
			<label for="confirmationPassword">Confirmation du mot de passe :</label>
			<input type="password" id="confirmationPassword" name="confirmationPassword" required>
			</div>
			
			<input type="submit" value="Enregistrer">
		    <input type="button" value="Annuler">
		</form>
	</div>
	</div>
<%@ include file="templates/footer.jsp"%>
