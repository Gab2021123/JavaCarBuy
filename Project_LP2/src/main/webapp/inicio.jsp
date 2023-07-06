<%@page import="beans.Categorias"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ page import="java.util.ArrayList" %>
<%@ page import="beans.Producto" %>
<%@ page import="Implementacion.ProductoDAOImpl" %>

<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
		<link rel="stylesheet" href="./css/style.css">
	<title>Insert title here</title>
	<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-KK94CHFLLe+nY2dmCWGMq91rCGa5gtU4mk92HdvYe+M/SXH301p5ILy+dN9+nJOZ" crossorigin="Gab_203"> 
	<link href='https://unpkg.com/boxicons@2.1.4/css/boxicons.min.css' rel='stylesheet'>
	<link rel="stylesheet" href="./css/slider.css">
	<link rel="stylesheet" href="./css/carBoxSlider.css">
	<link rel="stylesheet" href="./css/modal.css">
	<link rel="stylesheet"href="https://cdn.jsdelivr.net/npm/swiper@9/swiper-bundle.min.css"/>
  	 
  	 <script type="text/javascript" src="./js/inicio.js"></script>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>

<%
ProductoDAOImpl pdao=new ProductoDAOImpl();
ArrayList<Producto> Lista = new ArrayList<Producto>();
Lista = pdao.listar();
ArrayList<Categorias> ListadoCategorias=new ArrayList<Categorias>();
%>
<body class="" >
<div class="d-flex justify-content-between align-items-center menu ">
				<i id="btn-Menu" class='bx bx-menu bx-sm'></i>
				<ul class="nav nav-menu d-flex ">
					<li><a id="buttonInicio" href="Controlador?accion=ListarProducto">Inicio</a></li>
					<li class="sub-menu">
						<a href="#">Modelos</a>
						<ul>
							<li><a href="">Smartphones</a></li>
							<li><a href="">Tablets</a></li>
							<li><a href="">Televisores</a></li>
							<li><a href="">Tablets</a></li>
						</ul>
					</li>
					<li><a href="#">Preguntas frecuentes?</a></li>
				</ul>			
			</div>
			<div class="menu_ubication" id="menu-left">
			<ul class="menu-left" id="menu_left_list">
				<li><i class='bx bxs-cart-alt bx-lg' id="icon_menu"></i><a class="" id="enlace_menu" href="Controlador?accion=Carrito">(<label>${contador}</label>)Ver Carrito</a></li>
				<li><i class='bx bxs-cart-add bx-lg' id="icon_menu"></i><a class="" id="enlace_menu" href="Controlador?accion=listarCompras">Ver Compras</a></li>
				<li><i class='bx bxs-user bx-lg' id="icon_menu"></i><a class="" id="enlace_menu" href="Controlador?accion=listarClientes">Ver Clientes</a></li>
			</ul>
			</div>    
			
		<div class="content" id="content">
			<div class="section" id="section" style="display: grid;
    grid-template-columns: repeat(3,1fr); margin-left: 5rem;">
			
					<%
			for(Producto p:Lista){
				String imagen="<img class='card-img' src=./img/"+
		                p.getFoto()+">";
		         String nombre=p.getNom();
		         String descripcion=p.getDescripcion();
		         int id=p.getIdProducto();
                %>							
						<div class="card">
					            	<div class="phone-card">
					               		 <%=imagen %>					
						                    <div class="phone-card_hover">						                    
							                        <div id="saberMas">													
							                                <a href="Controlador?accion=AgregarCarrito&id=<%=id %>">Añadir al carrito</a>							                
							                        </div>
						                    </div>
					            	</div>
					
						
							            <span class="card-name"><%=nombre %></span>
							            
							            <p class="card-des"><%=descripcion %></p>
							            <div class="facebook-icon">
							                <a><i class='bx bxl-facebook bx-sm' ></i></a>
							            </div>
							            <div class="twitter-icon">
							                <a href=""><i class='bx bxl-twitter bx-sm' ></i></a>
							            </div>
					
					      </div>
						
						<%} %>
					
						</div>
				    </div>
			
			


<script src="./js/app.js"></script>

</body>

</html>


