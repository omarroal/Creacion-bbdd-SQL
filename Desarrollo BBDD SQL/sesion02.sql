ALTER TABLE ALUMNO ADD EMAIL VARCHAR2(30);
ALTER TABLE ALUMNO MODIFY SEXO VARCHAR2(1);
ALTER TABLE ALUMNO MODIFY SEXO VARCHAR2(1) constraint alu_sex_ch CHECK (sexo in ('H','J'));
ALTER TABLE MONITOR MODIFY TELEFONO constraint mon_tel_nn NOT NULL;
ALTER TABLE MONITOR ADD (CODIGO VARCHAR2(15) constraint mon_cod_uq UNIQUE constraint mon_cod_nn NOT NULL);
ALTER TABLE CURSO ADD (constraint cur_pis_fk FOREIGN KEY (pista) REFERENCES PISTA);
ALTER TABLE CURSO ADD (CONSTRAINT cur_pis_fk FOREIGN KEY(pista) REFERENCES PISTA);
ALTER TABLE ASIGNAR MODIFY (descuento DEFAULT 0 constraint asi_des_ch CHECK ( descuento>=0));

Eliminar restricción 
ALTER TABLE ASIGNAR DROP CONSTRAINT asi_des_ch;