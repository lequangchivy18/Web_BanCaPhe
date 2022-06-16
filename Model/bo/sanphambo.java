package bo;

import java.util.ArrayList;

import bean.lopsanpham;
import dao.sanphamdao;



public class sanphambo {
	sanphamdao sdao = new sanphamdao();
	 public ArrayList<lopsanpham> getsp() throws Exception{
		 return sdao.getsp();
	 	}
	  public ArrayList<lopsanpham> Timloai(ArrayList<lopsanpham> ds, String maloai) throws Exception{
	    	ArrayList<lopsanpham> tam= new ArrayList<lopsanpham>();
	    	for(lopsanpham sach: ds)
	    		if(sach.getMaloai().equals(maloai))
	    			tam.add(sach);
	    	return tam;
	 	
	    }
	  public ArrayList<lopsanpham> Tim (ArrayList<lopsanpham> ds, String key) throws Exception{
	    	ArrayList<lopsanpham> tam= new ArrayList<lopsanpham>();
	    	for(lopsanpham sach: ds)
	    		if(sach.getTensp().toLowerCase().contains(key.toLowerCase()))
	    			tam.add(sach);
	    	return tam;
	 	
	    }
	  public int DemLoai (ArrayList<lopsanpham> ds, String maloai) throws Exception{
		  int d=0;
	    	 for(lopsanpham s: ds)
	    		 if(s.getMaloai().equals(maloai))
	    			d++;
	    	 return d;
	  }
}
