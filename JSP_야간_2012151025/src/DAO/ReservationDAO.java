package DAO;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.text.ParseException;
import java.util.ArrayList;

import DatabaseManager.HotelDatabaseConnection;
import Model.ReservationTable;

public class ReservationDAO {
	private HotelDatabaseConnection hotelDatabase;
	
	public ReservationDAO() {
		this.hotelDatabase = new HotelDatabaseConnection();
	}
	
	//insert - new reservation 
	//check for New Sign Up
	public void InsertReservation(int reservatecode, String emailid, int roomtype, int roomid, int price, String reservatedate, String checkin, String checkout) throws ParseException {
		PreparedStatement ps = null;
		try {
			ps = this.hotelDatabase.conn.prepareStatement("insert into reservation values (?,?,?,?,?,?,?,?)");
			ps.setInt(1, reservatecode);
			ps.setString(2, emailid);
			ps.setInt(3, roomtype);
			ps.setInt(4, roomid);
			ps.setInt(5, price);
			ps.setString(6, reservatedate);
			ps.setString(7, checkin);
			ps.setString(8, checkout);
			ps.addBatch();			
			
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
	
	//select - all reservation
	public ArrayList<ReservationTable> selectAllUser() {
		ArrayList<ReservationTable> reservationlist = new ArrayList<ReservationTable>();
		
		try {
			PreparedStatement ps 
			= this.hotelDatabase.conn.prepareStatement("select * from user");
			ResultSet rs = ps.executeQuery();
			
			while(rs.next()){
				ReservationTable reserve = new ReservationTable();

				reserve.setReservatecode(rs.getInt("reservationcode"));
				reserve.setEmailid(rs.getString("emailid"));
				reserve.setRoomtype(rs.getInt("roomtype"));
				reserve.setRoomid(rs.getInt("roomid"));
				reserve.setPrice(rs.getInt("price"));
				reserve.setReservatedate(rs.getString("reservatedate"));
				reserve.setCheckin(rs.getString("checkin"));
				reserve.setCheckout(rs.getString("checkout"));

				reservationlist.add(reserve);
			}
			ps.close();			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}		
		
		return reservationlist;
	}
	
	//select - my reservation
	public ArrayList<ReservationTable> SelectCheckMyReservation(String emailid) {
		ArrayList<ReservationTable> reservationlist = new ArrayList<ReservationTable>();
		try {
			PreparedStatement ps 
			= this.hotelDatabase.conn.prepareStatement("select * from reservation where emailid = ?");
			ps.setString(1, emailid);
			ResultSet rs = ps.executeQuery();
			
			while(rs.next()){
				ReservationTable reserve = new ReservationTable();

				reserve.setReservatecode(rs.getInt("reservationcode"));
				reserve.setEmailid(rs.getString("emailid"));
				reserve.setRoomtype(rs.getInt("roomtype"));
				reserve.setRoomid(rs.getInt("roomid"));
				reserve.setPrice(rs.getInt("price"));
				reserve.setReservatedate(rs.getString("reservatedate"));
				reserve.setCheckin(rs.getString("checkin"));
				reserve.setCheckout(rs.getString("checkout"));

				reservationlist.add(reserve);
			}
			ps.close();			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return reservationlist;
	}
	
	//select - my reservation receipt
	public ReservationTable SelectCheckReceipt(int code) {
		ReservationTable reservationTable = new ReservationTable();
		try {
			PreparedStatement ps 
			= this.hotelDatabase.conn.prepareStatement("select * from reservation where reservationcode = ?");
			ps.setInt(1, code);
			ResultSet rs = ps.executeQuery();
			
			rs.next();

			reservationTable.setReservatecode(rs.getInt("reservationcode"));
			reservationTable.setEmailid(rs.getString("emailid"));
			reservationTable.setRoomtype(rs.getInt("roomtype"));
			reservationTable.setRoomid(rs.getInt("roomid"));
			reservationTable.setPrice(rs.getInt("price"));
			reservationTable.setReservatedate(rs.getString("reservatedate"));
			reservationTable.setCheckin(rs.getString("checkin"));
			reservationTable.setCheckout(rs.getString("checkout"));
			
			ps.close();			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return reservationTable;
	}
	
	//delete - cancel reservation - delete from ���̺�� where = ����;
	public boolean DeleteReservation(String emailid, int reservatecode) {
		boolean isDelete = false;
		PreparedStatement ps = null;

		try {
			ps = this.hotelDatabase.conn.prepareStatement("delete from reservation where emailid = ? and reservatecode = ?");
			ps.setString(1, emailid);
			ps.setInt(2, reservatecode);
			ps.addBatch();			
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			try {
				ps.executeBatch();
				ps.close();
				this.hotelDatabase.conn.commit();
				isDelete = !isDelete;
				//this.hotelDatabase.conn.close();
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
		return isDelete;
	}
	
	
	//update - modify my reservation
	public boolean UpdateMyReservation(String emailid, int reservatecode, int roomtype, int checkin, int checkout) {
		boolean isDelete = false;
		PreparedStatement ps = null;

		try {
			ps = this.hotelDatabase.conn.prepareStatement("update reservation set roomtype = ?, checkin = ?, checkout = ? where reservatecode = ?");
			ps.setInt(1, roomtype);
			ps.setInt(2, checkin);
			ps.setInt(3, checkout);
			ps.setInt(4, reservatecode);
			ps.addBatch();			
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			try {
				ps.executeBatch();
				ps.close();
				this.hotelDatabase.conn.commit();
				isDelete = !isDelete;
				//this.hotelDatabase.conn.close();
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
		return isDelete;
	}
	
	
	@Override
	protected void finalize() throws Throwable {
		// TODO Auto-generated method stub
		hotelDatabase.conn.close();
		
		super.finalize();
	}
}
