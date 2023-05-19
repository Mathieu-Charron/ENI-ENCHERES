<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ include file="templates/header.jsp"%>
<style>
		<%@ include file="../public/css/profile.css"%>
</style>
	<div class="container-edit-profile">
	<h1>Mon profil</h1>
	<div class="form">
		<form action="${pageContext.request.contextPath}/EditProfile">
	
			<div class="form-element">
                <label for="username">Pseudo :</label>
                <input type="text" id="username" name="username" value="<c:out value="${user.username}"/>">
            </div>
            
            <div class="form-element">
                <label for="lastName">Nom :</label>
                <input type="text" id="lastName" name="lastName" value="<c:out value="${user.lastName}"/>">
            </div>
            
            <div class="form-element">
                <label for="firstName">Prénom :</label>
                <input type="text" id="firstName" name="firstName" value="<c:out value="${user.firstName}"/>">
            </div>
            
            <div class="form-element">
                <label for="email">Email :</label>
                <input type="email" id="email" name="email" value="<c:out value="${user.email}"/>">
            </div>
            
            <div class="form-element">
                <label for="phone">Téléphone :</label>
                <input type="tel" id="phone" name="phone" value="<c:out value="${user.phone}"/>">
            </div>
            
            <div class="form-element">
                <label for="street">Rue :</label>
                <input type="text" id="street" name="street" value="<c:out value="${user.street}"/>">
            </div>
        
            <div class="form-element">
                <label for="postalCode">Code Postal :</label>
                <input type="text" id="postalCode" name="postalCode" value="<c:out value="${user.postalCode}"/>">
            </div>
        
            <div class="form-element">
                <label for="city">Ville :</label>
                <input type="text" id="city" name="city" value="<c:out value="${user.city}"/>">
            </div>
        
            <div class="form-element">
                <label for="password">Mot de passe :</label>
                <input type="password" id="password" name="password">
            </div>
        
            <div class="form-element">
                <label for="confirmationPassword">Confirmation du mot de passe :</label>
                <input type="password" id="confirmationPassword" name="confirmationPassword" required>
            </div>
			<div class="profile-button">
			<c:if test="${not empty sessionScope.user}">
			<input class="button-style-1" type="submit" value="Enregistrer">
			</c:if>
			<c:if test="${not empty sessionScope.user}">
		    <input class="button-style-1" type="button" value="Supprimer mon compte">
		    </c:if>
		    <c:if test="${empty sessionScope.user}">
		    <input class="button-style-1" type="submit" value="Créer">
		    </c:if>
		    <c:if test="${empty sessionScope.user}">
<!-- 		    <input type="button" value="Annuler">
 -->		    <a href="<%= request.getContextPath() %>/">Annuler</a>
		    </c:if>
		    </div>
		</form>
	</div>
	</div>
<%@ include file="templates/footer.jsp"%>
