<%@ include file="templates/header.jsp"%>
<style>
	<%@ include file="../public/css/NewSold.css"%>
	<%@ include file="../public/css/profile.css"%>
</style>
<div>
	<div class="container">
		<div class="image-container">
			<div class="image-container-box">
				<img id="preview" src="<%= request.getContextPath() %>/public/assets/image/no-image.png" alt="Aperçu de l'image">
<%-- 				<img src="<%= request.getContextPath() %>/public/assets/image/logo.png" alt="#">
 --%>			</div>
		</div>
		<div class="form">
			<form action="${pageContext.request.contextPath}/newSold">
				<div>
					<h1 class="title">Nouvelle vente</h1>
				</div>
				<div>
					<p>Article :</p>
				</div>
				<div style="display: flex; justify-content: center;">
					<div style="width: 60%; margin-right: 5px">
						<input placeholder="Nom de l'article" type="text" id="article" name="article" required>
					</div>
					<div style="width:40%; margin-left: 5px">
						<select style="width:100%" name="categorie" id="categorie-select" required>
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
				<div style="display:flex;">
					<p style="width:20%">Photo de l'article :</p>
					<input style="width:100%" type="file" id="picture" name="picture" accept="image/png, image/jpeg" required>
				</div>
				<div style="display:flex;">
					<p style="width:20%">Prix de l'article :</p>
					<input placeholder="Prix de l'article" type="number" id="price" name="price" min="0" max="9999999" required>
				</div>
				<div class="bidsDate" style="justify-content: center;">
					<div style="margin-right: 5%; width: 40%;">
						<p>Début de l'enchère :</p>
						<input type="date" name="startBids" id="startBids" required>
					</div>
					<div style="margin-left: 5%; width: 40%;">
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
							<input placeholder="Code Postale" name="postalCode" size="15" required>
						</div>
						<div>
							<input placeholder="Ville :" name="city" size="15" required>
						</div>
					</div>
				</div>
				<div style="display: flex; width:100%; margin:auto; box-sizing: border-box;">
					<input class="button-style-1" style="margin-right: 5px;" type="submit" name="Register" value="Enregistrer">
<!-- 					<input class="button-style-1" style="margin-left: 5px;" type="button" name="Cancel" value="Annuler">
 -->					<a class="button-style-1" style="margin-left: 5px;" href="<%= request.getContextPath() %>/">Annuler</a>
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
