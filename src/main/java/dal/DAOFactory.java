package dal;

import dal.jdbc.UserDAOJdbcImpl;

public class DAOFactory {

	public static IUserDAO getUserDAO() {
		return new UserDAOJdbcImpl();
	}
}
