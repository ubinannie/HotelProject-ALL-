package MiniHotel;

public class Member_Vo {

	private String id;
	private String pw;
	private String name;
	private String nickname;
	private String email;
	private String birth;
	private String tel;
	private String date;
	private String level;
	private String ok;
	
	public Member_Vo() {
		// TODO Auto-generated constructor stub
	}
	
	public Member_Vo(String id, String pw, String name, String nickname, String email, String birth, String tel) {
		super();
		this.id = id;
		this.pw = pw;
		this.name = name;
		this.nickname = nickname;
		this.email = email;
		this.birth = birth;
		this.tel = tel;
	}

	public Member_Vo(String id, String pw, String name, String nickname, String email, String birth, String tel,
			String date, String level, String ok) {
		super();
		this.id = id;
		this.pw = pw;
		this.name = name;
		this.nickname = nickname;
		this.email = email;
		this.birth = birth;
		this.tel = tel;
		this.date = date;
		this.level = level;
		this.ok = ok;
	}



	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}

	public String getPw() {
		return pw;
	}

	public void setPw(String pw) {
		this.pw = pw;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getNickname() {
		return nickname;
	}

	public void setNickname(String nickname) {
		this.nickname = nickname;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public String getBirth() {
		return birth;
	}

	public void setBirth(String birth) {
		this.birth = birth;
	}

	public String getTel() {
		return tel;
	}

	public void setTel(String tel) {
		this.tel = tel;
	}

	public String getDate() {
		return date;
	}

	public void setDate(String date) {
		this.date = date;
	}

	public String getLevel() {
		return level;
	}

	public void setLevel(String level) {
		this.level = level;
	}

	public String getOk() {
		return ok;
	}

	public void setOk(String ok) {
		this.ok = ok;
	}
	
	
	
}




