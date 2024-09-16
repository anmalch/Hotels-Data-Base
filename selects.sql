1. Найти все отели сети 'Hilton'.

SELECT name, website
FROM hotels
WHERE website = 'hilton.com';

2. Найти все отели в Барселоне (Испания).

SELECT name, address, city, country
FROM hotels
WHERE city = 'Barcelona' AND country = 'Spain';

3. Вывести список images для каждого отеля, у которого они существуют.

SELECT h.name, him.file_name
FROM hotels h
LEFT JOIN hotel_images him
ON
  h.id=him.hotel_id
GROUP BY h.name, him.file_name
ORDER BY h.name;

4. Вывести все названия отелей, где останавливался гость guest_id = 10 и его имя.

SELECT CONCAT(g.first_name, ' ', g.last_name), h.name AS hotel_name
FROM orders o
  JOIN guests g ON o.guest_id=g.id
  JOIN rooms r ON o.room_id=r.id
  JOIN hotels h ON h.id = r.hotel_id
WHERE guest_id =10;

5. Вывести комнату(id, name) с большим количеством броней.

SELECT room_id, r.name, COUNT(*) AS cnt
FROM orders o
  JOIN rooms r ON o.room_id=r.id
GROUP BY room_id
ORDER BY cnt DESC
LIMIT 1;

6. Вывести 	отели с оценкой от гостей больше 4

SELECT id, name 
FROM hotels
WHERE id IN 
   (SELECT to_hotel_id 
    FROM reviews r 
    WHERE grade > 4);


7. Вывести самого частого посетителя отелей

SELECT CONCAT(g.first_name, ' ', g.last_name) AS tourist, COUNT(b.id) AS tour
FROM bookings b
 JOIN guests g ON b.guest_id=g.id
GROUP BY guest_id
ORDER BY tour DESC
LIMIT 1;

8. Вывести средний рейтинг отеля.

SELECT h.name, AVG(grade) AS average_rating
FROM hotels h
   RIGHT JOIN reviews r ON h.id=r.to_hotel_id
GROUP BY name
ORDER BY average_rating DESC;


9. Создать представление, сопоставляющее название комнаты соответствующему отелю.

DROP VIEW name;

CREATE VIEW name AS 
SELECT r.name AS  rooms,
     h.name AS hotels
FROM rooms r 
JOIN hotels h 
  ON 
  r.hotel_id = h.id;

10. Вывести отели и комментарии от гостей к ним 

CREATE VIEW comment_to_hotel AS 
SELECT h.name AS hotels,
       r.comment AS  reviews
FROM hotels h
JOIN reviews r
ON 
  h.id=r.to_hotel_id ;


11. Триггер для валидации  имени и фамилии гостя 

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

INSERT INTO guests (first_name, last_name, gender, birthday_at, email, address, city, postcode, country, phone, password_hash, created_at, updated_at) VALUES
    ('Dobby', NULL, 'm', '1930-01-01', 'dobby@fantastic.com', 'Hogwarts School', 'London', 22222, 'England', '456072194272', '1d8f3272b013387b76bcbedb4758586d', '2014-12-31 16:16:27', '2015-12-31 11:16:28');

SELECT * FROM guests;


12. Триггер для валидации даты дня рождения
DROP TRIGGER IF EXISTS check_birthday_before_insert;
DROP TRIGGER IF EXISTS check_birthday_before_update;

DELIMITER //

CREATE TRIGGER check_birthday_before_insert BEFORE INSERT ON guests
FOR EACH ROW
begin
    IF NEW.birthday >= CURRENT_DATE() THEN
        SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'Insert is canceled. Birthday must be in the past!';
    END IF;
END//

CREATE TRIGGER check_birthday_before_update BEFORE UPDATE ON guests
FOR EACH ROW
begin
    IF NEW.birthday >= CURRENT_DATE() THEN 
        SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'Update is canceled. Birthday must be in the past!';
    END IF;
END//

DELIMITER ;

INSERT INTO guests (first_name, last_name, gender, birthday_at, email, address, city, postcode, country, phone, password_hash, created_at, updated_at) VALUES
    ('Dobby', 'Good', 'm', '2030-01-01', 'dobby@fantastic.com', 'Hogwarts School', 'London', 22222, 'England', '456072194272', '1d8f3272b013387b76bcbedb4758586d', '2014-12-31 16:16:27', '2015-12-31 11:16:28');

SELECT * FROM guests;





