<%@ include file="templates/header.jsp"%>
		<style>
			<%@ include file="../public/css/detailBid.css"%>
		</style>
		<div>
				<h1 class="title">Détail vente</h1>
			</div>
		<div>
			<div class="container">
				<div class="image-container">
					<img src="chemin/vers/mon-image.jpg" alt="#">
				</div>
				<div class="form">
						<div>
							<p id="article">PC Gamer pour travailler</p>
						</div>
						<div>
							<label for="description">Description :</label>
							<p id="description">Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing.
							</p>
						</div>
						<div>
							<label for="categorie-select">Catégorie :</label>
							<p id="categorie">
								Informatique
							</p>
						</div>
						<div>
							<label for="bestOffer">Meilleure offre :</label>
							<p id="bestOffer">210 pts par Bob</p>
						</div>
						<div>
							<label for="price">Mise à prix :</label>
							<p id="price">185 points</p>
						</div>
						<div>
							<label for="endBids">Fin de l'enchère :</label>
							<p id="endBids">09/10/2018</p>
						</div>
						<div>
							<p>Adresse :</p>
							<div>
								<p id="street">10 allée des alouettes</p>
								<p id="postalCode">44450</p>
								<p id="city">Nantes</p>
							</div>
						</div>
						<div>
							<label for="seller">Vendeur :</label>
							<p id="seller">jojo44</p>
						</div>
						<form action="#">
							<div>
								<label for="myBids">Mon enchère :</label>
								<input type="number" id="myBids">
							</div>
							<div>
								<input type="submit" name="Bids" value="Enchérir">
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


