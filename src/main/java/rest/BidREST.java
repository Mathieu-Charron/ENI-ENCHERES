package rest;

import javax.ws.rs.GET;
import javax.ws.rs.Path;

import bll.UserManager;
import bo.User;

@Path("/bids")
public class BidREST {

	@GET
	public User getUser() {
		UserManager mgt = UserManager.getInstance();
		return mgt.authentication("johnDoe", "password123");
	}
}
