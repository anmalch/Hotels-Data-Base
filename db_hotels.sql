
UNLOCK TABLES;
DROP TABLE IF EXISTS order_details;
DROP TABLE IF EXISTS reviews;
DROP TABLE IF EXISTS orders;
DROP TABLE IF EXISTS bookings;
DROP TABLE IF EXISTS bookmarks;
DROP TABLE IF EXISTS guests;

CREATE TABLE guests (
  id BIGINT UNSIGNED NOT NULL AUTO_INCREMENT,
  first_name VARCHAR(145) NOT NULL,
  last_name VARCHAR(145) NOT NULL,
  gender ENUM('f','m') NOT NULL,
  birthday_at DATETIME NOT NULL,
  email VARCHAR(145) NOT NULL,
  address VARCHAR(145) NOT NULL,
  city VARCHAR(145) NOT NULL,
  postcode INT(10) NOT NULL,
  country VARCHAR(145) NOT NULL,
  phone VARCHAR(20) NOT NULL,
  password_hash CHAR(65) DEFAULT NULL,
  created_at DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
  updated_at DATETIME DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (id),
  UNIQUE KEY email_unique (email),
  UNIQUE KEY phone_unique (phone),
  CONSTRAINT phone_check CHECK (REGEXP_LIKE(phone, '^[0-9]{6,20}$'))
  
  );
  
 
LOCK TABLES guests WRITE;

INSERT INTO 
  guests
VALUES 
  (1, 'Harry',   'Potter',     'm', '1980-07-30', 'harry.potter@fantastic.com',       'Westminster 1',           'London',    22222, 'England', '442072194272', '1d8f3272b013387bbebcbedb4758586d', '2013-11-25 16:16:27', '2015-11-25 11:16:28'),
  (2, 'Hermine', 'Granger',    'f', '1979-09-14', 'hermine.granger@fantastic.com',    'Karlstrasse 3',           'Vienna',    1010,'Austria', '431711360', '2df8f3272b013387bbebcbedb4758586a', '2020-10-26 16:14:27', '2021-01-26 12:14:27'),
  (3, 'Ron',     'Weasley',    'm', '1980-05-17', 'ron.weasley@fantastic.com',        'Panoramastrasse 1A',      'Berlin',    10178, 'Germany', '030247575875', '3wf8f3272b013387bbebcbedb4758586v', '2019-09-09 16:18:27', NULL),
  (4, 'Draco',   'Malfoy',     'm', '1980-04-08', 'draco.malfoy@fantastic.com',       '20 W 34th St',         	 'New York',  10001, 'USA', '12127363100', '6548f3272b013387bbebcbedb4758586m', '2015-08-09 12:18:27', NULL),
  (5, 'Lord',    'Voldemort',  'm', '1957-01-31', 'lord.voldemort@fantastic.com',     'GAGARIN St 1',     'Moscow',    103132, 'Russia', '74956000349', '1x32f3272b013387bbebcbedb47586789' , '2021-09-08 11:18:27', NULL),
  (6, 'Albus',   'Dumbledore', 'm', '1932-01-21', 'albus.dumbledore@fantastic.com',   '5 Avenue Anatole France', 'Paris',     75007, 'France', '33892701239', '3wf8f3272b013387bbebcbedb4758586v' , '2013-05-09 13:18:27', NULL),
  (7, 'Rubeus',  'Hagrid',     'm', '1960-09-01', 'rubeus.hagrid@fantastic.com',      'PalaceSquare 2',          'St Petersburg', 190000, 'Russia', '78127109079', '345673272b013387bbebcbedb475858dfrt' , '2017-01-01 14:18:27', NULL),
  (8, 'Minerva', 'McGonagall', 'f', '1940-06-03', 'minerva.mcgonagall@fantastic.com', '2 Rue de Montpensier',    'Paris',     75001, 'France', '33892709090', 'asdf73272b013387bbebcbedb475858dfrt' , '2016-02-01 14:18:27', NULL),
  (9, 'Severus', 'Snape',      'm', '1954-10-18', 'severus.snape@fantastic.com',      'Carrer de Mallorca 401',  'Barcelona', 08013, 'Spain', '34932080404', 'rty783272b013387bbebcbedb475856yi8' , '2021-01-01 12:18:27', NULL ),
  (10, 'Remus',  'Lupin',      'm', '1960-08-20', 'remus.lupin@fantastic.com',        'Piazza di Trevi 1',       'Rome',      00187, 'Italy', '39060608', 'f4f6773272b013387bbebcbedb475858dfrt' , '2021-02-01 14:18:27', NULL),
  (11, 'Newt',   'Scamander',  'm', '1977-03-08', 'newt.scamander@fantastic.com',     'Sestiere Dorsoduro 3901', 'Venice',    30123, 'Italy', '390412792111', 'd4f6q3272b013387bbebcbedb475858dfrt' , '2020-02-01 14:18:27', NULL);

UNLOCK TABLES;

DROP TABLE IF EXISTS hotel_managers;
DROP TABLE IF EXISTS reviews;
DROP TABLE IF EXISTS hotel_images;
DROP TABLE IF EXISTS rooms;
DROP TABLE IF EXISTS hotels;

CREATE TABLE hotels (
  id BIGINT UNSIGNED NOT NULL AUTO_INCREMENT,
  name VARCHAR(145) NOT NULL,
  stars INT(1) DEFAULT NULL, 
  email VARCHAR(145) NOT NULL,
  address VARCHAR(145) NOT NULL,
  city VARCHAR(145) NOT NULL,
  postcode INT(10) NOT NULL,
  country VARCHAR(145) NOT NULL,
  phone VARCHAR(20) NOT NULL,
  image_name VARCHAR(155) NOT NULL, 
  website VARCHAR(30) NOT NULL,
  created_at DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
  updated_at DATETIME DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (id),
  UNIQUE KEY phone_unique (phone),
  CONSTRAINT phone_check_hotel CHECK (REGEXP_LIKE(phone, '^[0-9]{6,20}$')),
  INDEX fk_hotel_country_idx (country),
  INDEX fk_hotel_city_idx (city),
  INDEX fk_hotel_stars_idx (stars)
  );
 
 LOCK TABLES hotels WRITE;

INSERT INTO 
  hotels
VALUES 
  (1, 'Hilton Hotel Munich',  		  					4, 'hilton.garden@hilten.com',    'Landsberger Str. 112',         		'Munich',     80339,   'Germany',  '017633333333',  'hiltonmunich.jpg',   'hilton.com', '2000-03-31 07:18:50', '2020-06-21 07:18:50'),
  (2, 'Hilton Hotel Barcelona', 	  					4, 'hilton.barcelona@hilten.com', 'Avinguda Diagonal 589',       		'Barcelona',  08014,   'Spain',    '34934957777',   'hilton_barcelona.png','hilton.com', '2001-02-24 07:17:50', '2021-01-31 06:18:50'),
  (3, 'Marion Hotel', 			      					1, 'hello@marionhotel.com',       '36 Grigoriou',           			'Loutraki',   20300,   'Greece',   '302744066800',  'marion_greece.png',   'marionhotels.com', '1984-01-02 08:17:50', '2021-03-31 06:18:50'),
  (4, 'Courtyard Munich City Center', 					5, 'hello@marriotthotel.com', 	  'Schwanthalerstrasse 37',             'Munich',     80336,   'Germany',  '498954884880',  'courtyard.jpg',       'marriott.com', '1980-10-02 08:17:50', '2021-09-13 06:18:50'),
  (5, 'Cotton House Hotel',                 			5, 'hello@marriotthotel.com',     'Gran Via de les Corts Catalanes 670','Barcelona',  08010,   'Spain',    '34934505045',   'cotton_marriott.jpg', 'marriott.com', '2000-10-02 08:17:50', NULL),
  (6, 'Renaissance Paris Republique Hotel', 			5, 'hello@marriotthotel.com',     '40 Rue Rene Boulange', 			    'Paris',      75010,   'France',   '33171182095',   'renaissance.png',     'marriott.com', '1985-11-02 08:17:50', NULL),
  (7, 'Bauer Palazzo', 									1, 'bauerpalazzo@hotels.com',     'San Marco 1459', 					'Venice',     30124,   'Italy',    '39883456',      'bauerpalazzo.png',    'bauerpalazzo.com', '1990-03-23 08:11:50', NULL),
  (8, 'Hotel Scenario', 								2, 'hotelscenario@gmail.com',     'Vicolo Delle Ceste 26', 				'Rome', 	  00186,   'Italy',    '30987543',      'scenario.png',        'hotelszenario.com', '1965-01-23 08:10:50', '2021-03-23 08:11:50'),
  (9, 'Hotel Hospes Maricel y Spa Opens in new window', 1, 'hospesmaricel@hotel.com',     'Carretera d \'Andratx 11', 			'Cas Català', 07181,   'Spain',    '34971707744',   'maricel_hotel.png',   'maricel.com', '2012-03-23 08:11:50', NULL),
  (10, 'Hotel Do Chile', 								3, 'hoteldochile@hotel.com',      'Rua Antonio Pedro 40', 				'Lisboa',     1000039, 'Portugal', '351089065',     'dochile.png',         'hoteldochile.com', '2020-11-01 08:11:50', NULL);

UNLOCK TABLES;
 
DROP TABLE IF EXISTS hotel_managers;

CREATE TABLE hotel_managers (
  id BIGINT UNSIGNED NOT NULL AUTO_INCREMENT,
  hotel_id BIGINT UNSIGNED NOT NULL,
  first_name VARCHAR(145) NOT NULL,
  last_name VARCHAR(145) NOT NULL,
  email VARCHAR(145) NOT NULL,
  phone VARCHAR(20) NOT NULL,
  password_hash CHAR(65) DEFAULT NULL,
  created_at DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
  updated_at DATETIME DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (id),
  UNIQUE KEY email_unique (email),
  UNIQUE KEY phone_unique (phone),
  INDEX fk_hotel_manager_idx (hotel_id),
  CONSTRAINT managers_phone_check CHECK (REGEXP_LIKE(phone, '^[0-9]{6,20}$')),
  CONSTRAINT fk_hotel_manager FOREIGN KEY (hotel_id) REFERENCES hotels (id)
); 

LOCK TABLES hotel_managers WRITE;

INSERT INTO 
  hotel_managers
VALUES 
  (1, 10, 'Fradegar', 'Bolger', 'frader.bolher@hotel.com', '351089070', 'gtref3272b013387bbebcbedb4758l9i6', '2021-03-23 08:01:09', NULL ),
  (2, 8, 'Betsy', 'Butterbur', 'betsy.butterbu@hotel.com', '30987580', 'ju76f3272b013387bbebcbedb4758n5rw', '2020-04-02 07:11:50', NULL),
  (3, 5, 'Alfrid', 'Lickspittle', 'lickspittle@hotel.com', '34934505999', 'b74ef3272b013387bbebcbedb4758l9ig', '2020-05-23 06:23:50', NULL),
  (4, 6, 'Bill', 'Ferny', 'bill.ferny@hotel.com', '33171182123', '0o7gf3272b013387bbebcbedb4758ki0d', '2015-01-13 10:45:16', '2018-06-23 08:18:34'),
  (5, 1, 'Hilda', 'Bianca', 'hilda.bianca@hotel.com', '017633333555', 'v4a1f3272b013387bbebcbedb47585re2', '2021-03-23 08:11:50', NULL),
  (6, 9, 'Robin', 'Kerr', 'robin.kerr@hotel.com', '34971707788', 'b6r3f3272b013387bbebcbedb4758u6tr', '2020-06-26 11:10:23', NULL),
  (7, 7, 'Fredegar', 'Chubb', 'fredegar.chubb@hotel.com', '39883445', 'n7t3f3272b013387bbebcbedb4758n6tr', '2020-08-12 12:10:34', NULL),
  (8, 2, 'Simon', 'London', 'simon.london@hotel.com', '34934957755', 'b6tr33272b013387bbebcbedb47585k8u', '2021-04-18 15:16:56', NULL ),
  (9, 3, 'Stephen', 'Ure', 'stephen.ure@hotel.com', '302744066811', 'b6a1f3272b013387bbebcbedb4758o6t3', '2020-11-13 10:19:33', NULL),
  (10, 4, 'Ben', 'Mitchell', 'ben.mitchell@hotel.com', '498954884453', 'v5e2f3272b013387bbebcbedb4758m8y4', '2018-04-13 08:15:24', '2020-08-13 08:15:24');
  
UNLOCK TABLES;

DROP TABLE IF EXISTS hotel_images;

CREATE TABLE hotel_images (
  id BIGINT UNSIGNED NOT NULL AUTO_INCREMENT,
  hotel_id BIGINT UNSIGNED NOT NULL,
  file_name VARCHAR(245) DEFAULT NULL,
  file_size BIGINT DEFAULT NULL,
  created_at DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (id),
  CONSTRAINT fk_hotel_image FOREIGN KEY (hotel_id) REFERENCES hotels (id)
);

LOCK TABLES hotel_images WRITE;

INSERT INTO 
  hotel_images
VALUES
  (1, 5, 'red.png', 57498563, '2020-02-13 16:12:19'),
  (2, 7, 'blue.jpg', 76094683, '2020-12-12 14:32:56' ),
  (3, 5, 'black.jpg', 576223050,'2020-03-31 08:56:50'),
  (4, 2, 'white.jpg', 234223050,'2019-03-31 07:18:50'),
  (5, 3, 'green.jpg', 65802451, '2018-04-19 08:51:36'),
  (6, 6, 'yellow.jpg', 45783295, '2017-03-31 07:18:50'),
  (7, 8, 'brown.jpg', 56396584, '2013-05-06 21:24:27'),
  (8, 10, 'orange.jpg', 23754965, '2020-02-13 16:12:19'),
  (9, 1, 'turquoise.jpg', 46086574, '2017-04-19 08:51:36'),
  (10, 9, 'indigo.jpg', 69312337, '2020-09-18 12:12:30'),
  (11, 4, 'pink.jpg', 32853956, '2019-11-18 05:02:09'),
  (12, 1, 'lime.jpg', 21369876, '2011-02-13 16:12:19'),
  (13, 6, 'bronze.jpg', 56094532, '2014-08-18 17:12:30'),
  (14, 10, 'marron.jpg', 57307598, '2001-04-19 08:51:36'),
  (15, 3, 'salmon.jpg', 57302764, '2016-10-08 11:48:23'),
  (16, 8, 'violet.jpg', 47392643, '2019-03-13 23:25:50'),
  (17, 2, 'gray.jpg', 48274560, '2000-05-31 16:45:06'),
  (18, 4, 'crimson.jpg', 56284650, '1999-01-28 06:34:28'),
  (19, 4, 'purple.jpg', 45963975, '2013-10-04 06:38:51'),
  (20, 9, 'gold.jpg', 45927459, '2017-03-06 04:59:36');

UNLOCK TABLES;

DROP TABLE IF EXISTS rooms;

CREATE TABLE rooms (
  id BIGINT UNSIGNED NOT NULL AUTO_INCREMENT,
  hotel_id BIGINT UNSIGNED NOT NULL,
  name VARCHAR(40) NOT NULL,
  description VARCHAR(255) DEFAULT NULL, 
  number_of_bed INT NOT NULL,
  type_of_bed VARCHAR(20) NOT NULL, 
  price_per_adult VARCHAR(10) NOT NULL,
  price_per_child VARCHAR(10) NOT NULL,
  price_weekend_edition VARCHAR(10) NOT NULL,
  created_at DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
  updated_at DATETIME DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (id),
  CONSTRAINT fk_hotels_room FOREIGN KEY (hotel_id) REFERENCES  hotels (id)
  
);


LOCK TABLES rooms WRITE;

INSERT INTO 
  rooms
VALUES
  (1, 6, '34',     	'0',                                                                     1, 'single', '87 EUR',  '50 EUR',  '99 EUR',  '2016-11-25 16:16:27', '2020-11-25 11:16:28'),
  (2, 8, 'Italy', 	'Bathtub, Air conditioning, Attached bathroom, Soundproof,Free WiFi',    2, 'king',   '230 EUR', '180 EUR', '260 EUR', '2017-10-25 16:16:27', '2020-11-25 11:16:28'),
  (3, 4, '585',		'Flat-screen TV. Soundproof. Coffee machine',                            2, 'single', '120 EUR', '90 EUR',  '158 EUR', '2019-11-25 16:16:27', '2020-11-25 11:16:28'),
  (4, 7, '405',     'Bathtub, Air conditioning, Attached bathroom, Soundproof,Free WiFi',    3, 'single', '134 EUR', '60 EUR',  '180 EUR', '2020-09-25 16:16:27', '2020-11-25 11:16:28'),
  (5, 1, '69', 		'Garden view, Air conditioning',                                         1, 'single', '245 EUR', '160 EUR', '280 EUR', '2019-11-25 16:16:27', '2020-11-25 11:16:28'),
  (6, 7, '209', 	'Flat-screen TV. Soundproof. Coffee machine',                            4, 'single', '54 EUR',  '30 EUR',  '67 EUR',  '2019-11-25 16:16:27', '2020-11-25 11:16:28'),
  (7, 5, '31', 		'Garden view, Air conditioning',                                         2, 'double', '132 EUR', '88 EUR', '170 EUR', '2019-01-25 16:16:27', '2020-11-25 11:16:28'),
  (8, 9, '108',     'Bathtub, Air conditioning, Attached bathroom, Soundproof,Free WiFi',    2, 'single', '304 EUR', '207 EUR', '320 EUR', '2019-11-25 16:16:27', '2020-06-25 11:16:28'),
  (9, 4, '666',     'Garden view, Air conditioning, Coffee machine', 			             1, 'single', '123 EUR', '90 EUR', '140 EUR', '2019-07-25 16:16:27', '2020-01-25 11:16:28'),
  (10, 9, '45',     'Flat-screen TV. Soundproof. Coffee machine', 			                 3, 'single', '260 EUR', '200 EUR', '280 EUR', '2016-11-25 16:16:27', '2020-11-25 11:16:28'),
  (11, 6, '23',     'These contemporary rooms are decorated with stone walls and parquet floors, featuring a small Zen seasonal swimming pool', 1, 'single', '67 EUR', '50 EUR', '88 EUR', '2019-02-09 16:16:27', '2021-01-25 11:16:28'),
  (12, 3, 'Lavender','Garden view, Air conditioning', 						                 3, 'single', '76 EUR', '38 EUR', '99 EUR', '2019-02-09 16:16:27', '2021-01-25 11:16:28'),
  (13, 10, '57', 	'Flat-screen TV. Soundproof. Coffee machine', 			                 2, 'double', '125 EUR', '85 EUR', '145 EUR', '2018-03-09 16:16:27', '2021-03-25 11:16:28'),
  (14, 1, '41', 	'0',                                   					                 1, 'single', '99 EUR', '34 EUR', '102 EUR', '2018-02-09 16:16:27', '2021-01-25 11:16:28'),
  (15, 8, 'Spain', 	'Street view, Air conditioning, Coffee machine', 						 2, 'double', '111 EUR', '88 EUR', '122 EUR', '2019-08-09 16:16:27', '2021-03-25 11:16:28'),
  (16, 2, '80',     'Coffee machine, Soundproof', 																								1, 'single', '154 EUR', '121 EUR', '165 EUR', '2018-07-09 18:16:27', '2021-04-01 10:16:28'),
  (17, 3, 'Green', 	'Coffee machine, Garden view', 																								2, 'double', '142 EUR', '90 EUR', '190 EUR', '2017-04-09 16:16:27', '2021-03-25 11:16:28'),
  (18, 2, '87', 	'Flat-screen TV. Soundproof. Coffee machine', 																				1, 'single', '142 EUR', '85 EUR', '150 EUR', '2018-03-09 16:16:27', '2021-03-01 11:16:28'),
  (19, 5, '209', 	'0', 																														2, 	'king', '309 EUR', '50 EUR', '99 EUR', '2015-03-09 16:16:27', '2020-03-01 11:16:28'),
  (20, 3, 'Red', 	'Coffee machine, Garden view', 																								1, 'single', '54 EUR', '35 EUR', '78 EUR', '2019-03-09 16:16:27', '2021-01-01 11:16:28'),
  (21, 9, '608', 	'These contemporary rooms are decorated with stone walls and parquet floors, featuring a small Zen seasonal swimming pool', 1, 'single', '54 EUR', '35 EUR', '78 EUR', '2019-03-08 16:16:27', '2021-03-03 11:16:28'),
  (22, 3, 'Gold', 	'Coffee machine,  Soundproof', 																								2, 'king', '106 EUR', '70 EUR', '120 EUR', '2020-10-09 16:16:27', '2021-03-11 11:16:28'),
  (23, 4, '701', 	'Flat-screen TV. Soundproof. Coffee machine', 																				2, 'double', '90 EUR', '60 EUR', '99 EUR', '2020-10-10 16:16:27', '2021-02-02 11:16:28'),
  (24, 1, '39', 	'0', 																														1, 'single', '34 EUR', '20 EUR', '40 EUR', '2019-09-09 16:16:27', '2021-01-11 11:16:28'),
  (25, 5, '606', 	'Air conditioning. Attached bathroom.Free WiFi', 																			3, 'single', '70 EUR', '45 EUR', '80 EUR', '2020-12-01 16:16:27', '2021-03-03 11:16:28');
  

UNLOCK TABLES;
SELECT * FROM rooms;
DROP TABLE IF EXISTS bookings;

CREATE TABLE bookings (
  id BIGINT UNSIGNED NOT NULL AUTO_INCREMENT,
  room_id BIGINT UNSIGNED NOT NULL,
  guest_id BIGINT UNSIGNED NOT NULL,
  guest_count SMALLINT UNSIGNED NOT NULL,
  check_in DATETIME NOT NULL,
  check_out DATETIME NOT NULL,
  status ENUM ('active', 'canceled') NOT NULL,
  created_at DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
  updated_at DATETIME DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (id),
  CONSTRAINT fk_booking_room FOREIGN KEY (room_id) REFERENCES  rooms (id),
  CONSTRAINT fk_booking_guest FOREIGN KEY (guest_id) REFERENCES  guests (id)
);  

LOCK TABLES bookings WRITE;

INSERT INTO 
  bookings
VALUES
  (1, 20, 3, 1, '2019-05-05 11:26:56', '2019-05-07 11:16:09', 'active', '2019-05-05 11:26:56', NULL),
  (2, 13, 2, 2, '2021-03-23 18:11:49', '2021-03-26 08:01:01', 'canceled', '2021-03-26 08:01:01', NULL),
  (3, 18, 1, 1, '2020-06-01 09:26:23', '2020-06-03 15:34:20', 'canceled', '2020-06-02 15:34:20', '2020-06-03 15:34:20'),
  (4, 18, 10, 1, '2020-01-11 12:26:41', '2020-01-21 16:13:50', 'canceled', '2020-01-21 09:13:50', '2020-01-21 12:20:50'),
  (5, 6, 4, 4, '2013-09-23 14:45:01', '2013-09-29 09:11:29', 'active', '2013-09-23 14:45:01', NULL),
  (6, 18, 5, 1, '2020-06-04 05:26:29', '2020-06-07 17:15:30', 'active', '2020-06-04 05:26:29', NULL),
  (7, 10, 10, 3, '2020-06-01 13:47:23', '2020-06-02 09:09:40', 'canceled', '2020-06-02 09:09:40', '2020-06-02 12:10:40'),
  (8, 12, 9, 3, '2020-07-13 11:26:28', '2020-07-18 08:04:50', 'canceled', '2020-07-18 08:04:50', NULL),
  (9, 20, 7, 1, '2019-05-08 09:34:56', '2019-05-09 07:56:31', 'canceled', '2019-05-09 07:56:31', NULL),
  (10, 6, 10, 4, '2021-01-10 11:16:30', '2021-01-15 09:25:20', 'canceled', '2021-01-15 09:25:20', '2021-01-15 18:31:10');

UNLOCK TABLES;
SELECT * FROM bookings;

DROP TABLE IF EXISTS orders;

CREATE TABLE orders(
  id BIGINT UNSIGNED NOT NULL AUTO_INCREMENT,
  guest_id BIGINT UNSIGNED NOT NULL,
  guest_first_name VARCHAR(145) NOT NULL,
  guest_last_name VARCHAR(145) NOT NULL,
  guest_address VARCHAR(145) NOT NULL,
  guest_city VARCHAR(145) NOT NULL,
  guest_postcode INT(10) NOT NULL,
  guest_country VARCHAR(145) NOT NULL,
  guest_phone VARCHAR(20) NOT NULL,
  room_id BIGINT UNSIGNED NOT NULL,
  booking_id BIGINT UNSIGNED NOT NULL,
  number_of_nights INT UNSIGNED NOT NULL,
  number_of_adult INT UNSIGNED NOT NULL,
  number_of_children INT UNSIGNED DEFAULT NULL,
  amount INT(10) NOT NULL,
  currency VARCHAR(10) NOT NULL,
  is_paid TINYINT(1) DEFAULT '0', -- paid/not paid
  created_at DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
  UNIQUE KEY (guest_id, booking_id),
  PRIMARY KEY (id),
  CONSTRAINT fk_order_room FOREIGN KEY (room_id) REFERENCES  rooms (id),
  CONSTRAINT fk_order_guest FOREIGN KEY (guest_id) REFERENCES  guests (id),
  CONSTRAINT fk_order_booking FOREIGN KEY (booking_id) REFERENCES  bookings (id) 
);



LOCK TABLES orders WRITE;

INSERT INTO 
  orders 
VALUES 
  (1, 10, 'Remus', 'Lupin', 'Piazza di Trevi 1', 'Rome', 00187, 'Italy', '39060608', 10, 7, 1, 2, 1, 720, 'EUR', 1, '2021-01-15 09:25:20'),
  (2, 5,  'Lord', 'Voldemort', 'Tverskoy District 1', 'Moscow', 103132, 'Russia', '74956970349', 18, 6, 2, 1, 0, 426, 'EUR', 0, '2020-06-04 05:26:29'),
  (3, 3,  'Ron', 'Weasley','Panoramastrasse 1A', 'Berlin', 10178, 'Germany', '030247575875', 20, 1, 2, 1, 0, 108,'EUR', 1, '2019-05-05 11:26:56'),
  (4, 10, 'Remus', 'Lupin','Piazza di Trevi 1','Rome', 00187, 'Italy', '39060608', 18, 4, 10, 1, 0, 1420,  'EUR', 0, '2020-01-21 12:20:50'),
  (5, 4,  'Draco', 'Malfoy','20 W 34th St', 'New York', 10001, 'USA', '12127363100', 6, 5, 6, 2, 2, 1008, 'EUR', 0, '2013-09-23 14:45:01'),
  (6, 2,  'Hermine','Granger', 'Karlstrasse 3','Vienna', 1010, 'Austria', '431711360', 13, 2, 3, 2, 0, 870, 'EUR', 1, '2021-03-26 08:01:01'), 
  (7, 1,  'Harry', 'Potter', 'Westminster 1','London', 22222, 'England', '442072194272', 18, 3, 2, 1, 0, 284, 'EUR', 0, '2020-06-03 15:34:20'),
  (8, 9,  'Severus', 'Snape','Carrer de Mallorca 401','Barcelona', 08013, 'Spain', '34932080404', 12, 8, 5, 2, 1, 950,  'EUR', 1, '2020-07-18 08:04:50'),
  (9, 10, 'Remus', 'Lupin','Piazza di Trevi 1', 'Rome',          00187,  'Italy',  '39060608',    6, 10, 5, 2, 2, 168, 'EUR', 1, '2021-01-15 18:31:10'),
  (10, 7, 'Rubeus', 'Hagrid', 'PalaceSquare 2', 'St Petersburg', 190000, 'Russia', '78127109079', 20, 9, 1, 1, 0, 54,  'EUR', 0, '2019-05-09 07:56:31');
  

UNLOCK TABLES;
 SELECT * FROM orders;


DROP TABLE IF EXISTS order_details; 
CREATE TABLE order_details (
  id BIGINT UNSIGNED NOT NULL AUTO_INCREMENT,
  order_id BIGINT UNSIGNED NOT NULL,
  service_name VARCHAR (145) NOT NULL, -- breakfast, mini-bar
  extra_amount INT(10) DEFAULT NULL,
  currency VARCHAR(10) NOT NULL,
  created_at DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (id),
  INDEX fk_order_order_details_idx (order_id),
  CONSTRAINT fk_order_order_details FOREIGN KEY (order_id) REFERENCES  orders (id)
  
);
LOCK TABLES order_details WRITE;

INSERT INTO 
  order_details
VALUES 
  (1, 8, 'breakfast', 150, 'EUR', '2020-07-18 08:04:50'),
  (2, 9, 'breakfast', 95, 'EUR', '2021-01-15 18:31:10'),
  (3, 10, 'mini-bar coca cola', 3, 'EUR', '2019-05-09 07:56:31');
UNLOCK TABLES; 


DROP TABLE IF EXISTS reviews;

CREATE TABLE reviews (
  id BIGINT UNSIGNED NOT NULL AUTO_INCREMENT,
  from_guest_id BIGINT UNSIGNED NOT NULL,
  to_hotel_id BIGINT UNSIGNED NOT NULL,
  order_id BIGINT UNSIGNED NOT NULL,
  comment VARCHAR (255) NOT NULL,
  grade INT(1) UNSIGNED DEFAULT NULL, -- rating
  created_at DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (hotel_id, guest_id),
  INDEX fk_reviews_to_hotel_idx (to_hotel_id),
  INDEX fk_reviews_from_guest_idx (from_guest_id),
  CONSTRAINT fk_reviews_to_hotel FOREIGN KEY (to_hotel_id) REFERENCES  hotels (id),
  CONSTRAINT fk_orders FOREIGN KEY (order_id) REFERENCES  orders (id),
  CONSTRAINT fk_from_guest FOREIGN KEY (from_guest_id) REFERENCES  guests (id),
  CONSTRAINT grade CHECK (REGEXP_LIKE(grade, '^[1-5]{1}$'))
);




LOCK TABLES reviews WRITE;

INSERT INTO 
  reviews
VALUES 
  (1, 10, 9, 1, 'The room was amazing. The place, the nature. A well needed calm', 5, '2020-06-02 18:10:40'),
  (2, 5, 2, 2, 'I am so glad we found this place for our stay in Barcelona!',  5, '2020-06-04 10:26:29'),
  (3, 3, 3, 3, 'Great!',  2, '2019-05-05 20:26:56'),
  (4, 10, 2, 4,  'Bad service', 1, '2020-01-22 10:20:50'),
  (5, 4, 7, 5, 'Facilities, bed quality, very friendly and helpful staff, decor, location, everything',  5, '2013-09-24 16:45:01'),
  (6, 2, 10, 6, 'Great location, perfect for exploring. Lovely room',  4, '2021-03-26 10:01:01'),
  (7, 1, 2, 7, 'Great location. Very central for exploring all parts of Venice. Super room. Very comfortable and had everything we needed. Good restaurant.',  5, '2020-06-03 18:34:20'),
  (8, 9, 3, 8, 'Good location, easy to get to Vatican by bus. Rooms are very comfortable and well equipped, good breakfast and very good looking camp! Will consider to stay again with kids!', 4, '2020-07-18 12:04:50'),
  (9, 10, 7, 9, 'The food was wonderful. Having the jazz club in the hotel was so convenient. Everything was perfection.',  5, '2021-01-16 20:31:10'),
  (10, 7, 3, 10 'Bad internet',  1, '2019-05-09 08:56:31');
  
UNLOCK TABLES;


DROP TABLE IF EXISTS bookmarks;
CREATE TABLE bookmarks (
  id BIGINT UNSIGNED NOT NULL AUTO_INCREMENT,
  hotel_id  BIGINT UNSIGNED NOT NULL,
  guest_id  BIGINT UNSIGNED NOT NULL,
  comment VARCHAR (255) DEFAULT NULL,
  created_at DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP, 
  PRIMARY KEY (hotel_id, guest_id),
  CONSTRAINT fk_bookmarks_hotel FOREIGN KEY (hotel_id) REFERENCES  hotels (id),
  CONSTRAINT fk_bookmarks_from_guest FOREIGN KEY (guest_id) REFERENCES  guests (id)
);

LOCK TABLES bookmarks WRITE;
INSERT INTO 
  bookmarks
VALUES
  (1, 2, 9, 'Summer holidays', '2020-05-09 08:56:31'),
  (2, 3, 6, 'Holidays', '2020-01-02 10:56:31'),
  (3, 3, 10, NULL, '2020-03-05 10:56:31'),
  (4, 5, 7, NULL, '2020-08-19 11:56:31'),
  (5, 10, 5, NULL, '2020-03-21 10:56:31'),
  (6, 7, 4, NULL, '2020-12-09 10:56:31'),
  (7, 4, 2, 'Holidays 2021', '2021-01-09 10:56:31'),
  (8, 6, 3, 'Spring holidays', '2020-05-09 10:56:31'),
  (9, 3, 1, NULL, '2020-05-09 10:56:31'),
  (10, 8, 6, NULL, '2020-05-09 10:56:31'),
  (11, 5, 3, 'Spring holidays', '2020-02-09 10:56:31'),
  (12, 10, 6, 'Spring holidays', '2020-12-31 11:56:31'),
  (13, 4, 5, NULL, '2020-05-09 10:56:31'),
  (14, 8, 2, 'Holidays 2021', '2020-05-09 10:56:31'),
  (15, 9, 3, 'Spring holidays', '2020-11-21 13:56:31'),
  (16, 2, 8, NULL, '2019-12-18 07:42:38'),
  (17, 10, 9, 'Summer holidays', '2018-06-04 11:41:20'),
  (18, 6, 3, 'Spring holidays', '2020-01-06 12:00:48'),
  (19, 9, 1, NULL, '2020-04-09 11:12:34'),
  (20, 5, 8, NULL, '2020-08-02 10:51:56'),
  (21, 6, 9, 'Summer holidays', '2020-05-09 18:37:12' ),
  (22, 1, 5, NULL, '2018-11-01 17:49:18'),
  (23, 2, 4, 'Holidays 2020', '2020-01-03 16:31:16'),
  (24, 1, 3, 'Spring holidays', '2020-03-01 15:12:51');

UNLOCK TABLES;






DROP TRIGGER IF EXISTS check_name_before_insert;
DROP TRIGGER IF EXISTS check_name_before_update;
DELIMITER //
CREATE TRIGGER check_name_before_insert  BEFORE INSERT ON guests
FOR EACH ROW
BEGIN 
    IF (NEW.first_name IS NULL OR NEW.last_name IS NULL) THEN
    SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT='INSERT is canceled. Fields last_name and first_name can not be Null.';
    END IF;
END //
CREATE TRIGGER check_name_before_update  BEFORE UPDATE ON guests
FOR EACH ROW
BEGIN 
    IF (NEW.first_name IS NULL OR NEW.last_name IS NULL) THEN
    SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT='UPDATE is canceled. Fields last_name and first_name can not be Null.';
    END IF;
END //
DELIMITER ;

-- INSERT INTO guests (first_name, last_name, gender, birthday_at, email, address, city, postcode, country, phone, password_hash, created_at, updated_at) VALUES
--     ('Dobby', NULL, 'm', '1930-01-01', 'dobby@fantastic.com', 'Hogwarts School', 'London', 22222, 'England', '456072194272', '1d8f3272b013387b76bcbedb4758586d', '2014-12-31 16:16:27', '2015-12-31 11:16:28');




DROP TRIGGER IF EXISTS check_birthday_before_insert;
DROP TRIGGER IF EXISTS check_birthday_before_update;

DELIMITER //

CREATE TRIGGER check_birthday_before_insert BEFORE INSERT ON guests
FOR EACH ROW
begin
    IF NEW.birthday_at >= CURRENT_DATE() THEN 
        SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'Insert is canceled. Birthday must be in the past!';
    END IF;
END //

CREATE TRIGGER check_birthday_before_update BEFORE UPDATE ON guests
FOR EACH ROW
BEGIN 
    IF NEW.birthday_at >= CURRENT_DATE() THEN 
        SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'Update is canceled. Birthday must be in the past!';
    END IF;
END //

DELIMITER ;

-- INSERT INTO guests (first_name, last_name, gender, birthday_at, email, address, city, postcode, country, phone, password_hash, created_at, updated_at) VALUES
--     ('Dobby',   'Good',     'm', '2030-01-01', 'dobby@fantastic.com',       'Hogwarts School',           'London',    22222, 'England', '456072194272', '1d8f3272b013387b76bcbedb4758586d', '2014-12-31 16:16:27', '2015-12-31 11:16:28');




