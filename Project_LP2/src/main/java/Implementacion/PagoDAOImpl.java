package Implementacion;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.List;

import beans.Cliente;
import beans.Pago;
import interfaces.PagoDAO;
import util.MysqlConectar;

public class PagoDAOImpl implements PagoDAO {
	Connection con=null;
	Statement cmd;
	PreparedStatement ps;
	ResultSet rs=null;
	Cliente c;

	@Override
	public int listarId(List<Pago> p, int id) {
		try {
			String sql="select*from pago where id_pag="+id;
			con=MysqlConectar.getConnection();
			cmd=con.createStatement();
			rs=cmd.executeQuery(sql);
			while(rs.next()) {
				p.add(new Pago(
				rs.getInt("id_pag"),
				rs.getDouble("monto_pag")
				));
			}
			con.close();
			for(Pago pagos:p) {
				if(pagos.getIdPag()==id) {
					return id;
				}
			}
			
		} catch (Exception e) {
			System.out.print("ERROR: "+e.getMessage());
		}
		return 0;
	}

}
