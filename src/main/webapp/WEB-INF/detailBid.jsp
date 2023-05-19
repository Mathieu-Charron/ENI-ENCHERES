<%@ include file="templates/header.jsp"%>
		<style>
			<%@ include file="../public/css/detailBid.css"%>
		</style>
		<div>
				<h1 class="title">D�tail vente</h1>
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
							<label for="categorie-select">Cat�gorie :</label>
							<p id="categorie">
								Informatique
							</p>
						</div>
						<div>
							<label for="bestOffer">Meilleure offre :</label>
							<p id="bestOffer">210 pts par Bob</p>
						</div>
						<div>
							<label for="price">Mise � prix :</label>
							<p id="price">185 points</p>
						</div>
						<div>
							<label for="endBids">Fin de l'ench�re :</label>
							<p id="endBids">09/10/2018</p>
						</div>
						<div>
							<p>Adresse :</p>
							<div>
								<p id="street">10 all�e des alouettes</p>
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
								<label for="myBids">Mon ench�re :</label>
								<input type="number" id="myBids">
							</div>
							<div>
								<input type="submit" name="Bids" value="Ench�rir">
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


