package DatabaseManager;

import java.sql.*;

public class HotelDatabase {
//    private volatile static HotelDatabase HotelDatabaseUniqueInstance;
    private static final String root = "root";
	private static final String passwd = "ihson83729405";
	private static final String strUrl = "jdbc:mysql://127.0.0.1:3306/jsp_�߰�_2012151025";
	public Connection conn;

    public HotelDatabase() {
    	System.setProperty("jdbc.drivers","com.mysql.jdbc.Driver");
		try {
			Class.forName("com.mysql.jdbc.Driver");
		} catch (ClassNotFoundException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}		
		
		try {
			conn = DriverManager.getConnection(this.strUrl, this.root, this.passwd);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
    }

//    public HotelDatabase getInstance() {
//            if (HotelDatabaseUniqueInstance == null)
//            	HotelDatabaseUniqueInstance = new HotelDatabase() ;
//        return HotelDatabaseUniqueInstance;
//    }
//
//	public Connection getConn(){
//		return conn;
//	}    
}
