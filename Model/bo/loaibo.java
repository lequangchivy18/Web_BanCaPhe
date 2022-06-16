package bo;

import java.util.ArrayList;

import bean.loploai;
import dao.loaidao;

public class loaibo {
	loaidao ldao=new loaidao();
	public ArrayList<loploai> getloai() throws Exception {
		return ldao.getloai();
	}
}
