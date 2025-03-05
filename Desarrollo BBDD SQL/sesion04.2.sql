
1- UPDATE ALUMNO SET dni = '33000666F' where dni= '33000666H';
2- UPDATE MONITOR SET  codigo = 'Manu' where dni='44333555S';
3- UPDATE PISTA SET estado = 'Disponible' observaciones = '' where codigo = 'BRONCE';
4- UPDATE ALUMNO SET sexo = 'H' where sexo IS NULL;
5- UPDATE CURSO set precio= precio * 1.2 where dnimonitor = '44333555S';
6- UPDATE MATRICULAR set CURSO = 1, NIVEL = 3 where CURSO = 2 AND NIVEL= 3; 
7- UPDATE CURSO set PRECIO = PRECIO-30 where NUMNIVEL= 3 AND NUMERO = 2;

Select * from CURSO where dnimonitor = (SELECT DNI from MONITOR where codigo = 'Lola');
8- UPDATE CURSO SET dnimonitor = '44333555S' where dnimonitor= '22333444M';
9- UPDATE CURSO SET dnimonitor = (SELECT DNI from MONITOR where codigo= 'Manu'), pista='BRONCE' where dnimonitor = ( SELECT DNI FROM MONITOR WHERE codigo='Patri'); 