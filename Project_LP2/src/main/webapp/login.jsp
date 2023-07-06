<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	 <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-KK94CHFLLe+nY2dmCWGMq91rCGa5gtU4mk92HdvYe+M/SXH301p5ILy+dN9+nJOZ" crossorigin="Gab_203"> 
	<link href='https://unpkg.com/boxicons@2.1.4/css/boxicons.min.css' rel='stylesheet'>
  	<link href="css/login.css" rel="stylesheet" type="text/css">
  	
  	<meta charset="UTF-8">
  	<title>CelTask</title>
  	
</head>
<body class="main">
	<div class="login d-grid">
		
			<div class="container d-flex flex-column justify-content-center align-items-center border border-primary rounded-4 content">
					
				<div class="d-flex justify-content-center align-items-center flex-column  box-login m-md " >
					<form action="Controlador?accion=Entrar" method="get">
						<label class="d-flex align-items-center" style="--bs-text-opacity: .8;" ><i class='bx bx-user-circle bx-sm'></i> Usuario:</label> 
						<input name="txtuser" type="text" placeholder="Usuario" >
						<label class="d-flex align-items-center" >Password:</label>
						<input name="txtPass" type="password" placeholder="Contraseña"  >
						
							<div class="d-flex flex-row ">
									<input  type="submit" name="accion" value="Entrar"  class="btn btn-primary m-3" >
									<a href="./register.jsp"  class="btn btn-primary m-3">Registrar</a>
							</div>
					</form>
							
					
				</div>
				
				<div class="d-flex flex-row bd-highlight mb-3 links">
					<a><i class='bx bxl-github bx-sm' ></i></a>
					<a><i class='bx bxl-linkedin bx-sm' ></i></a>
					<a><i class='bx bxl-facebook bx-sm' ></i></a>
					<a><i class='bx bxl-twitter bx-sm' ></i></a>
					
				</div>
				
			
				
					
			</div>
				
		
				
	</div>
			
		
</body>
</html>