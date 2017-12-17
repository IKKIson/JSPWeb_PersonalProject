package Model;

public class ReservationTable {
	private int reservatecode;
	private String emailid;
	private int roomtype;
	private int roomid;
	private int price;
	private String reservatedate;
	private String checkin;
	private String checkout;
	
	public int getReservatecode() {
		return reservatecode;
	}
	public void setReservatecode(int reservatecode) {
		this.reservatecode = reservatecode;
	}
	public String getEmailid() {
		return emailid;
	}
	public void setEmailid(String emailid) {
		this.emailid = emailid;
	}
	public int getRoomtype() {
		return roomtype;
	}
	public void setRoomtype(int roomtype) {
		this.roomtype = roomtype;
	}
	public int getRoomid() {
		return roomid;
	}
	public void setRoomid(int roomid) {
		this.roomid = roomid;
	}
	public int getPrice() {
		return price;
	}
	public void setPrice(int price) {
		this.price = price;
	}
	public String getReservatedate() {
		return reservatedate;
	}
	public void setReservatedate(String reservatedate) {
		this.reservatedate = reservatedate;
	}
	public String getCheckin() {
		return checkin;
	}
	public void setCheckin(String checkin) {
		this.checkin = checkin;
	}
	public String getCheckout() {
		return checkout;
	}
	public void setCheckout(String checkout) {
		this.checkout = checkout;
	}
	
	

	
}
