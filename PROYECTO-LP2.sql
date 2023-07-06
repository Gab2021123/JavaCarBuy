create database proyecto;

use proyecto;
/*Tabla categorias*/
drop table if exists categorias;
create table categorias(
IdCategoria char(6) primary key,
Descripcion varchar(50),
Imagen varchar(50),
Estado char(1)
);

/*Tabla Compra*/
drop table if exists compra;
create table compra(
idcomp int primary key,
idCli int  not null,
idpag int not null,
fecCompra varchar(50) not null,
monto decimal not null,
estado varchar(50),
foreign key (idCli) references cliente(idCli),
foreign key (idpag) references pago(id_pag)
);
/*Tabla Detalle*/
drop table if exists detalle;
create table detalle(
idDet int  primary key auto_increment,
idproducto int,
idcomp int not null,
cant int not null,
precio_comp decimal not null,
foreign key(idproducto) references producto(idproducto),
foreign key(idcomp)references compra(idpag)
);
/*Tabla cliente*/
drop  table if exists cliente;
create table `cliente`(
`idCli` int  primary key auto_increment,
`dniCLi` varchar(8) default null,
`nomCli` varchar(50) default null,
`dirCli` varchar(50) default null,
`emailCli` varchar(70) default null,
`password` varchar(50) default null
)engine=InnoDB default charset=utf8mb4 collate=utf8mb4_0900_ai_ci;

/*Tabla Producto*/
drop table if exists producto ;
create table producto(
	idproducto int primary key,
    nom varchar(100),
    IdCategoria char(6),
    foto varchar(100),
    descp varchar(350),
    precio double,
    stock int,
    estado char(1)
);
use proyecto;
select*from cliente;
create table pago(
id_pag int primary key,
monto_pag double
);

/*Procedimientos alamcenados*/
delimiter $$
create procedure insertarCliente(
idCli int,
dni char(8),
nomCli varchar(50),
dirCli varchar(50),
emailCli varchar(70),
pass varchar(50)
)
begin 
insert into cliente values(idCli,dni,nomCli,dirCli,emailCli,pass);
end $$
delimiter ;
-- Store Procedure : ListarClientes
drop procedure if exists cliente;
delimiter $$
create procedure listarCliente()
begin 
select*from cliente;
end $$
delimiter ;
call listarCliente();
/*Ejemplo para eliminar registro de la tabla clientes*/
delete from cliente where idCli=5;

-- Store Procedure : ListarProductos
DROP PROCEDURE IF EXISTS ListarProducto;
DELIMITER @@
CREATE PROCEDURE ListarProducto()
BEGIN
    SELECT * FROM producto;
END @@
DELIMITER;

-- Llamada al procedimiento almacenado
CALL ListarProducto();

-- Store Procedure : ListarProductosXCategoria
DROP PROCEDURE IF EXISTS ListarProductosXCategoria;
DELIMITER @@
CREATE PROCEDURE ListarProductosXCategoria(IdCat CHAR(6))
BEGIN
    SELECT * FROM Productos
    WHERE IdCategoria = IdCat;
END @@
DELIMITER ;
CALL ListarProductoXCategoria('CAT001');
-- Store Procedure :Insetar
DROP PROCEDURE InsertaDetalle;
DELIMITER @@
CREATE PROCEDURE InsertaDetalle(
id_det int (10),
idproducto char (6),
id_comp int ,
cant int ,
precio_comp decimal,
estado char(1)
)
BEGIN
    INSERT INTO Detalle VALUES(id_det,idproducto,id_comp,cant,precio_comp,estado);
END @@
DELIMITER ;categorias
use proyecto;

/*Inserciones*/
select*from producto;

INSERT INTO Categorias VALUES('CAT001','Telefonos','Telefonos.jpg','1');
INSERT INTO Categorias VALUES('CAT002','Tablets','Tablets.jpg','1');
INSERT INTO Categorias VALUES('CAT003','Monitores','Monitores.jpg','1');
INSERT INTO Categorias VALUES('CAT004','Accesorios','Accesorios.jpg','1');

insert into producto values(1,'Iphone 13 128GB','CAT001','iphone13.jpeg','El iPhone 13 es uno de los últimos lanzamientos de Apple y ahora puedes conseguirlo al mejor precio.',719,50,'1');
insert into producto values	(2,'Moto G51 5G','CAT001','motog51.png','El Moto G51 cuenta con mejoras en sus prestaciones que lo hacen un celular más avanzado que su versión anterior, como pueden ser su mayor tamaño de pantalla, que ahora es de 6.8 pulgadas y con calidad Full HD+.',739,100,'1');
insert into producto values (3,'Galaxy A22 producto64GB','CAT001','galaxyA22.jpeg','Aprovecha los descuentos en celulares del catálogo Entel y consigue un Samsung Galaxy A22 al precio más económico.',709,75,'1');
insert into producto values	(4,'Redmi 10C 64GB','CAT001','redmi10C.jpeg','El Redmi 10C es uno de los modelos más vendidos de la casa Xiaomi por tratarse de un celular muy completo, equipado con las prestaciones que no deben faltar en los equipos de esta gama, pero también por su económico precio, que ya casi es marca de la casa.',679,86,'1');
insert into producto values	(5,'M4 Pro 128GB 5G','CAT001','m4pro.jpeg','El M4 Pro es un celular económico de la marca POCO en el que no faltan las prestaciones que todo usuario busca en un smartphone.',899,20,'1');
insert into producto values (6,'Honor X8','CAT001','honorx8.jpg','El X8 es uno de los modelos más vendidos de HONOR: un celular que cuenta con un diseño que nos recuerda a la casa Apple por sus bordes planos y su módulo de cámaras traseras.',909,142,'1');
                            
insert into producto values (7,'Tab P11 Snapdragon 662','CAT002','tabp11.jpeg','Si estás buscando una tablet, ¡llegaste al lugar indicado! Nuestra selección de tablets ofrece todo lo que necesitas para satisfacer tus necesidades móviles.',1447,142,'1');
insert into producto values (8,'Smart Tab M8 MediaTek Helio A22','CAT002','smarttabm8.jpeg','Parlante frontal dual con Dolby Atmos, Color: Iron Grey, incluye base de carga',399,45,'1');
insert into producto values (9,'HUAWEI Matepad SE','CAT002','hmatepad.jpeg','Octa Core,Memoria RAM: 4GB,Memoria interna: 64GB,Cámara posterior: 5MP',829,49,'1');
insert into producto values (10,'Tablet M10 Plus (3Rd Gen) 128Gb ','CAT002','tablem10.jpeg','TABLET M10 PLUS 4GB 128GB WIFI',929,22,'1');
insert into producto values (11,'Galaxy Tab A7 Lite','CAT002','galaxytab.jpeg','Pantalla de 8,7"│Peso 366 g│Cubierta metálica',855,50,'1');
insert into producto values  (12,'Tablet Advance Intro TR7989 7 1GB RAM 16GB Cover Azul','CAT002','tabletadv.jpeg','7" 1GB RAM 16GB Cover Azul',200,50,'1');
                            
insert into producto values (13,'Monitor plano 21.5" AOC E2270SWHN','CAT003','monitoplano.jpeg','Panel TN, 1920 x 1080, 60Hz, 5ms, color negro',299,50,'1');
insert into producto values	(14,'Monitor UltraWide LG 29"','CAT003','ultrawide.jpeg','29WQ600 FHD, Panel IPS, 5ms, 100 Hz, AMD FreeSync',1299,50,'1');
insert into producto values (15,'Monitor 23.8" Xiaomi Mi Desktop 1C','CAT003','xiaomi.jpg','Panel IPS, FHD, 6ms, 60 Hz',599,50,'1');
insert into producto values (16,'Monitor plano 19.5" LG 20MK400H-B','CAT003','lgmonitor.jpeg','Panel TN, 1366 x 768, 5ms, 60 Hz',449,50,'1');
insert into producto values (17,'Monitor Teros TE-3199N','CAT003','monitorteros.jpeg','27″ Ips, 75HZ, 1920X1080, FULL HD',599,50,'1');
insert into producto values  (18,'Monitor plano 27" Samsung Odyssey G3','CAT003','samsung.jpeg','Panel VA, FHD, 1 ms, 165 Hz, FreeSync',999,50,'1');
                            
insert into producto values (19,'Teclado Mecanico + Mouse Logitech','CAT004','pack.jpeg','Pop Keys Lila Verde',469,50,'1');
insert into producto values	(20,'Teclado gamer Teraware4gaming','CAT004','teraware.jpeg','Mecánico, alámbrico, conexión usb, 87 teclas y luces RGB',109,50,'1');
insert into producto values (21,'Camara Logitech B2B-C930E','CAT004','logitech.jpeg','Webcam Ultra Wide Angle Black',365,50,'1');
insert into producto values (22,'Presentador inalámbrico Coolbox','CAT004','presentador.jpeg','Láser rojo, 2.4GHz, usa pilas, negro',89,50,'1');
insert into producto values  (23,'Audífonos gamer Teraware','CAT004','gamer.jpeg','Conexión 3.5 mm, RGB, compatible PC',79,50,'1');
insert into producto values (24,'Lámpara para pantalla de computadora Usams ABS','CAT004','lampara.jpeg',' Led, 5W, negro',189,50,'1');

insert into pago values(1,4000);
select*from pago;

select * from compra ;
insert into compra values(1,1,1,"05/06/2023",1506.50,"Comprado") ;
select*from cliente;

select*from pago where id_pag=1;
