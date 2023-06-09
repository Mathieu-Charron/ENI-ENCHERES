<%@ include file="templates/header.jsp"%>
<style>
	<%@ include file="../public/css/NewSold.css"%>
	<%@ include file="../public/css/profile.css"%>
</style>
<div class="container-new-sold">
	<div class="container">
		<div class="image-container">
			<div class="image-container-box">
				<img id="preview" src="<%= request.getContextPath() %>/public/assets/image/no-image.png" alt="Aper�u de l'image">
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
						<input placeholder="Nom de l'article" type="text" id="itemName" name="itemName" value="${form.itemName}" required>
					</div>
					<div class="categorie">
						<select name="categoryId" id="categorie-select" required>
							<option value="">--Choisir une Cat�gorie--</option>
					    	<c:forEach var="category" items="${categories}">
					    		<c:if test="${category.categoryId eq form.categoryId}">
					    			<option value="${category.categoryId}" selected>${category.label}</option>
					    		</c:if>
					    		<c:if test="${!(category.categoryId eq form.categoryId)}">
					    			<option value="${category.categoryId}" >${category.label}</option>
					    		</c:if>
							</c:forEach>
						</select>
					</div>
				</div>
				<div>
					<textarea placeholder="Description" id="description" name="description" required rows="5">${form.description}</textarea>
				</div>
				<div class="flex">
					<p style="width:20%">Photo de l'article :</p>
					<input style="width:100%" type="file" id="picture" name="picture" accept="image/png, image/jpeg">
				</div>
				<div class="flex">
					<p class="pLabel">Prix de l'article :</p>
					<input placeholder="Prix de l'article" type="number" value="${form.initialPrice}" id="initialPrice" name="initialPrice" min="0" max="9999999" required>
				</div>
				<div class="bidsDate flex">
					<div class="startBids">
						<p>D�but de l'ench�re :</p>
						<input type="date" name="startDate" id="startDate" value="${form.startDate}" required>
					</div>
					<div class="endBids">
						<p>Fin de l'ench�re :</p>
						<input type="date" name="endDate" id="endDate"  value="${form.endDate}" required>
					</div>
				</div>
				<div>
					<p>Retrait :</p>
					<div>
						<div>
							<c:choose>
								<c:when test="${form != null}">
									<input placeholder="Rue" name="street" size="15" required value='<c:out value="${form.street}"/>'>
								</c:when>
								<c:otherwise>
									<input placeholder="Rue" name="street" size="15" required value='<c:out value="${sessionScope.user.street}" />'>
								</c:otherwise>
							</c:choose>
						</div>
						<div>
							<c:choose>
								<c:when test="${form != null}">
									<input placeholder="Code Postal" name="postalCode" size="15" required value='<c:out value="${form.postalCode}" />'>
								</c:when>
								<c:otherwise>
									<input placeholder="Code Postal" name="postalCode" size="15" required value='<c:out value="${sessionScope.user.postalCode}" />'>
								</c:otherwise>
							</c:choose>
						</div>
						<div>
							<c:choose>
								<c:when test="${form != null}">
									<input placeholder="Ville" name="city" size="15" required value='<c:out value="${form.city}" />'>
								</c:when>
								<c:otherwise>
									<input placeholder="Ville" name="city" size="15" required value='<c:out value="${sessionScope.user.city}" />'>
								</c:otherwise>
							</c:choose>
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
	/* Affichage de l'image de l'ench�re */
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
