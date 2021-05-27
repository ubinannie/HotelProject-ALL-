package reservation;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import MiniHotel.Member_Vo;

public class ReservationDAO {
	
	StringBuffer sb = new StringBuffer();
	ResultSet rs = null;
	PreparedStatement pstmt = null;
	Connection conn = null;
	
	public ReservationDAO() {
		conn = OracleXEConnection.getInstance().getConnection();
	}// Reservation end
	
	// Test 테이블에 값 추가
	public void addData(ReservationVO vo) {
		sb.setLength(0);
		sb.append("insert into reservation_no ");
		sb.append("values (reservation_rs_num_seq.nextval, ?, ?, ?, 0, ?, ?, sysdate, ?, ?, ? ) ");
		
		try {
			pstmt = conn.prepareStatement(sb.toString());
			pstmt.setNString(1, vo.getRs_name());
			pstmt.setNString(2, vo.getRs_st_date());
			pstmt.setNString(3, vo.getRs_en_date());
			pstmt.setInt(4, vo.getRs_pri());
			pstmt.setNString(5, vo.getRs_tel());
			pstmt.setNString(6, vo.getRs_text());
			pstmt.setInt(7, vo.getH_no());
			pstmt.setInt(8,  vo.getHr_no());
			
			pstmt.executeUpdate();
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
	}// addData() end
	public void addDataLogin(ReservationVO vo) {
		sb.setLength(0);
		sb.append("insert into reservation ");
		sb.append("values (reservation_rs_num_seq.nextval, ?, ?, ?, 0, ?, ?, sysdate, ?, ?, ?, ? ) ");
		
		try {
			pstmt = conn.prepareStatement(sb.toString());
			pstmt.setNString(1, vo.getRs_name());
			pstmt.setNString(2, vo.getRs_st_date());
			pstmt.setNString(3, vo.getRs_en_date());
			pstmt.setInt(4, vo.getRs_pri());
			pstmt.setNString(5, vo.getRs_tel());
			pstmt.setNString(6, vo.getRs_text());
			pstmt.setNString(7, vo.getMb_id());
			pstmt.setInt(8, vo.getH_no());
			pstmt.setInt(9,  vo.getHr_no());
			
			pstmt.executeUpdate();
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
	}// addData() end
	// 비회원 내역 조회
	public ArrayList<ReservationVO> getData(String tel, int rs_num) {
		ArrayList<ReservationVO> list = new ArrayList<ReservationVO>();
		
		sb.setLength(0);
		sb.append("select * from reservation_no ");
		sb.append("where rs_tel = ? and rs_num = ? ");
		
		try {
			pstmt = conn.prepareStatement(sb.toString());
			pstmt.setNString(1, tel);
			pstmt.setInt(2, rs_num);
			
			rs = pstmt.executeQuery();
			
			while(rs.next()) {
				int h_no = rs.getInt(11);
				String rs_name = rs.getNString(2);
				String rs_st_date = rs.getNString(3);
				String rs_en_date = rs.getNString(4);
				String rs_st = rs.getNString(5);
				
				ReservationVO vo = new ReservationVO(rs_num, h_no, rs_st_date, rs_en_date, rs_name, rs_st);
				
				list.add(vo);
			}			
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return list;
	}
	
	// 예약 내역
	public ArrayList<ReservationVO> getDataLogin(String name, String tel, String mb_id) {
		ArrayList<ReservationVO> list = new ArrayList<ReservationVO>();
		
		sb.setLength(0);
		sb.append("select * from reservation ");
		sb.append("where rs_name = ? and rs_tel = ? and mb_id = ? ");
		
		try {
			pstmt = conn.prepareStatement(sb.toString());
			pstmt.setNString(1, name);
			pstmt.setNString(2, tel);
			pstmt.setNString(3, mb_id);
			
			rs = pstmt.executeQuery();
			
			while(rs.next()) {
				int rs_num = rs.getInt(1);
				String rs_st_date = rs.getNString(3);
				String rs_en_date = rs.getNString(4);
				String rs_st = rs.getNString(5);
				
				ReservationVO vo = new ReservationVO(rs_num, rs_st_date, rs_en_date, rs_st);
				
				list.add(vo);
			}			
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return list;
	}// getData() end
	
	public ArrayList<ReservationVO> getDataLogin(String name, String tel, String mb_id, int h_no) {
		ArrayList<ReservationVO> list = new ArrayList<ReservationVO>();
		
		sb.setLength(0);
		sb.append("select * ");
		sb.append("from reservation rs, roomofhotel hr ");
		sb.append("where rs.h_no = ? and hr.h_no = ? ");
		
		try {
			pstmt = conn.prepareStatement(sb.toString());
			pstmt.setInt(1, h_no);
			pstmt.setInt(2, h_no);
			
			rs = pstmt.executeQuery();
			
			while(rs.next()) {
				int rs_num = rs.getInt(1);
				String hr_name = rs.getNString(14);
				String rs_st_date = rs.getNString(3);
				String rs_en_date = rs.getNString(4);
				String rs_st = rs.getNString(5);
				
				ReservationVO vo = new ReservationVO(rs_num, h_no, rs_st_date, rs_en_date, name, rs_st);
				
				list.add(vo);
			}			
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return list;
	}// getData() end
	
	public ReservationVO getData(String id) {
		
		sb.setLength(0);
		sb.append("select * from reservation ");
		sb.append("where MB_ID = ? ");
		
		ReservationVO vo = null;
		
		try {
			pstmt = conn.prepareStatement(sb.toString());
			pstmt.setString(1, id);
			
			rs = pstmt.executeQuery();
			
			rs.next();
			String rs_name = rs.getNString(2);
			String rs_tel = rs.getNString(7);
			
			vo = new ReservationVO(rs_name, rs_tel);
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		return vo;
		
	}// getData() end
	
	// reserCancel()
	public void reserCancel(String name, String tel, String mb_id, int rs_num) {
		sb.setLength(0);
		sb.append("update reservation ");
		sb.append("set rs_st = rs_st+2 ");			// 취소 후에 관리자가 rs_st를 0 으로 초기화 해줘야함
		sb.append("where rs_name = ? and rs_tel = ? and mb_id = ? and rs_num = ? ");
		
		try {
			pstmt = conn.prepareStatement(sb.toString());
			pstmt.setNString(1, name);
			pstmt.setNString(2, tel);
			pstmt.setNString(3, mb_id);
			pstmt.setInt(4, rs_num);
			
			pstmt.executeUpdate();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
	// 내역 삭제		-- 관리자가 삭제
	public void deleteReser(String name, String tel, String mb_id, int rs_num) {
		sb.setLength(0);
		sb.append("delete reservation ");
		sb.append("where rs_name = ? and rs_tel = ? and mb_id = ? and rs_num = ? ");
		
		try {
			pstmt = conn.prepareStatement(sb.toString());
			pstmt.setNString(1, name);
			pstmt.setNString(2, tel);
			pstmt.setNString(3, mb_id);
			pstmt.setInt(4, rs_num);
			
			pstmt.executeUpdate();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
	// 멤버 회원과 JOIN해서 값을 가져오는 메서드
	
	// 예약테이블 호텔 넘버와 조인 해서 값 가져오기 
	public ArrayList<ReservationVO> getJoinData(int h_no) {
		ArrayList<ReservationVO> list = new ArrayList<ReservationVO>();
		sb.setLength(0);
		sb.append("select ho.h_name, hr.hr_price, hr.hr_type ");
		sb.append("from hotel ho, roomofhotel hr ");
		sb.append("where ho.h_no = ? and  hr.h_no = ? ");
		
		try {
			pstmt = conn.prepareStatement(sb.toString());
			pstmt.setInt(1, h_no);
			pstmt.setInt(2, h_no);
			
			rs = pstmt.executeQuery();
			
			while(rs.next()) {
				String name = rs.getNString(1);
				int price = rs.getInt(2);
				String type = rs.getNString(3);
				
				ReservationVO vo = new ReservationVO(name, price, type);
				
				list.add(vo);
			}
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return list;
	}// getJoinData() end
	// 멤버테이블에서 이름 번호 가져오기
	public ArrayList<ReservationVO> getMemData(String mb_id) {
		ArrayList<ReservationVO> list = new ArrayList<ReservationVO>();
		sb.setLength(0);
		sb.append("select rs.rs_name, rs.rs_tel ");
		sb.append("from member mb, reservation rs ");
		sb.append("where mb.mb_id = ? and rs.mb_id = ? ");
		
		try {
			pstmt = conn.prepareStatement(sb.toString());
			pstmt.setNString(1, mb_id);
			pstmt.setNString(2, mb_id);
			rs = pstmt.executeQuery();
			
			while(rs.next()) {
				String name = rs.getNString(1);
				String tel = rs.getNString(2);
				
				ReservationVO vo = new ReservationVO(name, tel);
				list.add(vo);
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return list;
	}// getMemData() end
	
	
	// getAdminData() 			-- 관리자 등급을 가진 회원이 조회를 할 수 있어야함.
}

