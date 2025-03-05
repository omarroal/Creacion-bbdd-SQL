Sesion 9:

1-
  create or replace FUNCTION TOTALCURSOS_NIVEL(nNivel CURSO.NUMNIVEL%TYPE)
	RETURN NUMBER
	IS
		total NUMBER :=0;
	BEGIN
		SELECT COUNT(*) INTO total
		FROM CURSO
		WHERE nNivel = CURSO.NUMNIVEL;
		RETURN total;
	END;
	/
2-
CREATE OR REPLACE FUNCTION TOTALALUMNOS_NIVELCURSO(nNivel MATRICULAR.NIVEL%TYPE, nCurso MATRICULAR.CURSO%TYPE)
RETURN NUMBER
IS
  total NUMBER := 0;
BEGIN
  SELECT COUNT(*) INTO total
  FROM MATRICULAR
  WHERE nNivel = MATRICULAR.NIVEL AND nCurso = MATRICULAR.CURSO;
RETURN total;
END;
/
3-
create or replace function IMPORTECURSOS_ALUMNO (f_dni matricular.dnialumno%TYPE)
return number
is total number;

begin

select sum(curso.precio) into total
from curso, matricular
where matricular.dnialumno = f_dni and matricular.curso = curso.numero and matricular.nivel = curso.numnivel;

return total;

end;
/

select importecursos_alumno('33000111M') FROM DUAL;

4-

SET SERVEROUTPUT ON
create or replace function EDAD_ANYO (fechaNacimiento DATE)
  return NUMBER
IS
  edad NUMBER;
  anyo_actual NUMBER;
  anyo_nacimiento NUMBER;

  begin

  anyo_actual := TO_NUMBER(TO_CHAR(SYSDATE,'YYYY'));
  anyo_nacimiento := TO_NUMBER(TO_CHAR(fechaNacimiento,'YYYY'));

  edad := anyo_actual - anyo_nacimiento;
  return edad;

END;
/

5-

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

                 