package reservation;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;



public class HotelInfoDAO {
	
	StringBuffer sb = new StringBuffer();
	ResultSet rs = null;
	PreparedStatement pstmt = null;
	Connection conn = null;
	
	public HotelInfoDAO() {
		conn = OracleXEConnection.getInstance().getConnection();
	}
	// 호텔 방 정보 
	public ArrayList<HotelInfoVO> getData(int h_no) {
		ArrayList<HotelInfoVO> list = new ArrayList<HotelInfoVO>();
		sb.setLength(0);
		sb.append("select * from roomofhotel ");
		sb.append("where h_no = ? ");
		
		try {
			pstmt = conn.prepareStatement(toString());
			pstmt.setInt(1, h_no);
			
			rs = pstmt.executeQuery();
			
			while(rs.next()) {
				int hr_no = rs.getInt(1);
				String hr_name = rs.getNString(2);
				String hr_picpath = rs.getNString(3);
				String hr_picname = rs.getNString(4);
				String hr_type = rs.getNString(5);
				int hr_maxppl = rs.getInt(6);
				int hr_price = rs.getInt(7);
				
				HotelInfoVO vo = new HotelInfoVO(hr_no, hr_name, hr_picpath, hr_picname, hr_type, hr_maxppl, hr_price, h_no);
				
				list.add(vo);
				
			}
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return list;
	}

}
