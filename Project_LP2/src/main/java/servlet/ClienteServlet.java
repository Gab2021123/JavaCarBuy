package servlet;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import Implementacion.ClienteDaoImpl;
import beans.Cliente;

/**
 * Servlet implementation class ClienteServlet
 */
@WebServlet("/ClienteServlet")
public class ClienteServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private ClienteDaoImpl cdao=new ClienteDaoImpl();
  
    public ClienteServlet() {
        super();
        // TODO Auto-generated constructor stub
    }
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.getWriter().append("Served at: ").append(request.getContextPath());
		RequestDispatcher dispatcher=request.getRequestDispatcher("register.jsp");
		dispatcher.forward(request, response);
	}
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		try {
			//Entrada de parametros
			
			String dni=request.getParameter("txtdni");
			String nombre=request.getParameter("txtnom");
			String direccion=request.getParameter("txtdir");
			String email=request.getParameter("txtemail");
			String pass=request.getParameter("txtpass");
			
			Cliente c=new Cliente();
		
			c.setDniCliente(dni);
			c.setNomCliente(nombre);
			c.setDirCliente(direccion);
			c.setEmailCliente(email);;
			c.setPassword(pass);
			
			cdao.agregar(c);
			
			RequestDispatcher dispatcher=request.getRequestDispatcher("login.jsp");
			dispatcher.forward(request, response);
		}catch(Exception e) {
			System.out.print("ERROR"+e.getMessage());
		}
		
		
		
	}

}
