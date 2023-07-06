package Implementacion;

import java.sql.Connection;
import java.util.ArrayList;
import java.util.List;
import java.sql.Statement;
import java.sql.ResultSet;



import beans.Producto;
import interfaces.CRUD;
import interfaces.ProductoDAO;
import util.MysqlConectar;
public class ProductoDAOImpl implements CRUD<Producto> ,ProductoDAO{
	Connection cn=null;
	Statement cmd;
	ResultSet rs;
	@Override
	public ArrayList<Producto> listar() {
		ArrayList<Producto>miLista=new ArrayList<Producto>();
		String SQL="call ListarProducto()";
		try {
			cn=MysqlConectar.getConnection();
			cmd=cn.createStatement();
			rs=cmd.executeQuery(SQL);
			while(rs.next()) {
				 miLista.add(new Producto(
					rs.getInt("idproducto"),
					rs.getString("nom"),
					rs.getString("IdCategoria"),
					rs.getString("foto"),
					rs.getString("descp"),
					rs.getDouble("precio"),
					rs.getInt("stock"),
					rs.getString("estado")
						));
			}
			cn.close();
		} catch (Exception e) {
		System.out.print("ERROR :"+e.getMessage());
		}
		
		return miLista;
	}
	

	@Override
	public Producto listarId(int id) {
		String sql="select*from producto where idproducto="+id;
		Producto p=new Producto();
		try {
			cn=MysqlConectar.getConnection();
			cmd=cn.createStatement();
			rs=cmd.executeQuery(sql);
			while(rs.next()) {
				p.setIdProducto(rs.getInt(1));
				p.setNom(rs.getString(2));
				p.setIdcategoria(rs.getString(3));
				p.setFoto(rs.getString(4));
				p.setDescripcion(rs.getString(5));
				p.setPrecio(rs.getDouble(6));
				p.setStock(rs.getInt(7));
				p.setEstado(rs.getString(8)+" ");
			}
		} catch (Exception e) {
			// TODO: handle exception
		}
		return p;
	}



	@Override
	public Producto ver(int id) {
		
		return null;
	}

	@Override
	public int agregar(Producto t) {
		// TODO Auto-generated method stub
	return 0;
	}

	@Override
	public int actulizar(Producto t) {
		// TODO Auto-generated method stub
	return 0;
	}

	@Override
	public int eliminar(int id) {
		// TODO Auto-generated method stub
	return 0;
	}


	@Override
	public List<Producto> listarxcategoria(String idCategoria) {
		ArrayList<Producto> miLista =new ArrayList<>();
		
		
		return null;
	}








}
