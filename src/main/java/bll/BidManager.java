package bll;

import java.util.List;

import bo.Bid;
import bo.Category;
import bo.SoldItem;
import bo.User;
import dal.DALException;
import dal.DAOFactory;
import dal.ISoldItemDAO;

public class BidManager {
	private ISoldItemDAO soldItemDAO;
	private static BidManager instance;
	
	private static final String ERROR_BDD = "Une erreur est survenue";

	
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
			User user) throws BLLException{
				
		try {
			return soldItemDAO.selectItemsByFilters(searchItemName, categoryId, isTypeBuy, filterCheck,user);
		} catch (DALException e) {
			e.printStackTrace();
			throw new BLLException(ERROR_BDD);
		}
	}
	
	public List<Category> getCategories() throws BLLException{
		try {
			return soldItemDAO.selectAllCategories();
		} catch (DALException e) {
			e.printStackTrace();
			throw new BLLException(ERROR_BDD);

		}
		
	}
}
