INSERT INTO CURSO (numnivel, numero, fechaini, horario, numhoras, precio, pista, dnimonitor) 
            VALUES (1, 1, '01/12/2018', 'L,X: 10:00-11:30', 50, 350, 'PLATA', '11222333A');
INSERT INTO CURSO (numnivel, numero, fechaini, horario, numhoras, precio, pista, dnimonitor) 
            VALUES (1, 2, NULL,'M,J: 12:00-13:00', 80, 480, 'PLATA', '11222333A');
INSERT INTO CURSO (numnivel, numero, fechaini, horario, numhoras, precio, pista, dnimonitor) 
            VALUES (4, 1, '22/12/2018', 'L,X,V: 16:00-17:30', NULL, NULL, 'ORO', '11222333A');
INSERT INTO CURSO (numnivel, numero, fechaini, horario, numhoras, precio, pista, dnimonitor) 
            VALUES (4, 2, '14/01/2019', 'X,V: 19:30-21:00', 100, 960, NULL, '22333444M');


SELECT numnivel, numero, fechaini, horario FROM CURSO ORDER BY numnivel, numero;