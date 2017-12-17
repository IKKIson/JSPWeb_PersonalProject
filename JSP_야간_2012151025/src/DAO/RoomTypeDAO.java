package DAO;

import java.sql.*;
import java.util.*;
import Model.RoomTypeTable;

import DatabaseManager.HotelDatabaseConnection;

public class RoomTypeDAO {
	
	private HotelDatabaseConnection hotelDatabase;
	
	public RoomTypeDAO() {
		this.hotelDatabase = new HotelDatabaseConnection();
		System.out.println("RoomTypeDAO:call HotelDatabase connection!!!");
	}

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
