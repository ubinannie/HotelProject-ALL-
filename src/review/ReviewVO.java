package review;

public class ReviewVO {
	private int r_no;
	private String r_title;
	private String r_contents;
	private String filepath;
	private String r_regdate;
	private String mb_id;
	private int h_no;
	
	public ReviewVO() {
		// TODO Auto-generated constructor stub
	}

	public ReviewVO(int r_no, String r_title, String r_contents, String filepath, String r_regdate, String mb_id,
			int h_no) {
		super();
		this.r_no = r_no;
		this.r_title = r_title;
		this.r_contents = r_contents;
		this.filepath = filepath;
		this.r_regdate = r_regdate;
		this.mb_id = mb_id;
		this.h_no = h_no;
	}

	public int getR_no() {
		return r_no;
	}

	public void setR_no(int r_no) {
		this.r_no = r_no;
	}

	public String getR_title() {
		return r_title;
	}

	public void setR_title(String r_title) {
		this.r_title = r_title;
	}

	public String getR_regdate() {
		return r_regdate;
	}

	public void setR_regdate(String r_regdate) {
		this.r_regdate = r_regdate;
	}

	public String getR_contents() {
		return r_contents;
	}

	public void setR_contents(String r_contents) {
		this.r_contents = r_contents;
	}

	public String getFilepath() {
		return filepath;
	}

	public void setFilepath(String filepath) {
		this.filepath = filepath;
	}

	public String getMb_id() {
		return mb_id;
	}

	public void setMb_id(String mb_id) {
		this.mb_id = mb_id;
	}

	public int getH_no() {
		return h_no;
	}

	public void setH_no(int h_no) {
		this.h_no = h_no;
	}

}
