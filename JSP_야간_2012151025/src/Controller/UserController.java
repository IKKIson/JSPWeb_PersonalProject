package Controller;

import DAO.UserDAO;
public class UserController {
	
	public UserController(){
		
	}
	
	public boolean isExistEmailidWithDB(String newEmailid){
		UserDAO userDAO = new UserDAO();
		if(userDAO.SelectEmailidCheck(newEmailid) != null){
			return false;
		}
		else {
			return true;
		}
	}
}
