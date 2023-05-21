package bll;

import bo.User;
import dal.DALException;
import dal.DAOFactory;
import dal.IUserDAO;

public class UserManager /*SINGLETON*/ {
	private IUserDAO userDAO;
	private static UserManager instance;
	
	private static final String ERROR_BDD = "Une erreur est survenue";
	private static final String INCORRECT_CREDENTIALS = "Identifiants incorrects";
	
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
		user = null;
		//verif authenticate with oldUsername && oldPassword
		
		//verif not null values
		
		//verif username > 3 characters
		
		//verif regex email
		
		//verif regex phone
		
		//verif password = confirmPassword
		
		//verif regex password
		
		//verif alphaNumeric username
		
		//FIRST THROW IF errorMessage is not empty
		
		//verif unique username && email in the BDD
		
		//SECOND THROW IF errorMessage is not empty
		
		
		try {
			userDAO.update(new User(username, lastName, firstName, email, phone, street, postalCode, city, 100, false, password));
			user = userDAO.authenticate(username, confirmationPassword);
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
		
		//verif username > 3 characters
		
		//verif regex email
		
		//verif regex phone
		
		//verif password = confirmPassword
		
		//verif regex password
		
		//verif alphaNumeric username
		
		//FIRST THROW IF errorMessage is not empty
		
		//verif unique username && email in the BDD
		
		//SECOND THROW IF errorMessage is not empty
		try {
			return userDAO.insert(new User(username, lastName, firstName, email, phone, street, postalCode, city, 100, false, password));
		} catch (DALException e) {
			e.printStackTrace();
			
			throw new BLLException(ERROR_BDD);
		}
	}
}
