DROP DATABASE IF EXISTS pizzeria;
CREATE DATABASE pizzeria;
USE pizzeria;
CREATE TABLE provincies(
  id int NOT NULL AUTO_INCREMENT PRIMARY KEY,
  provincia_name varchar(30) NOT NULL
);
CREATE TABLE localitats(
  id int NOT NULL AUTO_INCREMENT PRIMARY KEY,
  localitat_name varchar(30) NOT NULL,
  provincia_id int NOT NULL,
  FOREIGN KEY(provincia_id) references provincies(id)
);
CREATE TABLE clients(
  id int NOT NULL AUTO_INCREMENT PRIMARY KEY,
  client_name varchar(30) NOT NULL,
  surname varchar(30) NOT NULL,
  address varchar(120) NOT NULL,
  postcode varchar(10) NOT NULL,
  localitat_id int NOT NULL,
  telephone int NOT NULL,
  FOREIGN KEY(localitat_id) references localitats(id)
);
CREATE TABLE shops (
  id int NOT NULL AUTO_INCREMENT PRIMARY KEY,
  address varchar(120) NOT NULL,
  postcode int NOT NULL,
  localitat_id int NOT NULL,
  FOREIGN KEY(localitat_id) references localitats(id)
);
CREATE TABLE employees (
  id int NOT NULL AUTO_INCREMENT PRIMARY KEY,
  employee_name varchar(30) NOT NULL,
  employee_surname varchar(30) NOT NULL,
  NIF int NOT NULL,
  telephone int NOT NULL,
  employee enum('cook', 'rider')
);
CREATE TABLE pizza_categories (
  id int NOT NULL AUTO_INCREMENT PRIMARY KEY,
  pizza_name varchar(30) NOT NULL
);
CREATE TABLE pizza (
  id int NOT NULL AUTO_INCREMENT PRIMARY KEY,
  typeof_pizza_id int NOT NULL,
  description varchar(30) NOT NULL,
  img blob NOT NULL,
  price float NOT NULL,
  FOREIGN KEY(typeof_pizza_id) references pizza_categories(id)
);
CREATE TABLE burger (
  id int NOT NULL AUTO_INCREMENT PRIMARY KEY,
  burger_name varchar(30) NOT NULL,
  description varchar(30) NOT NULL,
  img blob NOT NULL,
  price float NOT NULL
);
CREATE TABLE drink (
  id int NOT NULL AUTO_INCREMENT PRIMARY KEY,
  drink_name varchar(30) NOT NULL,
  description varchar(30) NOT NULL,
  img blob NOT NULL,
  price float NOT NULL
);
CREATE TABLE orders(
  id int NOT NULL AUTO_INCREMENT PRIMARY KEY,
  date_and_time timestamp NOT NULL,
  service enum('delivery', 'take_away') NOT NULL,
  pizza_id int,
  burger_id int,
  drink_id int,
  total_price float NOT NULL,
  client_id int NOT NULL,
  shop_id int NOT NULL,
  FOREIGN KEY(client_id) references clients(id),
  FOREIGN KEY(shop_id) references shops(id),
  FOREIGN KEY(pizza_id) references pizza(id),
  FOREIGN KEY(burger_id) references burger(id),
  FOREIGN KEY(drink_id) references drink(id)
);
CREATE TABLE deliveries (
  id int NOT NULL AUTO_INCREMENT PRIMARY KEY,
  rider_id int NOT NULL,
  date_and_time timestamp NOT NULL,
  order_id int NOT NULL,
  FOREIGN KEY(rider_id) references employees(id),
  FOREIGN KEY(order_id) references orders(id)
);
-- PROVINCIES
INSERT INTO
  provincies (provincia_name)
VALUES
  ('provincia1');
INSERT INTO
  provincies (provincia_name)
VALUES
  ('provincia2');
INSERT INTO
  provincies (provincia_name)
VALUES
  ('provincia3');
-- LOCALITATS
INSERT INTO
  localitats (localitat_name, provincia_id)
VALUES
  ('localitat1', 1);
INSERT INTO
  localitats (localitat_name, provincia_id)
VALUES
  ('localitat2', 2);
INSERT INTO
  localitats (localitat_name, provincia_id)
VALUES
  ('localitat3', 1);
-- CLIENTS
INSERT INTO
  clients (
    client_name,
    surname,
    address,
    postcode,
    localitat_id,
    telephone
  )
VALUES
  (
    'pepe',
    'grillo',
    'calle falsa 123',
    08012,
    1,
    111222333
  );
INSERT INTO
  clients (
    client_name,
    surname,
    address,
    postcode,
    localitat_id,
    telephone
  )
VALUES
  (
    'susana',
    'horia',
    'calle falsa 123',
    08012,
    2,
    111222333
  );
INSERT INTO
  clients (
    client_name,
    surname,
    address,
    postcode,
    localitat_id,
    telephone
  )
VALUES
  (
    'john',
    'smith',
    'calle falsa 123',
    08012,
    3,
    111222333
  );
-- SHOPS
INSERT INTO
  shops (address, postcode, localitat_id)
VALUES
  ('plaza sesamo 33', '08014', 1);
INSERT INTO
  shops (address, postcode, localitat_id)
VALUES
  ('plaza sesamo 33', '08014', 2);
INSERT INTO
  shops (address, postcode, localitat_id)
VALUES
  ('plaza sesamo 33', '08014', 2);
-- EMPLOYEES
INSERT INTO
  employees (
    employee_name,
    employee_surname,
    NIF,
    telephone,
    employee
  )
VALUES
  ('robert', 'plant', 44455566, 999000888, 'cook');
INSERT INTO
  employees (
    employee_name,
    employee_surname,
    NIF,
    telephone,
    employee
  )
VALUES
  ('jimmy', 'page', 44455566, 999000888, 'rider');
INSERT INTO
  employees (
    employee_name,
    employee_surname,
    NIF,
    telephone,
    employee
  )
VALUES
  ('john', 'bonham', 44455566, 999000888, 'cook');
-- PIZZA CATEGORIAS
INSERT INTO
  pizza_categories (pizza_name)
VALUES
  ('dixie');
INSERT INTO
  pizza_categories (pizza_name)
VALUES
  ('lala');
INSERT INTO
  pizza_categories (pizza_name)
VALUES
  ('po');
-- PIZZAS
INSERT INTO
  pizza (typeof_pizza_id, description, img, price)
VALUES
  (
    1,
    'Lorem ipsum dolor sit amet',
    'img/jpg',
    7.30
  );
INSERT INTO
  pizza (typeof_pizza_id, description, img, price)
VALUES
  (
    2,
    'Lorem ipsum dolor sit amet',
    'img/jpg',
    11.30
  );
INSERT INTO
  pizza (typeof_pizza_id, description, img, price)
VALUES
  (
    3,
    'Lorem ipsum dolor sit amet',
    'img/jpg',
    9.30
  );
-- BURGERS
INSERT INTO
  burger (burger_name, description, img, price)
VALUES
  (
    'burger1',
    'Lorem ipsum dolor sit amet',
    'img/jpg',
    8.30
  );
INSERT INTO
  burger (burger_name, description, img, price)
VALUES
  (
    'burger2',
    'Lorem ipsum dolor sit amet',
    'img/jpg',
    9.50
  );
INSERT INTO
  burger (burger_name, description, img, price)
VALUES
  (
    'burger3',
    'Lorem ipsum dolor sit amet',
    'img/jpg',
    6.70
  );
-- DRINK
INSERT INTO
  drink (drink_name, description, img, price)
VALUES
  (
    'drink1',
    'Lorem ipsum dolor sit amet',
    'img/jpg',
    2.30
  );
INSERT INTO
  drink (drink_name, description, img, price)
VALUES
  (
    'drink2',
    'Lorem ipsum dolor sit amet',
    'img/jpg',
    1.30
  );
INSERT INTO
  drink (drink_name, description, img, price)
VALUES
  (
    'drink3',
    'Lorem ipsum dolor sit amet',
    'img/jpg',
    3.30
  );
-- ORDERS
INSERT INTO
  orders (
    date_and_time,
    service,
    pizza_id,
    burger_id,
    drink_id,
    total_price,
    client_id,
    shop_id
  )
VALUES
  (
    '2021-11-16 17:49:59',
    'delivery',
    1,
    2,
    3,
    13.50,
    1,
    1
  );
INSERT INTO
  orders (
    date_and_time,
    service,
    pizza_id,
    burger_id,
    drink_id,
    total_price,
    client_id,
    shop_id
  )
VALUES
  (
    '2021-10-16 17:49:59',
    'take_away',
    2,
    3,
    3,
    10.50,
    3,
    2
  );
INSERT INTO
  orders (
    date_and_time,
    service,
    pizza_id,
    burger_id,
    drink_id,
    total_price,
    client_id,
    shop_id
  )
VALUES
  (
    '2021-11-30 15:49:59',
    'delivery',
    3,
    2,
    1,
    13.50,
    2,
    3
  );
-- DELIVERIES
INSERT INTO
  deliveries (rider_id, date_and_time, order_id)
VALUES
  (1, '2021-10-16 17:49:59', 2);
INSERT INTO
  deliveries (rider_id, date_and_time, order_id)
VALUES
  (2, '2021-11-16 17:49:59', 1);
INSERT INTO
  deliveries (rider_id, date_and_time, order_id)
VALUES
  (1, '2021-10-25 17:49:59', 3);
-- Llista quants productes de la categoria 'begudes' s'han venut en una determinada localitat
SELECT
  d.drink_name
FROM
  drink d
  INNER JOIN orders o ON o.drink_id = d.id
  INNER JOIN shops s ON s.id = o.shop_id
  INNER JOIN localitats l ON l.id = s.localitat_id
WHERE
  l.localitat_name = 'localitat1';
-- Llista quantes comandes ha efectuat un determinat empleat
SELECT
  o.*
FROM
  orders o
  INNER JOIN shops s ON s.id = o.shop_id
  INNER JOIN deliveries d ON d.order_id = o.id
  INNER JOIN employees e ON e.id = d.rider_id
WHERE
  e.employee_name = 'robert';