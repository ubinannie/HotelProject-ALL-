package payment;

public class PaymentVO {
	private int p_num;
	private String p_name;
	private String p_tel;
	private String p_date;
	
	public PaymentVO() {
		System.out.println("PaymentVO 생성자 호출");
	}

	public PaymentVO(int p_num, String p_name, String p_tel, String p_date) {
		super();
		this.p_num = p_num;
		this.p_name = p_name;
		this.p_tel = p_tel;
		this.p_date = p_date;
	}

	public int getP_num() {
		return p_num;
	}

	public void setP_num(int p_num) {
		this.p_num = p_num;
	}

	public String getP_name() {
		return p_name;
	}

	public void setP_name(String p_name) {
		this.p_name = p_name;
	}

	public String getP_tel() {
		return p_tel;
	}

	public void setP_tel(String p_tel) {
		this.p_tel = p_tel;
	}

	public String getP_date() {
		return p_date;
	}

	public void setP_date(String p_date) {
		this.p_date = p_date;
	}



	
	
}
