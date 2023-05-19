package dal.jdbc;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.time.LocalDate;
import java.util.ArrayList;
import java.util.List;

import bo.Bid;
import bo.SoldItem;
import bo.User;
import dal.ConnectionProvider;
import dal.DALException;
import dal.ISoldItemDAO;

public class SoldItemDAOJdbcImpl implements ISoldItemDAO {

	@Override
	public SoldItem insert(SoldItem t) throws DALException {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public void delete(int id) throws DALException {
		// TODO Auto-generated method stub

	}

	@Override
	public void update(SoldItem t) throws DALException {
		// TODO Auto-generated method stub

	}

	@Override
	public List<SoldItem> selectItemsByFilters(String searchItemName, int categoryId, boolean isTypeBuy,
			List<String> filterCheck, User user) throws DALException {
		
		List<SoldItem> soldItems = new ArrayList<>();
		
		String sql= getRequestOnStringForSelectItemsByFilters(searchItemName,categoryId,isTypeBuy,filterCheck, user);
		
		try(Connection uneConnection= ConnectionProvider.getConnection();
				PreparedStatement unStmt= uneConnection.prepareStatement(sql);) {
			int i = 0;

			unStmt.setString(++i, "%" + searchItemName + "%");
			
			if(categoryId!=0) unStmt.setInt(++i, categoryId);

			if(user != null) {
				
				if(isTypeBuy) {
					if(filterCheck.contains("myBids")) unStmt.setInt(++i, user.getUserId());
					if(filterCheck.contains("myWonBids")) unStmt.setInt(++i, user.getUserId());
				}
				
				if(!isTypeBuy && filterCheck.size()>0) unStmt.setInt(++i, user.getUserId());

			}

			
			ResultSet rs = unStmt.executeQuery();
			
			while(rs.next()) {
				int soldItemId = rs.getInt("soldItemId");
				String itemName = rs.getString("itemName");
				int salePrice = rs.getInt("salePrice");
				LocalDate endDate = rs.getDate("endDate").toLocalDate();
				int userId = rs.getInt("userId");
				String username = rs.getString("username");
				
				soldItems.add(new SoldItem(soldItemId,itemName,salePrice,endDate,new User(userId,username)));
			}
		} catch (SQLException e) {
			throw new DALException(e.getMessage());
//			throw new RuntimeException(e);
		}
		
		return soldItems;
	}
	
	private String getRequestOnStringForSelectItemsByFilters(String searchItemName, int categoryId, boolean isTypeBuy,
			List<String> filterCheck, User user) {
		String request = "select "
				+ "	i.soldItemId,"
				+ "	i.itemName,"
				+ " COALESCE((SELECT TOP(1) bidAmount FROM BIDS WHERE soldItemId = i.soldItemId ORDER BY bidAmount DESC), i.salePrice) "
				+ "	AS salePrice,"
				+ " i.endDate,"
				+ " seller.userId, "
				+ "	seller.username "
				+ "from SOLD_ITEMS i "
				+ "JOIN USERS seller ON i.userId =seller.userId "
				+ "where itemName LIKE ?";
		
		if(categoryId!=0) request+=" AND categoryId=?";
		
		if(filterCheck.size() == 0 || user == null) return request;
		
		if(!isTypeBuy) request+= " AND  i.userId=?";
		
		request+= " AND (";
		
		String whereCheck =	"";
		
		if(isTypeBuy) {
			if(filterCheck.contains("openBids")) whereCheck+="OR GETDATE() BETWEEN i.startDate and i.endDate ";
			if(filterCheck.contains("myBids")) whereCheck+="OR EXISTS (SELECT * FROM BIDS WHERE userId=? AND soldItemId=i.soldItemId) ";
			if(filterCheck.contains("myWonBids")) whereCheck+="OR (EXISTS (SELECT * FROM BIDS WHERE userId=? AND soldItemId=i.soldItemId "
															+ " AND bidAmount = (SELECT TOP(1) bidAmount FROM BIDS WHERE soldItemId=i.soldItemId ORDER BY bidAmount DESC)) "
															+ "	AND endDate<GETDATE())";
			
		}else {
			if(filterCheck.contains("myCurrentSales")) whereCheck+="OR GETDATE() BETWEEN i.startDate and i.endDate ";
			if(filterCheck.contains("myNotStartedSales")) whereCheck+="OR GETDATE() < i.startDate ";
			if(filterCheck.contains("myEndedSales")) whereCheck+="OR GETDATE() > i.endDate ";
		}
		whereCheck = whereCheck.substring(2); //cut the first "OR"
		request+=whereCheck+")";
		
		return request;
	}

	@Override
	public SoldItem selectById(int id) throws DALException {
		// TODO Auto-generated method stub
		return null;
	}

}
