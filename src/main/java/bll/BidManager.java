package bll;

import java.util.List;

import bo.Bid;
import bo.SoldItem;
import bo.User;
import dal.DALException;
import dal.DAOFactory;
import dal.ISoldItemDAO;

public class BidManager {
	private ISoldItemDAO soldItemDAO;
	private static BidManager instance;
	
	private BidManager() {
		this.soldItemDAO = DAOFactory.getSoldItemDAO();
	}
	
	public static BidManager getInstance() {
		if(instance == null) {
			instance = new BidManager();
		}
		return instance;
	}
	
	public List<SoldItem> SearchBidsWithFilters(
			String searchItemName,
			int categoryId,
			boolean isTypeBuy,
			List<String> filterCheck,
			User user){
				
		try {
			return soldItemDAO.selectItemsByFilters(searchItemName, categoryId, isTypeBuy, filterCheck,user);
		} catch (DALException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		return null;
	}
}
