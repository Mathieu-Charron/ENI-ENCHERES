<%@ include file="templates/header.jsp"%>
<style>
	<%@ include file="../public/css/NewSold.css"%>
	<%@ include file="../public/css/profile.css"%>
</style>
<div class="container-new-sold">
	<div class="container">
		<div class="image-container">
			<div class="image-container-box">
				<img id="preview" src="<%= request.getContextPath() %>/public/assets/image/no-image.png" alt="Aperçu de l'image">
<%-- 				<img src="<%= request.getContextPath() %>/public/assets/image/logo.png" alt="#">
 --%>			</div>
		</div>
		<div class="form">
			<form method="POST" action="${pageContext.request.contextPath}/NewSold">
				<div>
					<h1 class="title">Nouvelle vente</h1>
				</div>
				<div>
					<p>Article :</p>
				</div>
				<div class="flex" style="justify-content: center;">
					<div class="articleName">
						<input placeholder="Nom de l'article" type="text" id="itemName" name="itemName" required>
					</div>
					<div class="categorie">
						<select name="categorie" id="categorie-select" required>
							<option value="">--Choisir une Catégorie--</option>
					    	<c:forEach var="category" items="${categories}">
					    		<option value="${category.categoryId}">${category.label}</option>
							</c:forEach>
						</select>
					</div>
				</div>
				<div>
					<textarea placeholder="Description" id="description" name="description" required rows="5"></textarea>
				</div>
				<div class="flex">
					<p style="width:20%">Photo de l'article :</p>
					<input style="width:100%" type="file" id="picture" name="picture" accept="image/png, image/jpeg">
				</div>
				<div class="flex">
					<p class="pLabel">Prix de l'article :</p>
					<input placeholder="Prix de l'article" type="number" id="initialPrice" name="initialPrice" min="0" max="9999999" required>
				</div>
				<div class="bidsDate flex">
					<div class="startBids">
						<p>Début de l'enchère :</p>
						<input type="date" name="startDate" id="startDate" required>
					</div>
					<div class="endBids">
						<p>Fin de l'enchère :</p>
						<input type="date" name="endDate" id="endDate" required>
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
					<input class="button-style-1" style="margin-right: 5px;" type="submit">
<!-- 					<input class="button-style-1" style="margin-left: 5px;" type="button" name="Cancel" value="Annuler">
 -->				<a class="button-style-1" style="margin-left: 5px;" href="<%= request.getContextPath() %>/">Annuler</a>
				</div>
			</form>
		</div>
	</div>
</div>
<script>
	/* Date du jour */
	var today = new Date().toISOString().split('T')[0];
	document.getElementById('startDate').setAttribute('min', today);
	document.getElementById('startDate').addEventListener('change', function() {
		var startDate = this.value;
		document.getElementById('endDate').setAttribute('min', startDate);
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
