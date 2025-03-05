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
   importeinicial	NUMBER(8,2), 
   importefinal	NUMBER(8,2),
   CONSTRAINT com_dnia_dnim_cif_fec_pk PRIMARY KEY (dnialumno, dnimonitor, ciftienda, fecha)
);

CREATE TABLE NIVEL 
(
   numero		NUMBER(2) CONSTRAINT niv_num_pk PRIMARY KEY, 
   nombre		VARCHAR(10), 
   descripcion	VARCHAR(50)
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
   numero		NUMBER(3), 
   fechaini	DATE, 
   horario	VARCHAR(40), 
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


/* 
   Instrucciones ALTER TABLE de la práctica 2
*/

REM 1.
 ALTER TABLE PISTA MODIFY (codigo VARCHAR2(10));

REM 2.
ALTER TABLE ALUMNO ADD (email VARCHAR2(30));

REM 3. 
ALTER TABLE ALUMNO MODIFY (  sexo VARCHAR2(1)  );

REM 4.
ALTER TABLE ALUMNO MODIFY (sexo CONSTRAINT alu_sex_ch CHECK (sexo IN ('H','M')));

REM 5. 
ALTER TABLE MONITOR MODIFY (telefono CONSTRAINT mon_tel_nn NOT NULL);

REM 6. 
ALTER TABLE MONITOR ADD (codigo VARCHAR2(15) 
                                   CONSTRAINT mon_cod_uq UNIQUE
                                   CONSTRAINT mon_cod_nn NOT NULL
                        );

REM 7.
ALTER TABLE CURSO ADD (CONSTRAINT cur_pis_fk FOREIGN KEY(pista) REFERENCES PISTA);

REM 8. 
ALTER TABLE CURSO MODIFY (dnimonitor CONSTRAINT cur_dni_nn NOT NULL);
ALTER TABLE NIVEL MODIFY (nombre VARCHAR2(15));

REM 9.
ALTER TABLE ASIGNAR MODIFY (descuento DEFAULT 0 
                            CONSTRAINT asi_des_ch CHECK (descuento>=0)
                           );

REM 10.
ALTER TABLE COMPRAR ADD (CONSTRAINT com_imp_ch CHECK (importefinal<=importeinicial));


