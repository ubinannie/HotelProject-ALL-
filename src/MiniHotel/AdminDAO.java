package MiniHotel;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;



public class AdminDAO {
	StringBuffer sb = new StringBuffer();
	
	ResultSet rs = null;
	PreparedStatement pstmt = null;
	Connection conn = null;
	
	public AdminDAO() {
		conn = OracleXEConnection.getInstance().getConnection();
	} // AdminDAO end
	
	
	//관리자 추가 - 사이트 관리자이면 vo 객체의 6번째 rank=1, 호텔매니저라면 rank=0;
		public void addAdmin(AdminVO vo) {
			sb.setLength(0);
			sb.append("insert into admin ");
			sb.append("values (?, ?, ?, ?, ?, 0) ");
			
			try {
				pstmt = conn.prepareStatement(sb.toString());
				pstmt.setNString(1, vo.getAd_id());
				pstmt.setNString(2, vo.getAd_password());
				pstmt.setNString(3, vo.getAd_name());
				pstmt.setNString(4, vo.getAd_email());
				pstmt.setNString(5, vo.getAd_tel());
				
				int result = pstmt.executeUpdate();
				
				System.out.println("result : " + result);
				
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}//addAdmin end
		
		public int duplecateID(String id){
			 
	    	int checkNum = 0;

	    	sb.setLength(0);
	    	sb.append("select * from admin ");
	    	sb.append("where Ad_id = ? ");
	    	
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
		public AdminVO getData(String id) {
			
			sb.setLength(0);
			sb.append("select * from admin ");
			sb.append("where Ad_id = ? ");
			
			AdminVO vo = null;
			
			try {
				pstmt = conn.prepareStatement(sb.toString());
				pstmt.setString(1, id);
				
				rs = pstmt.executeQuery();
				
				rs.next();
				
				String password = rs.getString(2);
				String name = rs.getString(3);
				String email = rs.getString(4);
				String tel = rs.getString(5);

				vo = new AdminVO(id, password, name, email, tel);
				
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			
			return vo;
			
		}// getData() end
		
		// id로만 존재하는 회원인지 여부를 파악하는 메소드 
		public boolean isExist(String id) {
		      
		      sb.setLength(0);
		      sb.append("select * from admin ");
		      sb.append("where Ad_id = ? ");
		      
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
		public int login(String Ad_id, String Ad_PASSWORD) { 
			 
			 String SQL = "SELECT Ad_PASSWORD FROM admin WHERE Ad_id = ? "; 
			 
			 try { 
				 
				pstmt = conn.prepareStatement(SQL); 
			 
			 	pstmt.setString(1, Ad_id); 
			 	
			 	rs = pstmt.executeQuery(); 
			 	
			 if(rs.next()) { 
				 
				 if(rs.getString(1).equalsIgnoreCase(Ad_PASSWORD)) { 
					 
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
		
		//관리자 데이터 수정 - id는 pk이기 때문에 인식용으로 씀, 변경 불가
		public void modifyAdmin(AdminVO vo) {
			sb.setLength(0);
			sb.append("update admin ");
			sb.append("set ad_password = ?, ad_name = ?, ad_email = ?, ad_tel = ? ");
			sb.append("where ad_id = ? ");
			
			try {
				pstmt = conn.prepareStatement(sb.toString());
				pstmt.setNString(1, vo.getAd_password());
				pstmt.setNString(2, vo.getAd_name());
				pstmt.setNString(3, vo.getAd_email());
				pstmt.setNString(4, vo.getAd_tel());
				pstmt.setNString(5, vo.getAd_id());
				
				pstmt.executeUpdate();
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}//modifyAdmin end
		
		//총 관리자 인원 파악
		public int getAdminCnt() {
			sb.setLength(0);
			sb.append("select count(*) ");
			sb.append("from admin ");
			
			int cnt = 0;
			
			try {
				pstmt = conn.prepareStatement(sb.toString());
				rs = pstmt.executeQuery();
				rs.next();
				cnt = rs.getInt(1);
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			return cnt;
		}//getAdminCnt end
		
		//관리자 확인 - 2자리 int 배열 반환, 첫자리는 테이블 데이터 존재여부, 둘째자리는 admin_rank
		public int[] isAdmin(String id, String pw) {
			sb.setLength(0);
			sb.append("select * from admin ");
			sb.append("where ad_id = ? and ad_password = ? ");
			
			int[] result = new int[2];
			boolean check = false;
			
			try {
				pstmt = conn.prepareStatement(sb.toString());
				pstmt.setNString(1, id);
				pstmt.setNString(2, pw);
				
				rs = pstmt.executeQuery();
				
				check = rs.next();			//존재 확인
				
				if(check==true) {
					result[0]=1;			//존재하면 result의 첫 부분에 1삽입
					result[1] = rs.getInt(6);	//admin rank result[2]에 삽입
				}
				
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			return result;
		}//isAdmin end
	public int updateData(AdminVO dto) {
		    	
		        sb.setLength(0);
		        sb.append("UPDATE ADMIN SET AD_PASSWORD = ?, AD_NAME = ?, AD_TEL = ? ");
		        sb.append("WHERE AD_ID = ? ");
		        
		        int result = -1;
		        
		        try {
	
		            pstmt=conn.prepareStatement(sb.toString());
		            
					 pstmt.setNString(1, dto.getAd_password());
					 pstmt.setNString(2, dto.getAd_name());
					 pstmt.setNString(3, dto.getAd_tel());
					 pstmt.setNString(4, dto.getAd_id());
	
					 pstmt.executeUpdate();	 
					 
		            
		            // 회원정보 수정 성공하면 1값을 돌려줌				
					 System.out.println(result);
					 
		        } catch (Exception e) {
	
		            System.out.println(e.toString());
		         // 회원정보 수정 실패하면 -1값을 돌려줌
		        }
				
		        return result;
		        
		    }	// updateData end
			
		
		// 자원반납
		public void close() {
			try {
				if(rs != null) rs.close();
				if(pstmt != null) pstmt.close();
				if(conn != null) conn.close();
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}// close() end
		
		
		
	
	
	

}
