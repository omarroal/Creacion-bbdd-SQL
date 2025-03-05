-----------------------1
set serveroutput on

create or replace procedure DATOS_MONITOR (p_apodo monitor.codigo%TYPE)
is

  f_dni monitor.dni%TYPE;
  f_nombre monitor.nombre%TYPE;
  f_apellido monitor.apellido1%TYPE;

begin

select dni, nombre, apellido1 into f_dni, f_nombre, f_apellido
from monitor
where p_apodo = monitor.codigo;

DBMS_OUTPUT.PUT_LINE(f_dni || ' ' || f_nombre || ' ' || f_apellido);


EXCEPTION

  when NO_DATA_FOUND then

  DBMS_OUTPUT.PUT_LINE('No existe el apodo');

end;
/

execute DATOS_MONITOR ('Toni')

-------------------2

set serveroutput on

create or replace procedure MATRICULAR_ALUMNONIVELCURSO (p_dni matricular.dnialumno%TYPE, p_nivel matricular.nivel%TYPE, p_curso matricular.curso%TYPE)

is

  f_dni matricular.dnialumno%TYPE;
  f_nivel matricular.nivel%TYPE;
  f_curso matricular.curso%TYPE;
  f_alumnosmatriculados NUMBER;
  f_num_curso NUMBER;

  maximo_matriculados EXCEPTION;
  alumno_no_existe EXCEPTION;
  PRAGMA EXCEPTION_INIT (alumno_no_existe,-02291);
  curso_nivel_no_existe EXCEPTION;

BEGIN

  select count(*) into f_alumnosmatriculados
  from matricular
  where p_nivel = nivel and p_curso = curso;

  select count(*) into f_num_curso
  from curso
  where p_nivel = numnivel and p_curso = numero;

  if (f_num_curso = 0) THEN
    raise curso_nivel_no_existe;
  end if;

  if (f_alumnosmatriculados > 4) THEN
    raise maximo_matriculados;
  end if;

  insert into matricular (dnialumno, nivel, curso) values (p_dni, p_nivel, p_curso);

  DBMS_OUTPUT.PUT_LINE(f_alumnosmatriculados);

EXCEPTION
  when maximo_matriculados THEN
  DBMS_OUTPUT.PUT_LINE('Maximo matriculados');
  when DUP_VAL_ON_INDEX then
  DBMS_OUTPUT.PUT_LINE('Alumno ya matriculado');
  when alumno_no_existe THEN
  DBMS_OUTPUT.PUT_LINE('Alumno no existe');
  when curso_nivel_no_existe THEN
  DBMS_OUTPUT.PUT_LINE('Curso no existe');

  
  
end;
/

execute MATRICULAR_ALUMNONIVELCURSO ('746366483', 1, 2);

------------------3

set serveroutput on

create or replace procedure ELIMINAR_CURSOSVACIOS_FECHAS (f_inicio curso.fechaini%TYPE, f_final curso.fechaini%TYPE)
Is
    anioinicioIntroducida NUMBER;
    mesinicioIntroducida NUMBER;
    aniofinalIntroducida NUMBER;
    mesfinalIntroducida NUMBER;
cursor c_listado is
select numnivel, numero, dnimonitor,fechaini
from curso
order by fechaini ASC;




registro c_listado%ROWTYPE;

begin
anioinicioIntroducida := TO_NUMBER(TO_CHAR(f_inicio,'YYYY'));
mesinicioIntroducida := TO_NUMBER(TO_CHAR(f_inicio,'MM'));
aniofinalIntroducida := TO_NUMBER(TO_CHAR(f_final,'YYYY'));
mesfinalIntroducida := TO_NUMBER(TO_CHAR(f_final,'MM'));
aniofecha  NUMBER;

DBMS_OUTPUT.PUT_LINE('anio inicio' || anioinicioIntroducida);
DBMS_OUTPUT.PUT_LINE('mes inicio' || mesinicioIntroducida);
DBMS_OUTPUT.PUT_LINE('anio final' || aniofinalIntroducida);
DBMS_OUTPUT.PUT_LINE('mes final' || mesfinalIntroducida);


open c_listado;

loop
  fetch c_listado into registro;
  exit when c_listado%NOTFOUND;
  aniofecha := TO_NUMBER(TO_CHAR(fechaini, 'YYYY'));
    DBMS_OUTPUT.PUT_LINE(registro.numnivel || ' ' || registro.numero || ' ' || registro.dnimonitor || ' ' || aniofecha);
end loop;

close c_listado;

END;
/
