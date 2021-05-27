package review;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import connection.OracleXEConnection;

public class ReviewDAO {
	StringBuffer sb=new StringBuffer();
	ResultSet rs=null;
	PreparedStatement pstmt=null;
	Connection conn=null;
	
	public ReviewDAO() {
		// TODO Auto-generated constructor stub
		conn=OracleXEConnection.getInstance().getConnection();
	}// 생성자 end
	
	//리뷰 입력 메소드 - addData()
//	insert into review_test
//	values (review_test_r_no_seq.nextval, ?, sysdate, ?, ?, ?, ?)
	public void addData(ReviewVO vo) {
		sb.setLength(0);
		sb.append("insert into review ");
		sb.append("values (review_r_no_seq.nextval, ?, ?, ?, sysdate, ?, ?) ");
		
		try {
			pstmt=conn.prepareStatement(sb.toString());
			pstmt.setString(1, vo.getR_title());
			pstmt.setString(2, vo.getR_contents());
			pstmt.setString(3, vo.getFilepath());
			pstmt.setString(4, vo.getMb_id());
			pstmt.setInt(5, vo.getH_no());
			
			pstmt.executeUpdate();
				
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}//addData() end
	
	//리뷰 전체 조회 - getAllData
//	select * 
//	from ( select rownum rn, r_no, r_title, r_regdate, r_contents, mb_id, h_no, filepath 
//	from ( select * from review_test 
//	order by r_no desc ) 
//	where rownum <= 5 )
//	where rn >= 1 ;
	public ArrayList<ReviewVO> getAllData(int startNo, int endNo){
		ArrayList<ReviewVO> list=new ArrayList<ReviewVO>();
		sb.setLength(0);
		sb.append("select * ");
		sb.append("from ( select rownum rn, r_no, r_title, r_contents, filepath, r_regdate, mb_id, h_no ");
		sb.append("from ( select * from review ");
		sb.append("order by r_no desc ) ");
		sb.append("where rownum <= ? ) ");
		sb.append("where rn >= ? ");
		
		try {
			pstmt=conn.prepareStatement(sb.toString());
			pstmt.setInt(1, endNo);
			pstmt.setInt(2, startNo);
			rs=pstmt.executeQuery();
			
			while(rs.next()) {
				ReviewVO vo=new ReviewVO(rs.getInt("r_no"), rs.getString("r_title"), rs.getString("r_contents"), 
						rs.getString("filepath"), rs.getString("r_regdate"), rs.getString("mb_id"), rs.getInt("h_no"));
				
				list.add(vo);
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return list;
	}//getAllData() end

	//리뷰 삭제  - 아이디 - deleteData()
	public void deleteData(String mb_id) {
		sb.setLength(0);
		sb.append("delete review ");
		sb.append("where mb_id = ? ");

		try {
			pstmt=conn.prepareStatement(sb.toString());
			pstmt.setString(1, mb_id);

			pstmt.executeUpdate();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}// deleteData() end
	
	//리뷰 삭제  - 게시글번호 - deleteData()
		public void deleteData(int r_no) {
			sb.setLength(0);
			sb.append("delete review ");
			sb.append("where r_no = ? ");

			try {
				pstmt=conn.prepareStatement(sb.toString());
				pstmt.setInt(1, r_no);

				pstmt.executeUpdate();
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}// deleteData() end
	
	//총 게시물 파악 메소드
	public int getTotalCount() {
		sb.setLength(0);
		sb.append("select count(*) cnt ");
		sb.append("from review ");
		
		int cnt=0;
		
		try {
			pstmt=conn.prepareStatement(sb.toString());
			rs=pstmt.executeQuery();
			
			rs.next();
			
//			cnt=rs.getInt(1); (x)
			cnt=rs.getInt("cnt");
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return cnt;
	}// getTotalCount() end
	
}
