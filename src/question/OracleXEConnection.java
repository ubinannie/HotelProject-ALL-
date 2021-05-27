package question;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import oracle.jdbc.OracleConnection;

// singleTone pattern
public class OracleXEConnection {
	private static OracleXEConnection oc = null;
	private static Connection conn;
	
	final String driver = "oracle.jdbc.driver.OracleDriver";
	final String url = "jdbc:oracle:thin:@localhost:1521:XE";
	final String user = "scott";
	final String password = "tiger";
	
	// 외부에서의 인스턴스화를 막는다
	public OracleXEConnection() {
		// TODO Auto-generated constructor stub
	}
	
	// OracleXECOnnection 인스턴스를 얻는 방법은 getInstance 메서드를 호출하는 방법
	public static OracleXEConnection getInstance() {
		if(oc == null) oc = new OracleXEConnection();
		return oc;
	}
	
	public Connection getConnection() {
		if(conn == null) {
			try {
				Class.forName(driver);
				
				conn = DriverManager.getConnection(url, user, password);
				
				System.out.println("conn : " +conn);
			} catch (ClassNotFoundException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
				System.out.println("드라이버 로딩 실패");
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
				System.out.println("db 연결 실패");
			}
		}// if end
		return conn;
	}
	
	
}
