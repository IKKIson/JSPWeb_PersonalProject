package DAO;

import java.sql.*;
import java.sql.Date;
import java.text.ParseException;
import java.util.*;
import Model.UserTable;

import DatabaseManager.HotelDatabaseConnection;

public class UserDAO {

	private HotelDatabaseConnection hotelDatabase;
	
	public UserDAO() {
		this.hotelDatabase = new HotelDatabaseConnection();
	}
	
	//check for login
	public UserTable isLogin(String eid, String pw){
		UserTable user = new UserTable();	
		try {
			PreparedStatement ps
			= this.hotelDatabase.conn.prepareStatement("select * from user where emailid=? and password=?");
			ps.setString(1, eid);
			ps.setString(2, pw);
			ResultSet rs = ps.executeQuery();
			
			user.setbLogin(rs.next());
			if(user.isbLogin()) {
				user.setEmailid(rs.getString("emailid"));
				user.setPassword(rs.getString("password"));
				user.setUsername(rs.getString("username"));
				user.setTell(rs.getInt("tell"));
				user.setBirthday(rs.getInt("birthday"));
				user.setCreditcard(rs.getString("creditcard"));
			}
			else {
				return user;
			}
			
			ps.close();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}		
		return user;
	}
	
	//check for New Sign Up
	public void InsertUser(String emailid, String pw, String name, int tel, int birth, String card) throws ParseException {
		PreparedStatement ps = null;
		try {
			ps = this.hotelDatabase.conn.prepareStatement("insert into user values (?,?,?,?,?,?)");
			ps.setString(1, emailid);
			ps.setString(2, pw);
			ps.setString(3, name);
			ps.setInt(4, tel);
			ps.setInt(5, birth);
			ps.setString(6, card);
			ps.addBatch();			

			System.out.println("SignUp New Member in InsertUser()");
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			try {
				ps.executeBatch();
				ps.close();
				this.hotelDatabase.conn.commit();
				//this.hotelDatabase.conn.close();
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
	}
	
	//check Members for sign up
	public ArrayList<UserTable> selectAllUser() {
		ArrayList<UserTable> userlist = new ArrayList<UserTable>();
		
		try {
			PreparedStatement ps 
			= this.hotelDatabase.conn.prepareStatement("select * from user");
			ResultSet rs = ps.executeQuery();
			
			while(rs.next()){
				UserTable user = new UserTable();
				
				user.setEmailid(rs.getString("emailid"));
				user.setPassword(rs.getString("password"));
				user.setUsername(rs.getString("username"));
				user.setTell(rs.getInt("tell"));
				user.setBirthday(rs.getInt("birthday"));
				user.setCreditcard(rs.getString("creditcard"));
				
				userlist.add(user);
			}
			ps.close();			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}		
		
		return userlist;
	}
	
	@Override
	protected void finalize() throws Throwable {
		// TODO Auto-generated method stub
		hotelDatabase.conn.close();
		
		super.finalize();
	}
}
