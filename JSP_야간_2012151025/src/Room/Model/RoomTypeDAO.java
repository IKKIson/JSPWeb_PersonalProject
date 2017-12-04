package Room.Model;

import java.sql.*;
import java.util.*;

import DatabaseManager.HotelDatabaseConnection;

public class RoomTypeDAO {
	
	private HotelDatabaseConnection hotelDatabase;
	
	public RoomTypeDAO() {
		this.hotelDatabase = new HotelDatabaseConnection();
		System.out.println("RoomTypeDAO:call HotelDatabase connection!!!");
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
			= this.hotelDatabase.conn.prepareStatement("select * from roomtype");
			ResultSet rs = ps.executeQuery();
			System.out.println("RoomTypeDAO:selectAllRoomType(): conn and Preparedstatement");
			while(rs.next()){
				RoomTypeTable room = new RoomTypeTable();
				room.setRoomtype(rs.getInt("roomtype"));
				room.setName(rs.getString("name"));
				room.setCapacity(rs.getInt("capacity"));
				room.setPrice(rs.getInt("price"));
				room.setAmount(rs.getInt("amount"));
				room.setExplanation(rs.getString("explanation"));

				roomTypelist.add(room);
				System.out.println("RoomTypeDAO:selectAllRoomType(): " + rs.getInt("roomtype"));
				room = null;
			}
			ps.close();			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}		
		System.out.println("RoomTypeDAO:Call selectAllRoomType()!!!");
		return roomTypelist;
	}
		
	@Override
	protected void finalize() throws Throwable {
		// TODO Auto-generated method stub
		hotelDatabase.conn.close();
		
		super.finalize();
	}
}
