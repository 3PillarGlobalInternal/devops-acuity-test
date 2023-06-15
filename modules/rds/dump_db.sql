CREATE DATABASE dummy_db;

USE dummy_db;

#
# TABLE STRUCTURE FOR: customers
#

DROP TABLE IF EXISTS `customers`;

CREATE TABLE `customers` (
  `id` int(9) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(100) NOT NULL,
  `last_name` varchar(100) NOT NULL,
  `age` varchar(255) NOT NULL,
  `birthday` date DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=101 DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

INSERT INTO `customers` (`id`, `name`, `last_name`, `age`, `birthday`) VALUES (1, 'debitis', 'Hilll', '2538', '1995-05-16');
INSERT INTO `customers` (`id`, `name`, `last_name`, `age`, `birthday`) VALUES (2, 'aut', 'Ratke', '26982', '1998-04-24');
INSERT INTO `customers` (`id`, `name`, `last_name`, `age`, `birthday`) VALUES (3, 'commodi', 'Roob', '5', '2007-05-24');
INSERT INTO `customers` (`id`, `name`, `last_name`, `age`, `birthday`) VALUES (4, 'exercitationem', 'Langosh', '', '1980-09-05');
INSERT INTO `customers` (`id`, `name`, `last_name`, `age`, `birthday`) VALUES (5, 'reprehenderit', 'Carroll', '', '1984-06-01');
INSERT INTO `customers` (`id`, `name`, `last_name`, `age`, `birthday`) VALUES (6, 'qui', 'Wilderman', '676', '1992-07-10');
INSERT INTO `customers` (`id`, `name`, `last_name`, `age`, `birthday`) VALUES (7, 'consequatur', 'Bauch', '9299508', '2005-08-07');
INSERT INTO `customers` (`id`, `name`, `last_name`, `age`, `birthday`) VALUES (8, 'sint', 'Mosciski', '97871', '2017-08-27');
INSERT INTO `customers` (`id`, `name`, `last_name`, `age`, `birthday`) VALUES (9, 'quo', 'Christiansen', '577023', '1991-08-19');
INSERT INTO `customers` (`id`, `name`, `last_name`, `age`, `birthday`) VALUES (10, 'autem', 'Boyer', '98732', '1985-09-19');
INSERT INTO `customers` (`id`, `name`, `last_name`, `age`, `birthday`) VALUES (11, 'repudiandae', 'Wuckert', '640582', '1979-10-20');
INSERT INTO `customers` (`id`, `name`, `last_name`, `age`, `birthday`) VALUES (12, 'debitis', 'Berge', '74', '2000-09-09');
INSERT INTO `customers` (`id`, `name`, `last_name`, `age`, `birthday`) VALUES (13, 'et', 'Hoppe', '974', '2020-11-05');
INSERT INTO `customers` (`id`, `name`, `last_name`, `age`, `birthday`) VALUES (14, 'accusantium', 'Willms', '65876', '2018-05-22');
INSERT INTO `customers` (`id`, `name`, `last_name`, `age`, `birthday`) VALUES (15, 'qui', 'Durgan', '872428', '2004-05-25');
INSERT INTO `customers` (`id`, `name`, `last_name`, `age`, `birthday`) VALUES (16, 'est', 'Kassulke', '7260', '1970-02-27');
INSERT INTO `customers` (`id`, `name`, `last_name`, `age`, `birthday`) VALUES (17, 'est', 'Schmitt', '295622', '2016-03-07');
INSERT INTO `customers` (`id`, `name`, `last_name`, `age`, `birthday`) VALUES (18, 'nisi', 'Raynor', '11', '1981-09-22');
INSERT INTO `customers` (`id`, `name`, `last_name`, `age`, `birthday`) VALUES (19, 'accusantium', 'Pacocha', '411715', '1989-09-18');
INSERT INTO `customers` (`id`, `name`, `last_name`, `age`, `birthday`) VALUES (20, 'maiores', 'Morissette', '12', '2009-09-13');
INSERT INTO `customers` (`id`, `name`, `last_name`, `age`, `birthday`) VALUES (21, 'vero', 'Adams', '12937', '2010-08-21');
INSERT INTO `customers` (`id`, `name`, `last_name`, `age`, `birthday`) VALUES (22, 'eos', 'Emmerich', '3389366', '2009-04-14');
INSERT INTO `customers` (`id`, `name`, `last_name`, `age`, `birthday`) VALUES (23, 'assumenda', 'Hettinger', '59797', '1985-07-21');
INSERT INTO `customers` (`id`, `name`, `last_name`, `age`, `birthday`) VALUES (24, 'qui', 'Robel', '98', '1998-09-27');
INSERT INTO `customers` (`id`, `name`, `last_name`, `age`, `birthday`) VALUES (25, 'qui', 'Bernhard', '', '1998-01-08');
INSERT INTO `customers` (`id`, `name`, `last_name`, `age`, `birthday`) VALUES (26, 'praesentium', 'Auer', '2542290', '1972-03-21');
INSERT INTO `customers` (`id`, `name`, `last_name`, `age`, `birthday`) VALUES (27, 'at', 'Kuhic', '512140417', '2019-04-30');
INSERT INTO `customers` (`id`, `name`, `last_name`, `age`, `birthday`) VALUES (28, 'enim', 'Roob', '89119', '2015-04-20');
INSERT INTO `customers` (`id`, `name`, `last_name`, `age`, `birthday`) VALUES (29, 'incidunt', 'Murray', '', '1989-07-26');
INSERT INTO `customers` (`id`, `name`, `last_name`, `age`, `birthday`) VALUES (30, 'omnis', 'Abernathy', '3361', '1977-06-10');
INSERT INTO `customers` (`id`, `name`, `last_name`, `age`, `birthday`) VALUES (31, 'sunt', 'Beatty', '', '1973-02-01');
INSERT INTO `customers` (`id`, `name`, `last_name`, `age`, `birthday`) VALUES (32, 'possimus', 'Kon', '283380', '1986-10-19');
INSERT INTO `customers` (`id`, `name`, `last_name`, `age`, `birthday`) VALUES (33, 'saepe', 'Hyatt', '776648907', '2011-04-08');
INSERT INTO `customers` (`id`, `name`, `last_name`, `age`, `birthday`) VALUES (34, 'nesciunt', 'Lemke', '7', '2004-10-02');
INSERT INTO `customers` (`id`, `name`, `last_name`, `age`, `birthday`) VALUES (35, 'quis', 'Ernser', '131', '1970-09-09');
INSERT INTO `customers` (`id`, `name`, `last_name`, `age`, `birthday`) VALUES (36, 'excepturi', 'Barton', '7', '1989-07-13');
INSERT INTO `customers` (`id`, `name`, `last_name`, `age`, `birthday`) VALUES (37, 'quaerat', 'Murphy', '784618', '2016-04-07');
INSERT INTO `customers` (`id`, `name`, `last_name`, `age`, `birthday`) VALUES (38, 'velit', 'Powlowski', '', '2008-04-21');
INSERT INTO `customers` (`id`, `name`, `last_name`, `age`, `birthday`) VALUES (39, 'consequatur', 'Wisoky', '965039360', '1976-03-03');
INSERT INTO `customers` (`id`, `name`, `last_name`, `age`, `birthday`) VALUES (40, 'quia', 'Walsh', '2108', '1991-01-14');
INSERT INTO `customers` (`id`, `name`, `last_name`, `age`, `birthday`) VALUES (41, 'consequatur', 'Schuster', '7738', '2017-07-03');
INSERT INTO `customers` (`id`, `name`, `last_name`, `age`, `birthday`) VALUES (42, 'sit', 'Marks', '935111698', '1974-03-04');
INSERT INTO `customers` (`id`, `name`, `last_name`, `age`, `birthday`) VALUES (43, 'est', 'Cassin', '3865147', '2011-05-04');
INSERT INTO `customers` (`id`, `name`, `last_name`, `age`, `birthday`) VALUES (44, 'ut', 'Collins', '398525', '2019-09-13');
INSERT INTO `customers` (`id`, `name`, `last_name`, `age`, `birthday`) VALUES (45, 'voluptatem', 'Witting', '3229', '1986-03-23');
INSERT INTO `customers` (`id`, `name`, `last_name`, `age`, `birthday`) VALUES (46, 'architecto', 'Satterfield', '3', '2007-06-02');
INSERT INTO `customers` (`id`, `name`, `last_name`, `age`, `birthday`) VALUES (47, 'quam', 'Langosh', '982700321', '1993-09-26');
INSERT INTO `customers` (`id`, `name`, `last_name`, `age`, `birthday`) VALUES (48, 'magni', 'Smitham', '2755', '2015-08-09');
INSERT INTO `customers` (`id`, `name`, `last_name`, `age`, `birthday`) VALUES (49, 'eaque', 'Fahey', '825440', '2013-02-16');
INSERT INTO `customers` (`id`, `name`, `last_name`, `age`, `birthday`) VALUES (50, 'voluptas', 'Johnson', '589', '2003-09-25');
INSERT INTO `customers` (`id`, `name`, `last_name`, `age`, `birthday`) VALUES (51, 'magni', 'Erdman', '69', '1990-09-06');
INSERT INTO `customers` (`id`, `name`, `last_name`, `age`, `birthday`) VALUES (52, 'quae', 'Murazik', '', '1970-08-23');
INSERT INTO `customers` (`id`, `name`, `last_name`, `age`, `birthday`) VALUES (53, 'corrupti', 'Connell', '342922', '1981-07-09');
INSERT INTO `customers` (`id`, `name`, `last_name`, `age`, `birthday`) VALUES (54, 'facere', 'Rau', '689', '2007-02-16');
INSERT INTO `customers` (`id`, `name`, `last_name`, `age`, `birthday`) VALUES (55, 'earum', 'Tillman', '48', '1973-06-30');
INSERT INTO `customers` (`id`, `name`, `last_name`, `age`, `birthday`) VALUES (56, 'aliquid', 'Klocko', '598320', '1980-10-10');
INSERT INTO `customers` (`id`, `name`, `last_name`, `age`, `birthday`) VALUES (57, 'est', 'Hoeger', '901', '1971-05-07');
INSERT INTO `customers` (`id`, `name`, `last_name`, `age`, `birthday`) VALUES (58, 'explicabo', 'Rogahn', '61', '2013-09-22');
INSERT INTO `customers` (`id`, `name`, `last_name`, `age`, `birthday`) VALUES (59, 'illum', 'Wunsch', '434', '1977-04-24');
INSERT INTO `customers` (`id`, `name`, `last_name`, `age`, `birthday`) VALUES (60, 'optio', 'Reichel', '439308131', '1990-09-16');
INSERT INTO `customers` (`id`, `name`, `last_name`, `age`, `birthday`) VALUES (61, 'fugiat', 'Zboncak', '11751070', '1979-12-14');
INSERT INTO `customers` (`id`, `name`, `last_name`, `age`, `birthday`) VALUES (62, 'numquam', 'Bergnaum', '41', '2006-12-02');
INSERT INTO `customers` (`id`, `name`, `last_name`, `age`, `birthday`) VALUES (63, 'itaque', 'Cole', '9313', '2017-10-16');
INSERT INTO `customers` (`id`, `name`, `last_name`, `age`, `birthday`) VALUES (64, 'unde', 'Dickinson', '909', '1985-08-22');
INSERT INTO `customers` (`id`, `name`, `last_name`, `age`, `birthday`) VALUES (65, 'sequi', 'Bins', '8044425', '1983-10-23');
INSERT INTO `customers` (`id`, `name`, `last_name`, `age`, `birthday`) VALUES (66, 'est', 'Smitham', '81717437', '2001-04-05');
INSERT INTO `customers` (`id`, `name`, `last_name`, `age`, `birthday`) VALUES (67, 'necessitatibus', 'Johnson', '903', '1988-06-05');
INSERT INTO `customers` (`id`, `name`, `last_name`, `age`, `birthday`) VALUES (68, 'dolorum', 'Gusikowski', '42918', '1988-10-20');
INSERT INTO `customers` (`id`, `name`, `last_name`, `age`, `birthday`) VALUES (69, 'eos', 'Zemlak', '663', '1992-04-23');
INSERT INTO `customers` (`id`, `name`, `last_name`, `age`, `birthday`) VALUES (70, 'neque', 'Borer', '678716898', '2022-09-23');
INSERT INTO `customers` (`id`, `name`, `last_name`, `age`, `birthday`) VALUES (71, 'harum', 'Collier', '23008147', '1988-12-26');
INSERT INTO `customers` (`id`, `name`, `last_name`, `age`, `birthday`) VALUES (72, 'porro', 'Windler', '', '1993-04-25');
INSERT INTO `customers` (`id`, `name`, `last_name`, `age`, `birthday`) VALUES (73, 'placeat', 'Feil', '', '1988-07-08');
INSERT INTO `customers` (`id`, `name`, `last_name`, `age`, `birthday`) VALUES (74, 'sed', 'Vandervort', '14966', '2016-12-04');
INSERT INTO `customers` (`id`, `name`, `last_name`, `age`, `birthday`) VALUES (75, 'sed', 'Morissette', '543164', '1983-01-16');
INSERT INTO `customers` (`id`, `name`, `last_name`, `age`, `birthday`) VALUES (76, 'non', 'Schowalter', '97', '1986-06-26');
INSERT INTO `customers` (`id`, `name`, `last_name`, `age`, `birthday`) VALUES (77, 'corporis', 'West', '756', '1997-10-19');
INSERT INTO `customers` (`id`, `name`, `last_name`, `age`, `birthday`) VALUES (78, 'voluptas', 'Bradtke', '68', '2020-08-14');
INSERT INTO `customers` (`id`, `name`, `last_name`, `age`, `birthday`) VALUES (79, 'non', 'Walsh', '29', '2015-10-24');
INSERT INTO `customers` (`id`, `name`, `last_name`, `age`, `birthday`) VALUES (80, 'beatae', 'Cremin', '743105632', '2002-10-05');
INSERT INTO `customers` (`id`, `name`, `last_name`, `age`, `birthday`) VALUES (81, 'quam', 'Mann', '10', '2011-02-28');
INSERT INTO `customers` (`id`, `name`, `last_name`, `age`, `birthday`) VALUES (82, 'repellat', 'Schimmel', '7968834', '1985-12-20');
INSERT INTO `customers` (`id`, `name`, `last_name`, `age`, `birthday`) VALUES (83, 'exercitationem', 'Mertz', '81916783', '2014-08-13');
INSERT INTO `customers` (`id`, `name`, `last_name`, `age`, `birthday`) VALUES (84, 'totam', 'Johns', '61345', '1999-08-21');
INSERT INTO `customers` (`id`, `name`, `last_name`, `age`, `birthday`) VALUES (85, 'error', 'Heathcote', '43808', '2003-11-24');
INSERT INTO `customers` (`id`, `name`, `last_name`, `age`, `birthday`) VALUES (86, 'qui', 'Fisher', '2744822', '1976-01-26');
INSERT INTO `customers` (`id`, `name`, `last_name`, `age`, `birthday`) VALUES (87, 'ullam', 'Gerhold', '', '1998-01-23');
INSERT INTO `customers` (`id`, `name`, `last_name`, `age`, `birthday`) VALUES (88, 'explicabo', 'Feil', '19358868', '1980-11-10');
INSERT INTO `customers` (`id`, `name`, `last_name`, `age`, `birthday`) VALUES (89, 'sint', 'Jones', '776', '2012-06-09');
INSERT INTO `customers` (`id`, `name`, `last_name`, `age`, `birthday`) VALUES (90, 'consequatur', 'Rempel', '258', '1979-04-13');
INSERT INTO `customers` (`id`, `name`, `last_name`, `age`, `birthday`) VALUES (91, 'quia', 'Wehner', '821456486', '1973-03-22');
INSERT INTO `customers` (`id`, `name`, `last_name`, `age`, `birthday`) VALUES (92, 'nisi', 'Schmitt', '104134361', '1980-03-10');
INSERT INTO `customers` (`id`, `name`, `last_name`, `age`, `birthday`) VALUES (93, 'doloremque', 'Kreiger', '3346946', '2013-08-18');
INSERT INTO `customers` (`id`, `name`, `last_name`, `age`, `birthday`) VALUES (94, 'quia', 'Pollich', '1355', '1994-08-02');
INSERT INTO `customers` (`id`, `name`, `last_name`, `age`, `birthday`) VALUES (95, 'aliquam', 'Farrell', '642792', '2013-12-06');
INSERT INTO `customers` (`id`, `name`, `last_name`, `age`, `birthday`) VALUES (96, 'nemo', 'Schaefer', '48016', '2013-09-11');
INSERT INTO `customers` (`id`, `name`, `last_name`, `age`, `birthday`) VALUES (97, 'non', 'Erdman', '468', '1997-12-14');
INSERT INTO `customers` (`id`, `name`, `last_name`, `age`, `birthday`) VALUES (98, 'explicabo', 'Jacobs', '', '1984-02-23');
INSERT INTO `customers` (`id`, `name`, `last_name`, `age`, `birthday`) VALUES (99, 'et', 'Kon', '899860337', '1990-04-13');
INSERT INTO `customers` (`id`, `name`, `last_name`, `age`, `birthday`) VALUES (100, 'sint', 'Huels', '91887565', '1991-12-03');


#
# TABLE STRUCTURE FOR: item
#

DROP TABLE IF EXISTS `item`;

CREATE TABLE `item` (
  `name` varchar(100) NOT NULL,
  `price` decimal(10,2) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

INSERT INTO `item` (`name`, `price`) VALUES ('est', '94391.63');
INSERT INTO `item` (`name`, `price`) VALUES ('mollitia', '1.00');
INSERT INTO `item` (`name`, `price`) VALUES ('architecto', '6.55');
INSERT INTO `item` (`name`, `price`) VALUES ('qui', '26.04');
INSERT INTO `item` (`name`, `price`) VALUES ('fuga', '714.34');
INSERT INTO `item` (`name`, `price`) VALUES ('et', '25793.00');
INSERT INTO `item` (`name`, `price`) VALUES ('omnis', '3.36');
INSERT INTO `item` (`name`, `price`) VALUES ('voluptatem', '435.48');
INSERT INTO `item` (`name`, `price`) VALUES ('velit', '50184.00');
INSERT INTO `item` (`name`, `price`) VALUES ('fugiat', '9163.90');
INSERT INTO `item` (`name`, `price`) VALUES ('et', '2736.92');
INSERT INTO `item` (`name`, `price`) VALUES ('sed', '4835551.78');
INSERT INTO `item` (`name`, `price`) VALUES ('doloremque', '13621280.00');
INSERT INTO `item` (`name`, `price`) VALUES ('quidem', '1833.00');
INSERT INTO `item` (`name`, `price`) VALUES ('qui', '5.68');
INSERT INTO `item` (`name`, `price`) VALUES ('rerum', '19024021.79');
INSERT INTO `item` (`name`, `price`) VALUES ('sit', '5574.50');
INSERT INTO `item` (`name`, `price`) VALUES ('aut', '2330.06');
INSERT INTO `item` (`name`, `price`) VALUES ('consequatur', '539172.09');
INSERT INTO `item` (`name`, `price`) VALUES ('ullam', '4.24');
INSERT INTO `item` (`name`, `price`) VALUES ('magnam', '111.67');
INSERT INTO `item` (`name`, `price`) VALUES ('rem', '47546315.20');
INSERT INTO `item` (`name`, `price`) VALUES ('dolorem', '0.00');
INSERT INTO `item` (`name`, `price`) VALUES ('soluta', '6.10');
INSERT INTO `item` (`name`, `price`) VALUES ('sequi', '416123.98');
INSERT INTO `item` (`name`, `price`) VALUES ('dolores', '75226.16');
INSERT INTO `item` (`name`, `price`) VALUES ('qui', '95.30');
INSERT INTO `item` (`name`, `price`) VALUES ('perferendis', '28069.65');
INSERT INTO `item` (`name`, `price`) VALUES ('est', '10721.20');
INSERT INTO `item` (`name`, `price`) VALUES ('vero', '404.16');
INSERT INTO `item` (`name`, `price`) VALUES ('error', '459.27');
INSERT INTO `item` (`name`, `price`) VALUES ('tempore', '1809117.48');
INSERT INTO `item` (`name`, `price`) VALUES ('sed', '5413.02');
INSERT INTO `item` (`name`, `price`) VALUES ('facilis', '0.26');
INSERT INTO `item` (`name`, `price`) VALUES ('dolorum', '0.00');
INSERT INTO `item` (`name`, `price`) VALUES ('fugit', '1.33');
INSERT INTO `item` (`name`, `price`) VALUES ('rerum', '4480254.40');
INSERT INTO `item` (`name`, `price`) VALUES ('expedita', '19.55');
INSERT INTO `item` (`name`, `price`) VALUES ('asperiores', '2180.36');
INSERT INTO `item` (`name`, `price`) VALUES ('inventore', '99999999.99');
INSERT INTO `item` (`name`, `price`) VALUES ('occaecati', '63.33');
INSERT INTO `item` (`name`, `price`) VALUES ('dolorem', '4073.16');
INSERT INTO `item` (`name`, `price`) VALUES ('autem', '20.44');
INSERT INTO `item` (`name`, `price`) VALUES ('sed', '1884.82');
INSERT INTO `item` (`name`, `price`) VALUES ('error', '373423.55');
INSERT INTO `item` (`name`, `price`) VALUES ('alias', '347.92');
INSERT INTO `item` (`name`, `price`) VALUES ('ab', '954205.13');
INSERT INTO `item` (`name`, `price`) VALUES ('rerum', '0.00');
INSERT INTO `item` (`name`, `price`) VALUES ('et', '0.00');
INSERT INTO `item` (`name`, `price`) VALUES ('magnam', '1.29');
INSERT INTO `item` (`name`, `price`) VALUES ('quis', '0.00');
INSERT INTO `item` (`name`, `price`) VALUES ('ipsam', '0.00');
INSERT INTO `item` (`name`, `price`) VALUES ('aut', '1490785.50');
INSERT INTO `item` (`name`, `price`) VALUES ('facere', '5.00');
INSERT INTO `item` (`name`, `price`) VALUES ('labore', '22443720.01');
INSERT INTO `item` (`name`, `price`) VALUES ('repellat', '3757.49');
INSERT INTO `item` (`name`, `price`) VALUES ('nostrum', '10.44');
INSERT INTO `item` (`name`, `price`) VALUES ('beatae', '58923.08');
INSERT INTO `item` (`name`, `price`) VALUES ('et', '1.31');
INSERT INTO `item` (`name`, `price`) VALUES ('quidem', '309351.22');
INSERT INTO `item` (`name`, `price`) VALUES ('recusandae', '0.00');
INSERT INTO `item` (`name`, `price`) VALUES ('voluptatem', '3.44');
INSERT INTO `item` (`name`, `price`) VALUES ('pariatur', '91257307.68');
INSERT INTO `item` (`name`, `price`) VALUES ('odit', '99999999.99');
INSERT INTO `item` (`name`, `price`) VALUES ('qui', '7871.57');
INSERT INTO `item` (`name`, `price`) VALUES ('ut', '443717.89');
INSERT INTO `item` (`name`, `price`) VALUES ('sit', '8.06');
INSERT INTO `item` (`name`, `price`) VALUES ('asperiores', '130.13');
INSERT INTO `item` (`name`, `price`) VALUES ('rem', '0.00');
INSERT INTO `item` (`name`, `price`) VALUES ('maxime', '99023.70');
INSERT INTO `item` (`name`, `price`) VALUES ('ipsum', '0.00');
INSERT INTO `item` (`name`, `price`) VALUES ('quaerat', '0.00');
INSERT INTO `item` (`name`, `price`) VALUES ('sed', '0.00');
INSERT INTO `item` (`name`, `price`) VALUES ('voluptate', '56682205.97');
INSERT INTO `item` (`name`, `price`) VALUES ('sit', '64414508.30');
INSERT INTO `item` (`name`, `price`) VALUES ('distinctio', '26192.67');
INSERT INTO `item` (`name`, `price`) VALUES ('nemo', '99999999.99');
INSERT INTO `item` (`name`, `price`) VALUES ('corporis', '700310.13');
INSERT INTO `item` (`name`, `price`) VALUES ('est', '0.00');
INSERT INTO `item` (`name`, `price`) VALUES ('error', '3699567.23');
INSERT INTO `item` (`name`, `price`) VALUES ('iste', '3281.10');
INSERT INTO `item` (`name`, `price`) VALUES ('quidem', '255.63');
INSERT INTO `item` (`name`, `price`) VALUES ('voluptatem', '0.00');
INSERT INTO `item` (`name`, `price`) VALUES ('illum', '3733.29');
INSERT INTO `item` (`name`, `price`) VALUES ('dignissimos', '74.80');
INSERT INTO `item` (`name`, `price`) VALUES ('ab', '172.13');
INSERT INTO `item` (`name`, `price`) VALUES ('minus', '99999999.99');
INSERT INTO `item` (`name`, `price`) VALUES ('impedit', '334.90');
INSERT INTO `item` (`name`, `price`) VALUES ('ipsum', '830.96');
INSERT INTO `item` (`name`, `price`) VALUES ('in', '18.58');
INSERT INTO `item` (`name`, `price`) VALUES ('architecto', '1.53');
INSERT INTO `item` (`name`, `price`) VALUES ('numquam', '1690.10');
INSERT INTO `item` (`name`, `price`) VALUES ('et', '168516.78');
INSERT INTO `item` (`name`, `price`) VALUES ('libero', '0.00');
INSERT INTO `item` (`name`, `price`) VALUES ('fugiat', '96070091.61');
INSERT INTO `item` (`name`, `price`) VALUES ('consequatur', '3606.87');
INSERT INTO `item` (`name`, `price`) VALUES ('possimus', '30995.50');
INSERT INTO `item` (`name`, `price`) VALUES ('consequatur', '44544140.39');
INSERT INTO `item` (`name`, `price`) VALUES ('facilis', '14109.69');
INSERT INTO `item` (`name`, `price`) VALUES ('deleniti', '0.00');


#
# TABLE STRUCTURE FOR: user
#

DROP TABLE IF EXISTS `user`;

CREATE TABLE `user` (
  `id` int(9) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(100) NOT NULL,
  `last_name` varchar(100) NOT NULL,
  `age` varchar(255) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=101 DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

INSERT INTO `user` (`id`, `name`, `last_name`, `age`) VALUES (1, 'corrupti', 'Schaden', '634');
INSERT INTO `user` (`id`, `name`, `last_name`, `age`) VALUES (2, 'voluptatum', 'McLaughlin', '3');
INSERT INTO `user` (`id`, `name`, `last_name`, `age`) VALUES (3, 'voluptas', 'McClure', '37738');
INSERT INTO `user` (`id`, `name`, `last_name`, `age`) VALUES (4, 'est', 'Murphy', '167');
INSERT INTO `user` (`id`, `name`, `last_name`, `age`) VALUES (5, 'dolores', 'Herzog', '6628054');
INSERT INTO `user` (`id`, `name`, `last_name`, `age`) VALUES (6, 'dolores', 'Dach', '');
INSERT INTO `user` (`id`, `name`, `last_name`, `age`) VALUES (7, 'dolores', 'Mayer', '9089174');
INSERT INTO `user` (`id`, `name`, `last_name`, `age`) VALUES (8, 'ut', 'Altenwerth', '');
INSERT INTO `user` (`id`, `name`, `last_name`, `age`) VALUES (9, 'illum', 'Sipes', '32585');
INSERT INTO `user` (`id`, `name`, `last_name`, `age`) VALUES (10, 'consequatur', 'Stanton', '6405');
INSERT INTO `user` (`id`, `name`, `last_name`, `age`) VALUES (11, 'rerum', 'Swift', '66885203');
INSERT INTO `user` (`id`, `name`, `last_name`, `age`) VALUES (12, 'sed', 'Waters', '22');
INSERT INTO `user` (`id`, `name`, `last_name`, `age`) VALUES (13, 'ullam', 'Davis', '48238');
INSERT INTO `user` (`id`, `name`, `last_name`, `age`) VALUES (14, 'ut', 'Russel', '3');
INSERT INTO `user` (`id`, `name`, `last_name`, `age`) VALUES (15, 'deleniti', 'Ondricka', '41691');
INSERT INTO `user` (`id`, `name`, `last_name`, `age`) VALUES (16, 'fuga', 'Gottlieb', '461640');
INSERT INTO `user` (`id`, `name`, `last_name`, `age`) VALUES (17, 'maiores', 'Medhurst', '148');
INSERT INTO `user` (`id`, `name`, `last_name`, `age`) VALUES (18, 'cupiditate', 'Weissnat', '77');
INSERT INTO `user` (`id`, `name`, `last_name`, `age`) VALUES (19, 'et', 'Bogisich', '75');
INSERT INTO `user` (`id`, `name`, `last_name`, `age`) VALUES (20, 'mollitia', 'Mitchell', '');
INSERT INTO `user` (`id`, `name`, `last_name`, `age`) VALUES (21, 'excepturi', 'Legros', '748984610');
INSERT INTO `user` (`id`, `name`, `last_name`, `age`) VALUES (22, 'non', 'Legros', '6930738');
INSERT INTO `user` (`id`, `name`, `last_name`, `age`) VALUES (23, 'repellendus', 'Strosin', '1055089');
INSERT INTO `user` (`id`, `name`, `last_name`, `age`) VALUES (24, 'aspernatur', 'Bahringer', '50204854');
INSERT INTO `user` (`id`, `name`, `last_name`, `age`) VALUES (25, 'at', 'Denesik', '96087');
INSERT INTO `user` (`id`, `name`, `last_name`, `age`) VALUES (26, 'earum', 'Rohan', '4');
INSERT INTO `user` (`id`, `name`, `last_name`, `age`) VALUES (27, 'explicabo', 'McCullough', '18965');
INSERT INTO `user` (`id`, `name`, `last_name`, `age`) VALUES (28, 'molestiae', 'Goldner', '807448');
INSERT INTO `user` (`id`, `name`, `last_name`, `age`) VALUES (29, 'saepe', 'Lakin', '85');
INSERT INTO `user` (`id`, `name`, `last_name`, `age`) VALUES (30, 'reiciendis', 'Hand', '3878306');
INSERT INTO `user` (`id`, `name`, `last_name`, `age`) VALUES (31, 'dignissimos', 'Waelchi', '2430979');
INSERT INTO `user` (`id`, `name`, `last_name`, `age`) VALUES (32, 'in', 'Kreiger', '827');
INSERT INTO `user` (`id`, `name`, `last_name`, `age`) VALUES (33, 'explicabo', 'Kovacek', '2191962');
INSERT INTO `user` (`id`, `name`, `last_name`, `age`) VALUES (34, 'laudantium', 'Adams', '96798');
INSERT INTO `user` (`id`, `name`, `last_name`, `age`) VALUES (35, 'molestias', 'Becker', '4503');
INSERT INTO `user` (`id`, `name`, `last_name`, `age`) VALUES (36, 'eum', 'Von', '1151803');
INSERT INTO `user` (`id`, `name`, `last_name`, `age`) VALUES (37, 'ut', 'Kutch', '817');
INSERT INTO `user` (`id`, `name`, `last_name`, `age`) VALUES (38, 'totam', 'Bayer', '43442');
INSERT INTO `user` (`id`, `name`, `last_name`, `age`) VALUES (39, 'consequatur', 'Feest', '426');
INSERT INTO `user` (`id`, `name`, `last_name`, `age`) VALUES (40, 'voluptatem', 'Daniel', '74617074');
INSERT INTO `user` (`id`, `name`, `last_name`, `age`) VALUES (41, 'tempore', 'Homenick', '6');
INSERT INTO `user` (`id`, `name`, `last_name`, `age`) VALUES (42, 'dolorem', 'Gleason', '302');
INSERT INTO `user` (`id`, `name`, `last_name`, `age`) VALUES (43, 'sit', 'Beier', '701684018');
INSERT INTO `user` (`id`, `name`, `last_name`, `age`) VALUES (44, 'aut', 'Stiedemann', '');
INSERT INTO `user` (`id`, `name`, `last_name`, `age`) VALUES (45, 'perspiciatis', 'Harvey', '6795');
INSERT INTO `user` (`id`, `name`, `last_name`, `age`) VALUES (46, 'maiores', 'Murphy', '');
INSERT INTO `user` (`id`, `name`, `last_name`, `age`) VALUES (47, 'sequi', 'Beatty', '1219');
INSERT INTO `user` (`id`, `name`, `last_name`, `age`) VALUES (48, 'deleniti', 'Lynch', '7');
INSERT INTO `user` (`id`, `name`, `last_name`, `age`) VALUES (49, 'ut', 'Kemmer', '954006');
INSERT INTO `user` (`id`, `name`, `last_name`, `age`) VALUES (50, 'iure', 'Hilll', '71627776');
INSERT INTO `user` (`id`, `name`, `last_name`, `age`) VALUES (51, 'sequi', 'Wisozk', '46713');
INSERT INTO `user` (`id`, `name`, `last_name`, `age`) VALUES (52, 'quis', 'Schowalter', '78027');
INSERT INTO `user` (`id`, `name`, `last_name`, `age`) VALUES (53, 'in', 'Doyle', '666236');
INSERT INTO `user` (`id`, `name`, `last_name`, `age`) VALUES (54, 'adipisci', 'Gutkowski', '35645');
INSERT INTO `user` (`id`, `name`, `last_name`, `age`) VALUES (55, 'itaque', 'Stamm', '508');
INSERT INTO `user` (`id`, `name`, `last_name`, `age`) VALUES (56, 'temporibus', 'Senger', '5894561');
INSERT INTO `user` (`id`, `name`, `last_name`, `age`) VALUES (57, 'et', 'Lang', '889794');
INSERT INTO `user` (`id`, `name`, `last_name`, `age`) VALUES (58, 'sequi', 'Keebler', '994');
INSERT INTO `user` (`id`, `name`, `last_name`, `age`) VALUES (59, 'rem', 'Volkman', '7595760');
INSERT INTO `user` (`id`, `name`, `last_name`, `age`) VALUES (60, 'et', 'Tromp', '521');
INSERT INTO `user` (`id`, `name`, `last_name`, `age`) VALUES (61, 'veritatis', 'Satterfield', '134');
INSERT INTO `user` (`id`, `name`, `last_name`, `age`) VALUES (62, 'amet', 'Miller', '837461');
INSERT INTO `user` (`id`, `name`, `last_name`, `age`) VALUES (63, 'molestiae', 'Waters', '');
INSERT INTO `user` (`id`, `name`, `last_name`, `age`) VALUES (64, 'esse', 'Kuhlman', '765');
INSERT INTO `user` (`id`, `name`, `last_name`, `age`) VALUES (65, 'numquam', 'Champlin', '');
INSERT INTO `user` (`id`, `name`, `last_name`, `age`) VALUES (66, 'adipisci', 'Beier', '73');
INSERT INTO `user` (`id`, `name`, `last_name`, `age`) VALUES (67, 'delectus', 'Lemke', '866818');
INSERT INTO `user` (`id`, `name`, `last_name`, `age`) VALUES (68, 'cumque', 'Metz', '2446411');
INSERT INTO `user` (`id`, `name`, `last_name`, `age`) VALUES (69, 'eum', 'Moore', '8503');
INSERT INTO `user` (`id`, `name`, `last_name`, `age`) VALUES (70, 'sint', 'Paucek', '455');
INSERT INTO `user` (`id`, `name`, `last_name`, `age`) VALUES (71, 'atque', 'Waelchi', '73630842');
INSERT INTO `user` (`id`, `name`, `last_name`, `age`) VALUES (72, 'reiciendis', 'Mann', '');
INSERT INTO `user` (`id`, `name`, `last_name`, `age`) VALUES (73, 'earum', 'Olson', '');
INSERT INTO `user` (`id`, `name`, `last_name`, `age`) VALUES (74, 'totam', 'Kris', '62');
INSERT INTO `user` (`id`, `name`, `last_name`, `age`) VALUES (75, 'eligendi', 'Shields', '331351');
INSERT INTO `user` (`id`, `name`, `last_name`, `age`) VALUES (76, 'ad', 'Parisian', '730192330');
INSERT INTO `user` (`id`, `name`, `last_name`, `age`) VALUES (77, 'cum', 'Hand', '86414592');
INSERT INTO `user` (`id`, `name`, `last_name`, `age`) VALUES (78, 'ea', 'Swift', '183388301');
INSERT INTO `user` (`id`, `name`, `last_name`, `age`) VALUES (79, 'aperiam', 'Harvey', '996');
INSERT INTO `user` (`id`, `name`, `last_name`, `age`) VALUES (80, 'cum', 'Hane', '34');
INSERT INTO `user` (`id`, `name`, `last_name`, `age`) VALUES (81, 'qui', 'Marks', '5');
INSERT INTO `user` (`id`, `name`, `last_name`, `age`) VALUES (82, 'dolore', 'Bailey', '3662666');
INSERT INTO `user` (`id`, `name`, `last_name`, `age`) VALUES (83, 'porro', 'Marvin', '218');
INSERT INTO `user` (`id`, `name`, `last_name`, `age`) VALUES (84, 'qui', 'Douglas', '836');
INSERT INTO `user` (`id`, `name`, `last_name`, `age`) VALUES (85, 'consequatur', 'Hirthe', '');
INSERT INTO `user` (`id`, `name`, `last_name`, `age`) VALUES (86, 'distinctio', 'Langosh', '216');
INSERT INTO `user` (`id`, `name`, `last_name`, `age`) VALUES (87, 'enim', 'Douglas', '');
INSERT INTO `user` (`id`, `name`, `last_name`, `age`) VALUES (88, 'sint', 'Koss', '52964174');
INSERT INTO `user` (`id`, `name`, `last_name`, `age`) VALUES (89, 'sint', 'Keebler', '4871');
INSERT INTO `user` (`id`, `name`, `last_name`, `age`) VALUES (90, 'iusto', 'Schuppe', '123214');
INSERT INTO `user` (`id`, `name`, `last_name`, `age`) VALUES (91, 'aut', 'Cummings', '50');
INSERT INTO `user` (`id`, `name`, `last_name`, `age`) VALUES (92, 'omnis', 'Fay', '52');
INSERT INTO `user` (`id`, `name`, `last_name`, `age`) VALUES (93, 'magni', 'Reinger', '807947');
INSERT INTO `user` (`id`, `name`, `last_name`, `age`) VALUES (94, 'quae', 'Hand', '4037413');
INSERT INTO `user` (`id`, `name`, `last_name`, `age`) VALUES (95, 'in', 'Barrows', '502810620');
INSERT INTO `user` (`id`, `name`, `last_name`, `age`) VALUES (96, 'est', 'Dicki', '760');
INSERT INTO `user` (`id`, `name`, `last_name`, `age`) VALUES (97, 'sed', 'Robel', '32');
INSERT INTO `user` (`id`, `name`, `last_name`, `age`) VALUES (98, 'dolores', 'Shanahan', '92862');
INSERT INTO `user` (`id`, `name`, `last_name`, `age`) VALUES (99, 'voluptates', 'Schmitt', '');
INSERT INTO `user` (`id`, `name`, `last_name`, `age`) VALUES (100, 'consectetur', 'Jenkins', '5');


