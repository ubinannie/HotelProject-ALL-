package review;

public class ReplyReviewVO {
	private int rp_no;
	private String rp_regdate;
	private String rp_contents;
	private String ad_id;
	private int ref;
	
	public ReplyReviewVO() {
		// TODO Auto-generated constructor stub
	}

	public ReplyReviewVO(int rp_no, String rp_regdate, String rp_contents, String ad_id, int ref) {
		super();
		this.rp_no = rp_no;
		this.rp_regdate = rp_regdate;
		this.rp_contents = rp_contents;
		this.ad_id = ad_id;
		this.ref=ref;
	}

	public int getRp_no() {
		return rp_no;
	}

	public void setRp_no(int rp_no) {
		this.rp_no = rp_no;
	}

	public String getRp_regdate() {
		return rp_regdate;
	}

	public void setRp_regdate(String rp_regdate) {
		this.rp_regdate = rp_regdate;
	}

	public String getRp_contents() {
		return rp_contents;
	}

	public void setRp_contents(String rp_contents) {
		this.rp_contents = rp_contents;
	}

	public String getAd_id() {
		return ad_id;
	}

	public void setAd_id(String ad_id) {
		this.ad_id = ad_id;
	}

	public int getRef() {
		return ref;
	}

	public void setRef(int ref) {
		this.ref = ref;
	}
	
	
}
