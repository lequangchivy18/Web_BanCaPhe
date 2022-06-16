package bo;

import java.util.ArrayList;

import bean.GioHangbean;

public class GioHangbo {
	public ArrayList<GioHangbean> ds= new ArrayList<GioHangbean>();
	public void Them(String masp, String tensp, Long gia, Long slmua) {
		//Kiem tra xem sach nay da co chua, neu co thi tang soluong
		for(GioHangbean g: ds)
			  if(g.getMasp().equals(masp)) {
				  g.setSl(g.getSl()+slmua);
				  return;
			  }
		ds.add(new GioHangbean(masp, tensp, gia, slmua));
	}
	public void xoa(String masp) {
		for(GioHangbean g: ds)
			  if(g.getMasp().equals(masp)) {
				  ds.remove(g);break;
			  }
	}
	public Long TongTien() {
		long s=(long)0;
		for(GioHangbean g: ds)
			s+=g.getThanhtien();
		return s;
	}
	public int soMonHang(){
		return ds.size();
	}
	public void sua(String masp, long sl) {
		for(GioHangbean g: ds)
			  if(g.getMasp().equals(masp)) {
				  g.setSl(sl);
				  return;
			  }
	}
}