2.- Elimina al alumno con email sortiz@hotmail.com.
DELETE FROM ALUMNO WHERE email ='sortiz@hotmail.com';

3.- Elimina a la alumna con email chuertas@gmail.com.
DELETE  ALUMNO WHERE email ='chuertas@gmail.com'

No se puede eliminar porque está en la tabla matricular.

DELETE FROM MATRICULAR WHERE DNIALUMNO= (SELECT DNI FROM ALUMNO WHERE EMAIL='chuertas@gmail.com');
DELETE FROM ALUMNO WHERE EMAIL='chuertas@gmail.com';


4.- ¿Hay algún alumno que no esté matriculado en ningún curso? 
En caso afirmativo, elimínalos de la BD. (Una instrucción DELETE con SELECT).

DELETE FROM ALUMNO WHERE DNI NOT IN (SELECT DNIALUMNO FROM MATRICULAR);

5.1.- En la tabla MATRICULAR identifica los campos que forman la clave principal de la tabla y en qué orden. 
Para obtener esta información realiza las consultas que sean necesarias sobre las vistas del diccionario de datos.

DNIALUMNO POSICIÓN 1
NIVEL POSICIÓN 2
CURSO POSICIÓN 3

5.2.- En el diseño lógico de MATRICULAR la clave ajena dnialumno -> ALUMNO controla que solamente puedan 
estar matriculados en cursos los alumnos que están dados de alta como alumnos en la BD. ¿Cómo se llama esta restricción en la BD?
	
	- MAT_ALU_FK
	
