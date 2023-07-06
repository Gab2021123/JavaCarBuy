package util;

import java.sql.Connection;
import java.sql.DriverManager;

public class MysqlConectar {
	
	public static Connection getConnection() {
		Connection cn=null;
		String Driver="com.mysql.cj.jdbc.Driver";
		String URL="jdbc:mysql://localhost:3307/proyecto?useTimezone=true&serverTimezone=UTC";
		String Usuario="root";
		String Clave="Acceso_2012";
		try {
			Class.forName(Driver);
			cn=DriverManager.getConnection(URL, Usuario, Clave);
			
		} catch (Exception e) {
			System.out.print("ERROR :"+e.getMessage());
		}
		return cn;
	}


}
