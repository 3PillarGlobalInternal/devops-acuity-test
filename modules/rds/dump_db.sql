CREATE DATABASE dummy_db;
GO

USE dummy_db;
GO

--
-- TABLE STRUCTURE FOR: customers
--

IF OBJECT_ID('customers', 'U') IS NOT NULL
  DROP TABLE customers;
GO

CREATE TABLE customers (
  id INT IDENTITY(1,1) NOT NULL,
  name VARCHAR(100) NOT NULL,
  last_name VARCHAR(100) NOT NULL,
  age VARCHAR(255) NOT NULL,
  birthday DATE NULL,
  PRIMARY KEY (id)
);
GO

INSERT INTO customers (name, last_name, age, birthday) VALUES ('debitis', 'Hilll', '2538', '1995-05-16');
INSERT INTO customers (name, last_name, age, birthday) VALUES ('aut', 'Ratke', '26982', '1998-04-24');
INSERT INTO customers (name, last_name, age, birthday) VALUES ('commodi', 'Roob', '5', '2007-05-24');
INSERT INTO customers (name, last_name, age, birthday) VALUES ('exercitationem', 'Langosh', '', '1980-09-05');
INSERT INTO customers (name, last_name, age, birthday) VALUES ('reprehenderit', 'Carroll', '', '1984-06-01');
INSERT INTO customers (name, last_name, age, birthday) VALUES ('qui', 'Wilderman', '676', '1992-07-10');
INSERT INTO customers (name, last_name, age, birthday) VALUES ('consequatur', 'Bauch', '9299508', '2005-08-07');
GO

--
-- TABLE STRUCTURE FOR: item
--

IF OBJECT_ID('item', 'U') IS NOT NULL
  DROP TABLE item;
GO

CREATE TABLE item (
  name VARCHAR(100) NOT NULL,
  price DECIMAL(10, 2) NOT NULL
);
GO

INSERT INTO item (name, price) VALUES ('est', '94391.63');
INSERT INTO item (name, price) VALUES ('mollitia', '1.00');
INSERT INTO item (name, price) VALUES ('architecto', '6.55');
INSERT INTO item (name, price) VALUES ('qui', '26.04');
INSERT INTO item (name, price) VALUES ('fuga', '714.34');
INSERT INTO item (name, price) VALUES ('et', '25793.00');
INSERT INTO item (name, price) VALUES ('omnis', '3.36');
INSERT INTO item (name, price) VALUES ('voluptatem', '435.48');
INSERT INTO item (name, price) VALUES ('velit', '50184.00');
INSERT INTO item (name, price) VALUES ('fugiat', '9163.90');
INSERT INTO item (name, price) VALUES ('et', '2736.92');
GO

--
-- TABLE STRUCTURE FOR: [user]
--

IF OBJECT_ID('[user]', 'U') IS NOT NULL
  DROP TABLE [user];
GO

CREATE TABLE [user] (
  id INT IDENTITY(1,1) NOT NULL,
  name VARCHAR(100) NOT NULL,
  last_name VARCHAR(100) NOT NULL,
  age VARCHAR(255) NOT NULL,
  PRIMARY KEY (id)
);
GO

INSERT INTO [user] (name, last_name, age) VALUES ('corrupti', 'Schaden', '634');
INSERT INTO [user] (name, last_name, age) VALUES ('voluptatum', 'McLaughlin', '3');
INSERT INTO [user] (name, last_name, age) VALUES ('voluptas', 'McClure', '37738');
INSERT INTO [user] (name, last_name, age) VALUES ('est', 'Murphy', '167');
INSERT INTO [user] (name, last_name, age) VALUES ('dolores', 'Herzog', '6628054');
INSERT INTO [user] (name, last_name, age) VALUES ('dolores', 'Dach', '');
INSERT INTO [user] (name, last_name, age) VALUES ('dolores', 'Mayer', '9089174');
INSERT INTO [user] (name, last_name, age) VALUES ('ut', 'Altenwerth', '');
INSERT INTO [user] (name, last_name, age) VALUES ('illum', 'Sipes', '32585');
INSERT INTO [user] (name, last_name, age) VALUES ('consequatur', 'Stanton', '6405');
INSERT INTO [user] (name, last_name, age) VALUES ('rerum', 'Swift', '66885203');
GO