package dal;

import java.util.List;

import bo.Bid;

public interface IBidDAO extends ICRUDDAO<Bid> {
	List<Bid> selectBidsByCategoryAndName(int categoryId, String itemName) throws DALException;
	
	
}
