package Controller;

import DAO.RoomListDAO;
import DAO.RoomTypeDAO;
import java.util.Random;

public class ReservationController {
	
	public boolean isUpperChkinThanChkOut(String Chekcin, String Checkout){
		
		return false;
	}
	
	public String ConvertRoomTypeToRoomName(int roomtype){
		RoomTypeDAO roomTypeDAO = new RoomTypeDAO();
		String roomName = roomTypeDAO.SelectRoomName(roomtype);
		return roomName;
	}
	
	public int ChooseRoomId(int roomtype){
		RoomTypeDAO roomTypeDAO = new RoomTypeDAO();
		int roomNum = roomTypeDAO.NumberOfRoomTypes(roomtype);
		String roomName = roomTypeDAO.SelectRoomName(roomtype);
		int[] roomSet = new int[roomNum];
		RoomListDAO roomListDAO = new RoomListDAO();		
		roomSet =  roomListDAO.SelectRoomIdofList(roomName, roomNum);		
		Random random = new Random();
		int result = 0;
		result = roomSet[random.nextInt(roomNum)];
		return result;
	}
}
