package dao;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import bean.Khachhangbean;

public class Khachhangdao {
	public Khachhangbean getkh(String un, String pass) throws Exception {
		
		DungChung dc = new DungChung();
		dc.KetNoi();
		// b2:Láº¥y dá»¯ liá»‡u vá»�
		String sql = "Select * from KhachHang where tendn=? and pass=?";
		PreparedStatement cmd = dc.cn.prepareStatement(sql);
		// Truyá»�n 01 tham sá»‘:un,pass vÃ o cmd
		cmd.setString(1, un);
		cmd.setString(2, pass);
		ResultSet rs = cmd.executeQuery();
		if (rs.next() == false)
			return null;
		else {
			int makh = rs.getInt("makh");
			String hoten = rs.getString("hoten");
			String diachi = rs.getString("diachi");
			String sodt = rs.getString("sodt");
			String email = rs.getString("email");
			String tendn = rs.getString("tendn");
			String matkhau = rs.getString("pass");
			Khachhangbean kh = new Khachhangbean(makh, hoten, diachi, sodt, email, tendn, matkhau);
			return kh;
		}
	}

	public int them(String hoten, String diachi, String sodt, String email, String tendn, String pass)
			throws Exception {
		// káº¿t ná»‘i
		DungChung dc = new DungChung();
		dc.KetNoi();
		// tao cau lenh sql
		String sql = "insert into KhachHang(hoten, diachi, sodt, email, tendn, pass) values (?,?,?,?,?,?)";
		// tao ra Preparedstatement
		PreparedStatement cmd = dc.cn.prepareStatement(sql);
		// truyen tham so (neu co)
		cmd.setString(1, hoten);
		cmd.setString(2, diachi);
		cmd.setString(3, sodt);
		cmd.setString(4, email);
		cmd.setString(5, tendn);
		cmd.setString(6, pass);
		// thuc hien cau lenh
		return cmd.executeUpdate();
	}

	public int themDonhang(int makh, int damua) throws Exception {
		// káº¿t ná»‘i
		DungChung dc = new DungChung();
		dc.KetNoi();
		// tao cau lenh sql
		String sql = "insert into hoadon(makh,NgayMua,damua) values (?,GETDATE(),?)";
		// tao ra Preparedstatement
		PreparedStatement cmd = dc.cn.prepareStatement(sql);
		// truyen tham so (neu co)
		cmd.setInt(1, makh);
		cmd.setInt(2, 0);

		return cmd.executeUpdate();
	}

	public int themchitietDonhang(int makh, String Masp, long SoLuongMua, int damua) throws Exception {
		
		DungChung dc = new DungChung();
		dc.KetNoi();
		// tao cau lenh sql
		String sql = "insert into ChiTietHoaDon(MaSanPham,SoLuongMua,MaHoaDon,damua) values (?,?,?,?)";
		// tao ra Preparedstatement
		PreparedStatement cmd = dc.cn.prepareStatement(sql);
		// truyen tham so (neu co)
		cmd.setString(1, Masp);
		cmd.setLong(2, SoLuongMua);
		cmd.setInt(3, this.getMaHoaDon(makh));
		cmd.setInt(4, 0);
		
		// thuc hien cau lenh
		return cmd.executeUpdate();
	}

	public int getMaHoaDon(int makh) throws Exception {
		
		DungChung dc = new DungChung();
		dc.KetNoi();
		
		String sql = "SELECT TOP 1 hd.MaHoaDon AS mahoadon\r\n" + "FROM hoadon AS hd\r\n" + "where hd.makh=?\r\n"
				+ "ORDER BY mahoadon DESC";
		PreparedStatement cmd = dc.cn.prepareStatement(sql);
		cmd.setInt(1, makh);

		ResultSet rs = cmd.executeQuery();
		if (rs.next() == false)
			return 0;
		else {
			int MaHoaDon1 = rs.getInt("MaHoaDon");
			return MaHoaDon1;
		}
	}

	public Khachhangbean getTendn(String tendn) throws Exception {
		// b1:
		DungChung dc = new DungChung();
		dc.KetNoi();
		
		String sql = "Select * from KhachHang where tendn=?";
		PreparedStatement cmd = dc.cn.prepareStatement(sql);
		cmd.setString(1, tendn);
		ResultSet rs = cmd.executeQuery();
		while (rs.next()) {
			return new Khachhangbean(rs.getInt(1), rs.getString(2), rs.getString(3), rs.getString(4), rs.getString(5),
					rs.getString(6), rs.getString(7));
		}
		return null;
	}
}
