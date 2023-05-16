<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="utf-8">
		<meta name="viewport" content="width=device-width, initial-scale=1">
		<title>Nouvelle vente</title>
		<link rel="css" href="css/newSold.css">
		<link rel="icon" href="favicon.jpg" />
	</head>
	<body>
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
					<form action="#">
						<div>
							<label for="article">Article :</label>
							<input type="text" id="article" name="article" required size="20">
						</div>
						<div>
							<label for="description">Description :</label>
							<textarea id="description" name="description" required rows="5"></textarea>
						</div>
						<div>
							<label for="categorie-select">Catégorie :</label>
							<select name="categorie" id="categorie-select" required>
								<option value="">--Choisir une Catégorie--</option>
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
							<label for="price">Mise à prix :</label>
							<input type="number" id="price" name="price" min="0" max="9999999" required>
						</div>
						<div>
							<label for="startBids">Début de l'enchère :</label>
							<input type="date" name="startBids" id="startBids" required>
						</div>
						<div>
							<label for="endBids">Fin de l'enchère :</label>
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
	</body>
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
</html>

