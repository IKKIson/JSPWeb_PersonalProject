package DAO;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import DatabaseManager.HotelDatabaseConnection;

public class RoomListDAO {
private HotelDatabaseConnection hotelDatabase;
	
	public RoomListDAO() {
		this.hotelDatabase = new HotelDatabaseConnection();
	}

	//select all rooomid for check page
	public int[] SelectAllRoomIdofList() {
		int []roomIdSet = null;
		int i = 0;
		
		try {
			PreparedStatement ps 
			= this.hotelDatabase.conn.prepareStatement("select * from roomtype");
			ResultSet rs = ps.executeQuery();
			roomIdSet = new int[rs.getRow()];
			while(rs.next()){
				int roomid = 0;
				//room.setRoomtype(rs.getInt("roomtype"));
				roomid = rs.getInt("roomid");
				
				roomIdSet[i] = roomid;
				i++;
			}
			ps.close();			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}		
		return roomIdSet;
	}
	
	//select all rooomid for check page
	public int[] SelectRoomIdofList(String roomName, int roomNum) {
		int []roomIdSet = new int[roomNum];
		int i = 0;
		
		try {
			PreparedStatement ps 
			= this.hotelDatabase.conn.prepareStatement("select roomid from roomlist where roomname = ?");
			ps.setString(1, roomName);
			ResultSet rs = ps.executeQuery();

			while(rs.next()){
				int roomid = 0;
				roomid = rs.getInt("roomid");
				
				roomIdSet[i] = roomid;
				i++;
			}
			ps.close();			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}		
		return roomIdSet;
	}
			
	@Override
	protected void finalize() throws Throwable {
		// TODO Auto-generated method stub
		hotelDatabase.conn.close();
		
		super.finalize();
	}
}
