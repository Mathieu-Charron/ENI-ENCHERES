<%@ include file="templates/header.jsp"%>
		<style>
			<%@ include file="../CSS/NewSold.css"%>
		</style>
		<header>
			<div class="logo">
				<!--<p>logo</p>-->
				<img class="logo" src="logo.jpg">
			</div>
			<div>
				<p class="title">Nouvelle vente</p>
			</div>
		</header>
		<div>
			<div class="container">
				<div class="image-container">
					<img src="chemin/vers/mon-image.jpg" alt="#">
				</div>
				<div class="form">
					<form action="${pageContext.request.contextPath}/newSold">
						<div>
							<label for="article">Article :</label>
							<input type="text" id="article" name="article" required size="20">
						</div>
						<div>
							<label for="description">Description :</label>
							<textarea id="description" name="description" required rows="5"></textarea>
						</div>
						<div>
							<label for="categorie-select">Cat�gorie :</label>
							<select name="categorie" id="categorie-select" required>
								<option value="">--Choisir une Cat�gorie--</option>
							    <option value="informatique">Informatique</option>
							    <option value="meuble">Meuble</option>
							    <option value="livre">Livre</option>
							</select>
						</div>
						<div>
							<label for="picture">Photo de l'article :</label>
							<input type="file" id="picture" name="picture" accept="image/png, image/jpeg" required>
						</div>
						<div>
							<label for="price">Mise � prix :</label>
							<input type="number" id="price" name="price" min="0" max="9999999" required>
						</div>
						<div>
							<label for="startBids">D�but de l'ench�re :</label>
							<input type="date" name="startBids" id="startBids" required>
						</div>
						<div>
							<label for="endBids">Fin de l'ench�re :</label>
							<input type="date" name="endBids" id="endBids" required>
						</div>
						<div>
							<p>Retrait :</p>
							<div>
								<label for="street">Rue :</label>
								<input type="street" name="street" size="15" required>
								<br>
								<label for="postalCode">Code Postal :</label>
								<input type="postalCode" name="postalCode" size="15" required>
								<br>
								<label for="city">Ville :</label>
								<input type="city" name="city" size="15" required>
							</div>
						</div>
						<div>
							<input type="submit" name="Register" value="Enregistrer">
							<input type="button" name="Cancel" value="Annuler">
						</div>
					</form>
				</div>
			</div>
		</div>
	<script>
		// Obtient la date actuelle
		var today = new Date().toISOString().split('T')[0];
		// D�finit la date minimale pour le champ de d�but d'ench�re
		document.getElementById('startBids').setAttribute('min', today);
	
		// G�re l'�v�nement de changement de date de d�but d'ench�re
		document.getElementById('startBids').addEventListener('change', function() {
			// Obtient la valeur s�lectionn�e du champ de d�but d'ench�re
			var startDate = this.value;
			
			// D�finit la date minimale pour le champ de fin d'ench�re
			document.getElementById('endBids').setAttribute('min', startDate);
		});
	</script>	
<%@ include file="templates/footer.jsp"%>


