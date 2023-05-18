package dal;

import dal.jdbc.SoldItemDAOJdbcImpl;
import dal.jdbc.UserDAOJdbcImpl;

public class DAOFactory {

	public static IUserDAO getUserDAO() {
		return new UserDAOJdbcImpl();
	}
	
	public static ISoldItemDAO getSoldItemDAO() {
		return new SoldItemDAOJdbcImpl();
	}
}
