-- TIENDA
SELECT nombre FROM producto;
SELECT nombre, precio FROM producto;
SELECT * FROM producto;
SELECT nombre, precio, precio * 1.088 FROM producto;
SELECT nombre AS nom_de_producto, precio AS euros, precio * 1.088 AS dolars FROM producto;
SELECT UPPER(nombre), precio FROM producto;
SELECT LOWER(nombre), precio FROM producto;
SELECT nombre, LEFT(UPPER(nombre), 2) FROM fabricante;
SELECT nombre, ROUND(precio) FROM producto;
SELECT nombre, TRUNCATE(precio, 0) FROM producto;
SELECT f.codigo FROM fabricante f INNER JOIN producto p ON f.codigo = p.codigo_fabricante;
SELECT DISTINCT f.codigo FROM fabricante f INNER JOIN producto p ON f.codigo = p.codigo_fabricante;
SELECT nombre FROM fabricante ORDER BY nombre;
SELECT nombre FROM fabricante ORDER BY nombre DESC;
SELECT nombre FROM producto ORDER BY nombre, precio DESC;
SELECT * FROM fabricante LIMIT 5;
SELECT * FROM fabricante LIMIT 3, 2;
SELECT nombre, precio FROM producto ORDER BY precio LIMIT 1;
SELECT nombre, precio FROM producto ORDER BY precio DESC LIMIT 1;
SELECT nombre FROM fabricante WHERE codigo = 2;
SELECT p.nombre AS nombre_producto, p.precio, f.nombre AS nombre_fabricante FROM producto p INNER JOIN fabricante f ON p.codigo_fabricante = f.codigo;
SELECT p.nombre AS nombre_producto, p.precio, f.nombre AS nombre_fabricante FROM producto p INNER JOIN fabricante f ON p.codigo_fabricante = f.codigo ORDER BY nombre_fabricante;
SELECT p.codigo AS codigo_producto, p.nombre AS nombre_producto, f.codigo AS codigo_fabricante, f.nombre AS nombre_fabricante FROM producto p INNER JOIN fabricante f ON p.codigo_fabricante = f.codigo;
SELECT p.nombre AS nombre_producto, p.precio, f.nombre AS nombre_fabricante FROM producto p INNER JOIN fabricante f ON p.codigo_fabricante = f.codigo ORDER BY precio LIMIT 1;
SELECT p.nombre AS nombre_producto, p.precio, f.nombre AS nombre_fabricante FROM producto p INNER JOIN fabricante f ON p.codigo_fabricante = f.codigo ORDER BY precio DESC LIMIT 1;
SELECT * FROM producto p INNER JOIN fabricante f ON p.codigo_fabricante = f.codigo WHERE f.nombre = 'Lenovo';
SELECT * FROM producto p INNER JOIN fabricante f ON p.codigo_fabricante = f.codigo WHERE f.nombre = 'Crucial' AND p.precio > 200;
SELECT * FROM producto p INNER JOIN fabricante f ON p.codigo_fabricante = f.codigo WHERE f.nombre = 'Asus' OR f.nombre = 'Hewlett-Packard' OR f.nombre = 'Seagate';
SELECT * FROM producto p INNER JOIN fabricante f ON p.codigo_fabricante = f.codigo WHERE f.nombre IN ('Asus', 'Hewlett-Packard', 'Seagate');
SELECT p.nombre, p.precio FROM producto p INNER JOIN fabricante f ON p.codigo_fabricante = f.codigo WHERE f.nombre LIKE '%e';
SELECT p.nombre, p.precio FROM producto p INNER JOIN fabricante f ON p.codigo_fabricante = f.codigo WHERE f.nombre LIKE '%w%';
SELECT p.nombre AS nombre_producto, p.precio, f.nombre AS nombre_fabricante FROM producto p INNER JOIN fabricante f ON p.codigo_fabricante = f.codigo WHERE p.precio >= 180 ORDER BY p.precio DESC, nombre_producto;
SELECT f.nombre AS nombre_fabricante, p.nombre AS nombre_producto FROM fabricante f INNER JOIN producto p ON f.codigo = p.codigo_fabricante;
SELECT f.nombre AS nombre_fabricante, p.nombre AS nombre_producto FROM fabricante f, producto p;
SELECT f.nombre AS nombre_fabricante, p.nombre AS nombre_producto FROM fabricante f LEFT JOIN producto p ON p.codigo_fabricante = f.codigo WHERE p.codigo_fabricante IS NULL;
SELECT p.nombre FROM producto p, fabricante f WHERE f.nombre = 'Lenovo';
SELECT * FROM producto p WHERE p.precio = (SELECT MAX(p.precio) FROM producto p WHERE p.codigo_fabricante = (SELECT f.codigo FROM fabricante f WHERE f.nombre = 'Lenovo'));
SELECT p.nombre FROM producto p INNER JOIN fabricante f ON p.codigo_fabricante = f.codigo WHERE f.nombre = 'Lenovo' ORDER BY p.precio DESC LIMIT 1;
SELECT p.nombre FROM producto p INNER JOIN fabricante f ON p.codigo_fabricante = f.codigo WHERE f.nombre = 'Hewlett-Packard' ORDER BY p.precio LIMIT 1;
SELECT * FROM producto p INNER JOIN fabricante f ON p.codigo_fabricante = f.codigo WHERE f.nombre = 'Asus';

-- UNIVERSIDAD
SELECT p.apellido1, p.apellido2, p.nombre FROM persona p INNER JOIN alumno_se_matricula_asignatura a ON p.id = a.id_alumno ORDER BY p.apellido1, p.apellido2, p.nombre;
SELECT p.nombre, p.apellido1, apellido2 FROM persona p INNER JOIN alumno_se_matricula_asignatura a ON p.id = a.id_alumno WHERE p.telefono IS NULL;
SELECT p.nombre, p.apellido1, p.apellido2 FROM persona p WHERE p.tipo = 'alumno' AND p.fecha_nacimiento >= '1999/01/01' AND p.fecha_nacimiento <= '1999/12/31';
SELECT p.nombre, p.apellido1, p.apellido2 FROM persona p INNER JOIN profesor pr ON p.id = pr.id_profesor WHERE p.telefono IS NULL AND p.nif LIKE '%K';
SELECT * FROM asignatura WHERE cuatrimestre = 1 AND curso = 3 AND id_grado = 7;
SELECT pe.apellido1, pe.apellido2, pe.nombre AS nombre_profesor, d.nombre AS nombre_departamento FROM profesor pr INNER JOIN persona pe ON pe.id = id_profesor INNER JOIN departamento d ON d.id = pr.id_departamento ORDER BY pe.apellido1, pe.apellido2, pe.nombre;
SELECT a.nombre, ce.anyo_inicio, ce.anyo_fin FROM asignatura a INNER JOIN alumno_se_matricula_asignatura al ON al.id_asignatura = a.id INNER JOIN persona p ON p.id = al.id_alumno INNER JOIN curso_escolar ce ON ce.id = al.id_curso_escolar WHERE p.nif = '26902806M';
SELECT d.nombre FROM departamento d INNER JOIN profesor p ON p.id_departamento = d.id INNER JOIN asignatura a ON a.id_profesor = p.id_profesor INNER JOIN grado g ON g.id = a.id_grado WHERE g.nombre = 'Grado en Ingeniería Informática (Plan 2015)';
SELECT p.nombre, p.apellido1, p.apellido2 FROM persona p INNER JOIN alumno_se_matricula_asignatura al ON p.id = al.id_alumno INNER JOIN curso_escolar ce ON ce.id = al.id_curso_escolar INNER JOIN asignatura a ON a.id = al.id_asignatura WHERE ce.anyo_inicio >= 2018 AND ce.anyo_fin <= 2019;
SELECT d.nombre AS nombre_departamento, pe.apellido1, pe.apellido2, pe.nombre As nombre_profesor FROM profesor pr INNER JOIN persona pe ON pe.id = pr.id_profesor RIGHT JOIN departamento d ON d.id = pr.id_departamento ORDER BY d.nombre, pe.apellido1, pe.apellido2, pe.nombre;
SELECT pe.apellido1, pe.apellido2, pe.nombre As nombre_profesor FROM profesor pr INNER JOIN persona pe ON pe.id = pr.id_profesor LEFT JOIN departamento d ON d.id = pr.id_departamento WHERE pr.id_departamento IS NULL;
SELECT d.nombre FROM departamento d LEFT JOIN profesor pr ON pr.id_departamento = d.id WHERE pr.id_departamento IS NULL;
SELECT pe.apellido1, pe.apellido2, pe.nombre As nombre_profesor FROM profesor pr INNER JOIN persona pe ON pe.id = pr.id_profesor LEFT JOIN asignatura a ON pr.id_profesor = a.id_profesor WHERE a.id_profesor IS NULL;
SELECT a.* FROM asignatura a LEFT JOIN profesor p ON p.id_profesor = a.id_profesor WHERE a.id_profesor IS NULL;
SELECT d.* FROM departamento d INNER JOIN profesor pr ON pr.id_departamento = d.id LEFT JOIN asignatura a ON a.id_profesor = pr.id_profesor WHERE a.curso IS NULL;
SELECT COUNT(*) FROM alumno_se_matricula_asignatura;
SELECT COUNT(*) FROM persona p WHERE p.tipo = 'alumno' AND p.fecha_nacimiento >= '1999/01/01' AND p.fecha_nacimiento <= '1999/12/31';
SELECT d.nombre, COUNT(pe.nombre) FROM profesor pr INNER JOIN persona pe ON pe.id = pr.id_profesor INNER JOIN departamento d ON d.id = pr.id_departamento GROUP BY d.nombre;
SELECT d.nombre, COUNT(pe.nombre) FROM persona pe INNER JOIN profesor pr ON pr.id_profesor = pe.id RIGHT JOIN departamento d ON pr.id_departamento = d.id GROUP BY d.nombre;
SELECT g.nombre, COUNT(a.nombre) FROM grado g LEFT JOIN asignatura a ON a.id_grado = g.id GROUP BY g.nombre ORDER BY COUNT(a.nombre);
SELECT g.nombre, COUNT(a.nombre) FROM grado g LEFT JOIN asignatura a ON a.id_grado = g.id GROUP BY g.nombre HAVING COUNT(a.nombre) > 40;
SELECT g.nombre, a.tipo, SUM(a.creditos) FROM grado g INNER JOIN asignatura a ON a.id_grado = g.id GROUP BY g.nombre, a.tipo;
SELECT ce.anyo_inicio, COUNT(al.id_alumno) FROM alumno_se_matricula_asignatura al INNER JOIN curso_escolar ce ON ce.id = al.id_curso_escolar GROUP BY ce.anyo_inicio;
SELECT pr.id_profesor, pe.nombre, pe.apellido1, pe.apellido2, COUNT(a.nombre) FROM persona pe INNER JOIN profesor pr ON pr.id_profesor = pe.id LEFT JOIN asignatura a ON a.id_profesor = pr.id_profesor GROUP BY pr.id_profesor ORDER BY COUNT(a.nombre) DESC;
SELECT pe.* FROM persona pe INNER JOIN alumno_se_matricula_asignatura al ON pe.id = al.id_alumno ORDER BY pe.fecha_nacimiento DESC LIMIT 1;
SELECT pe.nombre FROM profesor pr INNER JOIN persona pe ON pe.id = pr.id_profesor INNER JOIN departamento d ON d.id = pr.id_departamento LEFT JOIN asignatura a ON a.id_profesor = pr.id_profesor WHERE a.id_profesor IS NULL;