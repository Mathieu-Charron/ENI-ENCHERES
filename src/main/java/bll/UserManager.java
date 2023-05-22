package bll;

import java.util.Arrays;
import java.util.List;

import bo.User;
import dal.DALException;
import dal.DAOFactory;
import dal.IUserDAO;

public class UserManager /*SINGLETON*/ {
	private IUserDAO userDAO;
	private static UserManager instance;
	
	private static final String ERROR_BDD = "Une erreur est survenue\n";
	private static final String INCORRECT_CREDENTIALS = "Identifiants incorrects\n";
	
	private UserManager() {
		this.userDAO=DAOFactory.getUserDAO();
	}
	
	public static UserManager getInstance() {
		if(instance == null) {
			instance = new UserManager();
		}
		return instance;
	}
	
	public User authentication(String username,String password) throws BLLException {
		try {
			User user = userDAO.authenticate(username, password);
			
			if(user == null) {
				throw new BLLException(INCORRECT_CREDENTIALS);
			}
			
			return user;
		} catch (DALException e) {
			e.printStackTrace();
			throw new BLLException(ERROR_BDD);
		}
	}
	
	public User selectById(int id) throws BLLException {
		try {
			return userDAO.selectById(id);
		} catch (DALException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			throw new BLLException(ERROR_BDD);
		}
	}
	
	public void deleteUser(int id) throws BLLException {
		try {
			userDAO.delete(id);
		} catch (DALException e) {
			e.printStackTrace();
			throw new BLLException(ERROR_BDD);
		}
	}
	
	public User updateUser (
			User user,
			String username,
			String lastName,
			String firstName,
			String email,
			String phone,
			String street,
			String postalCode,
			String city,
			String oldPassword,
			String password,
			String confirmationPassword) throws BLLException {
		
		String errorMessage = "";

		
		//verif authenticate with oldUsername && oldPassword
		
		try {
			authentication(user.getUsername(), oldPassword);
		} catch(BLLException e) {
			errorMessage+= "Ancien mot de passe incorrect\n";
		}
		
		
		//verif not null values
		
		errorMessage+= checkValuesAreNotEmpty(Arrays.asList(username, lastName, firstName, email, phone, street, postalCode, city, password));
		
		//verif username > 3 characters
		
		errorMessage+= checkUsernameSize(username);
		
		//verif regex email
		
		errorMessage+= checkEmail(email);
		
		//verif regex phone
		
		errorMessage+= checkPhone(phone);
		
		//verif password = confirmPassword
		
		errorMessage+= checkConfirmPassword(password, confirmationPassword);
		
		//verif regex password
		
		errorMessage+= checkPassword(password);
		
		//verif alphaNumeric username
		
		errorMessage+= checkUsername(username);
		
		//FIRST THROW IF errorMessage is not empty
		if(errorMessage.length()>0) throw new BLLException(errorMessage);
		
		//verif unique username && email in the BDD
		
		//SECOND THROW IF errorMessage is not empty
		
		
		try {
			userDAO.update(new User(user.getUserId(),username, lastName, firstName, email, phone, street, postalCode, city, user.getCredit(), user.getAdministrator(), password));
			user = this.authentication(username, password);

		} catch (DALException e) {
			e.printStackTrace();
			
			throw new BLLException(ERROR_BDD);

		}
		return user;
	}
	
	public User insertUser(
			String username,
			String lastName,
			String firstName,
			String email,
			String phone,
			String street,
			String postalCode,
			String city,
			String password,
			String confirmationPassword) throws BLLException {
		
		String errorMessage = "";
		
		//verif not null values
		
		errorMessage+= checkValuesAreNotEmpty(Arrays.asList(username, lastName, firstName, email, phone, street, postalCode, city, password));
		
		//verif username > 3 characters
		
		errorMessage+= checkUsernameSize(username);
		
		//verif regex email
		
		errorMessage+= checkEmail(email);
		
		//verif regex phone
		
		errorMessage+= checkPhone(phone);
		
		//verif password = confirmPassword
		
		errorMessage+= checkConfirmPassword(password, confirmationPassword);
		
		//verif regex password
		
		errorMessage+= checkPassword(password);
		
		//verif alphaNumeric username
		
		errorMessage+= checkUsername(username);
		
		//FIRST THROW IF errorMessage is not empty
		if(errorMessage.length()>0) {
			throw new BLLException(errorMessage);
		}
		//verif unique username && email in the BDD
		
		//SECOND THROW IF errorMessage is not empty
		try {
			return userDAO.insert(new User(username, lastName, firstName, email, phone, street, postalCode, city, 100, false, password));
		} catch (DALException e) {
			e.printStackTrace();
			
			throw new BLLException(ERROR_BDD);
		}
	}
	
	
	private String checkValuesAreNotEmpty(List<String> values) {
		for(String value : values) {
			if(value.isBlank() || value.isEmpty()) {
				return "Les champs ne doivent pas être vides\n";
			}
		}
		return "";
	}
	
	private String checkUsernameSize(String username) {
		if (username.length() <= 4) {
		    return "Le nom d'utilisateur doit contenir plus de 3 caractères\n";
		}
		return "";
	}
	
	private String checkEmail(String email) {
		String emailRegex = "^[A-Za-z0-9+_.-]+@[A-Za-z0-9.-]+$";
		if (!email.matches(emailRegex)) {
		    return "L'adresse e-mail n'est pas valide\n";
		}
		return "";
	}
	
	private String checkPhone(String phone) {
		String phoneRegex = "^(\\+\\d{1,3}[- ]?)?\\d{10}$";
		if (!phone.matches(phoneRegex)) {
		    return "Le numéro de téléphone n'est pas valide\n";
		}
		return "";
	}
	
	private String checkConfirmPassword(String password, String confirmationPassword) {
		if (!password.equals(confirmationPassword)) {
		    return "Les mots de passe ne correspondent pas\n";
		}
		return "";
	}
	
	private String checkPassword (String password) {
		// au moins 8 caractères, au moins une lettre majuscule, une lettre minuscule et un chiffre
//		String passwordRegex = "^(?=.*[a-z])(?=.*[A-Z])(?=.*\\d)[a-zA-Z\\d]{8,}$";
		String passwordRegex = "^(?=.*\\d)(?=.*[a-z])(?=.*[A-Z]).{8,}$";
		if (!password.matches(passwordRegex)) {
		    return "Le mot de passe doit contenir au moins 8 caractères, dont au moins une lettre majuscule, une lettre minuscule et un chiffre\n";
		}
		return "";
	}
	
	private String checkUsername (String username) {
		String usernameRegex = "^[a-zA-Z0-9]+$";
		if (!username.matches(usernameRegex)) {
		    return "Le nom d'utilisateur ne doit contenir que des caractères alphanumériques\n";
		}
		return "";
	}
	
	
}
