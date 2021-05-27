package inquiry;

public class inquiryVO {
	private int n_no;
	private String mb_id;
	private String title;
	private String regdate;
	private String content;
	private int reply;
	private String category;
	
	public inquiryVO() {
		// TODO Auto-generated constructor stub
	}

	public inquiryVO(int n_no, String mb_id, String title, String regdate, String content, int reply,
			String category) {
		super();
		this.n_no = n_no;
		this.mb_id = mb_id;
		this.title = title;
		this.regdate = regdate;
		this.content = content;
		this.reply = reply;
		this.category = category;
	}

	public int getN_no() {
		return n_no;
	}

	public void setN_no(int n_no) {
		this.n_no = n_no;
	}

	public String getMb_id() {
		return mb_id;
	}

	public void setMb_id(String mb_id) {
		this.mb_id = mb_id;
	}

	public String getTitle() {
		return title;
	}

	public void setTitle(String title) {
		this.title = title;
	}

	public String getRegdate() {
		return regdate;
	}

	public void setRegdate(String regdate) {
		this.regdate = regdate;
	}

	public String getContent() {
		return content;
	}

	public void setContent(String content) {
		this.content = content;
	}

	public int getReply() {
		return reply;
	}

	public void setReply(int reply) {
		this.reply = reply;
	}

	public String getCategory() {
		return category;
	}

	public void setCategory(String category) {
		this.category = category;
	}
	
	



	
	
	
}

