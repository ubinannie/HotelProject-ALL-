package MiniHotel;

public class Member_test {

	public static void main(String[] args) {
		
		Member_Dao dao = new Member_Dao();
		
		// 멤버 추가 데이터 잘 넘어가는지 확인하는 곳
		Member_Vo vo = new Member_Vo();
					
		/* vo.setId("장유빈");
		vo.setPw("0000000");
		vo.setName("장유빈");
		vo.setNickname("얀얀");
		vo.setEmail("ubinannie@naver.com");
		vo.setBirth("960411");
		vo.setTel("010-3748-5437");
		
		dao.addData(vo); */
		
		// 여기까지 이상 없음
		vo.setId("장유빈");
		vo.setPw("0000000");
		vo.setName("장유빈");
		vo.setNickname("얀얀");
		vo.setEmail("ubinannie@naver.com");
		vo.setBirth("960411");
		vo.setTel("010-3748-5437");
		
		dao.addData(vo);
		
		
	}
	
}
