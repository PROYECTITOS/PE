-------------------------------------------------------------------------------------------------
----------------------------------------VALIDACION-----------------------------------------------
-------------------------------------------------------------------------------------------------
IF DB_ID('BOOKSTORE2016') IS NOT NULL
	BEGIN
		USE MASTER
		DROP DATABASE BOOKSTORE2016
	END

CREATE DATABASE BOOKSTORE2016
GO
USE BOOKSTORE2016
GO
-------------------------------------------------------------------------------------------------
----------------------------------------TABLAS---------------------------------------------------
-------------------------------------------------------------------------------------------------
CREATE TABLE TB_PAIS (
cod_pais 					INT 				NOT NULL	IDENTITY,
des_pais	 				VARCHAR(400)		NOT NULL
)
GO

CREATE TABLE TB_PREGUNTA (
cod_pre 					INT 				NOT NULL	IDENTITY,
desc_pre 					VARCHAR(100) 		NULL
)
GO

CREATE TABLE TB_TIPOTARJETA (
cod_ttar 					INT 				NOT NULL	IDENTITY,
desc_ttar 					VARCHAR(50) 		NOT NULL
)
GO

CREATE TABLE TB_ENCUADERNACION (
cod_enc 					INT 				NOT NULL	IDENTITY,
desc_enc 					VARCHAR(50) 		NOT NULL
)
GO

CREATE TABLE TB_GENERO (
cod_gen 					INT 				NOT NULL	IDENTITY,
nom_gen 					VARCHAR(50) 		NOT NULL
)
GO

CREATE TABLE TB_AUTOR (
cod_aut 					INT 				NOT NULL	IDENTITY,
nom_aut 					VARCHAR(50) 		NOT NULL ,
apep_aut 					VARCHAR(50) 		NOT NULL ,
apem_aut 					VARCHAR(50) 		NOT NULL ,
cod_pais  					VARCHAR(20) 		NOT NULL
)
GO


CREATE TABLE TB_EDITORIAL (
cod_edi 					INT 				NOT NULL	IDENTITY,
nom_edi 					VARCHAR(200) 		NOT NULL ,
dir_edi 					VARCHAR(500) 		NOT NULL ,
tel_edi 					VARCHAR(50) 		NOT NULL
)
GO





CREATE TABLE TB_LIBRO (
cod_lib 					INT 				NOT NULL	IDENTITY,
cod_aut 					INT 				NOT NULL ,
cod_edi 					INT 				NOT NULL ,
cod_enc 					INT 				NOT NULL ,
cod_gen 					INT 				NOT NULL ,
tit_lib 					VARCHAR(500) 		NOT NULL ,
pais_lib 					VARCHAR(50) 		NOT NULL ,
fpub_lib 					DATE 				NOT NULL ,
idi_lib 					VARCHAR(20) 		NULL ,
des_lib 					VARCHAR(1000) 		NOT NULL ,
ISBN_lib 					VARCHAR(30) 		NOT NULL ,
pag_lib 					VARCHAR(50)			NOT NULL ,
pre_lib 					MONEY 				NOT NULL ,
stock_lib 					INT 				NOT NULL ,
vend_lib 					INT 				NOT NULL ,
ruta_lib 					VARCHAR(550) 		NOT NULL
)
GO



CREATE TABLE TB_TIPOUSUARIO (
cod_tusu 					INT 				NOT NULL	IDENTITY,
nom_tusu 					VARCHAR(20) 		NOT NULL ,
desc_tusu 					VARCHAR(50) 		NULL
)
GO

CREATE TABLE TB_USUARIO (
id_usu 						INT 		NOT NULL ,
usu_usu						VARCHAR(600)		NOT NULL,
pwd_usu 					VARCHAR(600) 		NOT NULL ,
cod_tusu 					INT 				NOT NULL ,
nom_usu 					VARCHAR(500) 		NOT NULL ,
apep_usu 					VARCHAR(50) 		NOT NULL ,
apem_usu 					VARCHAR(50) 		NULL ,
mail_usu 					VARCHAR(500) 		NOT NULL ,
dni_usu 					VARCHAR(8) 			NOT NULL ,
cod_pre 					INT 				NOT NULL ,
res_usu 					VARCHAR(500) 		NOT NULL ,
foto_usu 					VARCHAR(500) 		NULL ,
est_usu 					VARCHAR(12) 		NOT NULL ,
pre_usu 					VARCHAR(20) 		NOT NULL
)
GO

CREATE TABLE TB_CARRITO (
cod_car 					VARCHAR(12) 		NOT NULL ,
id_usu 						INT 				NOT NULL ,
fec_car 					DATE 				NOT NULL ,
est_car 					VARCHAR(10) 		NOT NULL
)
GO

CREATE TABLE TB_DETALLECARRITO (
cod_car 					VARCHAR(12) 		NOT NULL ,
num_det 					INT 				NOT NULL ,
cod_lib 					INT			 		NOT NULL ,
cant_det 					INT 				NOT NULL
)
GO

CREATE TABLE TB_VENTA (
cod_car 					VARCHAR(12) 		NOT NULL ,
nom_vent 					VARCHAR(20) 		NOT NULL ,
dir_vent 					VARCHAR(50) 		NOT NULL ,
fec_vent 					DATETIME 			NOT NULL ,
monto_vent 					MONEY 				NOT NULL ,
cod_ttar 					INT 				NOT NULL ,
num_tar 					INT 				NOT NULL ,
ccv_tar 					INT 				NOT NULL ,
mexp_tar 					INT 				NOT NULL ,
yexp_tar 					INT 				NOT NULL
)
GO

-------------------------------------------------------------------------------------------------
------------------------------------LLAVES PRIMARIAS---------------------------------------------
-------------------------------------------------------------------------------------------------
ALTER TABLE TB_AUTOR ADD PRIMARY KEY (cod_aut)
ALTER TABLE TB_CARRITO ADD PRIMARY KEY (cod_car)
ALTER TABLE TB_DETALLECARRITO ADD PRIMARY KEY (cod_car, num_det)
ALTER TABLE TB_EDITORIAL ADD PRIMARY KEY (cod_edi)
ALTER TABLE TB_ENCUADERNACION ADD PRIMARY KEY (cod_enc)
ALTER TABLE TB_GENERO ADD PRIMARY KEY (cod_gen)
ALTER TABLE TB_LIBRO ADD PRIMARY KEY (cod_lib)
ALTER TABLE TB_PREGUNTA ADD PRIMARY KEY (cod_pre)
ALTER TABLE TB_TIPOTARJETA ADD PRIMARY KEY (cod_ttar)
ALTER TABLE TB_TIPOUSUARIO ADD PRIMARY KEY (cod_tusu)
ALTER TABLE TB_USUARIO ADD PRIMARY KEY (id_usu)
ALTER TABLE TB_USUARIO ADD UNIQUE (id_usu ASC)
ALTER TABLE TB_VENTA ADD PRIMARY KEY (cod_car)
GO

-------------------------------------------------------------------------------------------------
------------------------------------LLAVES FORANEAS----------------------------------------------
-------------------------------------------------------------------------------------------------
ALTER TABLE TB_CARRITO ADD FOREIGN KEY (id_usu) REFERENCES TB_USUARIO (id_usu)
ALTER TABLE TB_DETALLECARRITO ADD FOREIGN KEY (cod_car) REFERENCES TB_CARRITO (cod_car)
ALTER TABLE TB_DETALLECARRITO ADD FOREIGN KEY (cod_lib) REFERENCES TB_LIBRO (cod_lib)
ALTER TABLE TB_LIBRO ADD FOREIGN KEY (cod_aut) REFERENCES TB_AUTOR (cod_aut)
ALTER TABLE TB_LIBRO ADD FOREIGN KEY (cod_edi) REFERENCES TB_EDITORIAL (cod_edi)
ALTER TABLE TB_LIBRO ADD FOREIGN KEY (cod_enc) REFERENCES TB_ENCUADERNACION (cod_enc)
ALTER TABLE TB_LIBRO ADD FOREIGN KEY (cod_gen) REFERENCES TB_GENERO (cod_gen)
ALTER TABLE TB_USUARIO ADD FOREIGN KEY (cod_pre) REFERENCES TB_PREGUNTA (cod_pre)
ALTER TABLE TB_USUARIO ADD FOREIGN KEY (cod_tusu) REFERENCES TB_TIPOUSUARIO (cod_tusu)
ALTER TABLE TB_VENTA ADD FOREIGN KEY (cod_car) REFERENCES TB_CARRITO (cod_car)
ALTER TABLE TB_VENTA ADD FOREIGN KEY (cod_ttar) REFERENCES TB_TIPOTARJETA (cod_ttar)
GO

-------------------------------------------------------------------------------------------------
-------------------------------REGISTROS TB_AUTOR------------------------------------------------
-------------------------------------------------------------------------------------------------
INSERT INTO TB_AUTOR ( nom_aut, apep_aut, apem_aut, cod_pais) VALUES (N'Stephen', N'King', N'…', N'Estados Unidos')
INSERT INTO TB_AUTOR ( nom_aut, apep_aut, apem_aut, cod_pais) VALUES (N'Edgar Allan Poe', N'Allan', N'Poe', N'Estados Unidos')
INSERT INTO TB_AUTOR ( nom_aut, apep_aut, apem_aut, cod_pais) VALUES (N'Howard', N'Phillips ', N'Lovecraft', N'Estados Unidos')
INSERT INTO TB_AUTOR ( nom_aut, apep_aut, apem_aut, cod_pais) VALUES (N'Stephen', N' King', N'…', N'Estados Unidos')
INSERT INTO TB_AUTOR ( nom_aut, apep_aut, apem_aut, cod_pais) VALUES (N'Stephen', N' King', N'…', N'Estados Unidos')
INSERT INTO TB_AUTOR ( nom_aut, apep_aut, apem_aut, cod_pais) VALUES (N'Bram ', N'Stoker', N'…', N'Reino Unido')
INSERT INTO TB_AUTOR ( nom_aut, apep_aut, apem_aut, cod_pais) VALUES (N'Ray', N' Bradbury', N'…', N'Estados Unidos')
INSERT INTO TB_AUTOR ( nom_aut, apep_aut, apem_aut, cod_pais) VALUES (N'Clive', N' Barker', N'…', N'Reino Unido')
INSERT INTO TB_AUTOR ( nom_aut, apep_aut, apem_aut, cod_pais) VALUES (N'Mary', N' Shelley', N'…', N'Inglaterra')
INSERT INTO TB_AUTOR ( nom_aut, apep_aut, apem_aut, cod_pais) VALUES (N'Robert', N' Bloch', N'…', N'Ingles')
INSERT INTO TB_AUTOR ( nom_aut, apep_aut, apem_aut, cod_pais) VALUES (N'Gabriel ', N'Garcia ', N'Marquez', N'Colombia')
INSERT INTO TB_AUTOR ( nom_aut, apep_aut, apem_aut, cod_pais) VALUES (N'Franz', N' Kafka', N'…', N'Hungaria')
INSERT INTO TB_AUTOR ( nom_aut, apep_aut, apem_aut, cod_pais) VALUES (N'León ', N'Tolstói', N'…', N'Rusia')
INSERT INTO TB_AUTOR ( nom_aut, apep_aut, apem_aut, cod_pais) VALUES (N'J. R. R.', N' Tolkien', N'…', N'Reino Unido')
INSERT INTO TB_AUTOR ( nom_aut, apep_aut, apem_aut, cod_pais) VALUES (N'Gustave ', N'Flaubert', N'…', N'Francia')
INSERT INTO TB_AUTOR ( nom_aut, apep_aut, apem_aut, cod_pais) VALUES (N'Juan', N' Rulfo', N'…', N'Mexico')
INSERT INTO TB_AUTOR ( nom_aut, apep_aut, apem_aut, cod_pais) VALUES (N'Herman', N' Melville', N'…', N'Estados Unidos')
INSERT INTO TB_AUTOR ( nom_aut, apep_aut, apem_aut, cod_pais) VALUES (N'William', N' Shakespeare', N'…', N'Inglaterra')
INSERT INTO TB_AUTOR ( nom_aut, apep_aut, apem_aut, cod_pais) VALUES (N'Federico', N' Garcia', N' Lorca', N'España')
INSERT INTO TB_AUTOR ( nom_aut, apep_aut, apem_aut, cod_pais) VALUES (N'Vladímir ', N'Nabókov', N'…', N'Francia')
INSERT INTO TB_AUTOR ( nom_aut, apep_aut, apem_aut, cod_pais) VALUES (N'Douglas', N' Adams', N'…', N'Reino Unido')
INSERT INTO TB_AUTOR ( nom_aut, apep_aut, apem_aut, cod_pais) VALUES (N'John ', N'Kennedy ', N'Toole', N'Estados Unidos')
INSERT INTO TB_AUTOR ( nom_aut, apep_aut, apem_aut, cod_pais) VALUES (N'Jerome ', N'K.', N' Jerome', N'Estados Unidos')
INSERT INTO TB_AUTOR ( nom_aut, apep_aut, apem_aut, cod_pais) VALUES (N'Douglas', N' Adams', N'…', N'Reino Unido')
INSERT INTO TB_AUTOR ( nom_aut, apep_aut, apem_aut, cod_pais) VALUES (N'Terry ', N'Pratchett', N'…', N'Reino Unido')
INSERT INTO TB_AUTOR ( nom_aut, apep_aut, apem_aut, cod_pais) VALUES (N'Douglas ', N'Adams', N'…', N'Reino Unido')
INSERT INTO TB_AUTOR ( nom_aut, apep_aut, apem_aut, cod_pais) VALUES (N'Douglas', N' Adams', N'…', N'Reino Unido')
INSERT INTO TB_AUTOR ( nom_aut, apep_aut, apem_aut, cod_pais) VALUES (N'Roddy ', N'Doyle', N'…', N'Irlanda')
INSERT INTO TB_AUTOR ( nom_aut, apep_aut, apem_aut, cod_pais) VALUES (N'George ', N'Grossmith', N'…', N'Reino Unido')
INSERT INTO TB_AUTOR ( nom_aut, apep_aut, apem_aut, cod_pais) VALUES (N' VV', N'AA', N'…', N'España')
INSERT INTO TB_AUTOR ( nom_aut, apep_aut, apem_aut, cod_pais) VALUES (N'Alan', N'Moore', N'-', N'Estados Unidos')
INSERT INTO TB_AUTOR ( nom_aut, apep_aut, apem_aut, cod_pais) VALUES (N'Alejandro', N'Jodorowsky', N'-', N'Francia')
INSERT INTO TB_AUTOR ( nom_aut, apep_aut, apem_aut, cod_pais) VALUES (N'Neil', N'Gaiman', N'-', N'Estados Unidos')
INSERT INTO TB_AUTOR ( nom_aut, apep_aut, apem_aut, cod_pais) VALUES (N'Dave', N'Gibbons', N'-', N'Estados Unidos')
INSERT INTO TB_AUTOR ( nom_aut, apep_aut, apem_aut, cod_pais) VALUES (N'Kazuo', N'Koike', N'-', N'Estados Unidos')
INSERT INTO TB_AUTOR ( nom_aut, apep_aut, apem_aut, cod_pais) VALUES (N'Art', N'Spielgelman', N'-', N'Estados Unidos')
INSERT INTO TB_AUTOR ( nom_aut, apep_aut, apem_aut, cod_pais) VALUES (N'David', N'Mazzucchelli', N'-', N'Estados Unidos')
INSERT INTO TB_AUTOR ( nom_aut, apep_aut, apem_aut, cod_pais) VALUES (N'L Incal', N'Noir', N'-', N'Estados Unidos')
INSERT INTO TB_AUTOR ( nom_aut, apep_aut, apem_aut, cod_pais) VALUES (N'Frank', N'Miller', N'-', N'Estados Unidos')
INSERT INTO TB_AUTOR ( nom_aut, apep_aut, apem_aut, cod_pais) VALUES (N'Mike', N'Mignola', N'-', N'Estados Unidos')
INSERT INTO TB_AUTOR ( nom_aut, apep_aut, apem_aut, cod_pais) VALUES (N'Rubén', N'Darío', N'-', N'Nicaragua')
INSERT INTO TB_AUTOR ( nom_aut, apep_aut, apem_aut, cod_pais) VALUES (N'Gustavo', N'Adolfo', N'Bécquer', N'España')
INSERT INTO TB_AUTOR ( nom_aut, apep_aut, apem_aut, cod_pais) VALUES (N'Jorge', N'Luis', N'Borges', N'Argentina')
INSERT INTO TB_AUTOR ( nom_aut, apep_aut, apem_aut, cod_pais) VALUES (N'Pablo', N'Neruda', N'-', N'Chile')
INSERT INTO TB_AUTOR ( nom_aut, apep_aut, apem_aut, cod_pais) VALUES (N'Gustave', N'Flaubert', N'-', N'España')
INSERT INTO TB_AUTOR ( nom_aut, apep_aut, apem_aut, cod_pais) VALUES (N'Alfonsina', N'Storni', N'-', N'Argentina')
INSERT INTO TB_AUTOR ( nom_aut, apep_aut, apem_aut, cod_pais) VALUES (N'Mario', N'Benedetti', N'-', N'Uruguay')
INSERT INTO TB_AUTOR ( nom_aut, apep_aut, apem_aut, cod_pais) VALUES (N'Amado', N'Nervo', N'-', N'Mexico')
INSERT INTO TB_AUTOR ( nom_aut, apep_aut, apem_aut, cod_pais) VALUES (N'Julia', N'Prilutsky', N'Farni', N'Argentina')
INSERT INTO TB_AUTOR ( nom_aut, apep_aut, apem_aut, cod_pais) VALUES (N'Miguel', N'De Cervantes', N'-', N'España')
INSERT INTO TB_AUTOR ( nom_aut, apep_aut, apem_aut, cod_pais) VALUES (N'Gabriel', N'García', N'Márquez', N'Colombia')
INSERT INTO TB_AUTOR ( nom_aut, apep_aut, apem_aut, cod_pais) VALUES (N'Vicente', N'Blasco', N'Ibáñez', N'España')
INSERT INTO TB_AUTOR ( nom_aut, apep_aut, apem_aut, cod_pais) VALUES (N'Ramón', N'María del Valle', N'Inclán', N'España')
INSERT INTO TB_AUTOR ( nom_aut, apep_aut, apem_aut, cod_pais) VALUES (N'Camilo', N'José', N'Cela', N'España')
INSERT INTO TB_AUTOR ( nom_aut, apep_aut, apem_aut, cod_pais) VALUES (N'Miguel', N'Delibes', N'-', N'España')
INSERT INTO TB_AUTOR ( nom_aut, apep_aut, apem_aut, cod_pais) VALUES (N'Miguel', N'Ángel', N'Asturias', N'España')
INSERT INTO TB_AUTOR ( nom_aut, apep_aut, apem_aut, cod_pais) VALUES (N'Ernesto', N'Sabato', N'-', N'Argentina')
INSERT INTO TB_AUTOR ( nom_aut, apep_aut, apem_aut, cod_pais) VALUES (N'Laura', N'Esquivel', N'-', N'Mexico')
INSERT INTO TB_AUTOR ( nom_aut, apep_aut, apem_aut, cod_pais) VALUES (N'Isaac', N'Asimov', N'Yúdovich', N'Rusia')
INSERT INTO TB_AUTOR ( nom_aut, apep_aut, apem_aut, cod_pais) VALUES (N'Julio', N'Verne', N'G', N'Francia')
INSERT INTO TB_AUTOR ( nom_aut, apep_aut, apem_aut, cod_pais) VALUES (N'Andy', N'Weir', N'T', N'EE.UU')
INSERT INTO TB_AUTOR ( nom_aut, apep_aut, apem_aut, cod_pais) VALUES (N'Orson', N'Scott', N'Card', N'EE.UU')
INSERT INTO TB_AUTOR ( nom_aut, apep_aut, apem_aut, cod_pais) VALUES (N'H', N'Wells', N'G', N'Reino Unido')
INSERT INTO TB_AUTOR ( nom_aut, apep_aut, apem_aut, cod_pais) VALUES (N'Joe', N'Haldeman', N'M', N'EE.UU')
INSERT INTO TB_AUTOR ( nom_aut, apep_aut, apem_aut, cod_pais) VALUES (N'George', N'	Orwell', N'S', N'Reino Unido')
INSERT INTO TB_AUTOR ( nom_aut, apep_aut, apem_aut, cod_pais) VALUES (N'Frank', N'	Herbert	', N'P', N'	EE.UU')
INSERT INTO TB_AUTOR ( nom_aut, apep_aut, apem_aut, cod_pais) VALUES (N'Christine', N'Nöstlinger', N'L', N'Austria')
INSERT INTO TB_AUTOR ( nom_aut, apep_aut, apem_aut, cod_pais) VALUES (N'Ana Maria', N'Machado', N'J', N'Brasil')
INSERT INTO TB_AUTOR ( nom_aut, apep_aut, apem_aut, cod_pais) VALUES (N'Irene', N'Cabrejos', N'C', N'Agentina')
INSERT INTO TB_AUTOR ( nom_aut, apep_aut, apem_aut, cod_pais) VALUES (N'Pilar', N'Mateos	', N'M', N'España')
INSERT INTO TB_AUTOR ( nom_aut, apep_aut, apem_aut, cod_pais) VALUES (N'Sergio', N'Andricaín', N'P', N'Cuba')
INSERT INTO TB_AUTOR ( nom_aut, apep_aut, apem_aut, cod_pais) VALUES (N'Mauricio', N'Paredes ', N'N', N'Chile')
INSERT INTO TB_AUTOR ( nom_aut, apep_aut, apem_aut, cod_pais) VALUES (N'Fencndo ', N'Gomez', N'Campo', N'Colombia')
INSERT INTO TB_AUTOR ( nom_aut, apep_aut, apem_aut, cod_pais) VALUES (N'Sally ', N'Warner', N'B', N'EE.UU')
INSERT INTO TB_AUTOR ( nom_aut, apep_aut, apem_aut, cod_pais) VALUES (N'Claus', N'Priesner', N'P', N'España')
INSERT INTO TB_AUTOR ( nom_aut, apep_aut, apem_aut, cod_pais) VALUES (N'AA.VV', N'TIKAL', N'TIKAL', N'España')
INSERT INTO TB_AUTOR ( nom_aut, apep_aut, apem_aut, cod_pais) VALUES (N'Juan', N'Porras', N'C', N'Argentina')
INSERT INTO TB_AUTOR ( nom_aut, apep_aut, apem_aut, cod_pais) VALUES (N'Le rond Dalembert', N'Diderot', N'D', N'España')
INSERT INTO TB_AUTOR ( nom_aut, apep_aut, apem_aut, cod_pais) VALUES (N'LIBSA', N'-', N'-', N'España')
INSERT INTO TB_AUTOR ( nom_aut, apep_aut, apem_aut, cod_pais) VALUES (N'Isaac ', N'Asimov', N'Yúdovich ', N'Rusia')
INSERT INTO TB_AUTOR ( nom_aut, apep_aut, apem_aut, cod_pais) VALUES (N'Julio', N'Verne', N'G', N'Francia')
INSERT INTO TB_AUTOR ( nom_aut, apep_aut, apem_aut, cod_pais) VALUES (N'Andy', N'Weir', N'T', N'EE.UU')
INSERT INTO TB_AUTOR ( nom_aut, apep_aut, apem_aut, cod_pais) VALUES (N'Orson', N'Scott', N'Card', N'EE.UU')
INSERT INTO TB_AUTOR ( nom_aut, apep_aut, apem_aut, cod_pais) VALUES (N'H', N'Wells', N'G', N'Reino Unido')
INSERT INTO TB_AUTOR ( nom_aut, apep_aut, apem_aut, cod_pais) VALUES (N'Joe', N'Haldeman', N'M', N'EE.UU')
INSERT INTO TB_AUTOR ( nom_aut, apep_aut, apem_aut, cod_pais) VALUES (N'George', N'Orwell', N'S', N'Reino Unido')
INSERT INTO TB_AUTOR ( nom_aut, apep_aut, apem_aut, cod_pais) VALUES (N'Frank', N'Herbert', N'P', N'EE.UU')
INSERT INTO TB_AUTOR ( nom_aut, apep_aut, apem_aut, cod_pais) VALUES (N'Christine', N'Nöstlinger', N'L', N'Austria')
INSERT INTO TB_AUTOR ( nom_aut, apep_aut, apem_aut, cod_pais) VALUES (N'Ana Maria', N'Machado', N'J', N'Brasil')
INSERT INTO TB_AUTOR ( nom_aut, apep_aut, apem_aut, cod_pais) VALUES (N'Irene ', N'Cabrejos', N'C', N'Agentina')
INSERT INTO TB_AUTOR ( nom_aut, apep_aut, apem_aut, cod_pais) VALUES (N'Pilar ', N'Mateos', N'M', N'España')
INSERT INTO TB_AUTOR ( nom_aut, apep_aut, apem_aut, cod_pais) VALUES (N'Sergio ', N'Andricaín', N'P', N'Cuba')
INSERT INTO TB_AUTOR ( nom_aut, apep_aut, apem_aut, cod_pais) VALUES (N'Mauricio', N'Paredes ', N'N', N'Chile')
INSERT INTO TB_AUTOR ( nom_aut, apep_aut, apem_aut, cod_pais) VALUES (N'Fencndo ', N'Gomez ', N'Campo', N'Colombia')
INSERT INTO TB_AUTOR ( nom_aut, apep_aut, apem_aut, cod_pais) VALUES (N'Sally  ', N'Warner', N'B', N'EE.UU')
INSERT INTO TB_AUTOR ( nom_aut, apep_aut, apem_aut, cod_pais) VALUES (N'Claus', N'Priesner', N'P', N'España')
INSERT INTO TB_AUTOR ( nom_aut, apep_aut, apem_aut, cod_pais) VALUES (N'AA.VV', N'TIKAL', N'TIKAL', N'España')
INSERT INTO TB_AUTOR ( nom_aut, apep_aut, apem_aut, cod_pais) VALUES (N'Juan', N'Porras', N'C', N'Argentina')
INSERT INTO TB_AUTOR ( nom_aut, apep_aut, apem_aut, cod_pais) VALUES (N'Le rond Dalembert', N'Diderot', N'D', N'España')
INSERT INTO TB_AUTOR ( nom_aut, apep_aut, apem_aut, cod_pais) VALUES (N'LIBSA', N'-', N'-', N'España')

-------------------------------------------------------------------------------------------------
-------------------------------REGISTROS TB_EDITORIAL--------------------------------------------
-------------------------------------------------------------------------------------------------
INSERT INTO TB_EDITORIAL (nom_edi, dir_edi, tel_edi) VALUES (N'Viking Press', N'Lousiana Av 123', N'450-2320')
INSERT INTO TB_EDITORIAL (nom_edi, dir_edi, tel_edi) VALUES (N'Saturday Evening Post', N'Illinois Av 345', N'450-2321')
INSERT INTO TB_EDITORIAL (nom_edi, dir_edi, tel_edi) VALUES (N'Pulp Weird Tales', N'Porahi 147', N'450-2322')
INSERT INTO TB_EDITORIAL (nom_edi, dir_edi, tel_edi) VALUES (N'Double Day', N'Direccion 159', N'450-2323')
INSERT INTO TB_EDITORIAL (nom_edi, dir_edi, tel_edi) VALUES (N'Viking Press', N'Lousiana Av 123', N'450-2324')
INSERT INTO TB_EDITORIAL (nom_edi, dir_edi, tel_edi) VALUES (N'Constable & Robinson', N'Robinlandia Av 158', N'450-2325')
INSERT INTO TB_EDITORIAL (nom_edi, dir_edi, tel_edi) VALUES (N'Doubleday', N'Diadoble Jr 456', N'450-2326')
INSERT INTO TB_EDITORIAL (nom_edi, dir_edi, tel_edi) VALUES (N'Versal', N'Salver Av 001', N'450-2327')
INSERT INTO TB_EDITORIAL (nom_edi, dir_edi, tel_edi) VALUES (N'Lackington', N'Luckyinton 150 dpto', N'450-2328')
INSERT INTO TB_EDITORIAL (nom_edi, dir_edi, tel_edi) VALUES (N'Double Day', N'Diadoble Jr 456', N'450-2329')
INSERT INTO TB_EDITORIAL (nom_edi, dir_edi, tel_edi) VALUES (N'Sudamericana', N'Sudamerica 123', N'450-2330')
INSERT INTO TB_EDITORIAL (nom_edi, dir_edi, tel_edi) VALUES (N'Kurt Wolff', N'Lobolandia 235', N'450-2331')
INSERT INTO TB_EDITORIAL (nom_edi, dir_edi, tel_edi) VALUES (N'El mensajero ruso', N'Putinlandia Av 007', N'450-2332')
INSERT INTO TB_EDITORIAL (nom_edi, dir_edi, tel_edi) VALUES (N'George Allen', N'Av. El curioso 123', N'450-2333')
INSERT INTO TB_EDITORIAL (nom_edi, dir_edi, tel_edi) VALUES (N'Revue de Paris', N'Paris dpto 190', N'450-2334')
INSERT INTO TB_EDITORIAL (nom_edi, dir_edi, tel_edi) VALUES (N'Cultura Económica', N'Pobrelandia 158', N'450-2335')
INSERT INTO TB_EDITORIAL (nom_edi, dir_edi, tel_edi) VALUES (N'Richard Bentley', N'Bentley Av 920', N'450-2336')
INSERT INTO TB_EDITORIAL (nom_edi, dir_edi, tel_edi) VALUES (N'Random Print', N'Lulxd jr raymondi 123', N'450-2337')
INSERT INTO TB_EDITORIAL (nom_edi, dir_edi, tel_edi) VALUES (N'Losada', N'Unalosa Av 920', N'450-2338')
INSERT INTO TB_EDITORIAL (nom_edi, dir_edi, tel_edi) VALUES (N'Olympia Press', N'El olimpo 129', N'450-2339')
INSERT INTO TB_EDITORIAL (nom_edi, dir_edi, tel_edi) VALUES (N'Anagrama', N'Direccion 159', N'450-2340')
INSERT INTO TB_EDITORIAL (nom_edi, dir_edi, tel_edi) VALUES (N'LSU Press', N'Lousiana Av 123', N'450-2341')
INSERT INTO TB_EDITORIAL (nom_edi, dir_edi, tel_edi) VALUES (N'J. W. Arrowsmith', N'Robinlandia Av 158', N'450-2342')
INSERT INTO TB_EDITORIAL (nom_edi, dir_edi, tel_edi) VALUES (N'Pan Books', N'Diadoble Jr 456', N'450-2343')
INSERT INTO TB_EDITORIAL (nom_edi, dir_edi, tel_edi) VALUES (N'Victor Gollancz Ltd', N'Salver Av 001', N'450-2344')
INSERT INTO TB_EDITORIAL (nom_edi, dir_edi, tel_edi) VALUES (N'Pan Books', N'Luckyinton 150 dpto', N'450-2345')
INSERT INTO TB_EDITORIAL (nom_edi, dir_edi, tel_edi) VALUES (N'Pan Books', N'Diadoble Jr 456', N'450-2346')
INSERT INTO TB_EDITORIAL (nom_edi, dir_edi, tel_edi) VALUES (N'Irish press', N'Sudamerica 123', N'450-2347')
INSERT INTO TB_EDITORIAL (nom_edi, dir_edi, tel_edi) VALUES (N'Punch', N'Lobolandia 235', N'450-2348')
INSERT INTO TB_EDITORIAL (nom_edi, dir_edi, tel_edi) VALUES (N'Punto de lectura', N'Putinlandia Av 007', N'450-2349')
INSERT INTO TB_EDITORIAL (nom_edi, dir_edi, tel_edi) VALUES (N'DC Comics', N'Burbank, California, EE. UU.', N'452-8742')
INSERT INTO TB_EDITORIAL (nom_edi, dir_edi, tel_edi) VALUES (N'Les Humanoïdes Associés', N'	Paris, France', N'724-5464')
INSERT INTO TB_EDITORIAL (nom_edi, dir_edi, tel_edi) VALUES (N'Vertigo', N'	Ciudad de Nueva York, Nueva York', N'594-6388')
INSERT INTO TB_EDITORIAL (nom_edi, dir_edi, tel_edi) VALUES (N'Futabasha', N'Japan', N'489-8952')
INSERT INTO TB_EDITORIAL (nom_edi, dir_edi, tel_edi) VALUES (N'Apex Novelties', N'San Francisco, California', N'547-6325')
INSERT INTO TB_EDITORIAL (nom_edi, dir_edi, tel_edi) VALUES (N'Marvel Comics', N'Nueva York, Nueva York, Estados Unidos', N'456-5573')
INSERT INTO TB_EDITORIAL (nom_edi, dir_edi, tel_edi) VALUES (N'Claridad', N'Vidal 2649, Buenos Aires - Argentina', N'5219-2259')
INSERT INTO TB_EDITORIAL (nom_edi, dir_edi, tel_edi) VALUES (N'Aust.ral', N'Av. Diagonal,08034 Barcelona - España', N'662-664')
INSERT INTO TB_EDITORIAL (nom_edi, dir_edi, tel_edi) VALUES (N'Alianza', N'Calle de Juan Ignacio Luca de Tena, 15, 28027 Madrid, España', N'+34 91393-8888')
INSERT INTO TB_EDITORIAL (nom_edi, dir_edi, tel_edi) VALUES (N'Editorial Nascimento', N'Chile', N'4818-4488')
INSERT INTO TB_EDITORIAL (nom_edi, dir_edi, tel_edi) VALUES (N'Espasa Calpe S.A.', N'Calle de Alcalá, 96, 28009 Madrid, España', N'+34 91432-2261')
INSERT INTO TB_EDITORIAL (nom_edi, dir_edi, tel_edi) VALUES (N'Colección Visor de Poesía', N'Barcelona, España', N'+34 91549-2655')
INSERT INTO TB_EDITORIAL (nom_edi, dir_edi, tel_edi) VALUES (N'Modernismo hispanoamericano', N'Barcelona, España', N'+34 74542-4821')
INSERT INTO TB_EDITORIAL (nom_edi, dir_edi, tel_edi) VALUES (N'Biblioteca Clásica Castalia', N'Avda. Diagonal, 519-521, 2º piso, 08029 de Barcelona', N'0034 934949720')
INSERT INTO TB_EDITORIAL (nom_edi, dir_edi, tel_edi) VALUES (N'Editorial Sudamericana', N'Humberto Primo 555, Capital Federal-Uruguay', N'2901-3668')
INSERT INTO TB_EDITORIAL (nom_edi, dir_edi, tel_edi) VALUES (N'Prometeo', N'Pringles 521, Cdad. Autónoma de Buenos Aires, Argentina', N'+54 11 4862-6794')
INSERT INTO TB_EDITORIAL (nom_edi, dir_edi, tel_edi) VALUES (N'Teodolito', N'Rua de Costa Cabral 859', N'225074220')
INSERT INTO TB_EDITORIAL (nom_edi, dir_edi, tel_edi) VALUES (N'Destino Clasico', N'Barcelona-España', N'5634-653434')
INSERT INTO TB_EDITORIAL (nom_edi, dir_edi, tel_edi) VALUES (N'Auguirre Ed.', N'Santiago de Chile, Chile', N'3642-5542')
INSERT INTO TB_EDITORIAL (nom_edi, dir_edi, tel_edi) VALUES (N'La Nación', N'Buenos Aires-Argentina', N'6090-5000')
INSERT INTO TB_EDITORIAL (nom_edi, dir_edi, tel_edi) VALUES (N'Debolsillo', N'Buenos Aires-Argentina', N'4378-5533')
INSERT INTO TB_EDITORIAL (nom_edi, dir_edi, tel_edi) VALUES (N'Editorial Edhasa', N'Av. Córdoba 744, 1054, Cdad. Autónoma de Buenos Aires, Argentina', N'541-4393')
INSERT INTO TB_EDITORIAL (nom_edi, dir_edi, tel_edi) VALUES (N'Editorial Andres Bello', N'Ángel 15, Colonia San José Insurgentes,Delegación Benito Juárez,C.P. 03900 México DF', N'561-1548')
INSERT INTO TB_EDITORIAL (nom_edi, dir_edi, tel_edi) VALUES (N'Editorial EDICIONES B', N'Carrer del Consell de Cent, 425-427, 08009 Barcelona, España', N'349-4846')
INSERT INTO TB_EDITORIAL (nom_edi, dir_edi, tel_edi) VALUES (N'Editorial Tor Books', N' Buenos Aires - 1951', N'412-8618')
INSERT INTO TB_EDITORIAL (nom_edi, dir_edi, tel_edi) VALUES (N'Editorial Cantaro', N'-', N'274-2817')
INSERT INTO TB_EDITORIAL (nom_edi, dir_edi, tel_edi) VALUES (N'Editorial Norma', N'Avenida Canaval Y Moreyra, 345 - San Isidro', N'710-3000')
INSERT INTO TB_EDITORIAL (nom_edi, dir_edi, tel_edi) VALUES (N'Editorial St. Martins Press', N'New York, 1971', N'291-8810')
INSERT INTO TB_EDITORIAL (nom_edi, dir_edi, tel_edi) VALUES (N'Editorial Chilton Company', N'Chile. ... U.p. Chilton, Bruce D. Chilton', N'482-3918')
INSERT INTO TB_EDITORIAL (nom_edi, dir_edi, tel_edi) VALUES (N'Editorial Alfaguara', N'Avenida Primavera, Primavera 2160, Santiago de Surco 15023', N'96283551')
INSERT INTO TB_EDITORIAL (nom_edi, dir_edi, tel_edi) VALUES (N'Editorial Panamericana', N'Av. Aviación 2334, San Borja 15034', N'938-7856')
INSERT INTO TB_EDITORIAL (nom_edi, dir_edi, tel_edi) VALUES (N'Editorial Herder', N'Carrer de Provença, 388, 08025 Barcelona, España', N'937-3048')
INSERT INTO TB_EDITORIAL (nom_edi, dir_edi, tel_edi) VALUES (N'Editorial Tikal', N'España,barcelona av. Colonial 234', N'239-2432')
INSERT INTO TB_EDITORIAL (nom_edi, dir_edi, tel_edi) VALUES (N'Editorial billiken', N'Azopardo 565, 1107, Cdad. Autónoma de Buenos Aires, Argentina', N'233-2342')
INSERT INTO TB_EDITORIAL (nom_edi, dir_edi, tel_edi) VALUES (N'Editorial Tecnos', N'España, Calle de Juan Ignacio Luca de Tena 15.', N'231-1312')
INSERT INTO TB_EDITORIAL (nom_edi, dir_edi, tel_edi) VALUES (N'Editorial libbsa', N'Calle de San Rafael, 4, 28108 Alcobendas, Madrid, España', N'937-3048')
INSERT INTO TB_EDITORIAL (nom_edi, dir_edi, tel_edi) VALUES (N'Editorial larousse', N'Carrer de Mallorca, 45, 08029 Barcelona, España', N'241-4321')
INSERT INTO TB_EDITORIAL (nom_edi, dir_edi, tel_edi) VALUES (N'Editorial Edhasa', N'Cdad. Autónoma de Buenos Aires, Argentina', N'541-4393')
INSERT INTO TB_EDITORIAL (nom_edi, dir_edi, tel_edi) VALUES (N'Editorial Andres Bello', N'Delegación Benito Juárez,México DF', N'561-1548')
INSERT INTO TB_EDITORIAL (nom_edi, dir_edi, tel_edi) VALUES (N'Editorial EDICIONES B', N'Carrer del Consell de Cent,Barcelona, España', N'349-4846')
INSERT INTO TB_EDITORIAL (nom_edi, dir_edi, tel_edi) VALUES (N'Editorial Tor Books', N' Buenos Aires - 1951 ', N'412-8618')
INSERT INTO TB_EDITORIAL (nom_edi, dir_edi, tel_edi) VALUES (N'Editorial Cantaro', N'-', N'274-2817')
INSERT INTO TB_EDITORIAL (nom_edi, dir_edi, tel_edi) VALUES (N'Editorial Norma', N'Avenida Canaval Y Moreyra, 345 - San Isidro', N'710-3000')
INSERT INTO TB_EDITORIAL (nom_edi, dir_edi, tel_edi) VALUES (N'Editorial St. Martin', N'New York, 1971', N'291-8810')
INSERT INTO TB_EDITORIAL (nom_edi, dir_edi, tel_edi) VALUES (N'Editorial Chilton', N'Chile. ... U.p. Chilton, Bruce D. Chilton', N'482-3918')
INSERT INTO TB_EDITORIAL (nom_edi, dir_edi, tel_edi) VALUES (N'Editorial Alfaguara', N'Avenida Primavera 2160, Santiago de Surco 15023', N'962-3551')
INSERT INTO TB_EDITORIAL (nom_edi, dir_edi, tel_edi) VALUES (N'Editorial Panamericana', N'Av. Aviación 2334, San Borja 15034', N'938-7856')
INSERT INTO TB_EDITORIAL (nom_edi, dir_edi, tel_edi) VALUES (N'Editorial Herder', N'Carrer de Provença, Barcelona, España', N'937-3048')
INSERT INTO TB_EDITORIAL (nom_edi, dir_edi, tel_edi) VALUES (N'Editorial Tikal', N'España,barcelona av. Colonial 234', N'239-2432')
INSERT INTO TB_EDITORIAL (nom_edi, dir_edi, tel_edi) VALUES (N'Editorial billiken', N'Cdad. Autónoma de Buenos Aires, Argentina', N'233-2342')
INSERT INTO TB_EDITORIAL (nom_edi, dir_edi, tel_edi) VALUES (N'Editorial Tecnos', N'España, Calle de Juan Ignacio Luca de Tena 15.', N'231-1312')
INSERT INTO TB_EDITORIAL (nom_edi, dir_edi, tel_edi) VALUES (N'Editorial libbsa', N'Calle de San Rafael, 4,Alcobendas, Madrid, España', N'937-3048')
INSERT INTO TB_EDITORIAL (nom_edi, dir_edi, tel_edi) VALUES (N'Editorial larousse', N'Carrer de Mallorca, 45, 08029 Barcelona, España', N'241-4321')

-------------------------------------------------------------------------------------------------
-------------------------------REGISTROS TB_ENCUADERNACION---------------------------------------
-------------------------------------------------------------------------------------------------
INSERT INTO TB_ENCUADERNACION (desc_enc) VALUES (N'Rústica')
INSERT INTO TB_ENCUADERNACION (desc_enc) VALUES (N'Cartoné')
INSERT INTO TB_ENCUADERNACION (desc_enc) VALUES (N'Americana')
INSERT INTO TB_ENCUADERNACION (desc_enc) VALUES (N'Piel')
INSERT INTO TB_ENCUADERNACION (desc_enc) VALUES (N'Espiral')
INSERT INTO TB_ENCUADERNACION (desc_enc) VALUES (N'Alzado')
INSERT INTO TB_ENCUADERNACION (desc_enc) VALUES (N'Tapa blanca')

-------------------------------------------------------------------------------------------------
-------------------------------REGISTROS TB_GENERO---------------------------------------
-------------------------------------------------------------------------------------------------
INSERT INTO TB_GENERO (nom_gen) VALUES (N'Terror')
INSERT INTO TB_GENERO (nom_gen) VALUES (N'Drama')
INSERT INTO TB_GENERO (nom_gen) VALUES (N'Comedia')
INSERT INTO TB_GENERO (nom_gen) VALUES (N'Comic')
INSERT INTO TB_GENERO (nom_gen) VALUES (N'Poesia')
INSERT INTO TB_GENERO (nom_gen) VALUES (N'Novela')
INSERT INTO TB_GENERO (nom_gen) VALUES (N'Ciencia Ficcion')
INSERT INTO TB_GENERO (nom_gen) VALUES (N'Infantil')
INSERT INTO TB_GENERO (nom_gen) VALUES (N'Enciclopedia/Manual')

-------------------------------------------------------------------------------------------------
-------------------------------REGISTROS TB_PREGUNTA---------------------------------------
-------------------------------------------------------------------------------------------------
INSERT INTO TB_PREGUNTA (desc_pre) VALUES (N'Nombre de tu primer enamorado(a)')
INSERT INTO TB_PREGUNTA (desc_pre) VALUES (N'Lugar de nacimiento de la madre')
INSERT INTO TB_PREGUNTA (desc_pre) VALUES (N'Mejor amigo de la infancia')
INSERT INTO TB_PREGUNTA (desc_pre) VALUES (N'Nombre de la primera mascota')
INSERT INTO TB_PREGUNTA (desc_pre) VALUES (N'Profesor Favorito')
INSERT INTO TB_PREGUNTA (desc_pre) VALUES (N'Personaje historico favorito')
INSERT INTO TB_PREGUNTA (desc_pre) VALUES (N'Ocupacion del abuelo')
INSERT INTO TB_PREGUNTA (desc_pre) VALUES (N'Cuando fue tu primera vez')

-------------------------------------------------------------------------------------------------
-------------------------------REGISTROS TB_TIPOTARJETA-----------------------------------------
-------------------------------------------------------------------------------------------------
INSERT INTO TB_TIPOTARJETA (desc_ttar) VALUES (N'Visa')
INSERT INTO TB_TIPOTARJETA (desc_ttar) VALUES (N'Mastercard')
INSERT INTO TB_TIPOTARJETA (desc_ttar) VALUES (N'AmericanExpress')
INSERT INTO TB_TIPOTARJETA (desc_ttar) VALUES (N'CitiBank')
INSERT INTO TB_TIPOTARJETA (desc_ttar) VALUES (N'Discover')

-------------------------------------------------------------------------------------------------
-------------------------------REGISTROS TB_TIPOUSUARIO------------------------------------------
-------------------------------------------------------------------------------------------------
INSERT INTO TB_TIPOUSUARIO (nom_tusu, desc_tusu) VALUES (N'Administrador', N'Acceso a mantenimientos')
INSERT INTO TB_TIPOUSUARIO (nom_tusu, desc_tusu) VALUES (N'Cliente', N'Usuario web registrado')

-------------------------------------------------------------------------------------------------
-------------------------------REGISTROS TB_USUARIO----------------------------------------------
-------------------------------------------------------------------------------------------------
INSERT INTO TB_USUARIO (id_usu,usu_usu, pwd_usu, cod_tusu, nom_usu, apep_usu, apem_usu, mail_usu, dni_usu, cod_pre, res_usu, foto_usu, est_usu, pre_usu) VALUES (1,N'ADMIN', N'ADMIN', N'1', N'ADMINISTRADOR', N'ADMIN', N'ADMIN', N'ADMIN@ADMIN.com', N'ADMIN', N'1', N'ADMIN', N'10', N'ACTIVO', N'1,0,1,0,0,0,1,0,1')
INSERT INTO TB_USUARIO (id_usu,usu_usu, pwd_usu, cod_tusu, nom_usu, apep_usu, apem_usu, mail_usu, dni_usu, cod_pre, res_usu, foto_usu, est_usu, pre_usu) VALUES (2,N'DEV96', N'123456', N'2', N'MARK', N'ARROYO', N'GARCIA', N'DEV96@gmail.com', N'45240904', N'1', N'Catherine', null, N'ACTIVO', N'1,0,1,0,0,0,1,0,1')

-------------------------------------------------------------------------------------------------
-------------------------------REGISTROS TB_LIBRO------------------------------------------------
-------------------------------------------------------------------------------------------------
INSERT INTO TB_LIBRO (cod_aut, cod_edi, cod_enc, cod_gen, tit_lib, pais_lib, fpub_lib, idi_lib, des_lib, ISBN_lib, pag_lib, pre_lib, stock_lib, vend_lib, ruta_lib) VALUES ('01', 1, N'1', N'1', N'El resplandor', N'Estados Unidos', N'1980-11-03', N'Inglés', N'Best-seller de terror de Stephen King', N'978-0-385-121', N'447', N'50.0000', N'200', N'120', N'')
INSERT INTO TB_LIBRO (cod_aut, cod_edi, cod_enc, cod_gen, tit_lib, pais_lib, fpub_lib, idi_lib, des_lib, ISBN_lib, pag_lib, pre_lib, stock_lib, vend_lib, ruta_lib) VALUES ('02', 2, N'4', N'1', N'El gato Negro', N'Estados Unidos', N'1843-08-19', N'Inglés', N'Recordado libro de terror de Poe', N'874067960', N'20', N'40.0000', N'200', N'100', N'')
INSERT INTO TB_LIBRO (cod_aut, cod_edi, cod_enc, cod_gen, tit_lib, pais_lib, fpub_lib, idi_lib, des_lib, ISBN_lib, pag_lib, pre_lib, stock_lib, vend_lib, ruta_lib) VALUES ('03', 3, N'5', N'1', N'El llamado de Cthulu', N'Estados Unidos', N'1960-04-10', N'Inglés', N'Cuento memorable de Howard Lovecraft', N'1639186181', N'100', N'50.0000', N'200', N'70', N'')
INSERT INTO TB_LIBRO (cod_aut, cod_edi, cod_enc, cod_gen, tit_lib, pais_lib, fpub_lib, idi_lib, des_lib, ISBN_lib, pag_lib, pre_lib, stock_lib, vend_lib, ruta_lib) VALUES ('01', 4, N'2', N'1', N'Carrie', N'Estados Unidos', N'1924-01-27', N'Inglés', N'Chica molesta destruye cosas', N'0-385-08695-4', N'232', N'40.0000', N'200', N'70', N'')
INSERT INTO TB_LIBRO (cod_aut, cod_edi, cod_enc, cod_gen, tit_lib, pais_lib, fpub_lib, idi_lib, des_lib, ISBN_lib, pag_lib, pre_lib, stock_lib, vend_lib, ruta_lib) VALUES ('01', 5, N'3', N'1', N'IT', N'Estados Unidos', N'1968-06-20', N'Inglés', N'Payaso maligno que no solo es payaso', N'0-670-81302-8', N'1503', N'60.0000', N'200', N'130', N'')
INSERT INTO TB_LIBRO (cod_aut, cod_edi, cod_enc, cod_gen, tit_lib, pais_lib, fpub_lib, idi_lib, des_lib, ISBN_lib, pag_lib, pre_lib, stock_lib, vend_lib, ruta_lib) VALUES ('06', 6, N'7', N'1', N'Drácula', N'Reino Unido', N'1897-05-26', N'Inglés', N'Sujeto pálido muerde virgenes', N'9700762394', N'200', N'60.0000', N'200', N'100', N'')
INSERT INTO TB_LIBRO (cod_aut, cod_edi, cod_enc, cod_gen, tit_lib, pais_lib, fpub_lib, idi_lib, des_lib, ISBN_lib, pag_lib, pre_lib, stock_lib, vend_lib, ruta_lib) VALUES ('07', 7, N'6', N'1', N'Crónicas Marcianas', N'Estados Unidos', N'1956-04-18', N'Inglés', N'Aliens malignos atacan.', N'978-2-207-30001-5', N'244', N'30.0000', N'200', N'80', N'')
INSERT INTO TB_LIBRO (cod_aut, cod_edi, cod_enc, cod_gen, tit_lib, pais_lib, fpub_lib, idi_lib, des_lib, ISBN_lib, pag_lib, pre_lib, stock_lib, vend_lib, ruta_lib) VALUES ('08', 8, N'1', N'1', N'El juego de las maldiciones', N'Reino Unido', N'1971-02-15', N'Inglés', N'Un juego bien maldito.', N'84-86311-70-5', N'300', N'50.0000', N'200', N'70', N'')
INSERT INTO TB_LIBRO (cod_aut, cod_edi, cod_enc, cod_gen, tit_lib, pais_lib, fpub_lib, idi_lib, des_lib, ISBN_lib, pag_lib, pre_lib, stock_lib, vend_lib, ruta_lib) VALUES ('09', 9, N'4', N'1', N'Frankenstein', N'Inglaterra', N'1818-01-01', N'Inglés', N'Sujeto crea a tipo malo con clavos en la cabeza', N'97884-7702-739-3', N'288', N'60.0000', N'200', N'110', N'')
INSERT INTO TB_LIBRO (cod_aut, cod_edi, cod_enc, cod_gen, tit_lib, pais_lib, fpub_lib, idi_lib, des_lib, ISBN_lib, pag_lib, pre_lib, stock_lib, vend_lib, ruta_lib) VALUES ('10', 10, N'5', N'1', N'Psicosis', N'Ingles', N'1978-08-21', N'Inglés', N'Sujeto cree que su mama esta viva y acuchilla en duchas', N'97884-6161-739-3', N'300', N'50.0000', N'200', N'80', N'')
INSERT INTO TB_LIBRO (cod_aut, cod_edi, cod_enc, cod_gen, tit_lib, pais_lib, fpub_lib, idi_lib, des_lib, ISBN_lib, pag_lib, pre_lib, stock_lib, vend_lib, ruta_lib) VALUES ('11', 11, N'2', N'2', N'Cien años de soledad', N'Colombia', N'1911-06-24', N'Español', N'Un lugar bien mágico y cosas malas pasan.', N'84-376-0494-X', N'471', N'60.0000', N'200', N'100', N'')
INSERT INTO TB_LIBRO (cod_aut, cod_edi, cod_enc, cod_gen, tit_lib, pais_lib, fpub_lib, idi_lib, des_lib, ISBN_lib, pag_lib, pre_lib, stock_lib, vend_lib, ruta_lib) VALUES ('12', 12, N'3', N'2', N'La Metamorfosis', N'Hungaria', N'1954-07-05', N'Alemán', N'Pobre hombre amance con cabeza de mosca.', N'4968-361-131', N'95', N'40.0000', N'200', N'50', N'')
INSERT INTO TB_LIBRO (cod_aut, cod_edi, cod_enc, cod_gen, tit_lib, pais_lib, fpub_lib, idi_lib, des_lib, ISBN_lib, pag_lib, pre_lib, stock_lib, vend_lib, ruta_lib) VALUES ('13', 13, N'7', N'2', N'Ana Karenina', N'Rusia', N'1875-01-19', N'Ruso', N'Ana es bien Karenina.', N'220005468', N'325', N'60.0000', N'200', N'100', N'')
INSERT INTO TB_LIBRO (cod_aut, cod_edi, cod_enc, cod_gen, tit_lib, pais_lib, fpub_lib, idi_lib, des_lib, ISBN_lib, pag_lib, pre_lib, stock_lib, vend_lib, ruta_lib) VALUES ('14', 14, N'6', N'2', N'El señor de los anillos', N'Reino Unido', N'1934-07-19', N'Inglés', N'Frodo encuentra un anillo y cosas malas pasan.', N'84-450-7032-0', N'1368', N'50.0000', N'200', N'80', N'')
INSERT INTO TB_LIBRO (cod_aut, cod_edi, cod_enc, cod_gen, tit_lib, pais_lib, fpub_lib, idi_lib, des_lib, ISBN_lib, pag_lib, pre_lib, stock_lib, vend_lib, ruta_lib) VALUES ('15', 15, N'1', N'2', N'Madame Bovary', N'Francia', N'1856-10-12', N'Francés', N'Novela antigua de mujer loca que mata gente.', N'642-3582-136', N'250', N'60.0000', N'200', N'110', N'')
INSERT INTO TB_LIBRO (cod_aut, cod_edi, cod_enc, cod_gen, tit_lib, pais_lib, fpub_lib, idi_lib, des_lib, ISBN_lib, pag_lib, pre_lib, stock_lib, vend_lib, ruta_lib) VALUES ('16', 16, N'4', N'2', N'Pedro Páramo', N'Mexico', N'1994-03-20', N'Español', N'Pedro esta loco y vive en ciudad inexistente.', N'968-16-4950-8', N'300', N'40.0000', N'200', N'100', N'')
INSERT INTO TB_LIBRO (cod_aut, cod_edi, cod_enc, cod_gen, tit_lib, pais_lib, fpub_lib, idi_lib, des_lib, ISBN_lib, pag_lib, pre_lib, stock_lib, vend_lib, ruta_lib) VALUES ('17', 17, N'5', N'2', N'Moby-Dick', N'Estados Unidos', N'1851-10-18', N'Inglés', N'Sujeto y muchacho viven en ballena lol.', N'6161-7544-116', N'823', N'50.0000', N'200', N'90', N'')
INSERT INTO TB_LIBRO (cod_aut, cod_edi, cod_enc, cod_gen, tit_lib, pais_lib, fpub_lib, idi_lib, des_lib, ISBN_lib, pag_lib, pre_lib, stock_lib, vend_lib, ruta_lib) VALUES ('18', 18, N'2', N'2', N'Romeo y Julieta', N'Inglaterra', N'1996-12-13', N'Inglés', N'Dos individuos enamorados friegan a sus familias y todos mueren.', N'36137-7171-1', N'600', N'50.0000', N'200', N'100', N'')
INSERT INTO TB_LIBRO (cod_aut, cod_edi, cod_enc, cod_gen, tit_lib, pais_lib, fpub_lib, idi_lib, des_lib, ISBN_lib, pag_lib, pre_lib, stock_lib, vend_lib, ruta_lib) VALUES ('19', 19, N'3', N'2', N'La casa de Bernarda Alba', N'España', N'1925-07-16', N'Español', N'La verdad no estoy seguro.', N'3161-1613-765', N'300', N'50.0000', N'200', N'90', N'')
INSERT INTO TB_LIBRO (cod_aut, cod_edi, cod_enc, cod_gen, tit_lib, pais_lib, fpub_lib, idi_lib, des_lib, ISBN_lib, pag_lib, pre_lib, stock_lib, vend_lib, ruta_lib) VALUES ('20', 20, N'7', N'2', N'Lolita', N'Francia', N'1940-04-20', N'Francés', N'Tampoco tengo idea.', N'1-85715-133-X', N'420', N'60.0000', N'200', N'50', N'')
INSERT INTO TB_LIBRO (cod_aut, cod_edi, cod_enc, cod_gen, tit_lib, pais_lib, fpub_lib, idi_lib, des_lib, ISBN_lib, pag_lib, pre_lib, stock_lib, vend_lib, ruta_lib) VALUES ('21', 21, N'6', N'3', N'Guía del autoestopista galáctico', N'Reino Unido', N'1939-01-25', N'Inglés', N'Comedia espacial o eso creo.', N'2-207-30340-3', N'200', N'60.0000', N'200', N'90', N'')
INSERT INTO TB_LIBRO (cod_aut, cod_edi, cod_enc, cod_gen, tit_lib, pais_lib, fpub_lib, idi_lib, des_lib, ISBN_lib, pag_lib, pre_lib, stock_lib, vend_lib, ruta_lib) VALUES ('22', 22, N'1', N'3', N'La conjura de los necios', N'Estados Unidos', N'1945-04-29', N'Inglés', N'Gente necia haciendo conjuros comicamente.', N'0-8071-0657-7', N'300', N'50.0000', N'200', N'50', N'')
INSERT INTO TB_LIBRO (cod_aut, cod_edi, cod_enc, cod_gen, tit_lib, pais_lib, fpub_lib, idi_lib, des_lib, ISBN_lib, pag_lib, pre_lib, stock_lib, vend_lib, ruta_lib) VALUES ('23', 23, N'4', N'3', N'Tres hombres en un bote', N'Estados Unidos', N'1949-05-18', N'Inglés', N'Tres sujetos haciendo cosas cómicas en un barquito.', N'0-7653-4161-1', N'200', N'40.0000', N'200', N'60', N'')
INSERT INTO TB_LIBRO (cod_aut, cod_edi, cod_enc, cod_gen, tit_lib, pais_lib, fpub_lib, idi_lib, des_lib, ISBN_lib, pag_lib, pre_lib, stock_lib, vend_lib, ruta_lib) VALUES ('24', 24, N'5', N'3', N'La vida, el universo y todo lo demás', N'Reino Unido', N'1994-01-25', N'Inglés', N'La vida el universo y bueno, todo lo demas.', N'2-207-30369-1', N'150', N'60.0000', N'200', N'150', N'')
INSERT INTO TB_LIBRO (cod_aut, cod_edi, cod_enc, cod_gen, tit_lib, pais_lib, fpub_lib, idi_lib, des_lib, ISBN_lib, pag_lib, pre_lib, stock_lib, vend_lib, ruta_lib) VALUES ('25', 25, N'2', N'3', N'Buenos presagios', N'Reino Unido', N'1994-10-03', N'Inglés', N'Hay gente que hace presagios de los buenos.', N'2-84626-021-4', N'400', N'50.0000', N'200', N'90', N'')
INSERT INTO TB_LIBRO (cod_aut, cod_edi, cod_enc, cod_gen, tit_lib, pais_lib, fpub_lib, idi_lib, des_lib, ISBN_lib, pag_lib, pre_lib, stock_lib, vend_lib, ruta_lib) VALUES ('26', 26, N'3', N'3', N'Informe sobre la Tierra', N'Reino Unido', N'1912-03-03', N'Inglés', N'Se informa sobre cosas sobre la tierra.', N'2-207-30548-1', N'300', N'40.0000', N'200', N'50', N'')
INSERT INTO TB_LIBRO (cod_aut, cod_edi, cod_enc, cod_gen, tit_lib, pais_lib, fpub_lib, idi_lib, des_lib, ISBN_lib, pag_lib, pre_lib, stock_lib, vend_lib, ruta_lib) VALUES ('27', 27, N'7', N'3', N'Hasta luego, y gracias por el pescado', N'Reino Unido', N'1927-10-03', N'Inglés', N'Hubo un pescado muy rico y se agradece', N'2-207-30549-X', N'200', N'60.0000', N'200', N'60', N'')
INSERT INTO TB_LIBRO (cod_aut, cod_edi, cod_enc, cod_gen, tit_lib, pais_lib, fpub_lib, idi_lib, des_lib, ISBN_lib, pag_lib, pre_lib, stock_lib, vend_lib, ruta_lib) VALUES ('28', 28, N'6', N'3', N'The Commitments', N'Irlanda', N'1904-12-03', N'Irlandés', N'No hay libros populares de comedia no se por que escogi el genero.', N'0-9512072-0-2', N'150', N'50.0000', N'200', N'150', N'')
INSERT INTO TB_LIBRO (cod_aut, cod_edi, cod_enc, cod_gen, tit_lib, pais_lib, fpub_lib, idi_lib, des_lib, ISBN_lib, pag_lib, pre_lib, stock_lib, vend_lib, ruta_lib) VALUES ('29', 29, N'2', N'3', N'Diario de un don nadie', N'Reino Unido', N'1892-07-12', N'Inglés', N'Casi nadie conoce de la existencia de este libro creo.', N'63166-61617', N'400', N'40.0000', N'200', N'120', N'')
INSERT INTO TB_LIBRO (cod_aut, cod_edi, cod_enc, cod_gen, tit_lib, pais_lib, fpub_lib, idi_lib, des_lib, ISBN_lib, pag_lib, pre_lib, stock_lib, vend_lib, ruta_lib) VALUES ('30', 30, N'1', N'3', N'El club de la comedia', N'España', N'1998-11-03', N'Español', N'Este no solo no es conocido tambien es malo, numero al azar ->', N'9788466369077', N'500', N'70.0000', N'200', N'110', N'')
INSERT INTO TB_LIBRO (cod_aut, cod_edi, cod_enc, cod_gen, tit_lib, pais_lib, fpub_lib, idi_lib, des_lib, ISBN_lib, pag_lib, pre_lib, stock_lib, vend_lib, ruta_lib) VALUES ('31', 31, N'2', N'4', N'La Cosa del Pantano', N'Estados Unidos', N'1984-12-09', N'Ingles', N'Super fuerza, regeneración, control sobre plantas y elementos naturales.', N'972-0-385-38567-1', N'30', N'45.0000', N'200', N'100', N'-')
INSERT INTO TB_LIBRO (cod_aut, cod_edi, cod_enc, cod_gen, tit_lib, pais_lib, fpub_lib, idi_lib, des_lib, ISBN_lib, pag_lib, pre_lib, stock_lib, vend_lib, ruta_lib) VALUES ('32', 32, N'5', N'4', N'La Casta de los Metabarones', N'Francia', N'1992-08-04', N'Frances', N'La historia de una dinastía de guerreros perfectos.', N'482-0-985-44577-2', N'40', N'50.0000', N'200', N'90', N'-')
INSERT INTO TB_LIBRO (cod_aut, cod_edi, cod_enc, cod_gen, tit_lib, pais_lib, fpub_lib, idi_lib, des_lib, ISBN_lib, pag_lib, pre_lib, stock_lib, vend_lib, ruta_lib) VALUES ('33', 33, N'2', N'4', N'The Sandman', N'Estados Unidos', N'1989-05-11', N'Ingles', N'El protagonista de The Sandman es Sueño.', N'411-4-952-29375-3', N'45', N'60.0000', N'200', N'120', N'-')
INSERT INTO TB_LIBRO (cod_aut, cod_edi, cod_enc, cod_gen, tit_lib, pais_lib, fpub_lib, idi_lib, des_lib, ISBN_lib, pag_lib, pre_lib, stock_lib, vend_lib, ruta_lib) VALUES ('34', 31, N'2', N'4', N'Watchmen', N'Estados Unidos', N'1986-10-03', N'Ingles', N'Juvenal muestra en sus sátiras los vicios de la sociedad de la Antigua Roma.', N'1-4012-0713-8', N'50', N'69.0000', N'200', N'70', N'-')
INSERT INTO TB_LIBRO (cod_aut, cod_edi, cod_enc, cod_gen, tit_lib, pais_lib, fpub_lib, idi_lib, des_lib, ISBN_lib, pag_lib, pre_lib, stock_lib, vend_lib, ruta_lib) VALUES ('35', 34, N'5', N'4', N'El Lobo Solitario y su Cachorro', N'Estados Unidos', N'1970-09-02', N'Ingles', N'El gran guerrero y maestro del Suio Ryu Ogami Itto.', N'0-920-82953-1', N'70', N'44.0000', N'200', N'130', N'-')
INSERT INTO TB_LIBRO (cod_aut, cod_edi, cod_enc, cod_gen, tit_lib, pais_lib, fpub_lib, idi_lib, des_lib, ISBN_lib, pag_lib, pre_lib, stock_lib, vend_lib, ruta_lib) VALUES ('36', 35, N'2', N'4', N'MAUS', N'Estados Unidos', N'1977-03-15', N'Ingles', N'En Maus Art Spiegelman narra la historia real de su padre.', N'1-285-84525-2', N'50', N'65.0000', N'200', N'100', N'-')
INSERT INTO TB_LIBRO (cod_aut, cod_edi, cod_enc, cod_gen, tit_lib, pais_lib, fpub_lib, idi_lib, des_lib, ISBN_lib, pag_lib, pre_lib, stock_lib, vend_lib, ruta_lib) VALUES ('37', 36, N'4', N'4', N'DAREDEVIL: BORN AGAIN', N'Estados Unidos', N'1986-10-23', N'Ingles', N'La historia detalla el descenso a la locura y la destitución de Matt a manos de Kingpin.', N'2-917-29551-3', N'80', N'30.0000', N'200', N'80', N'-')
INSERT INTO TB_LIBRO (cod_aut, cod_edi, cod_enc, cod_gen, tit_lib, pais_lib, fpub_lib, idi_lib, des_lib, ISBN_lib, pag_lib, pre_lib, stock_lib, vend_lib, ruta_lib) VALUES ('38', 32, N'4', N'4', N'EL INCAL', N'Estados Unidos', N'1981-12-12', N'Ingles', N'Con más de un millón de ejemplares vendidos.', N'84-37821-70-5', N'75', N'55.0000', N'200', N'70', N'-')
INSERT INTO TB_LIBRO (cod_aut, cod_edi, cod_enc, cod_gen, tit_lib, pais_lib, fpub_lib, idi_lib, des_lib, ISBN_lib, pag_lib, pre_lib, stock_lib, vend_lib, ruta_lib) VALUES ('39', 31, N'2', N'4', N'THE DARK KNIGHT RETURNS', N'Estados Unidos', N'1986-03-18', N'Ingles', N'Convirtiéndose en símbolo de una era de superhéroes más violentos y moralmente complejos.', N'93748-8891-749-2', N'100', N'70.0000', N'200', N'98', N'-')
INSERT INTO TB_LIBRO (cod_aut, cod_edi, cod_enc, cod_gen, tit_lib, pais_lib, fpub_lib, idi_lib, des_lib, ISBN_lib, pag_lib, pre_lib, stock_lib, vend_lib, ruta_lib) VALUES ('40', 31, N'5', N'4', N'HELLBOY', N'Estados Unidos', N'1993-09-01', N'Ingles', N'Como un demonio con el nombre de Anung-Un-Rama.', N'1-4012-0713-8', N'50', N'69.0000', N'200', N'70', N'-')
INSERT INTO TB_LIBRO (cod_aut, cod_edi, cod_enc, cod_gen, tit_lib, pais_lib, fpub_lib, idi_lib, des_lib, ISBN_lib, pag_lib, pre_lib, stock_lib, vend_lib, ruta_lib) VALUES ('41', 37, N'2', N'5', N'Poesías Completas I', N'Nicaragua', N'1998-02-15', N'Español', N'Poesías completas es una compilación de hermosos versos.', N'10-987-4824-2', N'120', N'39.0000', N'200', N'40', N'-')
INSERT INTO TB_LIBRO (cod_aut, cod_edi, cod_enc, cod_gen, tit_lib, pais_lib, fpub_lib, idi_lib, des_lib, ISBN_lib, pag_lib, pre_lib, stock_lib, vend_lib, ruta_lib) VALUES ('42', 38, N'1', N'5', N'Rimas y Leyendas', N'España', N'2000-01-19', N'Español', N'El tesoro de oropeles y guinapos que ha ido acumulando la fantasia.', N'4378-386-185', N'175', N'95.0000', N'200', N'60', N'-')
INSERT INTO TB_LIBRO (cod_aut, cod_edi, cod_enc, cod_gen, tit_lib, pais_lib, fpub_lib, idi_lib, des_lib, ISBN_lib, pag_lib, pre_lib, stock_lib, vend_lib, ruta_lib) VALUES ('43', 39, N'5', N'5', N'Antología poética', N'Argentina', N'1981-01-01', N'Español', N'Una de las obras más complejas de la literatura americana.', N'7426-614-824', N'153', N'67.0000', N'200', N'100', N'-')
INSERT INTO TB_LIBRO (cod_aut, cod_edi, cod_enc, cod_gen, tit_lib, pais_lib, fpub_lib, idi_lib, des_lib, ISBN_lib, pag_lib, pre_lib, stock_lib, vend_lib, ruta_lib) VALUES ('44', 40, N'2', N'5', N'Veinte poemas de amor y una canción desesperada', N'Chile', N'1924-04-07', N'Español', N'Es una de las más célebres obras del poeta chileno.', N'22-853-9264-2', N'122', N'70.0000', N'200', N'89', N'-')
INSERT INTO TB_LIBRO (cod_aut, cod_edi, cod_enc, cod_gen, tit_lib, pais_lib, fpub_lib, idi_lib, des_lib, ISBN_lib, pag_lib, pre_lib, stock_lib, vend_lib, ruta_lib) VALUES ('45', 39, N'4', N'5', N'Romancero Gitano', N'España', N'1928-05-27', N'Español', N'Está compuesta por dieciocho romances con temas como la noche, la muerte, el cielo, la luna.', N'96-433-9243-5', N'180', N'47.0000', N'200', N'110', N'-')
INSERT INTO TB_LIBRO (cod_aut, cod_edi, cod_enc, cod_gen, tit_lib, pais_lib, fpub_lib, idi_lib, des_lib, ISBN_lib, pag_lib, pre_lib, stock_lib, vend_lib, ruta_lib) VALUES ('46', 41, N'4', N'5', N'Antología Poética II', N'Argentina', N'2004-11-18', N'Español', N'Mujer comprometida en la lucha por la liberación femenina.', N'174-76-8254-6', N'126', N'70.0000', N'200', N'50', N'-')
INSERT INTO TB_LIBRO (cod_aut, cod_edi, cod_enc, cod_gen, tit_lib, pais_lib, fpub_lib, idi_lib, des_lib, ISBN_lib, pag_lib, pre_lib, stock_lib, vend_lib, ruta_lib) VALUES ('47', 42, N'2', N'5', N'El Olvido Está Lleno de Memoria', N'Uruguay', N'1995-09-22', N'Español', N'Cada vez que nos dan clases de amnesia como si nunca hubieran existido.', N'9374-8264-121', N'166', N'85.0000', N'200', N'90', N'-')
INSERT INTO TB_LIBRO (cod_aut, cod_edi, cod_enc, cod_gen, tit_lib, pais_lib, fpub_lib, idi_lib, des_lib, ISBN_lib, pag_lib, pre_lib, stock_lib, vend_lib, ruta_lib) VALUES ('49', 43, N'5', N'5', N'Crónicas', N'Mexico', N'1897-05-12', N'Español', N'La poesía amorosa del mexicano Amado Nervo.', N'47764-8547-4', N'155', N'98.0000', N'200', N'21', N'-')
INSERT INTO TB_LIBRO (cod_aut, cod_edi, cod_enc, cod_gen, tit_lib, pais_lib, fpub_lib, idi_lib, des_lib, ISBN_lib, pag_lib, pre_lib, stock_lib, vend_lib, ruta_lib) VALUES ('49', 43, N'2', N'5', N'Antología del Amor', N'Argentina', N'1977-10-15', N'Español', N'Este sabor de lágrimas.', N'3161-1613-765', N'121', N'98.0000', N'200', N'100', N'-')
INSERT INTO TB_LIBRO (cod_aut, cod_edi, cod_enc, cod_gen, tit_lib, pais_lib, fpub_lib, idi_lib, des_lib, ISBN_lib, pag_lib, pre_lib, stock_lib, vend_lib, ruta_lib) VALUES ('50', 44, N'2', N'5', N'Poesías Sueltas', N'España', N'1955-12-17', N'Español', N'Uno de los mejores éxitos de Miguel de Cervantes.', N'1-27465-133-X', N'130', N'70.0000', N'200', N'89', N'-')
INSERT INTO TB_LIBRO (cod_aut, cod_edi, cod_enc, cod_gen, tit_lib, pais_lib, fpub_lib, idi_lib, des_lib, ISBN_lib, pag_lib, pre_lib, stock_lib, vend_lib, ruta_lib) VALUES ('51', 45, N'5', N'6', N'Cien Años de Soledad', N'Colombia', N'1967-08-20', N'Español', N'El libro narra la historia de la familia Buendía a lo largo de siete generaciones en el pueblo ficticio de Macondo.', N'84-376-0494-X', N'471', N'80.0000', N'200', N'110', N'-')
INSERT INTO TB_LIBRO (cod_aut, cod_edi, cod_enc, cod_gen, tit_lib, pais_lib, fpub_lib, idi_lib, des_lib, ISBN_lib, pag_lib, pre_lib, stock_lib, vend_lib, ruta_lib) VALUES ('52', 46, N'2', N'6', N'Los cuatro jinetes del Apocalipsis', N'España', N'1929-08-12', N'Español', N'Se trata de una novela ambientada en 1914 en Francia y narra las vicisitudes de la Primera Guerra Mundial.', N'0-8071-8369-7', N'404', N'60.0000', N'200', N'50', N'-')
INSERT INTO TB_LIBRO (cod_aut, cod_edi, cod_enc, cod_gen, tit_lib, pais_lib, fpub_lib, idi_lib, des_lib, ISBN_lib, pag_lib, pre_lib, stock_lib, vend_lib, ruta_lib) VALUES ('53', 47, N'4', N'6', N'Tirano Banderas', N'Uruguay', N'1926-10-13', N'España', N'Narra la caída del dictador sudamericano Santos Banderas.', N'84-239-7319-0', N'200', N'40.0000', N'200', N'90', N'-')
INSERT INTO TB_LIBRO (cod_aut, cod_edi, cod_enc, cod_gen, tit_lib, pais_lib, fpub_lib, idi_lib, des_lib, ISBN_lib, pag_lib, pre_lib, stock_lib, vend_lib, ruta_lib) VALUES ('54', 38, N'4', N'6', N'La familia de Pascual Duarte', N'España', N'1942-05-23', N'Mexico', N'Esta novela es fundadora del género que se dio a conocer como tremendismo.', N'84-233-0732-8', N'160', N'98.0000', N'200', N'21', N'-')
INSERT INTO TB_LIBRO (cod_aut, cod_edi, cod_enc, cod_gen, tit_lib, pais_lib, fpub_lib, idi_lib, des_lib, ISBN_lib, pag_lib, pre_lib, stock_lib, vend_lib, ruta_lib) VALUES ('55', 48, N'2', N'6', N'Cinco horas con Mario', N'España', N'1966-05-01', N'Español', N'El núcleo de esta narración lo constituye el soliloquio de Carmen.', N'978-84-233-4256-3', N'350', N'63.0000', N'200', N'80', N'-')
INSERT INTO TB_LIBRO (cod_aut, cod_edi, cod_enc, cod_gen, tit_lib, pais_lib, fpub_lib, idi_lib, des_lib, ISBN_lib, pag_lib, pre_lib, stock_lib, vend_lib, ruta_lib) VALUES ('51', 49, N'5', N'6', N'El coronel no tiene quien le escriba', N'España', N'1961-11-04', N'Español', N'El coronel es un veterano de la Guerra de los Mil Días que malvive en una casa de una villa de la costa atlántica colombiana junto a su esposa asmática.', N'84-9759-235-2', N'92', N'40.0000', N'200', N'30', N'-')
INSERT INTO TB_LIBRO (cod_aut, cod_edi, cod_enc, cod_gen, tit_lib, pais_lib, fpub_lib, idi_lib, des_lib, ISBN_lib, pag_lib, pre_lib, stock_lib, vend_lib, ruta_lib) VALUES ('55', 38, N'2', N'6', N'Los santos inocentes', N'España', N'1981-12-11', N'Español', N'Una familia de campesinos formada por Paco y Régula y sus cuatro hijos, Nieves, Quirce, Rogelio y Charito (la Niña Chica).', N'2-207-29472-X', N'130', N'70.0000', N'200', N'60', N'-')
INSERT INTO TB_LIBRO (cod_aut, cod_edi, cod_enc, cod_gen, tit_lib, pais_lib, fpub_lib, idi_lib, des_lib, ISBN_lib, pag_lib, pre_lib, stock_lib, vend_lib, ruta_lib) VALUES ('56', 39, N'1', N'6', N'El Señor Presidente', N'España', N'1946-11-23', N'Español', N'La novela, considerada como un punto de referencia en la literatura de América Latina.', N'0-9284572-0-4', N'203', N'60.0000', N'200', N'150', N'-')
INSERT INTO TB_LIBRO (cod_aut, cod_edi, cod_enc, cod_gen, tit_lib, pais_lib, fpub_lib, idi_lib, des_lib, ISBN_lib, pag_lib, pre_lib, stock_lib, vend_lib, ruta_lib) VALUES ('57', 50, N'5', N'6', N'Sobre héroes y tumbas', N'Argentina', N'1961-07-12', N'España', N'La novela narra diversos argumentos paralelamente.', N'978-950-731-398-1', N'417', N'60.0000', N'200', N'120', N'-')
INSERT INTO TB_LIBRO (cod_aut, cod_edi, cod_enc, cod_gen, tit_lib, pais_lib, fpub_lib, idi_lib, des_lib, ISBN_lib, pag_lib, pre_lib, stock_lib, vend_lib, ruta_lib) VALUES ('58', 51, N'2', N'6', N'Como agua para chocolate', N'Mexico', N'1992-11-12', N'Mexico', N'La historia está ambientada en Piedras Negras, Coahuila, México.', N'978-0-7807-3907-9', N'150', N'80.0000', N'200', N'98', N'-')
INSERT INTO TB_LIBRO (cod_aut, cod_edi, cod_enc, cod_gen, tit_lib, pais_lib, fpub_lib, idi_lib, des_lib, ISBN_lib, pag_lib, pre_lib, stock_lib, vend_lib, ruta_lib) VALUES ('82', 77, N'1', N'7', N'Yo, robot', N'España', N'1985-02-10', N'Español', N'La historia comienza cuando Susan Calvin, experta robopsicóloga concede una entrevista a un periodista de la Prensa Interplanetaria, quien hace una investigación sobre la robótica. Aquí ella le narra la evolución que han tenido los robots a través del tiempo, desde los más sencillos hasta los más sofisticados..', N'9781474260404', N'374', N'44.3000', N'12', N'1', N'-')
INSERT INTO TB_LIBRO (cod_aut, cod_edi, cod_enc, cod_gen, tit_lib, pais_lib, fpub_lib, idi_lib, des_lib, ISBN_lib, pag_lib, pre_lib, stock_lib, vend_lib, ruta_lib) VALUES ('83', 78, N'7', N'7', N'De la Tierra a la Luna', N'España', N'1865-07-03', N'Español', N'De la Tierra a la Luna describe los preparativos del viaje espacial, y Alrededor de la Luna relata el viaje propiamente dicho. La acción se sitúa al final de la guerra de Secesión de América.', N'9781438113784', N'125', N'24.3000', N'5', N'5', N'-')
INSERT INTO TB_LIBRO (cod_aut, cod_edi, cod_enc, cod_gen, tit_lib, pais_lib, fpub_lib, idi_lib, des_lib, ISBN_lib, pag_lib, pre_lib, stock_lib, vend_lib, ruta_lib) VALUES ('84', 79, N'1', N'7', N'El marciano', N'España', N'1989-01-15', N'Español', N'Hace seis dias, el astronauta Mark Watney se convirtió en una de las primeras personas en caminar por Marte. Ahora, está seguro de que va a ser la primera persona en morir allí. Después de que una tormenta de polvo casi acabase con él y oblige a su tripulacion a evacuar dándolo por muerto...', N'9781101042465', N'416', N'24.3100', N'15', N'3', N'-')
INSERT INTO TB_LIBRO (cod_aut, cod_edi, cod_enc, cod_gen, tit_lib, pais_lib, fpub_lib, idi_lib, des_lib, ISBN_lib, pag_lib, pre_lib, stock_lib, vend_lib, ruta_lib) VALUES ('85', 80, N'7', N'7', N'El juego de Ender', N'EE.UU', N'1898-09-19', N'Español', N'La Tierra se ve amenazada por una tercera guerra insectora y la humanidad busca un candidato capaz de acabar con ellos. Para encontrarle implantan monitores en los niños para ver lo que ellos ven, sentir lo que sienten …', N'9780856763175', N'384', N'50.3200', N'4', N'4', N'-')
INSERT INTO TB_LIBRO (cod_aut, cod_edi, cod_enc, cod_gen, tit_lib, pais_lib, fpub_lib, idi_lib, des_lib, ISBN_lib, pag_lib, pre_lib, stock_lib, vend_lib, ruta_lib) VALUES ('86', 81, N'7', N'7', N'La guerra de los mundos', N'España', N'1898-09-12', N'Español', N'A los pocos días cae un meteorito pero se descubre que es artificial por lo tanto tiene que haber sido creado por un ser inteligente, este sale de su casa y va hacia donde supone a caído el objeto no identificado.', N'9748738473920', N'244', N'20.0000', N'14', N'1', N'-')
INSERT INTO TB_LIBRO (cod_aut, cod_edi, cod_enc, cod_gen, tit_lib, pais_lib, fpub_lib, idi_lib, des_lib, ISBN_lib, pag_lib, pre_lib, stock_lib, vend_lib, ruta_lib) VALUES ('86', 82, N'7', N'7', N'La máquina del tiempo', N'EE.UU', N'1895-03-12', N'Ingles', N'En La Máquina del tiempo se narra la historia de cómo un científico de finales del siglo XIX viajó a través del tiempo con la intención de conocer el futuro de la humanidad...', N'9837504836863', N'313', N'15.0000', N'5', N'4', N'-')
INSERT INTO TB_LIBRO (cod_aut, cod_edi, cod_enc, cod_gen, tit_lib, pais_lib, fpub_lib, idi_lib, des_lib, ISBN_lib, pag_lib, pre_lib, stock_lib, vend_lib, ruta_lib) VALUES ('87', 83, N'7', N'7', N'La guerra interminable', N'España', N'1895-03-23', N'Español', N'Iniciada en 1997, la guerra con los taurinos dura desde hace siglos. Como pasan de un mundo a otro a velocidades superiores a la de la luz, las tropas de la guerra interminable envejecen sólo unos pocos días mientras en la Tierra pasan los años y el planeta se vuelve cada vez más irreconocible...', N'9715374625783', N'448', N'15.0000', N'7', N'2', N'-')
INSERT INTO TB_LIBRO (cod_aut, cod_edi, cod_enc, cod_gen, tit_lib, pais_lib, fpub_lib, idi_lib, des_lib, ISBN_lib, pag_lib, pre_lib, stock_lib, vend_lib, ruta_lib) VALUES ('88', 79, N'1', N'7', N'1984', N'EE.UU', N'1959-07-02', N'Español', N'1984 sitúa su acción en un Estado totalitario llamado Oceanía, el cuál, ha sido implantado tras una revolución de la población contra el sistema capitalista. Dicho estado es gobernado por un único partido, cuya ideología se denomina INGSOC (Socialismo Inglés). Éste, ejerce un control absoluto sobre sus súbditos, a través de diversos instrumentos de control ..', N'9258736485762', N'326', N'50.9000', N'2', N'5', N'-')
INSERT INTO TB_LIBRO (cod_aut, cod_edi, cod_enc, cod_gen, tit_lib, pais_lib, fpub_lib, idi_lib, des_lib, ISBN_lib, pag_lib, pre_lib, stock_lib, vend_lib, ruta_lib) VALUES ('83', 82, N'7', N'7', N'Veinte mil leguas de viaje submarino', N'España', N'1870-04-12', N'Español', N'Hace aproximadamente un siglo, ningún avión surcaba el cielo y los barcos de vapor eran la novedad. Fue entonces cuando apareció en el mar un monstruo, que era el terror de los marineros. Para atraparlo, se preparo la fragata Abraham Lincoln.Junto con su tripulación viajaba el profesor Aronnax y el asistente consejo. Un día estaban en cubierta cuando vieron a lo lejos al monstruo. La tripulación se preparó para luchar con el monstruo. Pero no hubo lucha...', N'9048364759274', N'576', N'15.0000', N'7', N'3', N'-')
INSERT INTO TB_LIBRO (cod_aut, cod_edi, cod_enc, cod_gen, tit_lib, pais_lib, fpub_lib, idi_lib, des_lib, ISBN_lib, pag_lib, pre_lib, stock_lib, vend_lib, ruta_lib) VALUES ('89', 83, N'7', N'7', N'Dune', N'EE.UU', N'1965-11-12', N'Ingles', N'Arrakis: un planeta desértico donde el agua es el bien más preciado, donde llorar a los muertos es el símbolo de la máxima prodigalidad. Paul Atreides: un adolescente marcado por un destino singular, dotado de extraños poderes, abocado a convertirse en dictador, mesías y ...', N'9727356374956', N'734', N'40.4000', N'20', N'2', N'-')
INSERT INTO TB_LIBRO (cod_aut, cod_edi, cod_enc, cod_gen, tit_lib, pais_lib, fpub_lib, idi_lib, des_lib, ISBN_lib, pag_lib, pre_lib, stock_lib, vend_lib, ruta_lib) VALUES ('90', 82, N'2', N'8', N'Las enfermedades de Franzs', N'España', N'2003-01-10', N'Español', N'Franz quiere enfermarse y no se enferma. Otro día le ocurrió esto: Franz iba a salir de paseo. Quería bajar al sótano para buscar su morral cuando, debido a la oscuridad, tropezó y cayó escaleras abajo. ', N'9102863746534', N'30', N'15.0000', N'12', N'1', N'-')
INSERT INTO TB_LIBRO (cod_aut, cod_edi, cod_enc, cod_gen, tit_lib, pais_lib, fpub_lib, idi_lib, des_lib, ISBN_lib, pag_lib, pre_lib, stock_lib, vend_lib, ruta_lib) VALUES ('91', 82, N'7', N'8', N'Ah,pajarita si yo pudiera', N'España', N'2002-01-09', N'Español', N'La pajarita se enfrenta a quien va a cortar el árbol donde ella esta haciendo su nido. Esta es una divertida historia que muestra como los que parecen mas débiles pueden llegar a ser muy fuertes, permite comprender la importancia de la fortaleza, de la valentía y de la necesidad de empezar a asumir sus propias acciones como individuos..', N'9950374846352', N'23', N'15.0000', N'4', N'2', N'-')
INSERT INTO TB_LIBRO (cod_aut, cod_edi, cod_enc, cod_gen, tit_lib, pais_lib, fpub_lib, idi_lib, des_lib, ISBN_lib, pag_lib, pre_lib, stock_lib, vend_lib, ruta_lib) VALUES ('90', 82, N'7', N'8', N'Nuevas Historias de Franzs en la escuela', N'España', N'2002-09-10', N'Español', N'Franz tiene siete años y seis meses. Como todas las personas, tiene algunos problemas: es el niño más pequeño de la escuela, cuando está nervioso la voz se le pone muy aguda, y a veces lo confunden con una niña, ¡a causa de sus rizos dorados! Pero Franz consigue solucionar casi todos sus problemas... ', N'9859353892303', N'30', N'23.0100', N'8', N'3', N'-')
INSERT INTO TB_LIBRO (cod_aut, cod_edi, cod_enc, cod_gen, tit_lib, pais_lib, fpub_lib, idi_lib, des_lib, ISBN_lib, pag_lib, pre_lib, stock_lib, vend_lib, ruta_lib) VALUES ('93', 82, N'1', N'8', N'Rita en el verano', N'España', N'2013-05-30', N'Español', N'Rita es una niña peculiar: adora la música clásica y el ballet tanto como otros aman el rock o la salsa. Eso si, tiene mucha fantasía y es muy sentimental, casi como un personaje de novela, pero es real. Ese verano Rita viaja con su familia en u lento avión correo. ', N'9023482439222', N'28', N'25.0200', N'6', N'2', N'-')
INSERT INTO TB_LIBRO (cod_aut, cod_edi, cod_enc, cod_gen, tit_lib, pais_lib, fpub_lib, idi_lib, des_lib, ISBN_lib, pag_lib, pre_lib, stock_lib, vend_lib, ruta_lib) VALUES ('94', 82, N'7', N'8', N'La bruja Mon', N'Brasil', N'2013-05-23', N'Español', N'La bruja Mon, es un cuento divertido, hace que uno disfrute mucho de las ocurrencias de la brujita.La bruja Mon se encontraba muy feliz en una tienda, en ese instante una niña le dio un pisotón, despertando su furia y en consecuencia la convirtió en una rana...', N'9473683568568', N'26', N'15.0300', N'10', N'1', N'-')
INSERT INTO TB_LIBRO (cod_aut, cod_edi, cod_enc, cod_gen, tit_lib, pais_lib, fpub_lib, idi_lib, des_lib, ISBN_lib, pag_lib, pre_lib, stock_lib, vend_lib, ruta_lib) VALUES ('95', 82, N'2', N'8', N'Libro secreto de los duendes', N'España', N'2008-03-10', N'Español', N'En la ciudad de Zombay hay una bruja llamada Graba, mitad máquina, mitad humana, que tiene poderes sobrenaturales y hace mover su casa a voluntad. Rownie es uno de los niños abandonados que vive con ella pero decide escaparse para encontrar a su hermano mayor, que ha desaparecido sin dejar rastro...', N'9467583563483', N'31', N'18.0400', N'4', N'2', N'-')
INSERT INTO TB_LIBRO (cod_aut, cod_edi, cod_enc, cod_gen, tit_lib, pais_lib, fpub_lib, idi_lib, des_lib, ISBN_lib, pag_lib, pre_lib, stock_lib, vend_lib, ruta_lib) VALUES ('96', 82, N'1', N'8', N'Perverso', N'Brasil', N'2010-03-02', N'Español', N'Un juego seductor y peligroso donde una pareja revela los secretos mas inquietantes de su intimidad', N'9786124559891', N'38', N'27.0500', N'4', N'3', N'-')
INSERT INTO TB_LIBRO (cod_aut, cod_edi, cod_enc, cod_gen, tit_lib, pais_lib, fpub_lib, idi_lib, des_lib, ISBN_lib, pag_lib, pre_lib, stock_lib, vend_lib, ruta_lib) VALUES ('91', 82, N'7', N'8', N'Raul pintado de Azul', N'España', N'2003-01-10', N'Español', N'Cuenta la historia de cómo a un pequeño niño un día común y corriente le empezaron a salir manchas azules por todo el brazo, viendo este inconveniente que surgía el pequeño niño empezó a preguntarse por quebrotaban manchas azules de sus brazos sin explicación...', N'9234235235745', N'23', N'15.0600', N'1', N'2', N'-')
INSERT INTO TB_LIBRO (cod_aut, cod_edi, cod_enc, cod_gen, tit_lib, pais_lib, fpub_lib, idi_lib, des_lib, ISBN_lib, pag_lib, pre_lib, stock_lib, vend_lib, ruta_lib) VALUES ('96', 82, N'7', N'8', N'Al final de la noche', N'España', N'2002-01-09', N'Español', N'Esta historia se trata sobre un grupo de estudiantes que fueron de excursión a la selva tropical, cuando ya estaban en el lugar donde iban a pasar la noche....', N'9653235727777', N'31', N'13.0700', N'3', N'1', N'-')
INSERT INTO TB_LIBRO (cod_aut, cod_edi, cod_enc, cod_gen, tit_lib, pais_lib, fpub_lib, idi_lib, des_lib, ISBN_lib, pag_lib, pre_lib, stock_lib, vend_lib, ruta_lib) VALUES ('97', 82, N'7', N'8', N'Como ser una persona de verdad', N'España', N'2004-12-02', N'Español', N'Kara, antes de cumplir los 11 años vivía en una vida normal y feliz, pero cuando su papá se tiene que ir de la casa por temas del trabajo, ella y su madre quedan solas. A pesar de que el padre les enviaba dinero, el trabajo lo tenía ocupado y no podía estar con ellas y su esposa no quería mudarse...', N'9234234234232', N'39', N'24.0800', N'2', N'2', N'-')
INSERT INTO TB_LIBRO (cod_aut, cod_edi, cod_enc, cod_gen, tit_lib, pais_lib, fpub_lib, idi_lib, des_lib, ISBN_lib, pag_lib, pre_lib, stock_lib, vend_lib, ruta_lib) VALUES ('98', 82, N'2', N'9', N'ALQUIMIA-ENCICLOPEDIA DE UNA CIENCIA HERMETICA', N'España', N'2004-11-10', N'Español', N'Este libro es la primera obra científica de consulta sobre alquimia en lengua española.', N'9786124559891', N'300', N'220.0000', N'10', N'4', N'-')
INSERT INTO TB_LIBRO (cod_aut, cod_edi, cod_enc, cod_gen, tit_lib, pais_lib, fpub_lib, idi_lib, des_lib, ISBN_lib, pag_lib, pre_lib, stock_lib, vend_lib, ruta_lib) VALUES ('99', 82, N'2', N'9', N'ANATOMIA ENCICLOPEDIA UNIVERSAL', N'España', N'2015-10-11', N'Español', N'Este libro es la primera obra científica de consulta sobre anatomia en lengua española.', N'9243234234232', N'100', N'32.0100', N'20', N'5', N'-')
INSERT INTO TB_LIBRO (cod_aut, cod_edi, cod_enc, cod_gen, tit_lib, pais_lib, fpub_lib, idi_lib, des_lib, ISBN_lib, pag_lib, pre_lib, stock_lib, vend_lib, ruta_lib) VALUES ('99', 82, N'2', N'9', N'ANTIGUO EGIPTO ENCICLOPEDIA UNIVERSAL', N'España', N'2015-10-11', N'Español', N'Este libro es la obra científica de consulta sobre el antiguo egipto en lengua española.', N'9112312312333', N'125', N'32.0200', N'23', N'7', N'-')
INSERT INTO TB_LIBRO (cod_aut, cod_edi, cod_enc, cod_gen, tit_lib, pais_lib, fpub_lib, idi_lib, des_lib, ISBN_lib, pag_lib, pre_lib, stock_lib, vend_lib, ruta_lib) VALUES ('100', 82, N'2', N'9', N'ARTE EL SIGLO XX ENCICLOPEDIA UNIVERSAL', N'España', N'2014-09-30', N'Español', N'Este libro es la enciclopedia de consulta sobre el arte en el siglo xx en lengua española.', N'9353453734773', N'300', N'70.0300', N'15', N'1', N'-')
INSERT INTO TB_LIBRO (cod_aut, cod_edi, cod_enc, cod_gen, tit_lib, pais_lib, fpub_lib, idi_lib, des_lib, ISBN_lib, pag_lib, pre_lib, stock_lib, vend_lib, ruta_lib) VALUES ('100', 83, N'2', N'9', N'ARTICULOS POLITICOS DE LA ENCICLOPEDIA', N'España', N'2012-10-23', N'Español', N'Este libro es la enciclopedia de articulos politicos en lengua española.', N'9453623724484', N'182', N'77.0000', N'13', N'3', N'-')
INSERT INTO TB_LIBRO (cod_aut, cod_edi, cod_enc, cod_gen, tit_lib, pais_lib, fpub_lib, idi_lib, des_lib, ISBN_lib, pag_lib, pre_lib, stock_lib, vend_lib, ruta_lib) VALUES ('100', 82, N'2', N'9', N'ATLAS DEL MUNDO-ENCICLOPEDIA ILUSTRADA JUVENIL', N'España', N'2013-10-04', N'Español', N'Este libro es la eciclopedia Atlas del mundo', N'9959223723734', N'48', N'37.0500', N'20', N'5', N'-')
INSERT INTO TB_LIBRO (cod_aut, cod_edi, cod_enc, cod_gen, tit_lib, pais_lib, fpub_lib, idi_lib, des_lib, ISBN_lib, pag_lib, pre_lib, stock_lib, vend_lib, ruta_lib) VALUES ('100', 82, N'2', N'9', N'ATLAS MUNDIAL ENCICLOPEDIA CARTOGRAFICA', N'España', N'2014-10-13', N'Español', N'Este libro es la enciclopedia científica mundial', N'9496568425623', N'50', N'182.0000', N'19', N'5', N'-')
INSERT INTO TB_LIBRO (cod_aut, cod_edi, cod_enc, cod_gen, tit_lib, pais_lib, fpub_lib, idi_lib, des_lib, ISBN_lib, pag_lib, pre_lib, stock_lib, vend_lib, ruta_lib) VALUES ('99', 82, N'2', N'9', N'AVES ENCICLOPEDIA DE LA CIENCIA', N'España', N'2015-10-11', N'Español', N'Este libro es la primera obra científica de consulta sobre aves.', N'9453462364346', N'93', N'45.0000', N'13', N'3', N'-')
INSERT INTO TB_LIBRO (cod_aut, cod_edi, cod_enc, cod_gen, tit_lib, pais_lib, fpub_lib, idi_lib, des_lib, ISBN_lib, pag_lib, pre_lib, stock_lib, vend_lib, ruta_lib) VALUES ('99', 82, N'2', N'9', N'BABY ENCICLOPEDIA', N'España', N'2014-12-03', N'Español', N'Este libro es la enciclopedia para infantes de consulta en lengua española.', N'9453462364432', N'50', N'36.0800', N'8', N'8', N'-')
INSERT INTO TB_LIBRO (cod_aut, cod_edi, cod_enc, cod_gen, tit_lib, pais_lib, fpub_lib, idi_lib, des_lib, ISBN_lib, pag_lib, pre_lib, stock_lib, vend_lib, ruta_lib) VALUES ('100', 82, N'2', N'9', N'BONSAI ENCICLOPEDIA PRÀCTICA', N'España', N'2015-10-11', N'Español', N'Este libro es la obra de consulta sobre bonsai.', N'9453234234233', N'32', N'119.0900', N'21', N'3', N'-')

SELECT COUNT(*) FROM TB_AUTOR
SELECT COUNT(*) FROM TB_EDITORIAL
SELECT COUNT(*) FROM TB_ENCUADERNACION
SELECT COUNT(*) FROM TB_GENERO

-------------------------------------------------------------------------------------------------
-------------------------------REGISTROS TB_PAIS------------------------------------------------
-------------------------------------------------------------------------------------------------




-------------------------------------------------------------------------------------------------
-------------------------------REGISTROS TB_CARRITO----------------------------------------------
-------------------------------------------------------------------------------------------------
INSERT INTO TB_CARRITO (cod_car, id_usu, fec_car, est_car) VALUES (N'CAR-00000001',1, N'2016-11-06', N'INICIADO')
INSERT INTO TB_CARRITO (cod_car, id_usu, fec_car, est_car) VALUES (N'CAR-00000003', 2, N'2016-11-06', N'INICIADO')

-------------------------------------------------------------------------------------------------
-------------------------------REGISTROS TB_DETALLECARRITO---------------------------------------
-------------------------------------------------------------------------------------------------
INSERT INTO TB_DETALLECARRITO(cod_car, num_det, cod_lib, cant_det) VALUES (N'CAR-00000001', N'1', 10, N'1')
INSERT INTO TB_DETALLECARRITO(cod_car, num_det, cod_lib, cant_det) VALUES (N'CAR-00000001', N'2', 11, N'2')
INSERT INTO TB_DETALLECARRITO(cod_car, num_det, cod_lib, cant_det) VALUES (N'CAR-00000001', N'3', 12, N'1')
GO

-------------------------------------------------------------------------------------------------
-------------------------------PROCEDIMIENTOS TB_AUTOR------------------------------------------
-------------------------------------------------------------------------------------------------
CREATE PROCEDURE USP_LISTAR_AUTOR
AS
	BEGIN 
		SELECT * FROM TB_AUTOR
	END 
GO

CREATE PROCEDURE USP_BUSCAR_AUTOR
@cod_aut int
AS
	BEGIN 
		SELECT * FROM TB_AUTOR WHERE cod_aut = @cod_aut
	END 
GO

CREATE PROCEDURE USP_REGISTRA_AUTOR
@nom_aut VARCHAR(50), 
@apep_aut VARCHAR(50), 
@apem_aut VARCHAR(50), 
@cod_pais VARCHAR(50) 
AS
	BEGIN 
		INSERT INTO TB_AUTOR (nom_aut, apep_aut, apem_aut, cod_pais) VALUES(@nom_aut,@apep_aut,@apem_aut,@cod_pais)    
	END 
GO

CREATE PROCEDURE USP_ACTUALIZA_AUTOR
@cod_aut INT, 
@nom_aut VARCHAR(50), 
@apep_aut VARCHAR(50), 
@apem_aut VARCHAR(50), 
@cod_pais VARCHAR(50)
AS
	BEGIN 
		UPDATE TB_AUTOR
		SET nom_aut = @nom_aut, 
		apep_aut = @apep_aut, 
		apem_aut = @apem_aut, 
		cod_pais = @cod_pais
		WHERE cod_aut = @cod_aut
	END 
GO

CREATE PROCEDURE USP_ELIMINA_AUTOR
@cod_aut INT
AS
	BEGIN 
		DELETE FROM TB_AUTOR WHERE cod_aut = @cod_aut
	END 
GO

-------------------------------------------------------------------------------------------------
-------------------------------PROCEDIMIENTOS TB_EDITORIAL------------------------------------------
-------------------------------------------------------------------------------------------------
CREATE PROCEDURE USP_LISTAR_EDITORIAL
AS
	BEGIN 
		SELECT * FROM TB_EDITORIAL
	END 
GO

CREATE PROCEDURE USP_BUSCAR_EDITORIAL
@cod_edi int
AS
	BEGIN 
		SELECT * FROM TB_EDITORIAL WHERE cod_edi = @cod_edi
	END 
GO

CREATE PROCEDURE USP_REGISTRA_EDITORIAL
@nom_edi VARCHAR(50), 
@dir_edi VARCHAR(50), 
@tel_edi VARCHAR(50)
AS
	BEGIN 
		INSERT INTO TB_EDITORIAL (nom_edi, dir_edi, tel_edi) VALUES(@nom_edi,@dir_edi,@tel_edi)    
	END 
GO

CREATE PROCEDURE USP_ACTUALIZA_EDITORIAL
@cod_edi INT,
@nom_edi VARCHAR(50), 
@dir_edi VARCHAR(50), 
@tel_edi VARCHAR(50)
AS
	BEGIN 
		UPDATE TB_EDITORIAL
		SET nom_edi = @nom_edi, 
		dir_edi = @dir_edi, 
		tel_edi = @tel_edi
		WHERE cod_edi = @cod_edi
	END 
GO

CREATE PROCEDURE USP_ELIMINA_EDITORIAL
@cod_edi INT
AS
	BEGIN 
		DELETE FROM TB_EDITORIAL WHERE cod_edi = @cod_edi
	END 
GO

-------------------------------------------------------------------------------------------------
-------------------------------PROCEDIMIENTOS TB_ENCUADERNACION------------------------------------------
-------------------------------------------------------------------------------------------------
CREATE PROCEDURE USP_LISTAR_ENCUADERNACION
AS
	BEGIN 
		SELECT * FROM TB_ENCUADERNACION
	END 
GO

CREATE PROCEDURE USP_BUSCAR_ENCUADERNACION
@cod_enc int
AS
	BEGIN 
		SELECT * FROM TB_ENCUADERNACION WHERE cod_enc = @cod_enc
	END 
GO

CREATE PROCEDURE USP_REGISTRA_ENCUADERNACION
@desc_enc VARCHAR(50)
AS
	BEGIN 
		INSERT INTO TB_ENCUADERNACION(desc_enc) VALUES(@desc_enc)    
	END 
GO

CREATE PROCEDURE USP_ACTUALIZA_ENCUADERNACION
@cod_enc int,
@desc_enc VARCHAR(50)
AS
	BEGIN 
		UPDATE TB_ENCUADERNACION
		SET desc_enc = @desc_enc
		WHERE cod_enc = @cod_enc
	END 
GO

CREATE PROCEDURE USP_ELIMINA_ENCUADERNACION
@cod_enc INT
AS
	BEGIN 
		DELETE FROM TB_ENCUADERNACION WHERE cod_enc = @cod_enc
	END 
GO

-------------------------------------------------------------------------------------------------
-------------------------------PROCEDIMIENTOS TB_GENERO-------------------------------------------
-------------------------------------------------------------------------------------------------
CREATE PROCEDURE USP_LISTAR_GENERO
AS
	BEGIN 
		SELECT * FROM TB_GENERO
	END 
GO

CREATE PROCEDURE USP_BUSCAR_GENERO
@cod_gen int
AS
	BEGIN 
		SELECT * FROM TB_GENERO WHERE cod_gen =@cod_gen		 
	END 
GO


CREATE PROCEDURE USP_REGISTRA_GENERO
@nom_gen varchar(50)
AS
	BEGIN 
		INSERT INTO TB_GENERO (nom_gen) VALUES (@nom_gen)    
				 
	END 
GO

CREATE PROCEDURE USP_ACTUALIZA_GENERO
@cod_gen int,
@nom_gen varchar(50)
AS
	BEGIN 
		UPDATE TB_GENERO
		SET nom_gen =@nom_gen 
		WHERE cod_gen =@cod_gen		 
	END 
GO

CREATE PROCEDURE USP_ELIMINA_GENERO
@cod_gen int
AS
	BEGIN 
		DELETE FROM TB_GENERO WHERE cod_gen =@cod_gen		 
	END 
GO

-------------------------------------------------------------------------------------------------
-------------------------------PROCEDIMIENTOS TB_LIBRO-------------------------------------------
-------------------------------------------------------------------------------------------------
CREATE PROCEDURE USP_LISTAR_LIBRO
AS
	BEGIN 
		SELECT * FROM TB_LIBRO
	END 
GO

CREATE PROCEDURE USP_BUSCAR_LIBRO
@cod_lib int
AS
	BEGIN 
		SELECT * FROM TB_LIBRO WHERE cod_lib = @cod_lib
	END 
GO

CREATE PROCEDURE USP_REGISTRA_LIBRO
@cod_aut INT, 
@cod_edi INT, 
@cod_enc INT, 
@cod_gen INT, 
@tit_lib VARCHAR(50), 
@pais_lib VARCHAR(50), 
@fpub_lib DATE, 
@idi_lib VARCHAR(50), 
@des_lib TEXT, 
@ISBN_lib VARCHAR(50), 
@pag_lib INT, 
@pre_lib DECIMAL, 
@stock_lib INT, 
@vend_lib MONEY, 
@ruta_lib VARCHAR(500)
AS
	BEGIN 
		INSERT INTO TB_LIBRO (cod_aut, cod_edi, cod_enc, cod_gen, tit_lib, pais_lib, fpub_lib, idi_lib, des_lib, ISBN_lib, pag_lib, pre_lib, stock_lib, vend_lib, ruta_lib) 
		VALUES(@cod_aut, @cod_edi, @cod_enc, @cod_gen, @tit_lib, @pais_lib, @fpub_lib, @idi_lib, @des_lib, @ISBN_lib, @pag_lib, @pre_lib, @stock_lib, @vend_lib, @ruta_lib)    
	END 
GO

CREATE PROCEDURE USP_ACTUALIZA_LIBRO
@cod_lib INT,
@cod_aut INT, 
@cod_edi INT, 
@cod_enc INT, 
@cod_gen INT, 
@tit_lib VARCHAR(50), 
@pais_lib VARCHAR(50), 
@fpub_lib DATE, 
@idi_lib VARCHAR(50), 
@des_lib TEXT, 
@ISBN_lib VARCHAR(50), 
@pag_lib INT, 
@pre_lib DECIMAL, 
@stock_lib INT, 
@vend_lib MONEY, 
@ruta_lib VARCHAR(500)
AS
	BEGIN 
		UPDATE TB_LIBRO
		SET 
		cod_aut = @cod_aut , 
		cod_edi = @cod_edi , 
		cod_enc = @cod_enc , 
		cod_gen = @cod_gen , 
		tit_lib = @tit_lib , 
		pais_lib = @pais_lib , 
		fpub_lib = @fpub_lib , 
		idi_lib = @idi_lib , 
		des_lib = @des_lib , 
		ISBN_lib = @ISBN_lib , 
		pag_lib = @pag_lib , 
		pre_lib = @pre_lib , 
		stock_lib = @stock_lib , 
		vend_lib = @vend_lib 
		WHERE cod_lib = @cod_lib
	END 
GO

CREATE PROCEDURE USP_ELIMINA_LIBRO
@cod_lib INT
AS
	BEGIN 
		DELETE FROM TB_LIBRO WHERE cod_lib = @cod_lib
	END 
GO


-------------------------------------------------------------------------------------------------
-------------------------------PROCEDIMIENTOS TB_PREGUNTA------------------------------------------
-------------------------------------------------------------------------------------------------
CREATE PROCEDURE USP_LISTAR_PREGUNTA
AS
	BEGIN 
		SELECT * FROM TB_PREGUNTA
	END 
GO

CREATE PROCEDURE USP_BUSCAR_PREGUNTA
@cod_pre int
AS
	BEGIN 
		SELECT * FROM TB_PREGUNTA WHERE cod_pre = @cod_pre
	END 
GO

CREATE PROCEDURE USP_REGISTRA_PREGUNTA
@desc_pre VARCHAR(50)
AS
	BEGIN 
		INSERT INTO TB_PREGUNTA(desc_pre) VALUES(@desc_pre)    
	END 
GO

CREATE PROCEDURE USP_ACTUALIZA_PREGUNTA
@cod_pre int,
@desc_pre VARCHAR(50)
AS
	BEGIN 
		UPDATE TB_PREGUNTA
		SET desc_pre = @desc_pre
		WHERE cod_pre = @cod_pre
	END 
GO

CREATE PROCEDURE USP_ELIMINA_PREGUNTA
@cod_pre INT
AS
	BEGIN 
		DELETE FROM TB_PREGUNTA WHERE cod_pre = @cod_pre
	END 
GO


-------------------------------------------------------------------------------------------------
SELECT * FROM TB_AUTOR
SELECT COUNT(*) AS CANTIDAD FROM TB_AUTOR
-------------------------------------------------------------------------------------------------
SELECT * FROM TB_EDITORIAL
SELECT COUNT(*) AS CANTIDAD FROM TB_EDITORIAL
-------------------------------------------------------------------------------------------------
SELECT * FROM TB_ENCUADERNACION
SELECT COUNT(*) AS CANTIDAD FROM TB_ENCUADERNACION
-------------------------------------------------------------------------------------------------
SELECT * FROM TB_GENERO
SELECT COUNT(*) AS CANTIDAD FROM TB_GENERO
-------------------------------------------------------------------------------------------------
SELECT * FROM TB_PREGUNTA
SELECT COUNT(*) AS CANTIDAD FROM TB_PREGUNTA
-------------------------------------------------------------------------------------------------
SELECT * FROM TB_TIPOTARJETA
SELECT COUNT(*) AS CANTIDAD FROM TB_TIPOTARJETA
-------------------------------------------------------------------------------------------------
SELECT * FROM TB_TIPOUSUARIO
SELECT COUNT(*) AS CANTIDAD FROM TB_TIPOUSUARIO
-------------------------------------------------------------------------------------------------
SELECT * FROM TB_USUARIO
SELECT COUNT(*) AS CANTIDAD FROM TB_USUARIO
-------------------------------------------------------------------------------------------------
SELECT * FROM TB_LIBRO
SELECT COUNT(*) AS CANTIDAD FROM TB_LIBRO
-------------------------------------------------------------------------------------------------
SELECT * FROM TB_PAIS
SELECT COUNT(*) AS CANTIDAD FROM TB_PAIS
-------------------------------------------------------------------------------------------------
SELECT * FROM TB_CARRITO
SELECT COUNT(*) AS CANTIDAD FROM TB_CARRITO
-------------------------------------------------------------------------------------------------
SELECT * FROM TB_DETALLECARRITO
SELECT COUNT(*) AS CANTIDAD FROM TB_DETALLECARRITO
-------------------------------------------------------------------------------------------------

SELECT * FROM SYS.tables ORDER BY NAME ASC