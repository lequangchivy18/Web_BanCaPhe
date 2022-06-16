package bo;

import java.util.ArrayList;

import bean.LichSuMuabean;
import dao.LichSuMuadao;

public class LichSuMuaBo {
	LichSuMuadao lsudao = new LichSuMuadao();
	public ArrayList<LichSuMuabean> getLs(int makhach) throws Exception {
		return lsudao.getls(makhach);
	}
}
