package servlet;

import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;


import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.mysql.cj.jdbc.Driver;

import Implementacion.ClienteDaoImpl;
import Implementacion.CompraDaoImpl;
import Implementacion.PagoDAOImpl;
import Implementacion.ProductoDAOImpl;
import beans.Producto;
import beans.Carrito;
import beans.Cliente;
import beans.Compra;
import beans.Fecha;
import beans.Pago;


/**
 * Servlet implementation class login
 */
@WebServlet("/Controlador")
public class Controlador extends HttpServlet {
	private static final long serialVersionUID = 1L;
    
	   private static final String JDBC_DRIVER = "com.mysql.cj.jdbc.Driver";
	    private static final String DB_URL = "jdbc:mysql://localhost:3307/proyecto?useTimezone=true&serverTimezone=UTC";
	    private static final String USER = "root";
	    private static final String PASS = "Acceso_2012";
	
	//Cliente Implementacion
	Cliente c=new Cliente();
	ClienteDaoImpl cdao=new ClienteDaoImpl();
	//Prdocuto Implemetancion
	ProductoDAOImpl pdao=new ProductoDAOImpl();
	Producto p=new Producto();
	//Implementacion de pago
	Pago pago=new Pago();
	PagoDAOImpl pDAO=new PagoDAOImpl();
	//Compra Implementacion
	Compra compra=new Compra();
	CompraDaoImpl comDAO=new CompraDaoImpl();
	//Implementamos Lista de carrito
	List<Carrito> listaCarrito=new ArrayList<>();
	List<Producto>productos=new ArrayList<>();
	List<Cliente> clientes=new ArrayList<>();
	List<Pago> pagos=new ArrayList<>();
	
	
	//Variables para el carrito de compras
	int item;
	double totalPagar=0.0;
    int cantidad=1;
    
    
	public Controlador() {
    }

	/**
	 * @see HttpServlet#service(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
				String opc=request.getParameter("accion");
				//si no le paso la info al btn
				
				System.out.print("Opcion seleccionada es:"+opc+"\n");
				//evaluar la opcion
				switch(opc) {
				case "Entrar":loginService(request,response);break;
				case "ListarProducto":listarService(request,response);break;
				case "AgregarCarrito":addCarService(request,response);break;
				case "Carrito":carService(request,response);break;
				case "Comprar":buyService(request,response);break;
				case "GenerarCompra":generateBuy(request,response);break;
				case "ListarProductoXCategorias": listProductCategory(request,response);break;
				case "ListarClientes":listClients(request,response);break;
				case "DeleteProducto":delete(request,response);break;
				case "ActualizarCantidad": updateCantidad(request,response);break;
				case "DeleteCliente":deleteClient(request,response);break;
				default:
					request.getRequestDispatcher("index.jsp").forward(request, response);
				}
	}

	private void deleteClient(HttpServletRequest request, HttpServletResponse response)throws ServletException,IOException {
		int idCli=Integer.parseInt(request.getParameter("idCli"));
		clientes=cdao.listar();
		for(int i=0;i<clientes.size();i++) {
			if(clientes.get(i).getIdCliente()==idCli){
				clientes.remove(i);
			}
		}
	}

	private void updateCantidad(HttpServletRequest request, HttpServletResponse response) {
		int idpro=Integer.parseInt(request.getParameter("idp"));
		int cant =Integer.parseInt(request.getParameter("Cantidad"));
		
		for(int i=0;i<listaCarrito.size();i++) {
			if(listaCarrito.get(i).getIdProducto()==idpro) {
				listaCarrito.get(i).setCantidad(cant);
				double st=listaCarrito.get(i).getPrecioCompra()*cant;
				listaCarrito.get(i).setSubTotal(st);
			}
		}
		
	}

	private void delete(HttpServletRequest request, HttpServletResponse response) {
		int idproducto=Integer.parseInt(request.getParameter("idp"));
		for(int i=0;i<listaCarrito.size();i++) {
			if(listaCarrito.get(i).getIdProducto()==idproducto) {
				listaCarrito.remove(i);
			}
		}
		
	}

	private void listClients(HttpServletRequest request, HttpServletResponse response) {
			try {
				clientes=cdao.listar();
				request.setAttribute("clientes",clientes);
				request.getRequestDispatcher("cliente.jsp").forward(request, response);
			} catch (Exception e) {
				System.out.print("ERROR:"+e.getMessage());
			}
	}

	private void listProductCategory(HttpServletRequest request, HttpServletResponse response) {
		
	}

	private void generateBuy(HttpServletRequest request, HttpServletResponse response) throws ServletException,IOException{
		Cliente c=new Cliente();
		Pago p=new Pago();
		Compra com=new Compra();
		Cliente idEncontrado=cdao.listarID(clientes, 1);
		int idPagoEncontrado=pDAO.listarId(pagos, p.getIdPag());
		String estado=comDAO.Estado(com);
		Compra compra=new Compra(idEncontrado,idPagoEncontrado , Fecha.FechaBd(), totalPagar, estado, listaCarrito);
		int res=comDAO.GenerarCompra(compra);
		if(res!=0&&totalPagar>0) {
			request.getRequestDispatcher("mensaje.jsp").forward(request, response);
		}else {
			request.getRequestDispatcher("error.jsp").forward(request, response);
		}
	}

	private void buyService(HttpServletRequest request, HttpServletResponse response)throws ServletException, IOException {
		double totalPagar=0.0;
		int idp=Integer.parseInt(request.getParameter("id"));
		p=pdao.listarId(idp);
		item=item+1;
		Carrito car=new Carrito();
		car.setItem(item);
		car.setIdProducto(p.getIdProducto());
		car.setNombres(p.getNom());
		car.setDescripcion(p.getDescripcion());
		car.setPrecioCompra(p.getPrecio());
		car.setCantidad(cantidad);
		car.setSubTotal(cantidad*p.getPrecio());
		listaCarrito.add(car);
		for(int i=0;i<listaCarrito.size();i++) {
			totalPagar=totalPagar+listaCarrito.get(i).getSubTotal();
		}
		request.setAttribute("contador", listaCarrito.size());
		request.setAttribute("carrito", listaCarrito);
		request.setAttribute("totalPagar", totalPagar);
		request.getRequestDispatcher("carrito.jsp").forward(request, response);
	}

	private void carService(HttpServletRequest request, HttpServletResponse response)throws ServletException, IOException {
		double totalPagar=0.0;
		request.setAttribute("carrito", listaCarrito);
			for(int i=0;i<listaCarrito.size();i++) {
				totalPagar=totalPagar+listaCarrito.get(i).getSubTotal();
			}
		request.setAttribute("totalPagar", totalPagar);
		request.getRequestDispatcher("carrito.jsp").forward(request, response);
	}

	private void addCarService(HttpServletRequest request, HttpServletResponse response)throws ServletException, IOException {
			int pos=0;
			cantidad=1;
			int idp=Integer.parseInt(request.getParameter("id"));
			p=pdao.listarId(idp);
			if(listaCarrito.size()>0) {
				for(int i=0;i<listaCarrito.size();i++) {
					if(idp==listaCarrito.get(i).getIdProducto()) {
						pos=i;
					}					
				}
				if(idp==listaCarrito.get(pos).getIdProducto() ) {
					cantidad=listaCarrito.get(pos).getCantidad()+cantidad;
					double subtotal=listaCarrito.get(pos).getPrecioCompra()*cantidad;
					listaCarrito.get(pos).setCantidad(cantidad);
					listaCarrito.get(pos).setSubTotal(subtotal);
				}
				else {
					item=item+1;
					Carrito car=new Carrito();
					car.setItem(item);
					car.setIdProducto(p.getIdProducto());
					car.setNombres(p.getNom());
					car.setDescripcion(p.getDescripcion());
					car.setPrecioCompra(p.getPrecio());
					car.setCantidad(cantidad);
					car.setSubTotal(cantidad*p.getPrecio());
					listaCarrito.add(car);
				}
			}else {
				item=item+1;
				Carrito car=new Carrito();
				car.setItem(item);
				car.setIdProducto(p.getIdProducto());
				car.setNombres(p.getNom());
				car.setDescripcion(p.getDescripcion());
				car.setPrecioCompra(p.getPrecio());
				car.setCantidad(cantidad);
				car.setSubTotal(cantidad*p.getPrecio());
				listaCarrito.add(car);
			
			}
			request.setAttribute("contador", listaCarrito.size());
			request.getRequestDispatcher("index.jsp").forward(request, response);
	}

	private void listarService(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		try {
			productos=pdao.listar();
			request.setAttribute("productos", productos);
			request.getRequestDispatcher("inicio.jsp").forward(request, response);
		} catch (Exception e) {
			System.out.print("ERROR:"+e.getMessage());
		}
	}

	private void loginService(HttpServletRequest request, HttpServletResponse response)throws ServletException,IOException {
		System.out.print("Ingreso al service login"+"\n");		
		//entrada de datos;
		String user=request.getParameter("txtuser");
		String clave=request.getParameter("txtPass");
		  Connection conn = null;
	        PreparedStatement stmt = null;
	        ResultSet rs = null;
	
		try {
			   // Establecer conexión con la base de datos
            Class.forName(JDBC_DRIVER);
            conn = DriverManager.getConnection(DB_URL, USER, PASS);
            //validar los archivos
            String sql = "SELECT emailCli, password FROM Cliente WHERE emailCli = ? AND password = ?";
            stmt = conn.prepareStatement(sql);
            stmt.setString(1, user);
            stmt.setString(2, clave);
            rs = stmt.executeQuery();
            
            if (rs.next()) {
                // Inicio de sesión válido
                String emailCli = rs.getString("emailCli");
                String password = rs.getString("password");

                HttpSession session = request.getSession();
                session.setAttribute("username", user);
                session.setAttribute("emailCli", emailCli);
                session.setAttribute("password", password);

                response.sendRedirect("index.jsp");
            } else {
                // Credenciales inválidas
                response.sendRedirect("login.jsp");
            }
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		finally {
        // Cerrar la conexión y liberar los recursos
        try {
            if (rs != null) rs.close();
            if (stmt != null) stmt.close();
            if (conn != null) conn.close();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }
		
		
		System.out.print("El valor de c es:"+c);
	}

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.getWriter().append("Served at: ").append(request.getContextPath());
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	
	}
}
