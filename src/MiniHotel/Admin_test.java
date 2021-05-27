package MiniHotel;

public class Admin_test {

	public static void main(String[] args) {
		
		//관리자 추가 - 사이트 관리자이면 vo 객체의 6번째 rank=1, 호텔매니저라면 rank=0;
		//함수 - public void addAdmin(AdminVO vo)
		
//		AdminVO vo = new AdminVO("goott", "1234", "hong", "hong@naver.com"
//				, "010-1234-5453", 1);
//		
//		AdminVO vo = new AdminVO("hyun8997", "hyun8997", "kim", "kim@naver.com"
//				, "010-5634-5353", 0);
//		
//		AdminDAO dao = new AdminDAO();
//		
//		dao.addAdmin(vo);	
		
//----------------------------------------------------------------------------------------------
		
		//관리자 데이터 수정 - id는 pk이기 때문에 인식용으로 씀, 변경 불가
		//함수 - public void modifyAdmin(AdminVO vo)
//		
//		AdminVO vo = new AdminVO("goott", "1234", "hong", "hong1234@naver.com"
//				, "010-1234-5453", 1);
//		
//		AdminDAO dao = new AdminDAO();
//		
//		dao.modifyAdmin(vo);
		
//----------------------------------------------------------------------------------------------		
		
		//총 관리자 인원 파악
		//함수 - public int getAdminCnt()
//		AdminDAO dao = new AdminDAO();
//		int result = dao.getAdminCnt();
//		System.out.println(result);
		
//----------------------------------------------------------------------------------------------	
		
		//관리자 확인 - 2자리 int 배열 반환, 첫자리는 테이블 데이터 존재여부, 둘째자리는 admin_rank
		//함수  - public int[] isAdmin(String id, String pw)
//		AdminDAO dao = new AdminDAO();
//		int[] result = new int[2];
//		
//		System.out.println(result[0]+" "+result[1]);
//		result = dao.isAdmin("goott", "1234");
//		System.out.println(result[0]+" "+result[1]);	//존재하고 rank=1, admin
//
//		System.out.println(result[0]+" "+result[1]);
//		result = dao.isAdmin("hyun8997", "hyun8997");
//		System.out.println(result[0]+" "+result[1]);	//존재하고 rank=0, hotel manager
		
//----------------------------------------------------------------------------------------------	
		
		//관리자 조회 by id - pk로 조회하므로 한명만 조회됨
		//함수 - public AdminVO getAdmin(String id)
//		AdminDAO dao = new AdminDAO();
//		AdminVO vo = null;
//		vo = dao.getAdmin("goott");
//		System.out.println(vo.getAd_id()+"의 이름:"+vo.getAd_name()+", 전화번호:"+vo.getAd_tel());
	
//----------------------------------------------------------------------------------------------	
		
		//전체 데이터 조회
		//함수 - public ArrayList<AdminVO> getAllData()
//		AdminDAO dao = new AdminDAO();
//		ArrayList<AdminVO> li = new ArrayList<AdminVO>();
//		
//		li = dao.getAllData();
//		
//		for(AdminVO vo : li) {
//			System.out.println("ID:"+vo.getAd_id()+", 이름:"+vo.getAd_name()+", 전화번호:"+vo.getAd_tel()+", rank:"+vo.getAd_rank());
//		}
		
//----------------------------------------------------------------------------------------------	
		
		AdminDAO dao = new AdminDAO();
		
		System.out.println(dao.isExist("111222"));
		
		
	}
	
}
