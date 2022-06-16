package bean;

public class loploai {
	private String maloai;
	private String tenloai;
	public loploai() {
		super();
		// TODO Auto-generated constructor stub
	}
	
	public loploai(String maloai, String tenloai) {
		super();
		this.maloai = maloai;
		this.tenloai = tenloai;
	}
	
	public String getMaloai() {
		return maloai;
	}
	public void setMaloai(String maloai) {
		this.maloai = maloai;
	}
	public String getTenloai() {
		return tenloai;
	}
	public void setTenloai(String tenloai) {
		this.tenloai = tenloai;
	}
}
