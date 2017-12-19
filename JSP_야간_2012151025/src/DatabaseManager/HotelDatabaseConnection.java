package DatabaseManager;

import java.sql.*;

public class HotelDatabaseConnection {
//    private volatile static HotelDatabase HotelDatabaseUniqueInstance;
    private static final String root = "root";
	private static final String passwd = "ihson83729405";
	private static final String strUrl = "jdbc:mysql://127.0.0.1:3306/jsp_야간_2012151025?useUnicode=true&characterEncoding=euc-kr";
	
	public Connection conn;

    public HotelDatabaseConnection() {
    	System.setProperty("jdbc.drivers","com.mysql.jdbc.Driver");
		try {
			Class.forName("com.mysql.jdbc.Driver");
		} catch (ClassNotFoundException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}		
		
		try {
			conn = DriverManager.getConnection(this.strUrl, this.root, this.passwd);
			conn.setAutoCommit(false); //이 기능을 사용X
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		System.out.println("New HotelDatabase connection!!!");
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
    
//	@Override
//	protected void finalize() throws Throwable {
//		// TODO Auto-generated method stub
//		this.conn.close();
//		
//		super.finalize();
//	}
}
