INSERT INTO ALUMNO (dni, nombre, apellido1, telefono, fechanac, sexo)         VALUES ('33000111M', 'Susana', 'Mora', '649000111', '01/02/1990', 'M');
INSERT INTO ALUMNO (dni, nombre, apellido1, telefono, fechanac, sexo, email)  VALUES ('33000222N', 'Diego', 'Rocamora', '605111222', '07/05/1980', 'H', 'drocamora@gmail.com');
INSERT INTO ALUMNO (dni, nombre, apellido1, telefono, fechanac, email)        VALUES ('33000333P', 'Antonio', 'Oliva', '965437657, 630112233', '21/09/1991', 'aoliva@hotmail.com');
INSERT INTO ALUMNO (dni, nombre, apellido1, telefono, fechanac, email)        VALUES ('33000444A', 'Santiago', 'Aldeguer', '96545555, 630113344', '15/09/1987', 'saldeguer@hotmail.com');
INSERT INTO ALUMNO (dni, nombre, apellido1, telefono, fechanac, email, sexo)  VALUES ('33000555M', 'Cristina', 'Huertas', '649125467', '30/11/1990', 'chuertas@gmail.com', 'M');
INSERT INTO ALUMNO (dni, nombre, apellido1, telefono, email, sexo)            VALUES ('33000666H', 'Carmen', 'Torres', '605887689', 'ctorres@gmail.com', 'M');
INSERT INTO ALUMNO (dni, nombre, apellido1, telefono, sexo)                   VALUES ('55111222X', 'Susana', 'Molina', '649004362', 'M');
INSERT INTO ALUMNO (dni, nombre, apellido1, telefono, fechanac, sexo, email)  VALUES ('45147825B', 'Salvador', 'Ortiz', '630987654,965431212', '12/04/1990', 'H', 'sortiz@hotmail.com');
INSERT INTO ALUMNO (dni, nombre, apellido1, telefono, fechanac, sexo)         VALUES ('45000111P', 'Patricia', 'Vives', '642970313', '19/06/1987', 'M');
INSERT INTO ALUMNO (dni, nombre, apellido1, telefono, fechanac, sexo)         VALUES ('72156234C', 'Carmen', 'Rocamora', '630178345', '01/03/1985', 'M');
INSERT INTO ALUMNO (dni, nombre, apellido1, telefono, fechanac, email)        VALUES ('54234567M', 'Unay', 'Ramos', '630238343', '18/05/1970', 'uramos@hotmail.es');
INSERT INTO ALUMNO (dni, nombre, apellido1, telefono, fechanac, sexo, email)  VALUES ('54234568K', 'Carlos', 'Ramos', '630178345', '18/05/1970', 'H', 'cramos@hotmail.es');
INSERT INTO ALUMNO (dni, nombre, apellido1, sexo, email)                      VALUES ('45700600U', 'Cristina', 'Medina', 'M', 'cmedina@gmail.com');
INSERT INTO ALUMNO (dni, nombre, apellido1, telefono, fechanac, sexo)         VALUES ('54000111H', 'Alicia', 'Torres', '630178345', '10/05/1987', 'M');
INSERT INTO ALUMNO (dni, nombre, apellido1, telefono)                         VALUES ('11222333A', 'Antonio','Soler', '605112233');
INSERT INTO ALUMNO (dni, nombre, apellido1, telefono)                         VALUES ('44333555S', 'Manuel Antonio', 'Vives', '630214123');


INSERT INTO MONITOR VALUES ('11222333A', 'Antonio','Soler', '605112233', 'Toni');
INSERT INTO MONITOR (codigo, dni, nombre, apellido1, telefono) VALUES ('Lola', '22333444M', 'Maria Dolores', 'Molins', '649001122');
INSERT INTO MONITOR VALUES ('44333555S', 'Manuel Antonio', 'Vives', '630214123', 'Toni2');
INSERT INTO MONITOR VALUES ('55111222X', 'Susana', 'Molina', '649004362', 'Chus');
INSERT INTO MONITOR (nombre, apellido1, dni, telefono, codigo) VALUES ('Patricia', 'Moles', '44555666P', '630112233', 'Patri');


INSERT INTO NIVEL VALUES (1, 'INICIACION I', 'Para quien no sabe nada');
INSERT INTO NIVEL VALUES (2, 'INICIACION II', 'Para quien tiene algunas nociones');
INSERT INTO NIVEL VALUES (3, 'INTERMEDIO I', 'Para quien juega habitualmente');
INSERT INTO NIVEL VALUES (4, 'INTERMEDIO II', 'Para quien compite en categ. 5 o 6');
INSERT INTO NIVEL VALUES (5, 'AVANZADO I', 'Para quien compite en categ. 4');
INSERT INTO NIVEL VALUES (6, 'AVANZADO II', 'Para quien compite en categ. 3');
INSERT INTO NIVEL VALUES (7, 'EXPERTO', 'Para quien compite en categ. 1 o 2');


INSERT INTO PISTA VALUES ('ORO', 'Disponible', NULL);
INSERT INTO PISTA (codigo, estado) VALUES ('PLATA', 'Disponible');
INSERT INTO PISTA (codigo, observaciones, estado) VALUES ('BRONCE', 'Limpiar pista y ajustar red', 'Mantenimiento');


INSERT INTO CURSO (numnivel, numero, fechaini, horario, numhoras, precio, pista, dnimonitor)  VALUES (1, 1, '01/12/2018', 'L,X: 10:00-11:30', 50, 350, 'PLATA', '11222333A');
INSERT INTO CURSO (numnivel, numero, fechaini, horario, numhoras, precio, pista, dnimonitor)  VALUES (1, 2, NULL,'M,J: 12:00-13:00', 80, 480, 'PLATA', '11222333A');
INSERT INTO CURSO (numnivel, numero, fechaini, horario, numhoras, precio, pista, dnimonitor)  VALUES (4, 1, '22/12/2018', 'L,X,V: 16:00-17:30', NULL, NULL, 'ORO', '11222333A');
INSERT INTO CURSO (numnivel, numero, fechaini, horario, numhoras, precio, pista, dnimonitor)  VALUES (4, 2, '14/01/2019', 'X,V: 19:30-21:00', 100, 960, NULL, '22333444M');
INSERT INTO CURSO (numnivel, numero, fechaini, horario, numhoras, precio, pista, dnimonitor)  VALUES (2, 1, '09/12/2018', 'M,J: 12:00-13:00', 80, 480, NULL, '11222333A');
INSERT INTO CURSO (numnivel, numero, fechaini, horario, numhoras, precio, pista, dnimonitor)  VALUES (2, 2, '23/12/2018', 'M,X,J: 12:00-13:00', 80, 480, 'ORO', '11222333A');
INSERT INTO CURSO (numnivel, numero, fechaini, horario, numhoras, precio, pista, dnimonitor)  VALUES (1, 3, '13/01/2019', 'M,J: 13:00-14:00', 100, 750, 'BRONCE', '22333444M');
INSERT INTO CURSO (numnivel, numero, fechaini, horario, numhoras, precio, pista, dnimonitor)  VALUES (1, 4, '07/02/2019', 'S,D: 11:00-12:00', 120, 860, 'ORO', '11222333A');
INSERT INTO CURSO (numnivel, numero, fechaini, horario, numhoras, precio, pista, dnimonitor)  VALUES (3, 1, '30/11/2018', 'L,S: 17:00-18:00', 60, 500, 'ORO', '11222333A');
INSERT INTO CURSO (numero, numnivel, fechaini, horario, numhoras, dnimonitor)                 VALUES (1, 7, '01/03/2019', 'S,D: 19:00-20:30', 32, '44555666P');
INSERT INTO CURSO (numnivel, numero, fechaini, horario, numhoras, precio, pista, dnimonitor)  VALUES (3, 2, '30/01/2019', 'V,S: 17:00-18:00', 60, 500, 'BRONCE', '44333555S');


INSERT INTO MATRICULAR (nivel, curso, dnialumno) VALUES (1, 1, '33000111M');
INSERT INTO MATRICULAR (nivel, curso, dnialumno) VALUES (1, 1, '33000222N');
INSERT INTO MATRICULAR (nivel, curso, dnialumno) VALUES (1, 1, '33000333P');
INSERT INTO MATRICULAR (nivel, curso, dnialumno) VALUES (1, 2, '33000555M');
INSERT INTO MATRICULAR (nivel, curso, dnialumno) VALUES (3, 1, '54234567M');
INSERT INTO MATRICULAR (nivel, curso, dnialumno) VALUES (3, 1, '54234568K');
INSERT INTO MATRICULAR (nivel, curso, dnialumno) VALUES (3, 1, '45700600U');
INSERT INTO MATRICULAR (nivel, curso, dnialumno) VALUES (3, 1, '54000111H');
INSERT INTO MATRICULAR (nivel, curso, dnialumno) VALUES (3, 2, '33000111M');
INSERT INTO MATRICULAR (nivel, curso, dnialumno) VALUES (3, 2, '72156234C');
INSERT INTO MATRICULAR (nivel, curso, dnialumno) VALUES (3, 2, '45000111P');
INSERT INTO MATRICULAR (nivel, curso, dnialumno) VALUES (4, 1, '54234567M');
INSERT INTO MATRICULAR (nivel, curso, dnialumno) VALUES (4, 1, '54234568K');
INSERT INTO MATRICULAR (nivel, curso, dnialumno) VALUES (4, 1, '33000111M');
INSERT INTO MATRICULAR (nivel, curso, dnialumno) VALUES (4, 1, '72156234C');
INSERT INTO MATRICULAR (nivel, curso, dnialumno) VALUES (1, 2, '33000111M');
INSERT INTO MATRICULAR (nivel, curso, dnialumno) VALUES (1, 2, '33000444A');
INSERT INTO MATRICULAR (nivel, curso, dnialumno) VALUES (2, 1, '33000111M');
INSERT INTO MATRICULAR (nivel, curso, dnialumno) VALUES (2, 1, '33000555M');
INSERT INTO MATRICULAR (nivel, curso, dnialumno) VALUES (4, 2, '54234567M');
INSERT INTO MATRICULAR (nivel, curso, dnialumno) VALUES (4, 2, '54234568K');
INSERT INTO MATRICULAR (nivel, curso, dnialumno) VALUES (4, 2, '33000111M');
INSERT INTO MATRICULAR (nivel, curso, dnialumno) VALUES (4, 2, '72156234C');
INSERT INTO MATRICULAR (nivel, curso, dnialumno) VALUES (7, 1, '11222333A');
INSERT INTO MATRICULAR (nivel, curso, dnialumno) VALUES (7, 1, '44333555S');
