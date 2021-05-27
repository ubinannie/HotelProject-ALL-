package review;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import connection.OracleXEConnection;

public class ReplyReviewDAO {
	StringBuffer sb=new StringBuffer();
	ResultSet rs=null;
	PreparedStatement pstmt=null;
	Connection conn=null;

	public ReplyReviewDAO() {
		// TODO Auto-generated constructor stub
		conn=OracleXEConnection.getInstance().getConnection();
	}

	//댓글 입력 메소드 - insertReply
	public void insertReply(ReplyReviewVO vo) {
		sb.setLength(0);
		sb.append("insert into reply ");
		sb.append("values (REPLY_RP_NO_SEQ.nextval, sysdate, ?, ?, ? )");

		try {
			pstmt=conn.prepareStatement(sb.toString());
			pstmt.setString(1, vo.getRp_contents());
			pstmt.setString(2, vo.getAd_id());
			pstmt.setInt(3, vo.getRef());

			pstmt.executeUpdate();

		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}//insertReply() end

	//댓글 조회 메소드 - 전체 조회
	public ArrayList<ReplyReviewVO> getAllReply(){
		ArrayList<ReplyReviewVO> list=new ArrayList<ReplyReviewVO>();

		sb.setLength(0);
		sb.append("select * from reply ");

		try {
			pstmt=conn.prepareStatement(sb.toString());

			rs=pstmt.executeQuery();

			while(rs.next()) {
				ReplyReviewVO rvo=
						new ReplyReviewVO(rs.getInt(1), rs.getString(2), rs.getString(3), rs.getString(4), rs.getInt(5));

				list.add(rvo);
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return list;
	}//getAllReply() end

	//댓글 조회 메소드 - 전체 조회(원글번호별)
	public ArrayList<ReplyReviewVO> getAllReply(int rp_no){
		ArrayList<ReplyReviewVO> list=new ArrayList<ReplyReviewVO>();

		sb.setLength(0);
		sb.append("select * from reply ");
		sb.append("where ref = ? ");

		try {
			pstmt=conn.prepareStatement(sb.toString());
			pstmt.setInt(1, rp_no);

			rs=pstmt.executeQuery();

			while(rs.next()) {
				ReplyReviewVO rvo=
						new ReplyReviewVO(rs.getInt(1), rs.getString(2), rs.getString(3), rs.getString(4), rs.getInt(5));

				list.add(rvo);
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return list;
	}//getAllReply(int bno) end

	//삭제 - 번호 - deleteData()
	public void deleteData(int rp_no) {
		sb.setLength(0);
		sb.append("delete reply ");
		sb.append("where rp_no = ? ");

		try {
			pstmt=conn.prepareStatement(sb.toString());
			pstmt.setInt(1, rp_no);

			pstmt.executeUpdate();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}// deleteData() end
}
