<%@ include file="templates/header.jsp"%>
<style>
	<%@ include file="../public/css/NewSold.css"%>
	<%@ include file="../public/css/profile.css"%>
</style>
<div>
	<h1 class="title">Nouvelle vente</h1>
</div>
<div>
	<div class="container">
		<div class="image-container">
			<div class="image-container-box">
				<img src="<%= request.getContextPath() %>/public/assets/image/logo.png" alt="#">
			</div>
		</div>
		<div class="form">
			<form action="${pageContext.request.contextPath}/newSold">
				<div style="display: flex; justify-content: center; ">
					<div>
						<input placeholder="Nom de l'article" type="text" id="article" name="article" required size="20">
					</div>
					<div>
						<select name="categorie" id="categorie-select" required>
							<option value="">--Choisir une Catégorie--</option>
							<option value="informatique">Informatique</option>
							<option value="meuble">Meuble</option>
							<option value="livre">Livre</option>
						</select>
					</div>
				</div>
				<div>
					<textarea placeholder="Description" id="description" name="description" required rows="5"></textarea>
				</div>
				<div>
					<label for="picture">Photo de l'article :</label>
					<input type="file" id="picture" name="picture" accept="image/png, image/jpeg" required>
				</div>
				<div>
					<input placeholder="Prix de l'article" type="number" id="price" name="price" min="0" max="9999999" required>
				</div>
				<div class="bidsDate" style="justify-content: center;">
					<div style="margin-right: 25px;">
						<label for="startBids">Début de l'enchère :</label>
						<input type="date" name="startBids" id="startBids" required>
					</div>
					<div style="margin-left: 25px;">
						<label for="endBids">Fin de l'enchère :</label>
						<input type="date" name="endBids" id="endBids" required>
					</div>
				</div>
				<div>
					<p>Retrait :</p>
					<div>
						<div>
							<input placeholder="Rue" type="street" name="street" size="15" required>
						</div>
						<div>
							<input placeholder="Code Postale" type="postalCode" name="postalCode" size="15" required>
						</div>
						<div>
							<input placeholder="Ville :" type="city" name="city" size="15" required>
						</div>
					</div>
				</div>
				<div style="display: flex; justify-content: center; ">
					<input class="button-style-1" type="submit" name="Register" value="Enregistrer">
					<input class="button-style-1" type="button" name="Cancel" value="Annuler">
				</div>
			</form>
		</div>
	</div>
</div>
<script>
	// Obtient la date actuelle
	var today = new Date().toISOString().split('T')[0];
	// Définit la date minimale pour le champ de début d'enchère
	document.getElementById('startBids').setAttribute('min', today);

	// Gère l'événement de changement de date de début d'enchère
	document.getElementById('startBids').addEventListener('change', function() {
		// Obtient la valeur sélectionnée du champ de début d'enchère
		var startDate = this.value;

		// Définit la date minimale pour le champ de fin d'enchère
		document.getElementById('endBids').setAttribute('min', startDate);
	});
</script>
<%@ include file="templates/footer.jsp"%>
