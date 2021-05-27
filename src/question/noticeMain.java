package question;

import java.util.ArrayList;

public class noticeMain {
	public static void main(String[] args) {
		questionDAO dao = new questionDAO();
		
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
		
		ArrayList<questionVO> list = dao.getAllData(1, 2);
		
		for(questionVO vo : list) {
			System.out.println(vo.getN_no());
		}
		
	}

	
}
