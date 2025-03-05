CREATE TABLE BAJAS 
(
   dni VARCHAR2(10) CONSTRAINT baj_dni_pk PRIMARY KEY, 
   nombre VARCHAR2(25), 
   apellido1 VARCHAR2(25), 
   telefono VARCHAR2(30), 
   fechanac DATE, 
   sexo VARCHAR2(1) CONSTRAINT baj_sex_ch CHECK (sexo IN ('H','M')),
   email VARCHAR2(30),
   usuario VARCHAR2(15),
   fechabaja DATE
);

----------------1
create or replace trigger BORRAR_ALUMNO
BEFORE DELETE ON ALUMNO
FOR EACH ROW

BEGIN
  INSERT INTO BAJAS  VALUES
  (:OLD.DNI, :OLD.NOMBRE, :OLD.APELLIDO1, :OLD.TELEFONO, :OLD.fechanac, :OLD.sexo, :OLD.EMAIL, USER, SYSDATE);
END;
/

DELETE FROM ALUMNO WHERE DNI= '33000111M';

------------------2

CREATE OR REPLACE TRIGGER ALTA_ALUMNO
BEFORE INSERT ON ALUMNO
FOR EACH ROW

DECLARE
  edadreal NUMBER;

BEGIN
edadreal := EDAD_REAL(:NEW.fechanac);

  if (edadreal > 7) then
    insert into ALUMNO VALUES (:NEW.DNI, :NEW.NOMBRE, :NEW.APELLIDO1, :NEW.TELEFONO, :NEW.fechanac, :NEW.sexo, :NEW.EMAIL);
  else
  DBMS_OUTPUT.PUT_LINE('Error');
  end if;
END;
/

CREATE OR REPLACE FUNCTION EDAD_REAL(a_fechanac ALUMNO.fechanac%TYPE)
RETURN NUMBER
IS
	edad_alumno NUMBER;
	mes NUMBER;
	dia NUMBER;

	año_actual NUMBER;
	año_nacimiento NUMBER;

	mes_actual NUMBER;
	mes_nacimiento NUMBER;

	dia_actual NUMBER;
	dia_nacimiento NUMBER;
BEGIN
	año_actual := TO_NUMBER(TO_CHAR(SYSDATE, 'YYYY'));
	año_nacimiento := TO_NUMBER(TO_CHAR(a_fechanac, 'YYYY'));

	mes_actual := TO_NUMBER(TO_CHAR(SYSDATE, 'MM'));
	mes_nacimiento := TO_NUMBER(TO_CHAR(a_fechanac, 'MM'));

	dia_actual := TO_NUMBER(TO_CHAR(SYSDATE, 'DD'));
	dia_nacimiento := TO_NUMBER(TO_CHAR(a_fechanac, 'DD'));

	mes := mes_actual - mes_nacimiento;
	dia := dia_actual - dia_nacimiento;

	if mes >= 0 THEN
		if dia >= 0 THEN
			edad_alumno := año_actual - año_nacimiento;
		else
			edad_alumno := año_actual - año_nacimiento - 1;
		END IF;
	else
		edad_alumno := año_actual - año_nacimiento - 1;
	END IF;

	return edad_alumno;
END;
/

CREATE OR REPLACE TRIGGER EDAD_MINIMA
	BEFORE INSERT ON ALUMNO
	FOR EACH ROW
BEGIN
	IF EDAD_REAL(:NEW.fechanac) < 7 THEN
		RAISE_APPLICATION_ERROR(-20002, 'No se realiza el alta el alumno con DNI: ' || :NEW.DNI || ' no tiene la edad minima');
	END IF;
END;
/

INSERT INTO ALUMNO (dni, nombre, apellido1, telefono, fechanac, sexo) VALUES('48679912m', 'OMAR', 'RODRIGUEZ', '652891811', '22/01/1997' , 'M', 'aaron@tofuerto.com');

INSERT INTO ALUMNO (dni, nombre, apellido1, telefono, fechanac, sexo) VALUES ('3304566M', 'antonio', 'Msfgdra', '649000111', '21/12/1990', 'M');

-------------------3

set serveroutput on
create or replace trigger ACTUALIZAR_PRECIO
BEFORE UPDATE ON CURSO
FOR EACH ROW

BEGIN

IF (:NEW.precio > ((:OLD.precio*0.1)+:old.precio)) THEN
:NEW.precio := ((:OLD.precio*0.1)+:old.precio);
DBMS_OUTPUT.PUT_LINE( 'El precio del curso ' || :NEW.numero || ' del nivel ' || :NEW.numnivel || ' se incrementa el maximo permitido (10%): ' || :OLD.precio || ' -> ' || :NEW.precio);
end if;

END;
/

UPDATE CURSO SET precio = precio + precio*0.15 WHERE NUMNIVEL = '1' AND  NUMERO = '2';

