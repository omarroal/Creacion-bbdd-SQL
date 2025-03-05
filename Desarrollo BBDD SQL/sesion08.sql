ACTIVIDAD 1
1.1

ventana 1:
select * from articulo where codigo='ART1';/*stock = 0*/
/*Después de haber hecho lo indicando en la ventana 2*/
select * from articulo where codigo='ART1';/*stock = 15*/



ventana 2:
select * from articulo where codigo='ART1';
UPDATE articulo set stock = 15 where codigo ='ART1';
select * from articulo where codigo='ART1'; /*Ahora hay 15*/
COMMIT;

1.3

ventana 1:
UPDATE ARTICULO SET stock = 0 where codigo = 'ART1';
COMMIT;
SET TRANSACTION ISOLATION LEVEL SERIALIZABLE;
select * from articulo where codigo='ART1';/*stock = 0*/
COMMIT; /*Ahora stock = 15*/

ventana 2; 
UPDATE articulo set stock = 15 where codigo ='ART1';
select * from articulo where codigo='ART1'; /*Ahora hay 15*/
COMMIT;
/*Lo dejamos todo como estaba*/

Ventana 1:
UPDATE ARTICULO SET stock = 0 where codigo = 'ART1';
COMMIT;

ACTIVIDAD 2:

Ventana 1:
select * from articulo where stock>10;


Ventana 2:
select * from articulo where stock>10;
INSERT INTO ARTICULO (stock,codigo) VALUES (25,'ART5');
COMMIT;

2.3

Ventana 1:
DELETE FROM ARTICULO where codigo='ART5';
COMMIT;

Actividad 3:
3.1
Ventana 1:
Select * from Articulo where codigo ='ART1';
UPDATE ARTICULO SET stock = stock + 2 where codigo ='ART1';
Select * from ARTICULO where codigo='ART1';
COMMIT;

Ventana 2:
Select * from articulo where codigo = 'ART1';
UPDATE ARTICULO SET stock = 10 where codigo ='ART1';
COMMIT;

3.2
Ventana 1: 
Select * from Articulo where codigo ='ART1';
UPDATE ARTICULO SET stock = 0 where codigo ='ART1';

3.3
Ventana 1:
SET TRANSACTION ISOLATION LEVEL SERIALIZABLE;

Ventana 2:
SET TRANSACTION ISOLATION LEVEL SERIALIZABLE;

ACTIVIDAD 4:
Ventana 1:
Select * from articulo where codigo='ART1';
UPDATE ARTICULO SET stock = stock + 1 where codigo='ART1';
/*DESPUES DE HACER LO DE LA VENTANA 2*/
ROLLBACK;

Ventana 2: 
Select * from articulo where codigo ='ART1';
UPDATE ARTICULO set stock = stock + 20 where codigo='ART1';
/*DESPUÉS DE HACER ROLLBACK*/
COMMIT;

