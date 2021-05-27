package inquiry;

public class commentVO {
	private int n_no;
	private String ad_id;
	private String content;
	private String regdate;
	private int ref;
	
	public commentVO() {
		// TODO Auto-generated constructor stub
	}

	public commentVO(int n_no, String ad_id, String content, String regdate, int ref) {
		super();
		this.n_no = n_no;
		this.ad_id = ad_id;
		this.content = content;
		this.regdate = regdate;
		this.ref = ref;
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

	public String getContent() {
		return content;
	}

	public void setContent(String content) {
		this.content = content;
	}

	public String getRegdate() {
		return regdate;
	}

	public void setRegdate(String regdate) {
		this.regdate = regdate;
	}

	public int getRef() {
		return ref;
	}

	public void setRef(int ref) {
		this.ref = ref;
	}



	




	
	
}
