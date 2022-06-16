package bean;


import java.util.Date;

public class LichSuMuabean {
	private String maHoaDon;
	private String tenSp;
	private int slmua;
	private long gia;
	private Date ngaymua;
	private int trangthai;
	public LichSuMuabean() {
		super();
		// TODO Auto-generated constructor stub
	}
	public LichSuMuabean(String maHoaDon, String tenSp, int slmua, long gia,Date ngaymua, int trangthai) {
		super();
		this.maHoaDon = maHoaDon;
		this.tenSp = tenSp;
		this.slmua = slmua;
		this.gia = gia;
		this.ngaymua = ngaymua;
		this.trangthai = trangthai;
	}
	public String getMaHoaDon() {
		return maHoaDon;
	}
	public void setMaHoaDon(String maHoaDon) {
		this.maHoaDon = maHoaDon;
	}
	public String getTenSp() {
		return tenSp;
	}
	public void setTenSp(String tenSp) {
		this.tenSp = tenSp;
	}
	public int getSlmua() {
		return slmua;
	}
	public void setSlmua(int slmua) {
		this.slmua = slmua;
	}
	public long getGia() {
		return gia;
	}
	public void setGia(long gia) {
		this.gia = gia;
	}
	public Date getNgaymua() {
		return ngaymua;
	}
	public void setNgaymua(Date ngaymua) {
		this.ngaymua = ngaymua;
	}
	public int getTrangthai() {
		return trangthai;
	}
	public void setTrangthai(int trangthai) {
		this.trangthai = trangthai;
	}
}

