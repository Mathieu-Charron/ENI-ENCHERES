package bll;

import bo.User;
import dal.DAOFactory;
import dal.IUserDAO;

public class UserManager /*SINGLETON*/ {
	private IUserDAO userDAO;
	private static UserManager instance;
	
	private UserManager() {
		this.userDAO=DAOFactory.getUserDAO();
	}
	
	public static UserManager getInstance() {
		if(instance == null) {
			instance = new UserManager();
		}
		return instance;
	}
	
	public User authentication(String username,String password) {
		return userDAO.authenticate(username, password);
	}
}
