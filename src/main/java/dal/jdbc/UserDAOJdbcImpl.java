package dal.jdbc;

import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import bo.User;
import dal.ConnectionProvider;
import dal.DALException;
import dal.IUserDAO;

public class UserDAOJdbcImpl implements IUserDAO {

	@Override
	public User insert(User user) throws DALException {
		String sql="INSERT " + TABLE_NAME +" "
				+ "(username,"
				+ "lastName,"
				+ "firstName,"
				+ "email,"
				+ "phone,"
				+ "street,"
				+ "postalCode,"
				+ "city,"
				+ "password,"
				+ "credit,"
				+ "administrator) "
				+ "VALUES (?,?,?,?,?,?,?,?,?,?,?)";
		try(Connection uneConnection= ConnectionProvider.getConnection();
				PreparedStatement unStmt= uneConnection.prepareStatement(sql,PreparedStatement.RETURN_GENERATED_KEYS);) {
			
			int i = 0;
			
			unStmt.setString(++i, user.getUsername());
			unStmt.setString(++i, user.getLastName());
			unStmt.setString(++i, user.getFirstName());
			unStmt.setString(++i, user.getEmail());
			unStmt.setString(++i, user.getPhone());
			unStmt.setString(++i, user.getStreet());
			unStmt.setString(++i, user.getPostalCode());
			unStmt.setString(++i, user.getCity());
			unStmt.setString(++i, hashPassword(user.getPassword()));
			unStmt.setInt(++i, user.getCredit());
			unStmt.setBoolean(++i, user.getAdministrator());
			
			unStmt.executeUpdate();
			ResultSet rs = unStmt.getGeneratedKeys();
			if(rs.next()) {
				user.setUserId(rs.getInt(1));
			};
			
			return user;
		} catch (SQLException e) {
			throw new DALException(e.getMessage());
		}
		
	}

	@Override
	public void delete(int id) throws DALException {
		String sql="DELETE "+TABLE_NAME+" WHERE userId=?";
		try(Connection uneConnection= ConnectionProvider.getConnection();
				PreparedStatement unStmt= uneConnection.prepareStatement(sql);) {
			
			unStmt.setInt(1, id);
			
			unStmt.executeUpdate();
			
		} catch (SQLException e) {
			throw new DALException(e.getMessage());
		}
	}

	@Override
	public void update(User user) throws DALException {
		String sql="UPDATE "+ TABLE_NAME + " SET "
				+ "	username=?,"
				+ "	lastName=?,"
				+ "	firstName=?,"
				+ "	email=?,"
				+ "	phone=?,"
				+ "	street=?,"
				+ "	postalCode=?,"
				+ "	city=?,"
				+ "	password=?,"
				+ "	credit=?,"
				+ "	administrator=?"
				+ "	WHERE userId=?";
		try(Connection uneConnection= ConnectionProvider.getConnection();
				PreparedStatement unStmt= uneConnection.prepareStatement(sql);) {
			
			int i = 0;
			
			unStmt.setString(++i, user.getUsername());
			unStmt.setString(++i, user.getLastName());
			unStmt.setString(++i, user.getFirstName());
			unStmt.setString(++i, user.getEmail());
			unStmt.setString(++i, user.getPhone());
			unStmt.setString(++i, user.getStreet());
			unStmt.setString(++i, user.getPostalCode());
			unStmt.setString(++i, user.getCity());
			unStmt.setString(++i, hashPassword(user.getPassword()));
			unStmt.setInt(++i, user.getCredit());
			unStmt.setBoolean(++i, user.getAdministrator());
			unStmt.setInt(++i, user.getUserId());
			
			unStmt.executeUpdate();
			
		} catch (SQLException e) {
			throw new DALException(e.getMessage());
		}
		
	}

	@Override
	public User authenticate(String username, String password) throws DALException {
		String sql="SELECT TOP(1)"
				+ "userId,"
				+ "username,"
				+ "lastName,"
				+ "firstName,"
				+ "email,"
				+ "phone,"
				+ "street,"
				+ "postalCode,"
				+ "city,"
				+ "credit,"
				+ "administrator"
				+ " from "+TABLE_NAME+" WHERE username=? and password=?";
		try(Connection uneConnection= ConnectionProvider.getConnection();
				PreparedStatement unStmt= uneConnection.prepareStatement(sql);) {
			
			unStmt.setString(1, username);
			unStmt.setString(2, hashPassword(password));
			
			ResultSet rs = unStmt.executeQuery();
			
			while(rs.next()) {
				int userId = rs.getInt("userId");
				username = rs.getString("username");
				String lastName = rs.getString("lastName");
				String firstName = rs.getString("firstName");
				String email = rs.getString("email");
				String phone = rs.getString("phone");
				String street = rs.getString("street");
				String postalCode = rs.getString("postalCode");
				String city = rs.getString("city");
				int credit = rs.getInt("credit");
				boolean administrator = rs.getBoolean("administrator");
				
				return new User(userId, username, lastName, firstName, email, phone, street, postalCode, city, credit, administrator);
			}
			return null;
		} catch (SQLException e) {
			throw new DALException(e.getMessage());
//			throw new RuntimeException(e);
		}

	}
	
	
    private static String hashPassword(String password) {
        try {
            MessageDigest md = MessageDigest.getInstance("SHA-256");
            byte[] hashedBytes = md.digest(password.getBytes());
            StringBuilder sb = new StringBuilder();
            for (byte b : hashedBytes) {
                sb.append(String.format("%02x", b));
            }
            return sb.toString();
        } catch (NoSuchAlgorithmException e) {
            e.printStackTrace();
        }
        
        return null;
    }
}
