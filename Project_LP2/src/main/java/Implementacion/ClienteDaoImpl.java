package Implementacion;
import java.util.ArrayList;
import java.util.List;

import beans.Cliente;
import interfaces.CRUD;
import interfaces.ClienteDAO;
import util.MysqlConectar;


import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.Statement;

import java.sql.ResultSet;
import java.sql.SQLException;
public class ClienteDaoImpl implements CRUD<Cliente>,ClienteDAO {
	Connection con=null;
	Statement cmd;
	PreparedStatement ps;
	ResultSet rs=null;
	Cliente c;

	
	//Metodo constructo vacio para listar la clase vacia
	public ClienteDaoImpl() {
		// TODO Auto-generated constructor stub
	}
	@Override
	public ArrayList<Cliente> listar() {
		ArrayList<Cliente> milista=new ArrayList<>();
		String sql="select*from cliente";		
		try {
			con=MysqlConectar.getConnection();
			cmd=con.createStatement();
			rs=cmd.executeQuery(sql);
			while(rs.next()) {
				milista.add(new Cliente(
						rs.getInt("idCli"),
						rs.getString("dniCli"),
						rs.getString("nomCli"),
						rs.getString("dirCli"),
						rs.getString("emailCli"),
						rs.getString("password")
						));
			}
			con.close();
		} catch (Exception e) {
		System.out.print("ERORR :"+e.getMessage());
		}
		
		
		return milista;
	
	}



	@Override
	public int agregar(Cliente t) {
		int rs=0;
		String sql="call insertarCliente(?,?,?,?,?,?)";
		try {
			con=MysqlConectar.getConnection();
			
			PreparedStatement ps=con.prepareStatement(sql);
		

			ps.setInt(1, t.getIdCliente());
			ps.setString(2, t.getDniCliente()+" ");
			ps.setString(3, t.getNomCliente());
			ps.setString(4, t.getDirCliente());
			ps.setString(5, t.getEmailCliente());
			ps.setString(6,t.getPassword());
			
	
			rs=ps.executeUpdate();
		} catch (SQLException e) {
			System.out.print("ERROR:"+e.getMessage());
		}
	return rs;
	}

	@Override
	public int actulizar(Cliente t) {
		// TODO Auto-generated method stub
		return 0;
	}
	
	
	
	@Override
	public Cliente ver(int id) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public int eliminar(int id) {
	
	return 0;
	}
	@Override
	public Cliente listarID(List<Cliente> clientes, int id) {
		try {
			String sql="select*from cliente where idCli="+id;
			con=MysqlConectar.getConnection();
			cmd=con.createStatement();
			rs=cmd.executeQuery(sql);
			while(rs.next()) {
				clientes.add(new Cliente(
					rs.getInt("idCli"),
					rs.getString("dniCLi"),
					rs.getString("nomCli"),
					rs.getString("dirCli"),
					rs.getString("emailCli"),
					rs.getString("password")
				));
			}
			con.close();
			for(Cliente c:clientes) {
				if(c.getIdCliente()==id) {
					return c;
				}
			}
			
		} catch (Exception e) {
			System.out.println("ERROR :"+e.getMessage());
		}
		return null;
	}

	





	
}
