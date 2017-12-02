package User.Model;

import java.sql.*;

import DatabaseManager.HotelDatabase;

public class UserDAO {

	private HotelDatabase hotelDatabase;
	
	public UserDAO() {
		this.hotelDatabase = new HotelDatabase();
	}
	
	public UserTable isLogin(String uid, String pw){
		UserTable user = new UserTable();		
		try {
			PreparedStatement ps
			= this.hotelDatabase.conn.prepareStatement("select * from user where emailid=? and password=?");
			ps.setString(1, uid);
			ps.setString(2, pw);
			ResultSet rs = ps.executeQuery();
			
			user.setbLogin(rs.next());  
			if(user.isbLogin()) {
				user.setEmailid(rs.getString("emailid"));
				user.setPassword(rs.getString("password"));
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
	
	
	
	
	@Override
	protected void finalize() throws Throwable {
		// TODO Auto-generated method stub
		hotelDatabase.conn.close();
		
		super.finalize();
	}
}
