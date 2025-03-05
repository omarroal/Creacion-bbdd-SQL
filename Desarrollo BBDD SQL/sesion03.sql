insert into CURSO (numnivel,numero,fechaini,horario,numhoras,precio,pista,dnimonitor)
					values (2,1,'09/12/2018','M,J: 12:00-13:00',80,480,NULL,'22333444M');
INSERT INTO MATRICULAR (dnialumno,nivel,curso)  SELECT dnialumno,4,2 FROM MATRICULAR where nivel = 4 AND curso=1;
					
INSERT INTO CURSO (dnimonitor, numnivel, numero) 
SELECT DNI,7,1 FROM MONITOR where apellido1 between 'P' and 'W';

