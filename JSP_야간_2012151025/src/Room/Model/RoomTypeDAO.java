package Room.Model;

import java.sql.*;
import java.util.*;

import DatabaseManager.HotelDatabase;

public class RoomTypeDAO {
	
	private HotelDatabase hotelDatabase;
	
	public RoomTypeDAO() {
		this.hotelDatabase = new HotelDatabase();
	}

/*	public RoomTypeTable selectUser(String userid) {
		RoomTypeTable user = new RoomTypeTable();
		
		try {
			PreparedStatement ps 
			= hotelDatabase.getConn().prepareStatement("select * from user where userid=?");
			ps.setString(1, userid);
			
			ResultSet rs = ps.executeQuery();			
			rs.next();			
			
			user.setUserid(rs.getString("userid"));
			user.setPassword(rs.getString("password"));
			
			ps.close();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		return user;
	}*/
	
	//select all rooomtype for introduce page
	public ArrayList<RoomTypeTable> selectAllRoomType() {
		ArrayList<RoomTypeTable> roomTypelist = new ArrayList<RoomTypeTable>();
		
		try {
			PreparedStatement ps 
			= this.hotelDatabase.conn.prepareStatement("select * from roomtype;");
			ResultSet rs = ps.executeQuery();
			
			while(rs.next()){
				RoomTypeTable room = new RoomTypeTable();
				room.setRoomtype(rs.getInt("roomtype"));
				room.setRoomname(rs.getString("roomname"));
				room.setCapacity(rs.getInt("capacity"));
				room.setPrice(rs.getInt("price"));
				room.setAmount(rs.getInt("amount"));
				room.setExplanation(rs.getString("explanation"));

				roomTypelist.add(room);
				room = null;
			}
			ps.close();			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}		
		
		return roomTypelist;
	}
		
	@Override
	protected void finalize() throws Throwable {
		// TODO Auto-generated method stub
		hotelDatabase.conn.close();
		
		super.finalize();
	}
}
