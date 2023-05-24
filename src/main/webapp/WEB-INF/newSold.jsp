<%@ include file="templates/header.jsp"%>
<style>
	<%@ include file="../public/css/NewSold.css"%>
	<%@ include file="../public/css/profile.css"%>
</style>
<div>
	<div class="container">
		<div class="image-container">
			<div class="image-container-box">
				<img id="preview" src="#" alt="Aperçu de l'image">
			</div>
		</div>
		<div class="form">
			<form action="${pageContext.request.contextPath}/newSold">
				<div>
					<h1 class="title">Nouvelle vente</h1>
				</div>
				<div>
					<p>Article :</p>
				</div>
				<div class="flex" style="justify-content: center;">
					<div class="articleName">
						<input placeholder="Nom de l'article" type="text" id="article" name="article" required>
					</div>
					<div class="categorie">
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
				<div class="flex">
					<p class="pLabel">Photo de l'article :</p>
					<input type="file" id="picture" name="picture" accept="image/*" required>
				</div>
				<div class="flex">
					<p class="pLabel">Prix de l'article :</p>
					<input placeholder="Prix de l'article" type="number" id="price" name="price" min="0" max="9999999" required>
				</div>
				<div class="bidsDate">
					<div class="startBids">
						<p>Début de l'enchère :</p>
						<input type="date" name="startBids" id="startBids" required>
					</div>
					<div class="endBids">
						<p>Fin de l'enchère :</p>
						<input type="date" name="endBids" id="endBids" required>
					</div>
				</div>
				<div>
					<p>Retrait :</p>
					<div>
						<div>
							<input placeholder="Rue" name="street" size="15" required>
						</div>
						<div>
							<input placeholder="Code Postal" name="postalCode" size="15" required>
						</div>
						<div>
							<input placeholder="Ville :" name="city" size="15" required>
						</div>
					</div>
				</div>
				<div class="flex-button">
					<input class="button-style-1" style="margin-right: 5px;" type="submit" name="Register" value="Enregistrer">
					<input class="button-style-1" style="margin-left: 5px;" type="button" name="Cancel" value="Annuler">
				</div>
			</form>
		</div>
	</div>
</div>
<script>
	/* Date du jour */
	var today = new Date().toISOString().split('T')[0];
	document.getElementById('startBids').setAttribute('min', today);
	document.getElementById('startBids').addEventListener('change', function() {
		var startDate = this.value;
		document.getElementById('endBids').setAttribute('min', startDate);
	});
	/* Affichage de l'image de l'enchère */
	document.getElementById('picture').addEventListener('change', function(e) {
        var file = e.target.files[0];
        var reader = new FileReader();

        reader.onload = function(e) {
            document.getElementById('preview').setAttribute('src', e.target.result);
        }

        reader.readAsDataURL(file);
    });
</script>
<%@ include file="templates/footer.jsp"%>
