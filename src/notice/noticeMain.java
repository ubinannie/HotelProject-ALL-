package notice;

import java.util.ArrayList;

public class noticeMain {
	public static void main(String[] args) {
		noticeDAO dao = new noticeDAO();
		
		// 글 작성 입력 테스트
//		noticeVO vo = new noticeVO();
//		vo.setAd_id("asddddasd");
//		vo.setTitle("홍길동전dddd");
//		vo.setContent("안녕하세요dddddd");
//		
//		System.out.println(vo.toString());
//		
//		dao.write(vo);
		
//		noticeVO vo = dao.getNotice(3);
//		System.out.println(vo.getN_no() + vo.getTitle());
		
		//데이터 삭제
		//dao.delete(3);
		
		ArrayList<noticeVO> list = dao.getAllData(1, 2);
		
		for(noticeVO vo : list) {
			System.out.println(vo.getN_no());
		}
		
	}

	
}
