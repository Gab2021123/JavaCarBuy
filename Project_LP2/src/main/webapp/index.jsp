<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.ArrayList" %>
<%@ page import="beans.Producto" %>
<%@ page import="beans.Categorias" %>
<%@ page import="Implementacion.ProductoDAOImpl" %>

<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">

<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1.0">

	<link rel="stylesheet" href="./css/style.css">
	<title>Insert title here</title>
	<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-KK94CHFLLe+nY2dmCWGMq91rCGa5gtU4mk92HdvYe+M/SXH301p5ILy+dN9+nJOZ" crossorigin="Gab_203"> 
	<link href='https://unpkg.com/boxicons@2.1.4/css/boxicons.min.css' rel='stylesheet'>
	<link rel="stylesheet" href="./css/slider.css">
	<link rel="stylesheet" href="./css/carBoxSlider.css">
	<link rel="stylesheet" href="./css/modal.css">
	<link rel="stylesheet"href="https://cdn.jsdelivr.net/npm/swiper@9/swiper-bundle.min.css"/>
</head>
	
	<%
	ProductoDAOImpl pdao=new ProductoDAOImpl();
    ArrayList<Producto> Lista = new ArrayList<Producto>();
    Lista = pdao.listar();
    HttpSession MiSesion = request.getSession();
	
	%>
	
<body style="   height: 100%;
    margin: 0;
    padding: 0;
  	overflow: hidden;">

		<div class="d-flex justify-content-between align-items-center menu ">
				
			<i id="btn-Menu" class='bx bx-menu bx-sm btn-Menu'></i>

			<ul class="nav nav-menu d-flex ">
				<li><a href="Controlador?accion=ListarProducto">Inicio</a></li>
				<li class="sub-menu">
					<a href="#modelos">Modelos</a>
					<ul>
						<li><a href="Controlador?accion=">Smartphones</a></li>
						<li><a href="Controlador?accion=">Tablets</a></li>
						<li><a href="Controlador?accion=">Monitores</a></li>
						<li><a href="Controlador?accion=">Accesorios</a></li>
					</ul>
				
				</li>
				<li><a href="#">Preguntas frecuentes?</a></li>
				
				
			</ul>
		</div>

		<div class="menu_ubication" id="menu-left">
			<ul class="menu-left" id="menu_left_list">
				<li><i class='bx bxs-cart-alt bx-lg' id="icon_menu"></i><a class="" id="enlace_menu" href="Controlador?accion=Carrito">(<label>${contador}</label>)Ver Carrito</a></li>
				<li><i class='bx bxs-cart-add bx-lg' id="icon_menu"></i><a class="" id="enlace_menu" href="Controlador?accion=listarCompras">Ver Compras</a></li>
				<li><i class='bx bxs-user bx-lg' id="icon_menu"></i><a class="" id="enlace_menu" href="Controlador?accion=ListarClientes">Ver Clientes</a></li>
			</ul>

		</div>    

		

		

<div class="main" id="main">

	<div class="" id="content">
	

				<div class="slider-container">
					
					<div class="slider_images" id="slider">
				
						<div class="slider_section"><img src="imgSlider/slidder1.png" alt=''></div>
						<div class="slider_section"><img src="imgSlider/slidder2.png" alt=""></div>
						<div class="slider_section"><img src="imgSlider/slidder3.png" alt=""></div>
						<div class="slider_section"><img src="imgSlider/slidder4.png" alt=""></div>
						<div class="slider_section"><img src="imgSlider/slidder5.png" alt=""></div>
						<div class="slider_section"><img src="imgSlider/slidder6.png" alt=""></div>
						<div class="slider_section"><img src="imgSlider/slidder7.png" alt=""></div>
				
						<div class="btnLeft"><i class='bx bx-left-arrow bx-md ' id="arrowLeft"></i></div>
						<div class="btnRight"><i class='bx bx-right-arrow bx-md ' id="arrowRight"></i></div>
						
					</div>

				</div>
				
	</div>


	<div class="section" id="section">

						
	

<%for(Producto p:Lista){
					        String imagen_modal="<img class='modal_img' src=img/"+p.getFoto()+">" ;
					        String titulo=p.getNom();
					        int id=p.getIdProducto();
					        
					        
 %>	
		<div class="modal_section" id="<%=id%>">

	
			<div class="modal-container" id="modal-container">
			
				<div class="descp_container">
					<%=imagen_modal %>
					<div class="options_modal">
						<div class="parrafos_modal">
							<h3><%=titulo %></h3>
						</div>
						<div class="d-flex button">
						<a href="Controlador?accion=Comprar&id=<%=id %>" class="btn btn-primary buy" >Comprar</a> 
						<a href="Controlador?accion=AgregarCarrito&id=<%=id %>" class="btn btn-success add" >Agregar carrito</a>
						</div>
					</div>
					 </div>

					
					<a class="modal_close" href="Controlador?accion=cancelarCompra">Cancelar Compra</a>
				</div>
			</div> 

		</div> 
	<%} %>
	
		
	
		<div class="swiper card_slider">
			<div class="swiper-wrapper d-flex justify-content-center align-items-center">
<%
	for(Producto p:Lista){
		String imagen="<img class='card-img' src=./img/"+
                p.getFoto()+">";
        String imagen_modal="<img class='modal_img' src=img/"+p.getFoto()+">" ;
        String nombre=p.getNom();
        String descripcion=p.getDescripcion();
  		int id=p.getIdProducto();
        String modalDisplay="<a class='modal_display' href="+"#"+id+ ">"+"Añadir al carrito"+"</a>";

		
	%>
			<div class="swiper-slide card-box">
						<div class="card">
								<div class="phone-card">
										<%=imagen %>
				
										<div class="phone-card_hover">
										
												<div id="saberMas">
													
														<%=modalDisplay %>
										
												</div>
										</div>
								</div>
		
			
									<span class="card-name"><%=nombre %></span>
								
									<p class="card-des"><%=descripcion %></p>
					
		
							</div>	
			
				
				</div>
		<%} %>
				
		
			</div>
		</div>
		
		<br><br><br><br><br><br>						

		<button class="btn btn-outline-primary" id="btn_display--car">Añadir lista de hijos</button>

		
</div>
<div id="car-buy" class="car_buy">Quiero comprar</div>
	</div>  
	


<script src="https://cdn.jsdelivr.net/npm/swiper@9/swiper-bundle.min.js"></script>
<script src="./js/swiper.js"></script>
<script src="./js/app.js"></script>
<script src="./js/slider.js"></script>
</body>

</html>