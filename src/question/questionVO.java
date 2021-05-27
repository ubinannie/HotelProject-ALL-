package question;

public class questionVO {
	private int n_no;
	private String ad_id;
	private String title;
	private String regdate;
	private String content;

	
	public questionVO() {
		// TODO Auto-generated constructor stub
	}


	public questionVO(int n_no, String ad_id, String title, String regdate, String content) {
		super();
		this.n_no = n_no;
		this.ad_id = ad_id;
		this.title = title;
		this.regdate = regdate;
		this.content = content;
	}


	public int getN_no() {
		return n_no;
	}


	public void setN_no(int n_no) {
		this.n_no = n_no;
	}


	public String getAd_id() {
		return ad_id;
	}


	public void setAd_id(String ad_id) {
		this.ad_id = ad_id;
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


	
	
	
}

