package bo;

import bean.Khachhangbean;
import dao.Khachhangdao;

public class Khachhangbo {
	Khachhangdao khdao = new Khachhangdao();
	
	public Khachhangbean ktdn(String makh,String matkhau) throws Exception {
			return khdao.getkh(makh, matkhau);	
		}
	public int them( String hoten, String diachi, String sdt, String email, String tendn, String pass) throws Exception{
		return khdao.them(hoten, diachi, sdt, email, tendn, pass);		
	}
	public Khachhangbean ktdk(String tendn) throws Exception {
		return khdao.getTendn(tendn);	
	}
	public int themDonhang(int makh,int damua ) throws Exception {
		return khdao.themDonhang(makh, damua);
	}
	public int themchitietDonhang(int makh, String Masp, long SoLuongMua, int damua) throws Exception{
		return khdao.themchitietDonhang(makh,Masp, SoLuongMua, damua);
	}
	public int getMaHoaDon(int makh) throws Exception {
		return khdao.getMaHoaDon(makh);
	}
}
