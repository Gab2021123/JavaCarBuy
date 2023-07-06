package Implementacion;


import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

import java.util.List;

import beans.Carrito;

import beans.Compra;

import interfaces.CRUD;
import interfaces.CompraDAO;
import util.MysqlConectar;

public class CompraDaoImpl implements CRUD<Compra>,CompraDAO {
	Connection con=null;
	Statement cmd;
	PreparedStatement ps;
	ResultSet rs=null;
	int r=0;
	@Override
	public List<Compra> listar() {
		
		return null;
	}

	@Override
	public Compra ver(int id) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public int agregar(Compra t) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public int actulizar(Compra t) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public int eliminar(int id) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public int GenerarCompra(Compra compra) {
		int idcompras;
		String sql="insert into compra(idCLi,idpag,fecCompra,monto,estado) values(?,?,?,?,?)";
		try {
			con=MysqlConectar.getConnection();
			ps=con.prepareStatement(sql);
			ps.setInt(1, compra.getCliente().getIdCliente());
			ps.setInt(2, compra.getIdPago());
			ps.setString(3, compra.getFechaVenta());
			ps.setDouble(4, compra.getMontoTotal());
			ps.setString(5, compra.getEstado());
			r=ps.executeUpdate();
			
			sql="Select @@IDENTITY AS idcomp";
			rs=ps.executeQuery(sql);
			
			rs.next();
			idcompras=rs.getInt("idcomp");
			rs.close();
			for(Carrito detalle : compra.getDetallecompras()) {
				sql="insert into detalle(idproducto,idcomp,cant,precio_comp) values(?,?,?,?)";
				ps=con.prepareStatement(sql);
				ps.setInt(1, detalle.getIdProducto());
				ps.setInt(2,idcompras);
				ps.setInt(3, detalle.getCantidad());
				ps.setDouble(4, detalle.getPrecioCompra());
				r=ps.executeUpdate();
				
			}
		} catch (Exception e) {
			System.out.println("ERROR :"+e.getMessage());
		}
		return r;
	}

	@Override
	public String Estado(Compra compra) {
		String sql="select estado from compra";
		try {
			con=MysqlConectar.getConnection();
			cmd=con.createStatement();
			rs=cmd.executeQuery(sql);
			int res=0;
			if(res==1) {
				rs.getString("estado");
				if(rs.next()) {
					compra.setEstado("Comprado");
				}
				else {
					compra.setEstado("En Proceso");
				}
			}else {
				return null;
			}
			
			
		} catch (SQLException e) {
		System.out.println("ERROR:"+e.getMessage());
		}
		
		return null;
	}

}
