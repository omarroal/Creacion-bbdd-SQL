CREATE TABLE ALUMNO
(
	dni varchar2(15),
	nombre varchar2(10),
	apellido1 varchar2(20),
	telefono number(12),
	fechanac date,
	sexo varchar2(10),
	CONSTRAINT alu_dni_pk PRIMARY KEY(dni)
);

CREATE TABLE ASIGNAR
(
	dnimonitor varchar2(15),
	ciftienda varchar2(20),
	descuento number(4,2),
	CONSTRAINT asi_dnim_cift_pk PRIMARY KEY(dnimonitor, ciftienda),
	CONSTRAINT asi_mon_fk FOREIGN KEY (dnimonitor) REFERENCES MONITOR,
	CONSTRAINT asi_tie_fk FOREIGN KEY (ciftienda) REFERENCES TIENDA
);

CREATE TABLE COMPRAR
(
	dnialumno varchar2(10),
	dnimonitor varchar2(10),
	ciftienda varchar2(15),
	fecha date,
	importeinicial number(4,2),
	importefinal number(4,2),
	CONSTRAINT com_dnia_dnim_cift_fec_pk PRIMARY KEY(dnialumno, dnimonitor, ciftienda, fecha),
	CONSTRAINT com_alu_fk FOREIGN KEY (dnialumno) REFERENCES ALUMNO,
	CONSTRAINT com_mon_fk FOREIGN KEY (dnimonitor) REFERENCES MONITOR,
	CONSTRAINT com_tie_fk FOREIGN KEY (ciftienda) REFERENCES TIENDA
);

CREATE TABLE MATRICULAR
(
	dnialumno varchar2(10),
	nivel number(6),
	curso number(5),
	diasasiste number(8),
	CONSTRAINT mat_dnia_niv_cur_pk PRIMARY KEY(dnialumno,nivel,curso),
	CONSTRAINT mat_alu_fk FOREIGN KEY (dnialumno) REFERENCES ALUMNO,
	CONSTRAINT mat_cur_fk FOREIGN KEY (nivel,curso) REFERENCES CURSO (numnivel,numero)	
);

Para contar las pk pondremos:
select COUNT(*) from user_constraints where constraint_type = 'P';
Para mostrar:
select (constraint_name) from user_constraints where constraint_type = 'P';
Para contar las fk pondremos:
select COUNT(*) from user_constraints where constraint_type = 'K';