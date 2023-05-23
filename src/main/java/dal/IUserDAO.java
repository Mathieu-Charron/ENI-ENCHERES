package dal;
import bo.User;

public interface IUserDAO extends ICRUDDAO<User> {
	String TABLE_NAME="USERS";

	
	User authenticate(String username, String password) throws DALException;
	boolean isUsernameOrEmailTaken(int userIdAuthenticate, String username, String email) throws DALException;
	
}
