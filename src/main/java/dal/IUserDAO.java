package dal;
import bo.User;

public interface IUserDAO extends ICRUDDAO<User> {
	String NOM_TABLE="USERS";

	
	User authenticate(String username, String password);
}
