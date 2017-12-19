package Controller;

import java.sql.Date;
import Model.UserTable;
import java.util.ArrayList;
import DAO.UserDAO;


public class SignUpController {
	private UserTable userTable;
	private UserDAO userDAO;
	private ArrayList<UserTable> userlist;
	
	//Database Columns
	private boolean userInDBCheck;
	private boolean userTableCheck;
	private boolean emailidCheck;
	private boolean passwordCheck;
	private boolean usernameCheck;
	private boolean tellCheck;
	private boolean birthdayCheck;
	private boolean creditcardCheck;
	
	private boolean CheckMemberInDB(UserTable userTable){
		//TODO : 데이터베이스에 입력된 신규가입 정보들이 있나, 일치하나 검사
		
		//init
		this.InitUserDAO();
		this.InitCheckColumns();
		
		if(CheckEmpty(userTable)){ 
			
		}
		
		return userInDBCheck;
	}
	
	//웹페이지에서 신규가입자가 항목을 다 입력했는지 확인
	private boolean CheckEmpty(UserTable userTable){
		
		//check empty of insert values columns
		for(int i = 0; i<userlist.size(); i++){
			
			this.isEmptyCheck(emailidCheck, userTable.getEmailid());
			this.isEmptyCheck(passwordCheck, userTable.getPassword());
			this.isEmptyCheck(usernameCheck, userTable.getUsername());
			this.isEmptyCheck(tellCheck, userTable.getTell());
			this.isEmptyCheck(birthdayCheck, userTable.getBirthday());
			this.isEmptyCheck(creditcardCheck, userTable.getCreditcard());
			
			userTable = null;
		}
		//results
		if(emailidCheck != false && passwordCheck != false && usernameCheck != false && tellCheck != false && birthdayCheck != false && creditcardCheck){
			userTableCheck = true;
		}
		
		return userTableCheck;
	}
	
	private void InitUserDAO(){
		userlist = new ArrayList<UserTable>();
		userDAO = new UserDAO();
		userlist=userDAO.selectAllUser();
	}
	private void InitCheckColumns(){
		userInDBCheck = false;
		userTableCheck = false;
		emailidCheck = false;
		passwordCheck = false;
		usernameCheck = false;
		tellCheck = false;
		birthdayCheck = false;
		creditcardCheck = false;
	}
	private void isEmptyCheck(boolean columnsCheck, String columnsValue){
		if(columnsValue != null) {
			columnsCheck = true;
		}
	}
	private void isEmptyCheck(boolean columnsCheck, int columnsValue){
		if(columnsValue>0) {
			columnsCheck = true;
		}
	}
	private void isEmptyCheck(boolean columnsCheck, Date columnsValue){
		if(columnsValue != null) {
			columnsCheck = true;
		}
	}
}
