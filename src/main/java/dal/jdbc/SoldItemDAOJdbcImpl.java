package dal.jdbc;

import java.sql.Connection;
import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.time.LocalDate;
import java.util.ArrayList;
import java.util.List;

import bo.Bid;
import bo.Category;
import bo.SoldItem;
import bo.User;
import bo.Withdrawal;
import dal.ConnectionProvider;
import dal.DALException;
import dal.DAOFactory;
import dal.ISoldItemDAO;

public class SoldItemDAOJdbcImpl implements ISoldItemDAO {

	private List<Category> categories;
	
	@Override
	public SoldItem insert(SoldItem item) throws DALException {
		String sql = "INSERT SOLD_ITEMS VALUES (?,?,?,?,?,?,?)";
		
		try(Connection uneConnection= ConnectionProvider.getConnection();
				PreparedStatement unStmt= uneConnection.prepareStatement(sql, PreparedStatement.RETURN_GENERATED_KEYS);) {
			int i = 0;

			unStmt.setString(++i, item.getItemName());
			unStmt.setString(++i, item.getDescription());
			unStmt.setDate(++i, Date.valueOf(item.getStartDate()));
			unStmt.setDate(++i, Date.valueOf(item.getEndDate()));
			unStmt.setInt(++i, item.getInitialPrice());
			unStmt.setInt(++i, item.getSeller().getUserId());
			unStmt.setInt(++i, item.getCategory().getCategoryId());

			unStmt.executeUpdate();
			
			ResultSet rs = unStmt.getGeneratedKeys();
			
			if(rs.next()) {
				int itemId = rs.getInt(1);
				Withdrawal withdrawal = item.getWithdrawal();
				insertWithDrawal(new Withdrawal(itemId, withdrawal.getStreet(), withdrawal.getPostalCode(), withdrawal.getCity()));
			};
			
			
			
		} catch (SQLException e) {
			throw new DALException(e.getMessage());
		}
		
		
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
	public SoldItem selectById(int id) throws DALException {
		String sql = "select "
				+ "	i.soldItemId, "
				+ "	i.itemName, "
				+ "	i.description, "
				+ "	c.categoryId, "
				+ "	c.label, "
				+ "	(select top(1) b.userId from BIDS b where b.soldItemId=i.soldItemId ORDER BY b.bidAmount DESC) as buyerUserId, "
				+ "	(select top(1) us.username "
				+ "	from BIDS b "
				+ "	LEFT JOIN USERS us ON b.userId = us.userId where b.soldItemId=i.soldItemId ORDER BY b.bidAmount DESC) as buyerUsername, "
				+ "	(select top(1) b.bidAmount from BIDS b where b.soldItemId=i.soldItemId ORDER BY b.bidAmount DESC) as bestOffer, "
				+ "	i.initialPrice, "
				+ "	i.startDate, "
				+ "	i.endDate, "
				+ "	w.street, "
				+ "	w.postalCode, "
				+ "	w.city, "
				+ "	i.userId AS sellerId, "
				+ "	seller.username AS sellerUsername, "
				+ " seller.phone AS sellerPhone "
				+ "from SOLD_ITEMS i "
				+ "JOIN CATEGORIES c ON i.categoryId=c.categoryId "
				+ "LEFT JOIN WITHDRAWALS w ON w.soldItemId=i.soldItemId "
				+ "JOIN USERS seller ON  seller.userId=i.userId "
				+ "WHERE i.soldItemId=?";
		
		try(Connection uneConnection= ConnectionProvider.getConnection();
				PreparedStatement unStmt= uneConnection.prepareStatement(sql);) {
			
			int i = 0;
			
			unStmt.setInt(++i, id);

			ResultSet rs = unStmt.executeQuery();
			
			while(rs.next()) {
				int soldItemId = rs.getInt("soldItemId");
				String itemName = rs.getString("itemName");
				String description = rs.getString("description");
				
				int cateogryId = rs.getInt("categoryId");
				String label = rs.getString("label");
				
				int buyerUserId = rs.getInt("buyerUserId");
				String buyerUsername = rs.getString("buyerUsername");
				
				int bestOffer = rs.getInt("bestOffer");
				
				int initialPrice = rs.getInt("initialPrice");
				LocalDate startDate = rs.getDate("startDate").toLocalDate();
				LocalDate endDate = rs.getDate("endDate").toLocalDate();
				
				String street = rs.getString("street");
				String postalCode = rs.getString("postalCode");
				String city = rs.getString("city");

				
				int sellerId = rs.getInt("sellerId");
				String sellerUsername = rs.getString("sellerUsername");
				String sellerPhone = rs.getString("sellerPhone");
				return new SoldItem(soldItemId, itemName, initialPrice, startDate, endDate, 
						new User(sellerId, sellerUsername, sellerPhone), description, 
						new Category(cateogryId, label), new User(buyerUserId,buyerUsername)
						, bestOffer, new Withdrawal(street, postalCode, city));
			}
			
		} catch (SQLException e) {
			throw new DALException(e.getMessage());
//			throw new RuntimeException(e);
		}
		return null;
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
				int initialPrice = rs.getInt("initialPrice");
				LocalDate endDate = rs.getDate("endDate").toLocalDate();
				int userId = rs.getInt("userId");
				String username = rs.getString("username");
				
				soldItems.add(new SoldItem(soldItemId,itemName,initialPrice,endDate,new User(userId,username)));
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
				+ " COALESCE((SELECT TOP(1) bidAmount FROM BIDS WHERE soldItemId = i.soldItemId ORDER BY bidAmount DESC), i.initialPrice) "
				+ "	AS initialPrice,"
				+ " i.endDate,"
				+ " seller.userId, "
				+ "	seller.username "
				+ "from SOLD_ITEMS i "
				+ "LEFT JOIN USERS seller ON i.userId =seller.userId "
				+ "where itemName LIKE ?";
		
		if(categoryId!=0) request+=" AND categoryId=?";
		
		if(filterCheck.size() == 0 || user == null) {
			if(user == null) {
				request+=" AND GETDATE() BETWEEN i.startDate and i.endDate";
			}
			return request;
		}
		
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
	public void bidOnItem(int soldItemId, int credits, User user) throws DALException {
		Bid oldBid = selectBestOfferByItemId(soldItemId);
		String sql = "INSERT BIDS VALUES (GETDATE(), ?, ?, ?)";
		try(Connection uneConnection= ConnectionProvider.getConnection();
				PreparedStatement unStmt= uneConnection.prepareStatement(sql);) {
			int i = 0;

			unStmt.setInt(++i, credits);
			unStmt.setInt(++i, soldItemId);
			unStmt.setInt(++i, user.getUserId());
			if(unStmt.executeUpdate()>0) {
				//remove credits from buyer
				user.addCredit(-credits);
				DAOFactory.getUserDAO().updateCredit(user);
				
				//take soldItems
				SoldItem soldItem = DAOFactory.getSoldItemDAO().selectById(soldItemId);
				
				if(oldBid != null) {
					//repay user on the oldBid
					User userOldBid = DAOFactory.getUserDAO().selectById(soldItem.getSeller().getUserId());
					
					//update user add credits
					userOldBid.addCredit(oldBid.getBidAmount());
					DAOFactory.getUserDAO().updateCredit(userOldBid);
				}
			}
			
		} catch (SQLException e) {
			throw new DALException(e.getMessage());
		}
	}

	@Override
	public List<Category> selectAllCategories() throws DALException {
		
		if(categories == null || categories.size() == 0) {
			
			String sql = "SELECT * FROM CATEGORIES";
			
			categories = new ArrayList<Category>();
			
			try(Connection uneConnection= ConnectionProvider.getConnection();
					Statement unStmt= uneConnection.createStatement();) {
				
				ResultSet rs = unStmt.executeQuery(sql);
							
				while(rs.next()) {
					int categoryId = rs.getInt("categoryId");
					String label = rs.getString("label");
					
					categories.add(new Category(categoryId, label));
				}
				
			} catch (SQLException e) {
				throw new DALException(e.getMessage());
			}
		}

		return categories;
	}
	
	
	public Bid selectBestOfferByItemId(int itemId) throws DALException {
		String sql = "SELECT TOP(1) bidAmount, userId FROM BIDS WHERE soldItemId=? ORDER BY bidAmount DESC";
		try(Connection uneConnection= ConnectionProvider.getConnection();
				PreparedStatement unStmt= uneConnection.prepareStatement(sql);) {
			int i = 0;

			unStmt.setInt(++i, itemId);
			
			ResultSet rs = unStmt.executeQuery();
			
			while(rs.next()) {
				int bidAmount = rs.getInt("bidAmount");
				int userId = rs.getInt("userId");
				
				return new Bid(bidAmount, new User(userId));
			}
			
		} catch (SQLException e) {
			throw new DALException(e.getMessage());
		}
		return null;
	}

	@Override
	public void insertWithDrawal(Withdrawal withdrawal) throws DALException {
		
		String sql = "INSERT WITHDRAWALS VALUES (?,?,?,?)";
		
		try(Connection uneConnection= ConnectionProvider.getConnection();
				PreparedStatement unStmt= uneConnection.prepareStatement(sql);) {
			int i = 0;

			unStmt.setInt(++i, withdrawal.getSoldItemId());
			unStmt.setString(++i, withdrawal.getStreet());
			unStmt.setString(++i, withdrawal.getPostalCode());
			unStmt.setString(++i, withdrawal.getCity());


			unStmt.executeUpdate();

			
		} catch (SQLException e) {
			throw new DALException(e.getMessage());
		}
		
	}

}
