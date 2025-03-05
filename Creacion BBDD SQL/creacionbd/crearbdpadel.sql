CREATE TABLE ALUMNO 
(
   dni		VARCHAR(10) CONSTRAINT alu_dni_pk PRIMARY KEY, 
   nombre	VARCHAR (25), 
   apellido1	VARCHAR(25), 
   telefono	VARCHAR(30), 
   fechanac	DATE, 
   sexo		VARCHAR(10)
);

CREATE TABLE MONITOR 
(
   dni 		VARCHAR(10) CONSTRAINT mon_dni_pk PRIMARY KEY, 
   nombre 	VARCHAR (25), 
   apellido1 	VARCHAR (25), 
   telefono 	VARCHAR(30)
);

CREATE TABLE TIENDA 
(
   cif      	VARCHAR(10) CONSTRAINT tie_cif_pk PRIMARY KEY, 
   nombre   	VARCHAR(50), 
   telefono 	VARCHAR(30)
);

CREATE TABLE ASIGNAR 
(
   dnimonitor 	VARCHAR(10) CONSTRAINT asi_mon_fk REFERENCES MONITOR(dni), 
   ciftienda  	VARCHAR(10) CONSTRAINT asi_tie_fk REFERENCES TIENDA, 
   descuento  	NUMBER(4,2),
   CONSTRAINT asi_dni_cif_pk PRIMARY KEY (dnimonitor,ciftienda)
);

CREATE TABLE COMPRAR 
(
   dnialumno	VARCHAR(10) CONSTRAINT com_alu_fk REFERENCES ALUMNO, 
   dnimonitor	VARCHAR(10) CONSTRAINT com_mon_fk REFERENCES MONITOR, 
   ciftienda	VARCHAR(10) CONSTRAINT com_tie_fk REFERENCES TIENDA, 
   fecha	DATE, 
   importeinicial NUMBER(8,2), 
   importefinal	  NUMBER(8,2),
   CONSTRAINT com_dnia_dnim_cif_fec_pk PRIMARY KEY (dnialumno, dnimonitor, ciftienda, fecha)
);

CREATE TABLE NIVEL 
(
   numero	NUMBER(2) CONSTRAINT niv_num_pk PRIMARY KEY, 
   nombre	VARCHAR(10), 
   descripcion	VARCHAR(100)
);


CREATE TABLE PISTA 
(
   codigo		VARCHAR(10) CONSTRAINT pis_cod_pk PRIMARY KEY, 
   estado		VARCHAR(20), 
   observaciones	VARCHAR(45)
);

CREATE TABLE CURSO 
(
   numnivel	NUMBER(2) CONSTRAINT cur_niv_fk REFERENCES NIVEL, 
   numero	NUMBER(3), 
   fechaini	DATE, 
   horario	VARCHAR(100), 
   numhoras	NUMBER(3), 
   precio	NUMBER(8,2), 
   pista	VARCHAR(10), 
   dnimonitor	CONSTRAINT cur_mon_fk REFERENCES MONITOR,
   CONSTRAINT  cur_niv_num_pk PRIMARY KEY (numnivel,numero)
);

CREATE TABLE MATRICULAR 
(
   dnialumno	CONSTRAINT mat_alu_fk REFERENCES alumno, 
   nivel	NUMBER(2), 
   curso	NUMBER(3), 
   diasasiste	NUMBER(3),
   CONSTRAINT mat_dni_niv_cur_pk PRIMARY KEY (dnialumno, nivel, curso),
   CONSTRAINT mat_cur_fk FOREIGN KEY (nivel,curso) REFERENCES CURSO
);









