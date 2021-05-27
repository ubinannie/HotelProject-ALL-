package reservation;

public class HotelInfoVO {
	private int hr_no;
	private String hr_name;
	private String hr_picpath;
	private String hr_picName;
	private String hr_type;
	private int hr_Maxppl;
	private int hr_price;
	private int h_no;
	
	public HotelInfoVO() {}

	public HotelInfoVO(int hr_no, String hr_name, String hr_picpath, String hr_picName, String hr_type, int hr_Maxppl,
			int hr_price, int h_no) {
		super();
		this.hr_no = hr_no;
		this.hr_name = hr_name;
		this.hr_picpath = hr_picpath;
		this.hr_picName = hr_picName;
		this.hr_type = hr_type;
		this.hr_Maxppl = hr_Maxppl;
		this.hr_price = hr_price;
		this.h_no = h_no;
	}


	public int getHr_no() {
		return hr_no;
	}

	public void setHr_no(int hr_no) {
		this.hr_no = hr_no;
	}

	public String getHr_picpath() {
		return hr_picpath;
	}
	
	
	public void setHr_picpath(String hr_picpath) {
		this.hr_picpath = hr_picpath;
	}

	public String getHr_name() {
		return hr_name;
	}

	public void setHr_name(String hr_name) {
		this.hr_name = hr_name;
	}

	public String getHr_picName() {
		return hr_picName;
	}

	public void setHr_picName(String hr_picName) {
		this.hr_picName = hr_picName;
	}

	public String getHr_type() {
		return hr_type;
	}

	public void setHr_type(String hr_type) {
		this.hr_type = hr_type;
	}

	public int getHr_Maxppl() {
		return hr_Maxppl;
	}

	public void setHr_Maxppl(int hr_Maxppl) {
		this.hr_Maxppl = hr_Maxppl;
	}

	public int getHr_price() {
		return hr_price;
	}

	public void setHr_price(int hr_price) {
		this.hr_price = hr_price;
	}

	public int getH_no() {
		return h_no;
	}

	public void setH_no(int h_no) {
		this.h_no = h_no;
	}
	
	
}


