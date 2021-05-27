package question;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import bbs.Bbs;

public class questionDAO {
	StringBuffer sb = new StringBuffer();
	ResultSet rs = null;
	PreparedStatement pstmt = null;
	Connection conn = null;
	
	public questionDAO() {
		conn = OracleXEConnection.getInstance().getConnection();
	}//생성자 end
	
	// 공지사항 입력 메소드 - write();
	
	//insert into notice
	//values(notice_n_no_seq.nextval, ?, ?, sysdate, ?)
	
	public int write(String ad_id, String title, String content) {
		sb.setLength(0);
		sb.append(" insert into question ");
		sb.append(" values(question_n_no_seq.nextval, ?, ?, sysdate, ? ) ");
		
		try {
			pstmt = conn.prepareStatement(sb.toString());
			
			pstmt.setNString(1, ad_id);
			pstmt.setNString(2, title);
			pstmt.setNString(3, content);
			
			return pstmt.executeUpdate();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return -1; // 데이터베이스 오류
	}
	
	//공지사항 한개 글읽어오기
	public questionVO getQuestion(int n_no) {
		sb.setLength(0);
		sb.append("select * from question ");
		sb.append("where n_no = ? ");
		
		try {
			PreparedStatement pstmt = conn.prepareStatement(sb.toString());
			pstmt.setInt(1, n_no);
			
			rs = pstmt.executeQuery();
			
			if(rs.next()) {
				questionVO vo = new questionVO();
				vo.setN_no(rs.getInt(1));
				vo.setAd_id(rs.getNString(2));
				vo.setTitle(rs.getNString(3));
				vo.setRegdate(rs.getNString(4));
				vo.setContent(rs.getNString(5));
				
				return vo;
			}
			
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return null;
	}
	
	
	//공지사항 전체 글 읽어오기 - getAllData(); , 페이징처리도 같이
	public ArrayList<questionVO> getAllData(int startNo, int endNo){
		ArrayList<questionVO> list = new ArrayList<questionVO>();
		
		sb.setLength(0);
		sb.append("select * ");
		sb.append(" from ( select rownum rn, n_no, ad_id, title, regdate, content ");
		sb.append(" from ( select * from question ");
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
				String ad_id = rs.getNString("ad_id");
				String title = rs.getNString("title");
				String regdate = rs.getNString("regdate");
				String content = rs.getNString("content");
				
				questionVO vo = new questionVO(n_no, ad_id, title, regdate, content);
				
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
		sb.append(" from question ");
		
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
	
	// 공지사항 수정
	public int update(int n_no, String title, String content) {
		sb.setLength(0);
		sb.append("update question ");
		sb.append("set title = ?, content = ? ");
		sb.append("where n_no = ? ");
		
		try {
			PreparedStatement pstmt = conn.prepareStatement(sb.toString());
			pstmt.setNString(1, title);
			pstmt.setNString(2, content);
			pstmt.setInt(3, n_no);
			
			return pstmt.executeUpdate();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return -1; // 데이터 베이스 오류
		
	}
	
	//공지사항 삭제
	public int delete(int n_no) {
		sb.setLength(0);
		sb.append("delete question " );
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
}
