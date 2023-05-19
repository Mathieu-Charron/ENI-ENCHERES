package bll;

import bo.User;
import dal.DALException;
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
		try {
			return userDAO.authenticate(username, password);
		} catch (DALException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return null;
	}
	
	public User selectById(int id) {
		try {
			return userDAO.selectById(id);
		} catch (DALException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return null;
	}
	
	public void deleteUser(int id) {
		try {
			userDAO.delete(id);
		} catch (DALException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
	
	public void updateUser(User user) {
		try {
			userDAO.update(user);
		} catch (DALException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
	
	public User insertUser(User user) {
		try {
			return userDAO.insert(user);
		} catch (DALException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return null;
	}
}
