DROP DATABASE IF EXISTS tienda;
CREATE DATABASE tienda CHARACTER SET utf8mb4;
USE tienda;
CREATE TABLE fabricante (
  codigo INT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
  nombre VARCHAR(100) NOT NULL
);
CREATE TABLE producto (
  codigo INT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
  nombre VARCHAR(100) NOT NULL,
  precio DOUBLE NOT NULL,
  codigo_fabricante INT UNSIGNED NOT NULL,
  FOREIGN KEY (codigo_fabricante) REFERENCES fabricante(codigo)
);
INSERT INTO
  fabricante
VALUES(1, 'Asus');
INSERT INTO
  fabricante
VALUES(2, 'Lenovo');
INSERT INTO
  fabricante
VALUES(3, 'Hewlett-Packard');
INSERT INTO
  fabricante
VALUES(4, 'Samsung');
INSERT INTO
  fabricante
VALUES(5, 'Seagate');
INSERT INTO
  fabricante
VALUES(6, 'Crucial');
INSERT INTO
  fabricante
VALUES(7, 'Gigabyte');
INSERT INTO
  fabricante
VALUES(8, 'Huawei');
INSERT INTO
  fabricante
VALUES(9, 'Xiaomi');
INSERT INTO
  producto
VALUES(1, 'Disco duro SATA3 1TB', 86.99, 5);
INSERT INTO
  producto
VALUES(2, 'Memoria RAM DDR4 8GB', 120, 6);
INSERT INTO
  producto
VALUES(3, 'Disco SSD 1 TB', 150.99, 4);
INSERT INTO
  producto
VALUES(4, 'GeForce GTX 1050Ti', 185, 7);
INSERT INTO
  producto
VALUES(5, 'GeForce GTX 1080 Xtreme', 755, 6);
INSERT INTO
  producto
VALUES(6, 'Monitor 24 LED Full HD', 202, 1);
INSERT INTO
  producto
VALUES(7, 'Monitor 27 LED Full HD', 245.99, 1);
INSERT INTO
  producto
VALUES(8, 'Portátil Yoga 520', 559, 2);
INSERT INTO
  producto
VALUES(9, 'Portátil Ideapd 320', 444, 2);
INSERT INTO
  producto
VALUES(10, 'Impresora HP Deskjet 3720', 59.99, 3);
INSERT INTO
  producto
VALUES(11, 'Impresora HP Laserjet Pro M26nw', 180, 3);
-- Llista el nom de tots els productos que hi ha en la taula producto.
SELECT
  nombre
FROM
  producto;
-- Llista els noms i els preus de tots els productos de la taula producto
SELECT
  nombre,
  precio
FROM
  producto;
-- Llista totes les columnes de la taula producto.
SELECT
  *
FROM
  producto;
-- Llista el nom dels productos, el preu en euros i el preu en d ò lars
  -- estatunidencs (USD).
SELECT
  nombre,
  precio,
  precio * 0.88
FROM
  producto;
-- Llista el nom dels productos, el preu en euros i el preu
  -- en dòlars estatunidencs (USD).Utilitza els següents à
  -- lies per a les columnes: nom de producto, euros,dolars.
SELECT
  nombre AS nom_de_producto,
  precio AS euros,
  precio * 0.88 AS DOLARS
FROM
  producto;
-- Llista els noms i els preus de tots els productos de la
  -- taula producto,convertint els noms a maj ú scula.
SELECT
  UPPER(nombre),
  precio
FROM
  producto;
-- Llista els noms i els preus de tots els productos de la taula
  -- producto, convertint els noms a min ú scula.
  -- Llista el nom de tots els
  -- fabricants en una columna, i en una altra columna obtingui en maj ú scules
  --  els dos
  -- primers car à cters del nom del fabricant.Llista els noms i els preus de tots els productos
  -- de la taula producto, arrodonint el valor del preu.Llista els noms i els preus de tots els
  -- productos de la taula producto, truncant el valor del preu per a mostrar - lo sense cap xifra
  --  decimal.Llista el codi dels fabricants que tenen productos en la taula producto.Llista el
  -- codi dels fabricants que tenen productos en la taula producto, eliminant els codis que
  -- apareixen repetits.Llista els noms dels fabricants ordenats de manera ascendent.Llista els
  -- noms dels fabricants ordenats de manera descendent.Llista els noms dels productos ordenats
  -- en primer lloc pel nom de manera ascendent i en segon lloc pel preu de manera descendent.
  -- Retorna una llista amb les 5 primeres files de la taula fabricante.Retorna una llista amb 2
  --  files a partir de la quarta fila de la taula fabricante.La quarta fila tamb é s 'ha d'
  -- incloure en la resposta.Llista el nom i el preu del producto m é s barat.(Utilitzi solament
  -- les cl à usules
  --   ORDER BY
  --     i
  --   LIMIT
  -- ).NOTA: Aqu í no podria usar MIN(preu), necessitaria
  -- GROUP BY
  --   Llista el nom i el preu del producto m é s car.(
  --     Utilitzi solament les cl à usules
  --     ORDER BY
  --       i
  --     LIMIT
  --   ).NOTA: Aqu í no podria usar MAX(preu), necessitaria
  -- GROUP BY.Llista el nom de tots els productos del fabricant el codi de fabricant del qual é s igual a 2.Retorna una llista amb el nom del producte,
  --   preu i nom de fabricant de tots els productes de la base de dades.Retorna una llista amb el nom del producte,
  --   preu i nom de fabricant de tots els productes de la base de dades.Ordeni el resultat pel nom del fabricador,
  --   per ordre alfab è tic.Retorna una llista amb el codi del producte,
  --   nom del producte,
  --   codi del fabricador i nom del fabricador,
  --   de tots els productes de la base de dades.Retorna el nom del producte,
  --   el seu preu i el nom del seu fabricant,
  --   del producte m é s barat.Retorna el nom del producte,
  --   el seu preu i el nom del seu fabricant,
  --   del producte m é s car.Retorna una llista de tots els productes del fabricador Lenovo.Retorna una llista de tots els productes del fabricant Crucial que tinguin un preu major que 200 €.Retorna un llistat amb tots els productes dels fabricants Asus,
  --   Hewlett - Packard i Seagate.Sense utilitzar l 'operador IN.
  -- Retorna un llistat amb tots els productes dels fabricants Asus, Hewlett-Packard i Seagate. Utilitzant l' operador IN.Retorna un llistat amb el nom i el preu de tots els productes dels fabricants el nom dels quals acabi per la vocal e.Retorna un llistat amb el nom i el preu de tots els productes el nom de fabricant dels quals contingui el car à cter w en el seu nom.Retorna un llistat amb el nom de producte,
  --   preu i nom de fabricant,
  --   de tots els productes que tinguin un preu major o igual a 180 €.Ordeni el resultat en primer lloc pel preu (en ordre descendent) i en segon lloc pel nom (en ordre ascendent) Retorna un llistat amb el codi i el nom de fabricant,
  --   solament d 'aquells fabricants que tenen productes associats en la base de dades.
  -- Retorna un llistat de tots els fabricants que existeixen en la base de dades, juntament amb els productes que té cadascun d' ells.El llistat haur à de mostrar tamb é aquells fabricants que no tenen productes associats.Retorna un llistat on nom é s apareguin aquells fabricants que no tenen cap producte associat.Retorna tots els productes del fabricador Lenovo.(
  --     Sense utilitzar
  --     INNER JOIN
  --   ).Retorna totes les dades dels productes que tenen el mateix preu que el producte m é s car del fabricador Lenovo.(
  --     Sense utilitzar
  --     INNER JOIN
  --   ).Llista el nom del producte m é s car del fabricador Lenovo.Llista el nom del producte m é s barat del fabricant Hewlett - Packard.Retorna tots els productes de la base de dades que tenen un preu major o igual al producte m é s car del fabricador Lenovo.Llesta tots els productes del fabricador Asus que tenen un preu superior al preu mitj à de tots els seus productes.