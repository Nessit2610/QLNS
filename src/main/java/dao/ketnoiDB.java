package dao;

import java.sql.Connection;
import java.sql.DriverManager;

public class ketnoiDB {
	public static Connection cn;
	public void ketnoi() throws Exception {
		Class.forName("com.microsoft.sqlserver.jdbc.SQLServerDriver");
		String url ="jdbc:sqlserver://NESSIT\\SQLEXPRESS:1433;databaseName=QLNS; user=sa; password=123";
		cn = DriverManager.getConnection(url);
		System.out.println("Da Ket Noi");
	}
}
