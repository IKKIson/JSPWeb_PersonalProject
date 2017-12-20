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
			= this.hotelDatabase.getInstance().getConn().prepareStatement("select * from roomtype");
			ResultSet rs = ps.executeQuery();
			System.out.println("RoomTypeDAO:selectAllRoomType(): conn and Preparedstatement");
			while(rs.next()){
				RoomTypeTable room = new RoomTypeTable();
				room.setRoomtype(rs.getInt("roomtype"));
				room.setName(rs.getString("roomname"));
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
	
	//Select - Get Price of Roomtype 
	public int SelectRoomPrice(int roomtype) {
		int price = 0;		
		try {
			PreparedStatement ps 
			= this.hotelDatabase.getInstance().getConn().prepareStatement("select price from roomtype where roomtype = ?");
			ps.setInt(1, roomtype);
			ResultSet rs = ps.executeQuery();
			rs.next();
			price = rs.getInt("price");
					 
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}		
		return price;
	}
	
	//Select - Get NAme of Roomtype 
	public String SelectRoomName(int roomtype) {
		String roomname = null;		
		try {
			PreparedStatement ps 
			= this.hotelDatabase.getInstance().getConn().prepareStatement("select roomname from roomtype where roomtype = ?");
			ps.setInt(1, roomtype);
			ResultSet rs = ps.executeQuery();
			rs.next();
			roomname = rs.getString("roomname");
					 
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}		
		return roomname;
	}
	

	//select - get count for roomtype's
	public int NumberOfRoomTypes(int roomtype){
		int getNumber = 0;
		
		try {
			PreparedStatement ps 
			= this.hotelDatabase.getInstance().getConn().prepareStatement("select amount from roomtype where roomtype = ?");
			ps.setInt(1, roomtype);
			ResultSet rs = ps.executeQuery();
			rs.next();
			getNumber = rs.getInt("amount");

			ps.close();			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}		
		
		return getNumber;
	}
	
		
	@Override
	protected void finalize() throws Throwable {
		// TODO Auto-generated method stub
		this.hotelDatabase.getInstance().getConn().close();
		
		super.finalize();
	}
}
