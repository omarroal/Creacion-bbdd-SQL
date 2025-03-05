INSERT INTO ALUMNO (dni, nombre, apellido1, telefono, fechanac, sexo, email) 
               VALUES ('45147825B', 'Salvador', 'Ortiz', '630987654,965431212', '12/04/1990', 'H', 'sortiz@hotmail.com');
INSERT INTO ALUMNO (dni, nombre, apellido1, telefono, fechanac, sexo)       
               VALUES ('45000111P', 'Patricia', 'Vives', '642970313', '19/06/1987', 'M');
INSERT INTO ALUMNO (dni, nombre, apellido1, telefono, fechanac, sexo)       
               VALUES ('72156234C', 'Carmen', 'Rocamora', '630178345', '01/03/1985', 'M');
INSERT INTO ALUMNO (dni, nombre, apellido1, telefono, fechanac, email)      
               VALUES ('54234567M', 'Unay', 'Ramos', '630238343', '18/05/1970', 'uramos@hotmail.es');
INSERT INTO ALUMNO (dni, nombre, apellido1, telefono, fechanac, sexo,EMAIL) 
                VALUES ('54234568K', 'Carlos', 'Ramos', '630178345', '18/05/1970', 'H', 'cramos@hotmail.es');
INSERT INTO ALUMNO (dni, nombre, apellido1, sexo, email)                   
               VALUES ('45700600U', 'Cristina', 'Medina', 'M', 'cmedina@gmail.com');
INSERT INTO ALUMNO (dni, nombre, apellido1, telefono, fechanac, sexo)       
               VALUES ('54000111H', 'Alicia', 'Torres', '630178345', '10/05/1987', 'M');

INSERT INTO CURSO (numnivel, numero, fechaini, horario, numhoras, precio, pista, dnimonitor) 
                VALUES (3, 2, '30/01/2019', 'V,S: 17:00-18:00', 60, 500, 'BRONCE', '44333555S');

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


COMMIT;

