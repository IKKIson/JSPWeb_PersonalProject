package Model;

import java.sql.Date;

public class UserTable {
	//Database Columns
	private String emailid;
	private String password;
	private String username;
	private int tell;
	private int birthday;
	private String creditcard;
	
	//use for user state - Login in Website and Stay in Hotel 
	private boolean bLogin;
	
	public boolean isbLogin() {
		return bLogin;
	}
	public void setbLogin(boolean bLogin) {
		this.bLogin = bLogin;
	}
	
	
	public String getEmailid() {
		return emailid;
	}
	public void setEmailid(String emailsid) {
		this.emailid = emailsid;
	}
	public String getPassword() {
		return password;
	}
	public void setPassword(String password) {
		this.password = password;
	}
	public String getUsername() {
		return username;
	}
	public void setUsername(String username) {
		this.username = username;
	}
	public int getTell() {
		return tell;
	}
	public void setTell(int tell) {
		this.tell = tell;
	}
	public int getBirthday() {
		return birthday;
	}
	public void setBirthday(int birthday) {
		this.birthday = birthday;
	}
	public String getCreditcard() {
		return creditcard;
	}
	public void setCreditcard(String creditcard) {
		this.creditcard = creditcard;
	}
	
}
