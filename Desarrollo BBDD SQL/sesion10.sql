------------------------1
set serveroutput on

create or replace procedure LISTADO1_CURSOS_MONITOR (p_dnimonitor monitor.dni%TYPE)
IS
cursor c_monitor is   
  select fechaini,horario, numero,numnivel 
  from curso 
  where dnimonitor= p_dnimonitor 
  order by fechaini asc;

  f_fechaini curso.fechaini%TYPE;
  f_horario curso.horario%TYPE;
  f_numero curso.numero%TYPE;
  f_numnivel curso.numnivel%TYPE;
  
BEGIN

open c_monitor;

DBMS_OUTPUT.PUT_LINE('---------------');
DBMS_OUTPUT.PUT_LINE('Monitor: '|| p_dnimonitor);
DBMS_OUTPUT.PUT_LINE('---------------');

LOOP 
fetch c_monitor into f_fechaini, f_horario, f_numero, f_numnivel;
exit when c_monitor%NOTFOUND;
DBMS_OUTPUT.PUT_LINE(f_fechaini || f_horario || f_numero || f_numnivel);
end loop;
close c_monitor;
END;
/
-----------------------2

set serveroutput on

create or replace procedure LISTADO2_CURSOS_MONITOR (p_dnimonitor monitor.dni%TYPE)
IS
cursor c_monitor is
  select fechaini,horario, numero,numnivel
  from curso
  where dnimonitor= p_dnimonitor
  order by fechaini asc;

cursor c_apodo is
  select codigo
  from monitor
  where p_dnimonitor = dni;

  f_fechaini curso.fechaini%TYPE;
  f_horario curso.horario%TYPE;
  f_numero curso.numero%TYPE;
  f_numnivel curso.numnivel%TYPE;
  f_apodo monitor.codigo%TYPE;

BEGIN

open c_monitor;
open c_apodo;
fetch c_apodo into f_apodo;
close c_apodo;

DBMS_OUTPUT.PUT_LINE('---------------');
DBMS_OUTPUT.PUT_LINE('Monitor: '|| p_dnimonitor || f_apodo);
DBMS_OUTPUT.PUT_LINE('---------------');

LOOP
fetch c_monitor into f_fechaini, f_horario, f_numero, f_numnivel;
exit when c_monitor%NOTFOUND;
DBMS_OUTPUT.PUT_LINE(f_fechaini || f_horario || f_numero || f_numnivel);
end loop;
close c_monitor;
END;
/

execute LISTADO2_CURSOS_MONITOR ('44333555S')

--------------------------2 otra forma apodo sin cursor y con excepción

set serveroutput on

create or replace procedure LISTADO2_CURSOS_MONITOR (p_dnimonitor monitor.dni%TYPE)
IS
cursor c_monitor is
  select fechaini,horario, numero,numnivel
  from curso
  where dnimonitor= p_dnimonitor
  order by fechaini asc;


  f_fechaini curso.fechaini%TYPE;
  f_horario curso.horario%TYPE;
  f_numero curso.numero%TYPE;
  f_numnivel curso.numnivel%TYPE;
  f_apodo monitor.codigo%TYPE;

BEGIN

open c_monitor;

 select codigo into f_apodo
  from monitor
  where p_dnimonitor = dni;

DBMS_OUTPUT.PUT_LINE('---------------');
DBMS_OUTPUT.PUT_LINE('Monitor: '|| p_dnimonitor ||' '|| f_apodo);
DBMS_OUTPUT.PUT_LINE('---------------');

LOOP
fetch c_monitor into f_fechaini, f_horario, f_numero, f_numnivel;
exit when c_monitor%NOTFOUND;
DBMS_OUTPUT.PUT_LINE(f_fechaini || f_horario || f_numero || f_numnivel);
end loop;
close c_monitor;

EXCEPTION
WHEN NO_DATA_FOUND THEN
DBMS_OUTPUT.PUT_LINE('Error, el dni: ' || p_dnimonitor || ' no existe en la Base de datos');


END;
/
execute LISTADO2_CURSOS_MONITOR ('44333555S')

SET SERVEROUTPUT ON

CREATE OR REPLACE PROCEDURE LISTADO_ALUMNOS_NIVELCURSO (p_curso curso.numnivel%TYPE, p_nivel curso.numero%TYPE)
IS
cursor c_listado  is
select apellido1, nombre
from alumno,matricular
where p_curso = curso and p_nivel = nivel and dni= dnialumno;

  f_apellido1 alumno.apellido1%TYPE;
  f_nombre alumno.nombre%TYPE;

  total NUMBER :=0;

begin
open c_listado;
select count(*) INTO total
from alumno,matricular
where p_curso = curso and p_nivel = nivel and dni= dnialumno;

DBMS_OUTPUT.PUT_LINE('---------------');
DBMS_OUTPUT.PUT_LINE('Curso: '|| p_curso ||' '|| 'Nivel: '|| p_nivel);
DBMS_OUTPUT.PUT_LINE('---------------');

LOOP
fetch c_listado into f_apellido1, f_nombre;
exit when c_listado%NOTFOUND;
DBMS_OUTPUT.PUT_LINE(f_apellido1 || f_nombre);

end loop;
close c_listado;
DBMS_OUTPUT.PUT_LINE('Total: ' || total);

END;
/

