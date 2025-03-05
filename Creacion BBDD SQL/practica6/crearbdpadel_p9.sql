CREATE TABLE ALUMNO 
(
   dni		VARCHAR2(10) CONSTRAINT alu_dni_pk PRIMARY KEY, 
   nombre	VARCHAR2(25), 
   apellido1	VARCHAR2(25), 
   telefono	VARCHAR2(30), 
   fechanac	DATE, 
   sexo		VARCHAR2(1) CONSTRAINT alu_sex_ch CHECK (sexo IN ('H','M')),
   email        VARCHAR2(30)
);

CREATE TABLE MONITOR 
(
   dni 		VARCHAR2(10) CONSTRAINT mon_dni_pk PRIMARY KEY, 
   nombre 	VARCHAR2(25), 
   apellido1 	VARCHAR2(25), 
   telefono 	VARCHAR2(30) CONSTRAINT mon_tel_nn NOT NULL,
   codigo       VARCHAR2(15) CONSTRAINT mon_cod_uq UNIQUE CONSTRAINT mon_cod_nn NOT NULL
);

CREATE TABLE TIENDA 
(
   cif      	VARCHAR2(10) CONSTRAINT tie_cif_pk PRIMARY KEY, 
   nombre   	VARCHAR2(50), 
   telefono 	VARCHAR2(30)
);

CREATE TABLE ASIGNAR 
(
   dnimonitor 	VARCHAR2(10) CONSTRAINT asi_mon_fk REFERENCES MONITOR(dni), 
   ciftienda  	VARCHAR2(10) CONSTRAINT asi_tie_fk REFERENCES TIENDA, 
   descuento  	NUMBER(4,2) DEFAULT 0 CONSTRAINT asi_des_ch CHECK (descuento>=0),
   CONSTRAINT asi_dni_cif_pk PRIMARY KEY (dnimonitor,ciftienda)
);


CREATE TABLE COMPRAR 
(
   dnialumno	VARCHAR2(10) CONSTRAINT com_alu_fk REFERENCES ALUMNO, 
   dnimonitor	VARCHAR2(10) CONSTRAINT com_mon_fk REFERENCES MONITOR, 
   ciftienda	VARCHAR2(10) CONSTRAINT com_tie_fk REFERENCES TIENDA, 
   fecha	DATE, 
   importeinicial NUMBER(8,2), 
   importefinal	  NUMBER(8,2),
   CONSTRAINT com_dnia_dnim_cif_fec_pk PRIMARY KEY (dnialumno, dnimonitor, ciftienda, fecha),
   CONSTRAINT com_imp_ch CHECK (importefinal<=importeinicial)
);

CREATE TABLE NIVEL 
(
   numero	NUMBER(2) CONSTRAINT niv_num_pk PRIMARY KEY, 
   nombre	VARCHAR2(15), 
   descripcion	VARCHAR2(50)
);


CREATE TABLE PISTA 
(
   codigo		VARCHAR2(10) CONSTRAINT pis_cod_pk PRIMARY KEY, 
   estado		VARCHAR2(20), 
   observaciones	VARCHAR2(45)
);

CREATE TABLE CURSO 
(
   numnivel	NUMBER(2) CONSTRAINT cur_niv_fk REFERENCES NIVEL, 
   numero	NUMBER(3), 
   fechaini	DATE, 
   horario	VARCHAR2(40), 
   numhoras	NUMBER(3), 
   precio	NUMBER(8,2), 
   pista	VARCHAR2(10), 
   dnimonitor	CONSTRAINT cur_mon_fk REFERENCES MONITOR CONSTRAINT cur_dni_nn NOT NULL,
   CONSTRAINT  cur_niv_num_pk PRIMARY KEY (numnivel,numero),
   CONSTRAINT  cur_pis_fk FOREIGN KEY (pista) REFERENCES PISTA ON DELETE SET NULL
);

CREATE TABLE MATRICULAR 
(
   dnialumno	CONSTRAINT mat_alu_fk REFERENCES ALUMNO ON DELETE CASCADE, 
   nivel	NUMBER(2), 
   curso	NUMBER(3), 
   diasasiste	NUMBER(3),
   CONSTRAINT mat_dni_niv_cur_pk PRIMARY KEY (dnialumno, nivel, curso),
   CONSTRAINT mat_cur_fk FOREIGN KEY (nivel,curso) REFERENCES CURSO
);
