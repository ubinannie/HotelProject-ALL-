package reservation;

public class ReservationVO {
	private int rs_num;
	private String rs_name;
	private String rs_st_date;
	private String rs_en_date;
	private String rs_st;
	private int rs_pri;
	private String rs_tel;
	private String rs_regdate;
	private String rs_text;
	private String mb_id;
	private String mb_name;
	private String mb_tel;
	private int h_no;
	private int hr_no;
	private String h_name;
	private int hr_price;
	private String type;
	
	public ReservationVO() {}
	
	
	public ReservationVO(String rs_name, String rs_tel) {
		super();
		this.rs_name = rs_name;
		this.rs_tel = rs_tel;
	}

	public ReservationVO(int rs_num, String rs_name, String rs_st_date, String rs_en_date, String rs_st, int rs_pri,
			String rs_tel, String rs_regdate, String rs_text, String mb_id, int h_no, int hr_no) {
		super();
		this.rs_num = rs_num;
		this.rs_name = rs_name;
		this.rs_st_date = rs_st_date;
		this.rs_en_date = rs_en_date;
		this.rs_st = rs_st;
		this.rs_pri = rs_pri;
		this.rs_tel = rs_tel;
		this.rs_regdate = rs_regdate;
		this.rs_text = rs_text;
		this.mb_id = mb_id;
		this.h_no = h_no;
		this.hr_no = hr_no;
	}

	public ReservationVO(int rs_num, int h_no, String rs_st_date, String rs_en_date, String rs_name, String rs_st) {
		super();
		this.rs_num = rs_num;
		this.rs_name = rs_name;
		this.rs_st_date = rs_st_date;
		this.rs_en_date = rs_en_date;
		this.rs_st = rs_st;
		this.h_no = h_no;
	}

	public ReservationVO(String rs_st_date, String rs_en_date, String rs_st, String h_name) {
		super();
		this.rs_st_date = rs_st_date;
		this.rs_en_date = rs_en_date;
		this.rs_st = rs_st;
		this.h_name = h_name;
	}


	public ReservationVO(String h_name, int hr_price, String type) {
		super();
		this.h_name = h_name;
		this.hr_price = hr_price;
		this.type = type;
	}
	
	public ReservationVO(String rs_name, String mb_name, String mb_tel) {
		super();
		this.rs_name = rs_name;
		this.mb_name = mb_name;
		this.mb_tel = mb_tel;
	}
	

	public ReservationVO(int rs_num, String rs_st_date, String rs_en_date, String rs_st) {
		super();
		this.rs_num = rs_num;
		this.rs_st_date = rs_st_date;
		this.rs_en_date = rs_en_date;
		this.rs_st = rs_st;
	}


	public int getRs_num() {
		return rs_num;
	}


	public void setRs_num(int rs_num) {
		this.rs_num = rs_num;
	}


	public String getRs_name() {
		return rs_name;
	}


	public void setRs_name(String rs_name) {
		this.rs_name = rs_name;
	}


	public String getRs_st_date() {
		return rs_st_date;
	}


	public void setRs_st_date(String rs_st_date) {
		this.rs_st_date = rs_st_date;
	}


	public String getRs_en_date() {
		return rs_en_date;
	}


	public void setRs_en_date(String rs_en_date) {
		this.rs_en_date = rs_en_date;
	}


	public String getRs_st() {
		return rs_st;
	}


	public void setRs_st(String rs_st) {
		this.rs_st = rs_st;
	}


	public int getRs_pri() {
		return rs_pri;
	}


	public void setRs_pri(int rs_pri) {
		this.rs_pri = rs_pri;
	}


	public String getRs_tel() {
		return rs_tel;
	}


	public void setRs_tel(String rs_tel) {
		this.rs_tel = rs_tel;
	}


	public String getRs_regdate() {
		return rs_regdate;
	}


	public void setRs_regdate(String rs_regdate) {
		this.rs_regdate = rs_regdate;
	}


	public String getRs_text() {
		return rs_text;
	}


	public void setRs_text(String rs_text) {
		this.rs_text = rs_text;
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


	public int getHr_no() {
		return hr_no;
	}


	public void setHr_no(int hr_no) {
		this.hr_no = hr_no;
	}
	
	public String getH_name() {
		return h_name;
	}


	public void setH_name(String h_name) {
		this.h_name = h_name;
	}


	public int getHr_price() {
		return hr_price;
	}


	public void setHr_price(int hr_price) {
		this.hr_price = hr_price;
	}


	public String getType() {
		return type;
	}


	public void setType(String type) {
		this.type = type;
	}


	public String getMb_name() {
		return mb_name;
	}


	public void setMb_name(String mb_name) {
		this.mb_name = mb_name;
	}


	public String getMb_tel() {
		return mb_tel;
	}

	
	public void setMb_tel(String mb_tel) {
		this.mb_tel = mb_tel;
	}
}
