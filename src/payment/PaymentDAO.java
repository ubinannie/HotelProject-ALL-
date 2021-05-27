package payment;

import java.io.IOException;
import java.sql.Connection;
import java.sql.Date;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import oracle.jdbc.OracleConnection;

public class PaymentDAO {
		StringBuffer sb = new StringBuffer();
		ResultSet rs = null;
		PreparedStatement pstmt = null;
		Connection conn = null;
		
		public PaymentDAO() {
			conn = OracleXEConnection.getInstance().getConnection();
		} // PaymentDAO 생성자 end
	
		// 결제창에서 입력한 값을 db에 추가하는 메서드	
		public void addData(PaymentVO vo) {		
			sb.setLength(0);
			sb.append("insert into payment ");
			sb.append("values (payment_p_num_seq.nextval, ?, ?, sysdate ) ");
			
			try {
				pstmt = conn.prepareStatement(sb.toString());
				pstmt.setInt(1, vo.getP_num());
				pstmt.setNString(2, vo.getP_name());
				pstmt.setNString(3, vo.getP_tel());
				pstmt.setNString(4, vo.getP_date());
				
				int result = pstmt.executeUpdate();
				
				System.out.println("result : " + result);
				
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
				
		}// addData() end
		
	public List listMembers() {
		List list = new ArrayList();
		
		try {
			String query = "select * from payment ";
			System.out.println(query);
			
			rs = pstmt.executeQuery();
			
			while(rs.next()) {
				int num = rs.getInt("p_num");
				String name = rs.getString("p_name");
				String tel = rs.getString("p_tel");
				String P_date = rs.getString("p_date");
				
				PaymentVO vo = new PaymentVO();
				vo.setP_num(num);
				vo.setP_name(name);
				vo.setP_tel(tel);
				vo.setP_date(P_date);	//각 컬럼 값을 다시 MemberVO 객체의 속성에 설정
				
				list.add(vo);
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return list;
	}// getData() end
		
}
