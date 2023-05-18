package rest;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import javax.ws.rs.GET;
import javax.ws.rs.POST;
import javax.ws.rs.Path;
import javax.ws.rs.QueryParam;
import javax.ws.rs.core.Context;

import bll.BidManager;
import bo.SoldItem;
import bo.User;

@Path("/bids")
public class BidREST {
	private BidManager mgt = BidManager.getInstance();
	
	@Context
	private HttpServletRequest httpRequest;

//	@GET
//	public User getUser() {
//		return (User) httpRequest.getSession().getAttribute("user");
//	}
//	
	@GET
	@Path("/searchWithFilters")
	public List<SoldItem> getSelectBidsByFilters(
			@QueryParam("searchItemName") String searchItemName,
			@QueryParam("categoryId") int categoryId,
			@QueryParam("isTypeBuy") boolean isTypeBuy,
			@QueryParam("openBids") boolean openBids,
			@QueryParam("myBids") boolean myBids,
			@QueryParam("myWonBids") boolean myWonBids,
			@QueryParam("myCurrentSales") boolean myCurrentSales,
			@QueryParam("myNotStartedSales") boolean myNotStartedSales,
			@QueryParam("myEndedSales") boolean myEndedSales
			) {
		
		List<String> filterCheck = new ArrayList<>();
		if(isTypeBuy) {
			if(openBids == true) filterCheck.add("openBids");
			if(myBids == true) filterCheck.add("myBids");
			if(myWonBids == true) filterCheck.add("myWonBids");
		}else {
			if(myCurrentSales == true) filterCheck.add("myCurrentSales");
			if(myNotStartedSales == true) filterCheck.add("myNotStartedSales");
			if(myEndedSales == true) filterCheck.add("myEndedSales");
		}

		return mgt.SearchBidsWithFilters(searchItemName, categoryId, isTypeBuy, filterCheck, (User) httpRequest.getSession().getAttribute("user"));
	}
}
