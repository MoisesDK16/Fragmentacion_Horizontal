#Creamos la tabla con las particiones en base a el id ,y de esa forma se segmenta los datos por dos grupos 
CREATE TABLE alumnos (
    id int,
    matricula int (10),
    nombre varchar(10)
) PARTITION BY RANGE (id) (PARTITION grupo1 VALUES less than(6), PARTITION grupo2 VALUES less than(11))


INSERT INTO alumnos (matricula, nombre) VALUES (2000, 'Hector');
INSERT INTO alumnos (matricula, nombre) VALUES (2001, 'Camila');
INSERT INTO alumnos (matricula, nombre) VALUES (2002, 'Rodrigo');
INSERT INTO alumnos (matricula, nombre) VALUES (2003, 'Alfonso');
INSERT INTO alumnos (matricula, nombre) VALUES (2004, 'Marco');
INSERT INTO alumnos (matricula, nombre) VALUES (2005, 'Kevin');
INSERT INTO alumnos (matricula, nombre) VALUES (2006, 'Luis');
INSERT INTO alumnos (matricula, nombre) VALUES (2007, 'Juliana');

#Creamos las vistas para poder visualizar las fragmentaciones segmentadas por grupos:
CREATE VIEW grupo_1 AS SELECT * FROM alumnos PARTITION(grupo1);
CREATE VIEW grupo_2 AS SELECT * FROM alumnos PARTITION(grupo2);