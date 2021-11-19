DROP DATABASE IF EXISTS optica;
CREATE DATABASE optica;
USE optica;
CREATE TABLE proveidors (
  id int NOT NULL AUTO_INCREMENT PRIMARY KEY,
  nom varchar(30) NOT NULL,
  adress varchar(200) NOT NULL,
  ciutat varchar(30) NOT NULL,
  pais varchar(30) NOT NULL,
  codi_postal varchar(30) NOT NULL,
  phone_number int NOT NULL,
  fax int NOT NULL,
  NIF int NOT NULL
);
CREATE TABLE ulleres (
  id int NOT NULL AUTO_INCREMENT PRIMARY KEY,
  marca varchar(30) NOT NULL,
  grad_dret int NOT NULL,
  grad_esquerre int NOT NULL,
  montura enum('flotant', 'pasta', 'metàl·lica') NOT NULL,
  color_montura varchar(30) NOT NULL,
  color_vedres varchar(30) NOT NULL,
  preu float NOT NULL,
  proveidor_id int NOT NULL,
  FOREIGN KEY(proveidor_id) REFERENCES proveidors(id)
);
CREATE TABLE clients(
  id int NOT NULL AUTO_INCREMENT PRIMARY KEY,
  nom varchar(30) NOT NULL,
  postcode varchar(30) NOT NULL,
  phone_number int NOT NULL,
  email varchar(30) NOT NULL,
  data_registre datetime NOT NULL,
  client_recomanador int,
  FOREIGN KEY(client_recomanador) REFERENCES clients(id)
);
CREATE TABLE empleats(
  id int NOT NULL AUTO_INCREMENT PRIMARY KEY,
  nom varchar(30) NOT NULL,
  cugnom varchar(30) NOT NULL
);
CREATE TABLE vendes(
  id int NOT NULL AUTO_INCREMENT PRIMARY KEY,
  ulleres_id int NOT NULL,
  empleat_id int NOT NULL,
  client_id int NOT NULL,
  data_venda date,
  FOREIGN KEY(ulleres_id) references ulleres(id),
  FOREIGN KEY(empleat_id) references empleats(id),
  FOREIGN KEY(client_id) references clients(id)
);
-- PROVEIDORS
INSERT INTO
  proveidors (
    nom,
    adress,
    ciutat,
    pais,
    codi_postal,
    phone_number,
    fax,
    NIF
  )
VALUES
  (
    'prov1',
    'calle falsa 123 5to 2da',
    'Barcelona',
    'España',
    '08012',
    111222333,
    444555666,
    777888999
  );
INSERT INTO
  proveidors (
    nom,
    adress,
    ciutat,
    pais,
    codi_postal,
    phone_number,
    fax,
    NIF
  )
VALUES
  (
    'prov2',
    'calle falsa 123 5to 2da',
    'Barcelona',
    'España',
    '08012',
    111222333,
    444555666,
    777888999
  );
INSERT INTO
  proveidors (
    nom,
    adress,
    ciutat,
    pais,
    codi_postal,
    phone_number,
    fax,
    NIF
  )
VALUES
  (
    'prov3',
    'calle falsa 123 5to 2da',
    'Barcelona',
    'España',
    '08012',
    111222333,
    444555666,
    777888999
  );
-- ULLERES
INSERT INTO
  ulleres (
    marca,
    grad_dret,
    grad_esquerre,
    montura,
    color_montura,
    color_vedres,
    preu,
    proveidor_id
  )
VALUES
  ('marca1', 2, 2, 'flotant', 'groc', 'blau', 80, 1);
INSERT INTO
  ulleres (
    marca,
    grad_dret,
    grad_esquerre,
    montura,
    color_montura,
    color_vedres,
    preu,
    proveidor_id
  )
VALUES
  (
    'marca2',
    2,
    2,
    'pasta',
    'gris',
    'transparent',
    100,
    2
  );
INSERT INTO
  ulleres (
    marca,
    grad_dret,
    grad_esquerre,
    montura,
    color_montura,
    color_vedres,
    preu,
    proveidor_id
  )
VALUES
  (
    'marca3',
    2,
    2,
    'metàl·lica',
    'verd',
    'marro',
    200,
    3
  );
-- CLIENTS
INSERT INTO
  clients (
    nom,
    postcode,
    phone_number,
    email,
    data_registre
  )
VALUES
  (
    'pepe lagos',
    'plaza sésamo 22 3 4',
    333222111,
    'pepe@mail.com',
    '2019/12/03'
  );
INSERT INTO
  clients (
    nom,
    postcode,
    phone_number,
    email,
    data_registre,
    client_recomanador
  )
VALUES
  (
    'juan dartes',
    'plaza sésamo 22 3 4',
    333222111,
    'juan@mail.com',
    '2020/12/03',
    1
  );
INSERT INTO
  clients (
    nom,
    postcode,
    phone_number,
    email,
    data_registre,
    client_recomanador
  )
VALUES
  (
    'susana horia',
    'plaza sésamo 22 3 4',
    333222111,
    'susi@mail.com',
    '2021/12/03',
    2
  );
-- EMPLEATS
INSERT INTO
  empleats (nom, cugnom)
VALUES
  ('lara', 'croft');
INSERT INTO
  empleats (nom, cugnom)
VALUES
  ('china', 'zorrilla');
INSERT INTO
  empleats (nom, cugnom)
VALUES
  ('lolo', 'pons');
-- VENDES
INSERT INTO
  vendes (ulleres_id, empleat_id, client_id, data_venda)
VALUES
  (1, 2, 3, '2021/12/03');
INSERT INTO
  vendes (ulleres_id, empleat_id, client_id, data_venda)
VALUES
  (2, 3, 1, '2019/12/03');
INSERT INTO
  vendes (ulleres_id, empleat_id, client_id, data_venda)
VALUES
  (3, 1, 2, '2020/12/03');
INSERT INTO
  vendes (ulleres_id, empleat_id, client_id, data_venda)
VALUES
  (3, 1, 1, '2022/08/03');
-- Llista el total de factures d'un client en un període determinat
SELECT
  *
FROM
  vendes
WHERE
  client_id = 1
  AND data_venda > '2018/03/03';
-- Llista els diferents models d'ulleres que ha venut un empleat durant un any
SELECT
  *
FROM
  ulleres u
  INNER JOIN vendes v ON u.id = v.ulleres_id
WHERE
  v.empleat_id = 3
  AND v.data_venda > '2019/11/03'
  AND v.data_venda < '2020/11/03';
-- Llista els diferents proveïdors que han subministrat ulleres venudes amb èxit per l'òptica
SELECT
  p.nom
FROM
  proveidors p
  INNER JOIN ulleres u ON p.id = u.proveidor_id
  INNER JOIN vendes v ON u.id = v.ulleres_id