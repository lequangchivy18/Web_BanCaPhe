package dao;

import java.sql.Connection;
import java.sql.DriverManager;

public class DungChung {
	public Connection cn;
	public void KetNoi() throws Exception{
		//B1 Xac dinh hqtcsdl
		Class.forName("com.microsoft.sqlserver.jdbc.SQLServerDriver");
		//DESKTOP-0T8INK9
		cn= DriverManager.getConnection("jdbc:sqlserver://DESKTOP-FAG8TFG:1433;databaseName=QlCoffee;user=sa; password=123");
        System.out.println("Da ket noi");
	}
}
