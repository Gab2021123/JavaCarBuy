<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 <%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="./css/style.css">
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-KK94CHFLLe+nY2dmCWGMq91rCGa5gtU4mk92HdvYe+M/SXH301p5ILy+dN9+nJOZ" crossorigin="Gab_203"> 
	<link href='https://unpkg.com/boxicons@2.1.4/css/boxicons.min.css' rel='stylesheet'>
	<link rel="stylesheet" href="./css/slider.css">
	<link rel="stylesheet" href="./css/carBoxSlider.css">
	<link rel="stylesheet" href="./css/modal.css">
	<link rel="stylesheet"href="https://cdn.jsdelivr.net/npm/swiper@9/swiper-bundle.min.css"/>
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
							
							<div class="dislay">
							<marquee direction="left" width="500px"  behavior="alternate" style="margin: 0 auto;">
								<h1>Listado de Clientes</h1>
							</marquee>
						</div>
						
							<table class="table table-hover">
								<thead>
								<tr>
								      <th scope="col">Id Cliente</th>
								      <th scope="col">Dni</th>
								      <th scope="col">Nombre</th>
								      <th scope="col">Direccion</th>
								      <th scope="col">Email</th>
								      <th scope="col">password</th>
								      <th scope="col">Acciones</th>
							    </tr>
								</thead>
								<tbody>
									<c:forEach var="cl" items="${clientes}">
										<tr>
											<td>${cl.getIdCliente()}</td>
											<td>${cl.getDniCliente()}</td>
											<td style="width: 500px;">${cl.getNomCliente()}</td>
											<td>${cl.getDirCliente() }</td>
											<td>${cl.getEmailCliente()}</td>
											<td>${cl. getPassword() }</td>
											<td>
												<input type="text" id="idCli" value="${cl.getIdCliente()}">
												<a href="#" class="btn btn-danger d-flex justify-content-center " id="btnElminarCliente">Eliminar</a>
											
											</td>
											
										</tr>
										
									</c:forEach>
									
								</tbody>		
							</table>
							
							
							
							
							</div>
					</div>
		<script src="https://cdn.jsdelivr.net/npm/jquery@3.5.1/dist/jquery.slim.min.js" integrity="sha384-DfXdz2htPH0lsSSs5nCTpuj/zy4C+OGpamoFVy38MVBnE+IbbVYUew+OrCXaRkfj" crossorigin="anonymous"></script>
		<script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js" integrity="sha384-9/reFTGAW83EW2RDu2S0VKaIzap3H66lZH81PoYlFhbGU+6BZp6G7niu735Sk7lN" crossorigin="anonymous"></script>
		<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/js/bootstrap.min.js" integrity="sha384-+sLIOodYLS7CIrQpBjl+C7nPvqq+FbNUBDunl/OZv93DB7Ln/533i8e/mZXLi/P+" crossorigin="anonymous"></script>
		<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
		<script src="./js/app.js"></script> 	
		<script type="text/javascript">
		$(document).ready(function(){
			$("tr #btnElminarCliente").click(function(){
				var idCli=$(this).parent().find("#idCli").val();
				swal({
					  title: "Estas seguro?",
					  text: "Una vez eliminado el registro de clientes no se podra entrar al index",
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
					    		parent.location.href="Controlador?accion=ListarClientes";
					    	}
					    });
					  } else {
					    swal("Registro Eliminado!");
					  }
					});
				eliminar(idCli);
			});
			function eliminar(idCli) {
				var url="Controlador?accion=DeleteCliente";
				$.ajax({
					type:'POST',
					url:url,
					data:"idCli="+idCli,
					success: function(data,textStatus,jqXHR) {
						
				    }
				});
			}
		});
		
		</script>
		<script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>	
</body>
</html>