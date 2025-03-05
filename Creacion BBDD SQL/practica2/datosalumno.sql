INSERT INTO ALUMNO (dni, nombre, apellido1, telefono, fechanac, sexo) VALUES ('33000111M', 'Susana', 'Mora', '649000111', '01/02/1990', 'M');
INSERT INTO ALUMNO (dni, nombre, apellido1, telefono, fechanac, sexo, email) VALUES ('33000222N', 'Diego', 'Rocamora', '605111222', '07/05/1980', 'H', 'drocamora@gmail.com');
INSERT INTO ALUMNO (dni, nombre, apellido1, telefono, fechanac, email) VALUES ('33000333P', 'Antonio', 'Oliva', '965437657, 630112233', '21/09/1991', 'aoliva@hotmail.com');
INSERT INTO ALUMNO (dni, nombre, apellido1, telefono, fechanac, email) VALUES ('33000444A', 'Santiago', 'Aldeguer', '96545555, 630113344', '15/09/1987', 'saldeguer@hotmail.com');
INSERT INTO ALUMNO (dni, nombre, apellido1, telefono, fechanac, email, sexo) VALUES ('33000555M', 'Cristina', 'Huertas', '649125467', '30/11/1990', 'chuertas@gmail.com', 'M');
INSERT INTO ALUMNO (dni, nombre, apellido1, telefono, email, sexo) VALUES ('33000666H', 'Carmen', 'Torres', '605887689', 'ctorres@gmail.com', 'M');
INSERT INTO ALUMNO (dni, nombre, apellido1, telefono, sexo) VALUES ('55111222X', 'Susana', 'Molina', '649004362', 'M');

SELECT dni,nombre,apellido1 FROM ALUMNO;
