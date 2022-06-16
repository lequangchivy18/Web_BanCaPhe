package bean;

public class Khachhangbean {
	private int makh;
	private String hoten;
	private String sodt;
	private String email;
	private String tendn;
	private String diachi;
	private String matkhau;
	
	public Khachhangbean() {
		super();
		// TODO Auto-generated constructor stub
	}
	
	public Khachhangbean(int makh, String hoten,String sodt,String email,String tendn, String diachi, String matkhau) {
		super();
		this.makh = makh;
		this.hoten = hoten;
		this.diachi = diachi;
		this.sodt = sodt;
		this.email = email;
		this.tendn = tendn;
		this.matkhau = matkhau;
	}

	public int getMakh() {
		return makh;
	}
	public void setMakh(int makh) {
		this.makh = makh;
	}
	public String getHoten() {
		return hoten;
	}
	public void setHoten(String hoten) {
		this.hoten = hoten;
	}
	public String getDiachi() {
		return diachi;
	}
	public void setDiachi(String diachi) {
		this.diachi = diachi;
	}
	public String getMatkhau() {
		return matkhau;
	}
	public void setMatkhau(String matkhau) {
		this.matkhau = matkhau;
	}

	public String getSodt() {
		return sodt;
	}

	public void setSodt(String sodt) {
		this.sodt = sodt;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public String getTendn() {
		return tendn;
	}

	public void setTendn(String tendn) {
		this.tendn = tendn;
	}

}
