package dal.jdbc;

import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import bo.User;
import dal.ConnectionProvider;
import dal.IUserDAO;

public class UserDAOJdbcImpl implements IUserDAO {

	@Override
	public void insert(User t) {
		// TODO Auto-generated method stub
		
	}

	@Override
	public void delete(int id) {
		// TODO Auto-generated method stub
		
	}

	@Override
	public void update(User user) {

		
	}

	@Override
	public User authenticate(String username, String password) {
		// TODO Auto-generated method stub
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
				+ " from "+NOM_TABLE+" WHERE username=? and password=?";
		try(Connection uneConnection= ConnectionProvider.getConnection();
				PreparedStatement unStmt= uneConnection.prepareStatement(sql);) {
			
			unStmt.setString(1, username);
			unStmt.setString(2, hashPassword(password));
			
			ResultSet rs = unStmt.executeQuery();
			
			while(rs.next()) {
				int userId = rs.getInt("userId");
				username = rs.getString("username").trim();
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
			e.printStackTrace();
//			throw new DALException(e.getMessage());
			throw new RuntimeException(e);
		}

//		return null;
	}
	
	
    private static String hashPassword(String password) {
        try {
            MessageDigest md = MessageDigest.getInstance("SHA-256");
            byte[] hashedBytes = md.digest(password.getBytes());
            StringBuilder sb = new StringBuilder();
            for (byte b : hashedBytes) {
                sb.append(String.format("%02x", b));
            }
            System.out.println(sb.toString());
            return sb.toString();
        } catch (NoSuchAlgorithmException e) {
            e.printStackTrace();
        }
        
        return null;
    }
}
