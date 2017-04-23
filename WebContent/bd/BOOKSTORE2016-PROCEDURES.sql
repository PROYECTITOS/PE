
-- ----------------------------
-- Procedure structure for MotorBusquedaLibro
-- ----------------------------
DROP PROCEDURE MotorBusquedaLibro
GO

create proc MotorBusquedaLibro
 @autor VARCHAR(500),
 @editorial VARCHAR(500),
 @encuadernacion VARCHAR(500),
 @titulo VARCHAR(500),
 @precio VARCHAR(500)
as
begin
select a.* from TB_LIBRO a
inner join TB_AUTOR b on (a.cod_aut=b.cod_aut)
inner join TB_EDITORIAL c on (a.cod_edi=c.cod_edi)
inner join TB_ENCUADERNACION d on (a.cod_enc=d.cod_enc)
where
a.tit_lib like '%' + @titulo + '%' and
(b.nom_aut +' '+b.apep_aut+' '+b.apem_aut)  like'%' + @autor +'%' and
c.nom_edi like  @editorial +'%' and
d.desc_enc like @encuadernacion +'%' and
a.pre_lib like  @precio +'%'
end

GO

-- ----------------------------
-- Procedure structure for PR_LOGIN
-- ----------------------------
DROP PROCEDURE PR_LOGIN
GO
 create procedure PR_LOGIN
 @p_Usuario VARCHAR(50),
 @p_Contrasena VARCHAR(50)
 as
 begin
 select * from TB_USUARIO where id_usu = @p_Usuario and pwd_usu = @p_Contrasena
 end

GO

-- ----------------------------
-- Procedure structure for usp_actualizarAutor
-- ----------------------------
DROP PROCEDURE usp_actualizarAutor
GO

 create procedure usp_actualizarAutor --es de autor >.<
 @codigo VARCHAR(12),
 @nombre VARCHAR(20),
 @paterno VARCHAR(20),
 @materno VARCHAR(20),
 @pais VARCHAR(12)
 as
 begin
 update TB_AUTOR
 set
 nom_aut = @nombre,
 apep_aut = @paterno,
 apem_aut = @materno
 where cod_aut=@codigo
 end

GO

-- ----------------------------
-- Procedure structure for usp_actualizarEditorial
-- ----------------------------
DROP PROCEDURE usp_actualizarEditorial
GO

create procedure usp_actualizarEditorial
 @codigo VARCHAR(12),
 @nombre VARCHAR(20),
 @direccion VARCHAR(50),
 @telefono VARCHAR(8)
as
begin
update TB_EDITORIAL
set  nom_edi=@nombre,
dir_edi=@direccion,
tel_edi=@telefono
where cod_edi=@codigo
end

GO

-- ----------------------------
-- Procedure structure for Usp_ActualizarLibros
-- ----------------------------
DROP PROCEDURE Usp_ActualizarLibros
GO

Create Proc Usp_ActualizarLibros
@codLib VARCHAR(12),
@codAut VARCHAR(12),
@codEdi VARCHAR(12),
@codEnc int,
@codGen int,
@titulo VARCHAR(50),
@pais VARCHAR(12),  --PAIS DEL AUTOR??? INNER JOIN en select?
@fecPublic date,
@Idioma VARCHAR(20),
@descripcion VARCHAR(500),
@ISBN VARCHAR(13),
@paginas int,
@precio money,
@stock int,
@vendidos int,
@ruta VARCHAR(500)
as
update TB_LIBRO
set cod_aut = @codAut, cod_edi = @codEdi, cod_enc = @codEnc, cod_gen = @codGen, tit_lib = @titulo, pais_lib = @pais,
fpub_lib = @fecPublic, idi_lib = @Idioma, des_lib = @descripcion, ISBN_lib = @ISBN, pag_lib = @paginas, pre_lib = @precio,
stock_lib = @stock, vend_lib = @vendidos, ruta_lib=@ruta
where cod_lib = @codLib

GO

-- ----------------------------
-- Procedure structure for usp_actualizarUsuario
-- ----------------------------
DROP PROCEDURE usp_actualizarUsuario
GO

 create procedure usp_actualizarUsuario

	@id_usu VARCHAR(12),
	@pwd_usu VARCHAR(600),
	@cod_tusu INT,

	@nom_usu VARCHAR(500),
	@apep_usu VARCHAR(50),
	@apem_usu VARCHAR(50),

	@mail_usua VARCHAR(500),
	@dni_usu VARCHAR(8),
	@cod_pre INT,

	@res_usu VARCHAR(500),
	@foto_usu VARCHAR(500) ,
	@est_usu VARCHAR(12) ,

	@pre_usu VARCHAR(20)
 as
 begin
 update TB_USUARIO
 set
 	pwd_usu = @pwd_usu ,
	cod_tusu= @cod_tusu ,
	nom_usu= @nom_usu,
	apep_usu = @apep_usu ,
	apem_usu= @apem_usu ,
	mail_usua= @mail_usua,
	dni_usu =@dni_usu ,
	cod_pre = @cod_pre ,
	res_usu=@res_usu,
	foto_usu=@foto_usu,
	est_usu  = @est_usu  ,
	pre_usu =@pre_usu
 where id_usu=@id_usu
 end

GO

-- ----------------------------
-- Procedure structure for Usp_AgregarCarrito
-- ----------------------------
DROP PROCEDURE Usp_AgregarCarrito
GO

Create Proc Usp_AgregarCarrito
@cod VARCHAR(12),
@idusu VARCHAR(12),
@fecha date,
@estado VARCHAR(10)
as
insert into TB_CARRITO values (@cod, @idusu, @fecha, @estado)

GO

-- ----------------------------
-- Procedure structure for Usp_buscarLibroxAutor
-- ----------------------------
DROP PROCEDURE Usp_buscarLibroxAutor
GO

Create Proc Usp_buscarLibroxAutor
@autor VARCHAR(15)
as
select l.* from TB_LIBRO l inner join TB_AUTOR a
on l.cod_aut = a.cod_aut
where a.cod_aut like @autor + '%'

GO

-- ----------------------------
-- Procedure structure for Usp_buscarLibroxEncuadernacion
-- ----------------------------
DROP PROCEDURE Usp_buscarLibroxEncuadernacion
GO

Create Proc Usp_buscarLibroxEncuadernacion
@categoria VARCHAR(12)
as
select * from TB_LIBRO l inner join tb_encudernacion e
on l.cod_enc =  e.cod_enc
where e.desc_enc = @categoria + '%'

GO

-- ----------------------------
-- Procedure structure for Usp_buscarLibroxGenero
-- ----------------------------
DROP PROCEDURE Usp_buscarLibroxGenero
GO

Create Proc Usp_buscarLibroxGenero
@genero VARCHAR(12)
as
select l.* from TB_LIBRO l inner join TB_GENERO g
on l.cod_gen = g.cod_gen
where g.nom_gen like @genero + '%'

GO

-- ----------------------------
-- Procedure structure for Usp_buscarLibroXNombre
-- ----------------------------
DROP PROCEDURE Usp_buscarLibroXNombre
GO

Create Proc Usp_buscarLibroXNombre
@titulo VARCHAR(50)
as
select * from TB_LIBRO where tit_lib = @titulo

GO

-- ----------------------------
-- Procedure structure for usp_CambiarContraseña
-- ----------------------------
DROP PROCEDURE usp_CambiarContraseña
GO


create proc usp_CambiarContraseña
@id VARCHAR(12),
@pass VARCHAR(12)
as
update TB_USUARIO
set pwd_usu = @pass
where id_usu = @id

GO

-- ----------------------------
-- Procedure structure for Usp_EliminarCarrito
-- ----------------------------
DROP PROCEDURE Usp_EliminarCarrito
GO

Create Proc Usp_EliminarCarrito -- se elimina carro o detalle?
@cod VARCHAR(12)
as
delete from TB_CARRITO where cod_car = @cod

GO

-- ----------------------------
-- Procedure structure for Usp_EliminarLibro
-- ----------------------------
DROP PROCEDURE Usp_EliminarLibro
GO

Create Proc Usp_EliminarLibro
@cod VARCHAR(12)
as
delete from TB_LIBRO where cod_lib = @cod

GO

-- ----------------------------
-- Procedure structure for Usp_ListarVentas
-- ----------------------------
DROP PROCEDURE Usp_ListarVentas
GO

Create Proc Usp_ListarVentas
as
select * from TB_VENTA

GO

-- ----------------------------
-- Procedure structure for usp_logueoUsuario
-- ----------------------------
DROP PROCEDURE usp_logueoUsuario
GO

-----------------------------------------

create proc usp_logueoUsuario
@id VARCHAR(12),
@pass VARCHAR(600)
as
select * from TB_USUARIO where id_usu = @id and pwd_usu = @pass

GO

-- ----------------------------
-- Procedure structure for Usp_registrarLibro
-- ----------------------------
DROP PROCEDURE Usp_registrarLibro
GO

Create Proc Usp_registrarLibro
@codLib VARCHAR(12),
@codAut VARCHAR(12),
@codEdi VARCHAR(12),
@codEnc int,
@codGen int,
@titulo VARCHAR(50),
@pais VARCHAR(12),  --PAIS DEL AUTOR??? INNER JOIN en select?
@fecPublic date,
@Idioma VARCHAR(20),
@descripcion VARCHAR(500),
@ISBN VARCHAR(13),
@paginas int,
@precio money,
@stock int,
@vendidos int,
@ruta VARCHAR(550)
as
insert into TB_LIBRO values
(@codLib,@codAut,@codEdi,@codEnc,@codGen,@titulo,@pais,@fecPublic,@Idioma,@descripcion,@ISBN,@paginas,@precio,@stock,@vendidos,@ruta)

GO

-- ----------------------------
-- Procedure structure for Usp_RegistrarVenta
-- ----------------------------
DROP PROCEDURE Usp_RegistrarVenta
GO

Create Proc Usp_RegistrarVenta
@cod VARCHAR(12),
@nombre VARCHAR(20),
@direccion VARCHAR(50),
@fecha date,
@monto money,
@codTarjeta int,
@numTarjeta int,
@claveTarjeta int,
@mesTarjeta int,
@añoTarjeta int
as
Insert into TB_VENTA values (@cod, @nombre, @direccion, @fecha, @monto, @codTarjeta, @numTarjeta, @claveTarjeta, @mesTarjeta, @añoTarjeta)

GO

-- ----------------------------
-- Procedure structure for usp_subtotal_detalle_carrito
-- ----------------------------
DROP PROCEDURE usp_subtotal_detalle_carrito
GO




-------------------------------------------------
CREATE PROC usp_subtotal_detalle_carrito
@cod_carrito VARCHAR(12),
@num_detalle INT
AS
SELECT D.cant_det * L.pre_lib AS 'SUBTOTAL' FROM
TB_DetalleCarrito AS D INNER JOIN
TB_LIBRO AS L ON
D.cod_lib = L.cod_lib
WHERE D.cod_car = @cod_carrito AND D.num_det = @num_detalle

GO

-- ----------------------------
-- Procedure structure for usp_total_carrito
-- ----------------------------
DROP PROCEDURE usp_total_carrito
GO

CREATE PROC usp_total_carrito
@cod_carrito VARCHAR(12)
AS
SELECT C.cod_car,SUM(L.pre_lib * D.cant_det) AS 'TOTAL' FROM
TB_CARRITO AS C INNER JOIN
TB_DetalleCarrito AS D ON
C.cod_car = D.cod_car INNER JOIN
TB_LIBRO AS L ON
D.cod_lib = L.cod_lib
WHERE C.cod_car = @cod_carrito
GROUP BY C.cod_car
--falta verificar el estado

GO
