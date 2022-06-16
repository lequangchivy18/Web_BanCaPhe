package bean;

public class GioHangbean {
	private String masp;
    private String tensp;
    private Long gia;
    private Long sl;
    @SuppressWarnings("unused")
	private Long thanhtien;
	public GioHangbean(String masp, String tensp, Long gia, Long sl) {
		super();
		this.masp = masp;
		this.tensp = tensp;
		this.gia = gia;
		this.sl = sl;
		this.thanhtien= sl*gia;
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
	public Long getSl() {
		return sl;
	}
	public void setSl(Long sl) {
		this.sl = sl;
	}
	public Long getThanhtien() {
		return sl*gia;
	}
	public void setThanhtien(Long thanhtien) {
		this.thanhtien = thanhtien;
	}
    
}
 