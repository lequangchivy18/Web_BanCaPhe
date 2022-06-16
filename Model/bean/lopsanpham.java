package bean;

public class lopsanpham {
	private String masp;
	private String tensp;
    private Long gia;
    private String anh;
    private String maloai;
    public lopsanpham() {
		super();
		// TODO Auto-generated constructor stub
	}
    
    public lopsanpham(String masp, String tensp, Long gia, String anh, String maloai) {
		super();
		this.masp = masp;
		this.tensp = tensp;
		this.gia = gia;
		this.anh = anh;
		this.maloai = maloai;
	}
    
    public String getMasp() {
		return masp;
	}
	public void setMasp(String masp) {
		this.masp = masp;
	}
	public String getTensp() {
		return tensp;
	}
	public void setTensp(String tensp) {
		this.tensp = tensp;
	}
	public Long getGia() {
		return gia;
	}
	public void setGia(Long gia) {
		this.gia = gia;
	}
	public String getAnh() {
		return anh;
	}
	public void setAnh(String anh) {
		this.anh = anh;
	}
	public String getMaloai() {
		return maloai;
	}
	public void setMaloai(String maloai) {
		this.maloai = maloai;
	}
}
