package dao;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

import bean.lopsanpham;

public class sanphamdao {
	public ArrayList<lopsanpham> getsp() throws Exception{
		ArrayList<lopsanpham> ds= new ArrayList<lopsanpham>();
		//b1: ket noi
		DungChung dc = new DungChung();
		dc.KetNoi();
		//b2: Lay du lieu ve
		//B2: Lay du lieu ve
    	String sql="Select * from sanpham";
    	PreparedStatement cmd= dc.cn.prepareStatement(sql);
    	ResultSet rs= cmd.executeQuery();
    	//b3: Duyet qua cac du lieu lay ve de luu vao 1 mang
    	while(rs.next()) {
    		String masp=rs.getString("masp");
    		String tensp=rs.getString("tensp");
    		Long gia=rs.getLong("gia");
    		String anh= rs.getString("anh");
    		String maloai= rs.getString("maloai");
    		ds.add(new lopsanpham(masp, tensp, gia, anh, maloai));
    	}
    	//Dong ket noi
    	rs.close();
    	dc.cn.close();
   	 return ds;
	}
}
