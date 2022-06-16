package dao;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.Date;

import bean.LichSuMuabean;

public class LichSuMuadao {
	public ArrayList<LichSuMuabean> getls(int makhach) throws Exception {
		ArrayList<LichSuMuabean> list = new ArrayList<LichSuMuabean>();
		// b1: ket noi
		DungChung dc = new DungChung();
		dc.KetNoi();
		// B2: Lay du lieu ve
		String sql = "SELECT * \r\n" + "FROM hoadon as hd \r\n"
				+ "		join ChiTietHoaDon as ct on hd.MaHoaDon=ct.MaHoaDon\r\n"
				+ "		join sanpham as s on ct.MaSanPham=s.masp			\r\n" 
				+ "			WHERE hd.makh =?		";
		PreparedStatement cmd = dc.cn.prepareStatement(sql);
		cmd.setInt(1, makhach);

		ResultSet rs = cmd.executeQuery();

		while (rs.next()) {
			String maHoaDon = rs.getString("MaHoaDon");
			String tensp = rs.getString("tensp");
			int slmua = rs.getInt("SoLuongMua");
			Long gia = rs.getLong("gia");
			Date ngaymua = rs.getDate("NgayMua");
			int trangthai = rs.getInt("damua");
			list.add(new LichSuMuabean(maHoaDon,tensp,slmua,gia,ngaymua,trangthai));
		}
		rs.close();
		dc.cn.close();
		return list;
	}
}
