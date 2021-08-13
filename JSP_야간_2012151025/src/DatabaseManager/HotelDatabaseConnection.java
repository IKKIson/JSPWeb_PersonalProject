package DatabaseManager;

import java.sql.*;

public class HotelDatabaseConnection {
    private volatile static HotelDatabaseConnection HotelDatabaseUniqueInstance;
    private static final String root = "root";
	private static final String passwd = "****************";
	private static final String strUrl = "jdbc:mysql://127.0.0.1:3306/jsp_n_2012151025?useUnicode=true&characterEncoding=euc-kr";
	
	private Connection conn;

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
			conn.setAutoCommit(false); //ÀÌ ±â´ÉÀ» »ç¿ëX
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		System.out.println("New HotelDatabase connection!!!");
    }

    public HotelDatabaseConnection getInstance() {
            if (HotelDatabaseUniqueInstance == null)
            	HotelDatabaseUniqueInstance = new HotelDatabaseConnection() ;
        return HotelDatabaseUniqueInstance;
    }

	public Connection getConn(){
		return conn;
	}    
    
	@Override
	protected void finalize() throws Throwable {
		// TODO Auto-generated method stub
		this.conn.close();
		
		super.finalize();
	}
}
