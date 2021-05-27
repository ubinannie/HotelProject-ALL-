package inquiry;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import notice.noticeVO;
import vo.ReBoardVO;

public class commentDAO {
	StringBuffer sb = new StringBuffer();
	ResultSet rs = null;
	PreparedStatement pstmt = null;
	Connection conn =null;
	
	public commentDAO() {
		conn = OracleXEConnection.getInstance().getConnection();
	}
	// 댓글 입력
	public void write(commentVO rvo) {
		sb.setLength(0);
		sb.append("insert into i_comment ");
		sb.append(" values (i_comment_n_no_seq.nextval, ?, ?, sysdate, ? ) ");
		
		
		try {
			pstmt = conn.prepareStatement(sb.toString());
			
			pstmt.setNString(1, rvo.getAd_id());
			pstmt.setNString(2, rvo.getContent());
			pstmt.setInt(3, rvo.getRef());
			
			pstmt.executeUpdate();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
	
	//답변 한개 글읽어오기
		public commentVO getComment(int n_no) {
			sb.setLength(0);
			sb.append("select * from i_comment ");
			sb.append("where n_no = ? ");
			
			try {
				PreparedStatement pstmt = conn.prepareStatement(sb.toString());
				pstmt.setInt(1, n_no);
				
				rs = pstmt.executeQuery();
				
				if(rs.next()) {
					commentVO vo = new commentVO();
					vo.setN_no(rs.getInt(1));
					vo.setAd_id(rs.getNString(2));
					vo.setContent(rs.getNString(3));
					vo.setRegdate(rs.getNString(4));
					vo.setRef(rs.getInt(5));
					
					return vo;
				}
				
				
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			return null;
		}
		
		// 댓글 조회 메소드 - 전체 조회
		public ArrayList<commentVO> getAllReply(){
			ArrayList<commentVO> list = new ArrayList<commentVO>();
			
			sb.setLength(0);
			sb.append("select * from i_comment ");
			sb.append("order by n_no desc ");
			
			try {
				pstmt = conn.prepareStatement(sb.toString());
				
				rs = pstmt.executeQuery();
				
				while(rs.next()) {
					commentVO rvo =
							new commentVO(rs.getInt(1), rs.getNString(2), rs.getNString(3), rs.getNString(4), rs.getInt(5));
					list.add(rvo);
					
				}
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			return list;
			
		} // getAllReply() end
	// 댓글 조회 메소드 - 전체 조회(원글 번호별)
	public ArrayList<commentVO> getAllReply(int n_no){
		ArrayList<commentVO> list = new ArrayList<commentVO>();
		
		sb.setLength(0);
		sb.append("select * from i_comment ");
		sb.append("where ref = ? ");
		sb.append("order by n_no desc ");
		
		try {
			pstmt = conn.prepareStatement(sb.toString());
			
			rs = pstmt.executeQuery();
			
			while(rs.next()) {
				commentVO cvo =
						new commentVO(rs.getInt(1), rs.getNString(2), rs.getNString(3), rs.getNString(4), rs.getInt(5));
				list.add(cvo);
				
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return list;
		
	} // getAllReply(int bno) end
	//공지사항 삭제
	public int delete(int n_no) {
		sb.setLength(0);
		sb.append("delete i_comment " );
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
