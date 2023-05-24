<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ include file="templates/header.jsp"%>
<style>
		<%@ include file="../public/css/profile.css"%>
</style>
	<div class="container-edit-profile">
	<h1>Mon profil</h1>
	<div class="form">
		<form method="POST" action="${pageContext.request.contextPath}${servletPath}">
	
			<div class="form-element">
				<div>
                	<label for="username">Pseudo</label>
                	<c:choose>
				         <c:when test="${not empty form}">
           	                <input type="text" id="username" name="username" value="<c:out value="${form.username}"/>">
				         </c:when>
				         <c:otherwise>
           	                <input type="text" id="username" name="username" value="<c:out value="${user.username}"/>">
				         </c:otherwise>
				    </c:choose>
                </div>
            </div>
            
            <div class="form-element">
            	<div>
                	<label for="lastName">Nom</label>
                	<c:choose>
				         <c:when test="${not empty form}">
           	                <input type="text" id="lastName" name="lastName" value="<c:out value="${form.lastName}"/>">
				         </c:when>
				         <c:otherwise>
           	                <input type="text" id="lastName" name="lastName" value="<c:out value="${user.lastName}"/>">
				         </c:otherwise>
				    </c:choose>
                </div>
            </div>
            
            <div class="form-element">
	            <div>
	                <label for="firstName">Prénom</label>
	                <c:choose>
				         <c:when test="${not empty form}">
           	                <input type="text" id="firstName" name="firstName" value="<c:out value="${form.firstName}"/>">
				         </c:when>
				         <c:otherwise>
           	                <input type="text" id="firstName" name="firstName" value="<c:out value="${user.firstName}"/>">
				         </c:otherwise>
				    </c:choose>
                </div>
            </div>
            
            <div class="form-element">
	            <div>
	                <label for="email">Email</label>
	                <c:choose>
				         <c:when test="${not empty form}">
           	                <input type="email" id="email" name="email" value="<c:out value="${form.email}"/>">
				         </c:when>
				         <c:otherwise>
           	                <input type="email" id="email" name="email" value="<c:out value="${user.email}"/>">
				         </c:otherwise>
				    </c:choose>
                </div>
            </div>
            
            <div class="form-element">
	            <div>
	                <label for="phone">Téléphone</label>
	                <c:choose>
				         <c:when test="${not empty form}">
           	                <input type="text" id="phone" name="phone" value="<c:out value="${form.phone}"/>">
				         </c:when>
				         <c:otherwise>
           	                <input type="text" id="phone" name="phone" value="<c:out value="${user.phone}"/>">
				         </c:otherwise>
				    </c:choose>
                </div>
            </div>
            
            <div class="form-element">
	            <div>
	                <label for="street">Rue</label>
        			<c:choose>
				         <c:when test="${not empty form}">
           	                <input type="text" id="street" name="street" value="<c:out value="${form.street}"/>">
				         </c:when>
				         <c:otherwise>
           	                <input type="text" id="street" name="street" value="<c:out value="${user.street}"/>">
				         </c:otherwise>
				    </c:choose>
                </div>
            </div>
        
            <div class="form-element">
	            <div>
	                <label for="postalCode">Code Postal</label>
                     <c:choose>
				         <c:when test="${not empty form}">
	          	                <input type="text" id="postalCode" name="postalCode" value="<c:out value="${form.postalCode}"/>">
				         </c:when>
				         <c:otherwise>
	          	                <input type="text" id="postalCode" name="postalCode" value="<c:out value="${user.postalCode}"/>">
				         </c:otherwise>
				      </c:choose>
                </div>
            </div>
                    
            <div class="form-element">
	            <div>
	                <label for="city">Ville</label>
	                <c:choose>
				         <c:when test="${not empty form}">
	          	                <input type="text" id="city" name="city" value="<c:out value="${form.city}"/>">
				         </c:when>
				         <c:otherwise>
	          	                <input type="text" id="city" name="city" value="<c:out value="${user.city}"/>">
				         </c:otherwise>
				      </c:choose>
	            </div>
	        </div>
            <c:if test="${servletPath.equals('/EditProfile')}">
	            <div class="form-element">
		            <div>
		                <label for="oldPassword">Mot de passe actuel</label>
		                <input type="password" id="oldPassword" name="oldPassword">
	                </div>
	            </div>
	            
	            <div class="form-element">
	               
	            </div>
        	</c:if>
            <div class="form-element">
	            <div>
	                <label for="password">Nouveau mot de passe</label>
	                <input type="password" id="password" name="password">
                </div>
            </div>
        
            <div class="form-element">
            	<div>
                	<label for="confirmationPassword">Confirmation du mot de passe</label>
                	<input type="password" id="confirmationPassword" name="confirmationPassword" required>
                </div>
            </div>
            
            <c:if test="${servletPath.equals('/EditProfile')}">
             <div class="coins">
	      		<div>
	                <label for="city">Crédit :</label>
	                <%-- <input type="text" id="credit" name="credit" value="<c:out value="${user.credit}"/>"> --%>
	                <label id="credit" for="credit">${user.credit}<i class="fa-solid fa-coins"></i></label>
	                
	           	</div>
            </div>
            
            
            </c:if>
            
			<div class="profile-button">
			<c:if test="${not empty sessionScope.user}">
			<input class="button-style-1" type="submit" value="Enregistrer">
			</c:if>
			<c:if test="${not empty sessionScope.user}">
    			<a href="${pageContext.request.contextPath}/EditProfile?action=delete"><input class="button-danger" type="button" value="Supprimer mon compte" onclick="confirmDelete();"></a>        			
			</c:if>
		    
		    
		    <c:if test="${empty sessionScope.user}">
		    <input class="button-style-1" type="submit" value="Créer">
		    </c:if>
		    <c:if test="${empty sessionScope.user}">
<!-- 		    <input type="button" value="Annuler">
 -->		    <a class="button-style-1" href="<%= request.getContextPath() %>/">Annuler</a>
		    </c:if>
		    </div>
		</form>
		
	</div>
	</div>
	
	<script>
	function confirmDelete() {
    	 confirm("Voulez-vous vraiment supprimer votre compte ?");
	}
</script>
<%@ include file="templates/footer.jsp"%>
