package review;

import java.util.ArrayList;

public class ReviewTest {
	public static void main(String[] args) {
		ReviewDAO dao=new ReviewDAO();
		
//		ReviewVO vo=new ReviewVO();
//		
//		vo.setR_title("test");
//		vo.setR_contents("test2...");
//		vo.setMb_id("hong");
//		vo.setH_no(1);
		
		//System.out.println(vo.getR_title());
		
		//dao.addData(vo);
//		ArrayList<ReviewVOO> list =dao.getAllData(1,1);
//		for(ReviewVOO vo : list) {
//			System.out.println(vo.getR_no());
//		}
		int x=dao.getTotalCount();
		System.out.println(x);
	}
}
