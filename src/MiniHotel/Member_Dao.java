package MiniHotel;

import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


public class Member_Dao {
		StringBuffer sb = new StringBuffer();
		
		ResultSet rs = null;
		PreparedStatement pstmt = null;
		Connection conn = null;
		
		public Member_Dao() {
			conn = OracleXEConnection.getInstance().getConnection();
		} // Member_Dao end
	
		// 맴버 추가 로직
		// 회원가입시 registerOk.jsp 파일에서 쓰임
		
		public void addData(Member_Vo plusvo) {
			
			sb.setLength(0);
			sb.append("insert into member ");
			sb.append("values (?,?,?,?,?,?,?, sysdate, 0, 0) ");
			
			try {
				pstmt = conn.prepareStatement(sb.toString());
				
				pstmt.setNString(1, plusvo.getId());
				pstmt.setNString(2, plusvo.getPw());
				pstmt.setNString(3, plusvo.getName());
				pstmt.setNString(4, plusvo.getNickname());
				pstmt.setNString(5, plusvo.getEmail());
				pstmt.setNString(6, plusvo.getBirth());
				pstmt.setNString(7, plusvo.getTel());
				
				int result = pstmt.executeUpdate();
				
				System.out.println("result : " + result);
				
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
				
		}// addData() end
		
		// id 중복 확인 로직
		 public int duplecateID(String id){
			 
	    	int checkNum = 0;

	    	sb.setLength(0);
	    	sb.append("select * from member ");
	    	sb.append("where MB_ID = ? ");
	    	
	    	try {
	    		pstmt=conn.prepareStatement(sb.toString());
	    		pstmt.setString(1, id);
	    		rs=pstmt.executeQuery();
	    		if(rs.next())
	    		{
	    			checkNum=1;
	    		}
	    	} catch(SQLException e){
	    		e.printStackTrace();
	    	} finally {
	    		close(rs,pstmt,conn);
	    	}
	    	return checkNum;
	    }// duplecateID end

		private void close(ResultSet rs2, PreparedStatement pstmt2, Connection conn2) {
			// TODO Auto-generated method stub
			
		}
		
		// id로 다른 정보들 가져오는 로직 -> String으로 값을 돌려주는 로직
		public Member_Vo getData(String id) {
			
			sb.setLength(0);
			sb.append("select * from member ");
			sb.append("where MB_ID = ? ");
			
			Member_Vo vo = null;
			
			try {
				pstmt = conn.prepareStatement(sb.toString());
				pstmt.setString(1, id);
				
				rs = pstmt.executeQuery();
				
				rs.next();
				
				String pw = rs.getString(2);
				String name = rs.getString(3);
				String nickname = rs.getString(4);
				String email = rs.getString(5);
				String birth = rs.getString(6);
				String tel = rs.getString(7);
				String date = rs.getString(8);
				String level = rs.getString(9);
				String ok = rs.getString(10);
				
				vo = new Member_Vo(id, pw, name, nickname, email, birth, tel, date, level, ok);
				
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			
			return vo;
			
		}// getData() end

		// id로만 존재하는 회원인지 여부를 파악하는 메소드 
		 public boolean isExist(String id) {
		      
		      sb.setLength(0);
		      sb.append("select * from member ");
		      sb.append("where MB_ID = ? ");
		      
		      boolean flag = false;
		      
		      try {
		         pstmt = conn.prepareStatement(sb.toString());
		         pstmt.setNString(1, id);
		         
		         rs = pstmt.executeQuery();
		         
		         flag = rs.next();   // 존재 여부만 파악해서 리턴
		         

		      } catch (SQLException e) {
		         // TODO Auto-generated catch block
		         e.printStackTrace();
		      }
		      return flag;
		      
		   }// isExist() end

		 // 로그인 할때 id랑 pw 정보 확인하는 로직
		 public int login(String MB_ID, String MB_PASSWORD) { 
			 
			 String SQL = "SELECT MB_PASSWORD FROM member WHERE MB_ID = ?"; 
			 
			 try { 
				 
				pstmt = conn.prepareStatement(SQL); 
			 
			 	pstmt.setString(1, MB_ID); 
			 	
			 	rs = pstmt.executeQuery(); 
			 	
			 if(rs.next()) { 
				 
				 if(rs.getString(1).equals(MB_PASSWORD)) { 
					 
					 	return 1; //로그인 성공 
					 	
					 } else 
						 
						return 0; //비밀번호 오류 
				 
				 } 
			 	 return -1; //아이디 없음 
			} catch (Exception e) { 
					 e.printStackTrace(); 
			} 
			return -2; // 데이터베이스 오류 
					
	} // login end
		 
		 public int join(Member_Vo user) { 
			 
			 String SQL = "INSERT INTO Member VALUES (?,?,?,?,?,?,?, sysdate, 0, 0) "; 
			 
			 try { 
				 
				 pstmt = conn.prepareStatement(SQL); 
				 pstmt.setNString(1, user.getId());
				 pstmt.setNString(2, user.getPw());
				 pstmt.setNString(3, user.getName());
				 pstmt.setNString(4, user.getNickname());
				 pstmt.setNString(5, user.getEmail());
				 pstmt.setNString(6, user.getBirth());
				 pstmt.setNString(7, user.getTel());
	
				 return pstmt.executeUpdate(); 
				 
			}catch (Exception e) { 
				
				e.printStackTrace(); 
				
			} return -1; //데이터베이스 오류 
			
		}//join end

		// 삭제 로직
		public int deleteMember(String MB_ID){
			
			int result=0;

			PreparedStatement pstmt=null;
			String sql;
				
			try{
				sql="DELETE FROM Member WHERE MB_ID=?";
					
				pstmt=conn.prepareStatement(sql);
					
				pstmt.setString(1, MB_ID);
					
				result=pstmt.executeUpdate();
					
				pstmt.close();
				
			}catch(Exception e){
				System.out.println(e.toString());
			}
				return result;
				
			} // deleteMember end

	// 수정할 로직
	    public int updateData(Member_Vo dto) {

	        int result=0;
	        PreparedStatement pstmt=null;
	        String sql;
	        
	        try {
	            sql="UPDATE Member SET MB_PASSWORD=?, MB_NICKNAME=?, MB_TEL=? ";
	            sql+=" WHERE MB_ID=?";

	            pstmt=conn.prepareStatement(sql);

				 pstmt.setNString(1, dto.getId());
				 pstmt.setNString(2, dto.getPw());
				 pstmt.setNString(3, dto.getName());
				 pstmt.setNString(4, dto.getNickname());
				 pstmt.setNString(5, dto.getEmail());
				 pstmt.setNString(6, dto.getBirth());
				 pstmt.setNString(7, dto.getTel());

	            result=pstmt.executeUpdate();
	            
	            pstmt.close();

	        } catch (Exception e) {

	            System.out.println(e.toString());

	        }
        return result;

	    }	// updateData end
	    
	    // 세션에 있는 id로 이름과 연락처를 가져올것

}
