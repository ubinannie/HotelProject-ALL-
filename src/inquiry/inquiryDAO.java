package inquiry;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import bbs.Bbs;

public class inquiryDAO {
	StringBuffer sb = new StringBuffer();
	ResultSet rs = null;
	PreparedStatement pstmt = null;
	Connection conn = null;
	
	public inquiryDAO() {
		conn = OracleXEConnection.getInstance().getConnection();
	}//생성자 end
	
	// 공지사항 입력 메소드 - write();
	
	//insert into notice
	//values(notice_n_no_seq.nextval, ?, ?, sysdate, ?)
	
	public int write(String mb_id, String title, String content, String category) {
		sb.setLength(0);
		sb.append(" insert into inquiry ");
		sb.append(" values(inquiry_n_no_seq.nextval, ?, ?, sysdate, ?, 0, ? ) ");
		
		try {
			pstmt = conn.prepareStatement(sb.toString());
			
			pstmt.setNString(1, mb_id);
			pstmt.setNString(2, title);
			pstmt.setNString(3, content);
			pstmt.setNString(4, category);
			
			
			return pstmt.executeUpdate();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return -1; // 데이터베이스 오류
	}
	
	//공지사항 한개 글읽어오기
	public inquiryVO getInuiry(int n_no) {
		sb.setLength(0);
		sb.append("select * from inquiry ");
		sb.append("where n_no = ? ");
		
		try {
			PreparedStatement pstmt = conn.prepareStatement(sb.toString());
			pstmt.setInt(1, n_no);
			
			rs = pstmt.executeQuery();
			
			if(rs.next()) {
				inquiryVO vo = new inquiryVO();
				vo.setN_no(rs.getInt(1));
				vo.setMb_id(rs.getNString(2));
				vo.setTitle(rs.getNString(3));
				vo.setRegdate(rs.getNString(4));
				vo.setContent(rs.getNString(5));
				vo.setReply(rs.getInt(6));
				vo.setCategory(rs.getNString(7));
				
				return vo;
			}
			
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return null;
	}
	
	
	//공지사항 전체 글 읽어오기 - getAllData(); , 페이징처리도 같이
	public ArrayList<inquiryVO> getAllData(int startNo, int endNo){
		ArrayList<inquiryVO> list = new ArrayList<inquiryVO>();
		
		sb.setLength(0);
		sb.append("select * ");
		sb.append(" from ( select rownum rn, n_no, mb_id, title, regdate, content, reply, category ");
		sb.append(" from ( select * from inquiry ");
		sb.append(" order by n_no desc ) ");
		sb.append(" where rownum <= ? ) ");
		sb.append(" where rn >= ? ");
		
		try {
			pstmt = conn.prepareStatement(sb.toString());
			pstmt.setInt(1, endNo);
			pstmt.setInt(2, startNo);
			
			// 실행
			rs = pstmt.executeQuery();
			
			while(rs.next()) {
				int n_no = rs.getInt("n_no");
				String mb_id = rs.getNString("mb_id");
				String title = rs.getNString("title");
				String regdate = rs.getNString("regdate");
				String content = rs.getNString("content");
				int reply = rs.getInt("reply");
				String category = rs.getNString("category");
				
				inquiryVO vo = new inquiryVO(n_no, mb_id, title, regdate, content, reply, category);
				
				list.add(vo);
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return list;
		
	}
	// 총 게시물 파악 메소드
	// select count(*)
	// from notice
	public int getTotalCount() {
		sb.setLength(0);
		sb.append(" select count(*) cnt ");
		sb.append(" from inquiry ");
		
		int cnt = 0;
		
		try {
			pstmt = conn.prepareStatement(sb.toString());
			
			rs = pstmt.executeQuery();
			
			rs.next();
			
			//cnt = rs.getInt(1)
			cnt = rs.getInt("cnt");
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return cnt;
		
	}// getTotalCount() end
	
	//  수정
	public int update(int n_no, String title, String content, String category) {
		sb.setLength(0);
		sb.append("update inquiry ");
		sb.append("set title = ?, content = ?, category = ? ");
		sb.append("where n_no = ? ");
		
		try {
			PreparedStatement pstmt = conn.prepareStatement(sb.toString());
			pstmt.setNString(1, title);
			pstmt.setNString(2, content);
			pstmt.setNString(3, category);
			pstmt.setInt(4, n_no);
			
			return pstmt.executeUpdate();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return -1; // 데이터 베이스 오류
		
	}
	
	// 삭제
	public int delete(int n_no) {
		sb.setLength(0);
		sb.append("delete inquiry " );
		sb.append("where n_no = ? ");
		try {
			pstmt = conn.prepareStatement(sb.toString());
			pstmt.setInt(1, n_no);
			return pstmt.executeUpdate();

		} catch (Exception e) {
			e.printStackTrace();
		}
		return -1; // 데이터베이스 오류
	}
	//reply를 통한 게시글 처리
	public int replyCk(int n_no) {
		sb.setLength(0);
		sb.append(" update inquiry ");
		sb.append("set reply = 1 ");
		sb.append("where n_no = ? ");
		
		int result = -1;
		
		try {
			pstmt = conn.prepareStatement(sb.toString());
			pstmt.setInt(1, n_no);;
			
			result = pstmt.executeUpdate();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return result;
		
	}
}
