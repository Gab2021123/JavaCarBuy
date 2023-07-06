<%@page import="Implementacion.ProductoDAOImpl"%>
<%@page import="beans.Producto"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 <%@ page import="java.util.ArrayList" %>
 <%@ page import="beans.Carrito" %> 
 <%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

	<link rel="stylesheet" href="./css/style.css">
	<title>Insert title here</title>
	<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-KK94CHFLLe+nY2dmCWGMq91rCGa5gtU4mk92HdvYe+M/SXH301p5ILy+dN9+nJOZ" crossorigin="Gab_203"> 
	<link href='https://unpkg.com/boxicons@2.1.4/css/boxicons.min.css' rel='stylesheet'>
	<link rel="stylesheet" href="./css/slider.css">
	<link rel="stylesheet" href="./css/carBoxSlider.css">
	<link rel="stylesheet" href="./css/modal.css">

	
	<%
	ProductoDAOImpl pdao=new ProductoDAOImpl();
    ArrayList<Producto> Lista = new ArrayList<Producto>();
    Lista = pdao.listar();
		 
	%>
</head>
<body>


		
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
							<li><i class='bx bxs-user bx-lg' id="icon_menu"></i><a class="" id="enlace_menu" href="Controlador?accion=listarClientes">Ver Clientes</a></li>
						</ul>

					</div>   
					
					<div class="content" id="content">
						<div class="section" id="section">
						
						<div class="d-flex justify-content-center w-1">
							
							<div class="card">
									<div class="card-header">
										<h4>Generar Compras</h4>
									</div>
									<div class="card-body">
										<label>Sub-Total:</label>
										<input type="text" value="S/.${totalPagar}" readonly="" class="form-control">
										<label>Descuento:</label>
										<input type="text" value="S/.0.0" readonly="" class="form-control">
										<label>Total a Pagar:</label>
										<input type="text" value="S/.0.0" readonly="" class="form-control">
									</div>
									<div class="card-footer">
										<a class="btn btn-light">Realizar Pago</a>
										<a class="btn btn-success" href="Controlador?accion=GenerarCompra">Generar Compra</a>
									</div>	
							</div>
						</div>
						<div class="dislay">
							<marquee direction="left" width="500px"  behavior="alternate" style="margin: 0 auto;">
								<h1>Carrito de compras</h1>
							</marquee>
						</div>
						
							<table class="table table-hover">
								<thead>
								<tr>
								      <th scope="col">ITEM</th>
								      <th scope="col">Nombre</th>
								      <th scope="col">Descripcion</th>
								      <th scope="col">Precio</th>
								      <th scope="col">Cantidad</th>
								      <th scope="col">Sub-total</th>
								      <th scope="col">Acciones</th>
							    </tr>
								</thead>
								<tbody>
									<c:forEach var="c" items="${carrito}">
										<tr>
											<td>${c.getItem()}</td>
											<td>${c.getNombres()}</td>
											<td style="width: 500px;">${c.getDescripcion()}</td>
											<td>${c.getPrecioCompra() }</td>
											<td>
												<input type="hidden" id="idpro" value="${c.getIdProducto()}">
												<input type="number" id="Cantidad" value="${c.getCantidad()}" class="form-control" min="1" style="width: 100px;">
											</td>
											<td>${c. getSubTotal() }</td>
											
											<td>
											
												<input type="hidden" id="idp" value="${c.getIdProducto()}">
												<a href="#> " class="btn btn-danger" id="btnDelete">Eliminar</a>
											</td>
										
										</tr>
										
									</c:forEach>
									
								</tbody>		
							</table>
							
							
								
						</div>
					</div>

		<script src="./js/app.js"></script> 
		<script src="https://cdn.jsdelivr.net/npm/jquery@3.5.1/dist/jquery.slim.min.js" integrity="sha384-DfXdz2htPH0lsSSs5nCTpuj/zy4C+OGpamoFVy38MVBnE+IbbVYUew+OrCXaRkfj" crossorigin="anonymous"></script>
		<script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js" integrity="sha384-9/reFTGAW83EW2RDu2S0VKaIzap3H66lZH81PoYlFhbGU+6BZp6G7niu735Sk7lN" crossorigin="anonymous"></script>
		<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/js/bootstrap.min.js" integrity="sha384-+sLIOodYLS7CIrQpBjl+C7nPvqq+FbNUBDunl/OZv93DB7Ln/533i8e/mZXLi/P+" crossorigin="anonymous"></script>
		<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>

		<script type="text/javascript">
			$(document).ready(function (){
				$("tr #btnDelete").click(function (){
					var idp=$(this).parent().find("#idp").val();
					swal({
						  title: "Estas seguro?",
						  text: "Once deleted, you will not be able to recover this imaginary file!",
						  icon: "warning",
						  buttons: true,
						  dangerMode: true,
						})
						.then((willDelete) => {
						  if (willDelete) {
						    swal("Poof!", {
						      icon: "success",
						    }).then((willDelete)=>{
						    	if(willDelete){
						    		parent.location.href="Controlador?accion=Carrito";
						    	}
						    });
						  } else {
						    swal("Registro Eliminado!");
						  }
						});
					
					eliminar(idp);
				});
				
				function eliminar(idp){
					var url="Controlador?accion=DeleteProducto";
					$.ajax({
						type:'POST',
						url:url,
						data:"idp="+idp,
						success: function(data,textStatus,jqXHR) {

					    }
					});
				}
				
				
				$(" tr #Cantidad ").click(function () {
					var idp=$(this).parent().find("#idpro").val();
					var cantidad=$(this).parent().find("#Cantidad").val();
					var url="Controlador?accion=ActualizarCantidad";
					$.ajax({
						type:'POST',
						url:url,
						data:"idp="+idp+"&Cantidad="+cantidad,
						success: function(data,textStatus,jqXHR) {
							location.href="Controlador?accion=Carrito";
					    }
					});
				})
			});
		</script>
		<script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
		
</body>
</html>