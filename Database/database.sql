DROP DATABASE IF EXISTS rarebooks;
CREATE DATABASE IF NOT EXISTS rarebooks;
USE rarebooks;

CREATE TABLE Author
(
author_numb int PRIMARY KEY AUTO_INCREMENT,
author_last_first char (128)
);

CREATE TABLE Condition_Codes
(
  condition_code int PRIMARY KEY AUTO_INCREMENT,
  condition_description varchar (128)
);

CREATE TABLE Work
(
  work_numb int PRIMARY KEY AUTO_INCREMENT,
  author_numb int,
  title char (50),
  CONSTRAINT AuthorWork FOREIGN KEY (author_numb) REFERENCES Author (author_numb)

);

CREATE TABLE Publisher
(
  publisher_id int PRIMARY KEY AUTO_INCREMENT,
  publisher_name char (50)
);

CREATE TABLE Customer
(
  customer_numb int PRIMARY KEY AUTO_INCREMENT,
  first_name varchar (30),
  last_name varchar (30),
  street varchar (50),
  city varchar (30),
  state_province char (2),
  zip_postcode char (10),
  contact_phone char (12)
);

CREATE TABLE Sale
(
  sale_id int PRIMARY KEY AUTO_INCREMENT,
  customer_numb int,
  sale_date date,
  sale_total_amt decimal (8,2),
  credit_card_numb char (20),
  exp_month int,
  exp_year int,
  CONSTRAINT SaleCustomer FOREIGN KEY (customer_numb) REFERENCES Customer (customer_numb)
);

CREATE TABLE Book
(
  ISBN char (17),
  work_numb int,
  publisher_id int,
  edition int,
  binding char (20),
  copyright_year char (4),
  CONSTRAINT pk_book PRIMARY KEY (ISBN),
  CONSTRAINT PublisherBook FOREIGN KEY (publisher_id) REFERENCES Publisher (publisher_id),
  CONSTRAINT workBook FOREIGN KEY (work_numb) REFERENCES Work (work_numb)
);

CREATE TABLE Volume
(
  inventory_id int PRIMARY KEY AUTO_INCREMENT,
  ISBN char (17),
  condition_code int,
  date_acquired date,
  asking_price decimal (7,2),
  selling_price decimal (7,2),
  sale_id int,
  CONSTRAINT BookVolume FOREIGN KEY (ISBN) REFERENCES Book (ISBN),
  CONSTRAINT ConditionVolume FOREIGN KEY (condition_code) REFERENCES Condition_codes (condition_code),
  CONSTRAINT SaleVolume FOREIGN KEY (sale_id) REFERENCES Sale (sale_id)
);

INSERT INTO customer VALUES (1,'Janice','Jones','125 Center Road','Anytown','NY','11111','518-555-1111');
INSERT INTO customer VALUES (2,'Jon','Jones','25 Elm Road','Next Town','NJ','18888','209-555-2222');
INSERT INTO customer VALUES (3,'John','Doe','821 Elm Street','Next Town','NJ','18888','209-555-3333');
INSERT INTO customer VALUES (4,'Jane','Doe','852 Main Street','Anytown','NY','11111','518-555-4444');
INSERT INTO customer VALUES (5,'Jane','Smith','1919 Main Street','New Village','NY','13333','518-555-5555');
INSERT INTO customer VALUES (6,'Janice','Smith','800 Center Road','Anytown','NY','11111','518-555-6666');
INSERT INTO customer VALUES (7,'Helen','Brown','25 Front Street','Anytown','NY','11111','518-555-7777');
INSERT INTO customer VALUES (8,'Helen','Jerry','16 Main Street','Newtown','NJ','18886','209-555-8888');
INSERT INTO customer VALUES (9,'Mary','Collins','301 Pine Road, Apt. 12','Newtown','NJ','18886','209-555-9999');
INSERT INTO customer VALUES (10,'Peter','Collins','18 Main Street','Newtown','NJ','18886','209-555-1010');
INSERT INTO customer VALUES (11,'Edna','Hayes','209 Circle Road','Anytown','NY','11111','518-555-1110');
INSERT INTO customer VALUES (12,'Franklin','Hayes','615 Circle Road','Anytown','NY','11111','518-555-1212');
INSERT INTO customer VALUES (13,'Peter','Johnson','22 Rose Court','Next Town','NJ','18888','209-555-1313');
INSERT INTO customer VALUES (14,'Peter','Johnson','881 Front Street','Next Town','NJ','18888','209-555-1414');
INSERT INTO customer VALUES (15,'John','Smith','881 Manor Lane','Next Town','NJ','18888','209-555-1515');
INSERT INTO publisher VALUES (1,'Wiley');
INSERT INTO publisher VALUES (2,'Simon & Schuster');
INSERT INTO publisher VALUES (3,'Macmillan');
INSERT INTO publisher VALUES (4,'Tor');
INSERT INTO publisher VALUES (5,'DAW');
INSERT INTO author VALUES (1,'Bronte, Charlotte');
INSERT INTO author VALUES (2,'Doyle, Sir Arthur Conan');
INSERT INTO author VALUES (3,'Twain, Mark');
INSERT INTO author VALUES (4,'Stevenson, Robert Louis');
INSERT INTO author VALUES (5,'Rand, Ayn');
INSERT INTO author VALUES (6,'Barrie, James');
INSERT INTO author VALUES (7,'Ludlum, Robert');
INSERT INTO author VALUES (8,'Barth, John');
INSERT INTO author VALUES (9,'Herbert, Frank');
INSERT INTO author VALUES (10,'Asimov, Isaac');
INSERT INTO author VALUES (11,'Funke, Cornelia');
INSERT INTO author VALUES (12,'Stephenson, Neal');
INSERT INTO condition_codes VALUES (1,'New');
INSERT INTO condition_codes VALUES (2,'Excellent');
INSERT INTO condition_codes VALUES (3,'Fine');
INSERT INTO condition_codes VALUES (4,'Good');
INSERT INTO condition_codes VALUES (5,'Poor');
INSERT INTO work VALUES (1,1,'Jane Eyre');
INSERT INTO work VALUES (2,1,'Villette');
INSERT INTO work VALUES (3,2,'Hound of the Baskervilles');
INSERT INTO work VALUES (4,2,'Lost World, The');
INSERT INTO work VALUES (5,2,'Complete Sherlock Holmes');
INSERT INTO work VALUES (6,3,'Connecticut Yankee in King Arthurs Court, A');
INSERT INTO work VALUES (7,3,'Prince and the Pauper');
INSERT INTO work VALUES (8,3,'Tom Sawyer');
INSERT INTO work VALUES (9,3,'Adventures of Huckleberry Finn, The');
INSERT INTO work VALUES (10,7,'Bourne Identity, The');
INSERT INTO work VALUES (11,7,'Matarese Circle, The');
INSERT INTO work VALUES (12,7,'Bourne Supremacy, The');
INSERT INTO work VALUES (13,5,'Fountainhead, The');
INSERT INTO work VALUES (14,5,'Atlas Shrugged');
INSERT INTO work VALUES (15,6,'Peter Pan');
INSERT INTO work VALUES (16,4,'Kidnapped');
INSERT INTO work VALUES (17,4,'Treasure Island');
INSERT INTO work VALUES (18,8,'Sot Weed Factor, The');
INSERT INTO work VALUES (19,8,'Lost in the Funhouse');
INSERT INTO work VALUES (20,8,'Giles Goat Boy');
INSERT INTO work VALUES (21,9,'Dune');
INSERT INTO work VALUES (22,9,'Dune Messiah');
INSERT INTO work VALUES (23,10,'Foundation');
INSERT INTO work VALUES (32,10,'Foundation and Empire');
INSERT INTO work VALUES (24,10,'Last Foundation');
INSERT INTO work VALUES (25,10,'I, Robot');
INSERT INTO work VALUES (26,11,'Inkheart');
INSERT INTO work VALUES (27,11,'Inkdeath');
INSERT INTO work VALUES (28,12,'Anathem');
INSERT INTO work VALUES (29,12,'Snow Crash');
INSERT INTO work VALUES (30,5,'Anthem');
INSERT INTO work VALUES (31,12,'Cryptonomicon');
INSERT INTO book VALUES ('978-1-11111-111-1',1,1,2,'Board',1857);
INSERT INTO book VALUES ('978-1-11111-112-1',1,1,1,'Board',1847);
INSERT INTO book VALUES ('978-1-11111-113-1',2,4,1,'Board',1842);
INSERT INTO book VALUES ('978-1-11111-114-1',3,4,1,'Board',1801);
INSERT INTO book VALUES ('978-1-11111-115-1',3,4,10,'Leather',1925);
INSERT INTO book VALUES ('978-1-11111-116-1',4,3,1,'Board',1805);
INSERT INTO book VALUES ('978-1-11111-117-1',5,5,1,'Board',1808);
INSERT INTO book VALUES ('978-1-11111-118-1',5,2,19,'Leather',1956);
INSERT INTO book VALUES ('978-1-11111-119-1',6,2,3,'Board',1956);
INSERT INTO book VALUES ('978-1-11111-120-1',8,4,5,'Board',1906);
INSERT INTO book VALUES ('978-1-11111-121-1',8,1,12,'Leather',1982);
INSERT INTO book VALUES ('978-1-11111-122-1',9,1,12,'Leather',1982);
INSERT INTO book VALUES ('978-1-11111-123-1',11,2,1,'Board',1988);
INSERT INTO book VALUES ('978-1-11111-124-1',12,2,1,'Board',1989);
INSERT INTO book VALUES ('978-1-11111-125-1',13,2,3,'Board',1965);
INSERT INTO book VALUES ('978-1-11111-126-1',13,2,9,'Leather',2001);
INSERT INTO book VALUES ('978-1-11111-127-1',14,2,1,'Board',1960);
INSERT INTO book VALUES ('978-1-11111-128-1',16,2,12,'Board',1960);
INSERT INTO book VALUES ('978-1-11111-129-1',16,2,14,'Leather',2002);
INSERT INTO book VALUES ('978-1-11111-130-1',17,3,6,'Leather',1905);
INSERT INTO book VALUES ('978-1-11111-131-1',18,4,6,'Board',1957);
INSERT INTO book VALUES ('978-1-11111-132-1',19,4,1,'Board',1962);
INSERT INTO book VALUES ('978-1-11111-133-1',20,4,1,'Board',1964);
INSERT INTO book VALUES ('978-1-11111-134-1',21,5,1,'Board',1964);
INSERT INTO book VALUES ('978-1-11111-135-1',23,5,1,'Board',1962);
INSERT INTO book VALUES ('978-1-11111-136-1',23,5,4,'Leather',2001);
INSERT INTO book VALUES ('978-1-11111-137-1',24,5,4,'Leather',2001);
INSERT INTO book VALUES ('978-1-11111-138-1',23,5,4,'Leather',2001);
INSERT INTO book VALUES ('978-1-11111-139-1',25,5,4,'Leather',2001);
INSERT INTO book VALUES ('978-1-11111-140-1',26,5,1,'Board',2001);
INSERT INTO book VALUES ('978-1-11111-141-1',27,5,1,'Board',2005);
INSERT INTO book VALUES ('978-1-11111-142-1',28,5,1,'Board',2008);
INSERT INTO book VALUES ('978-1-11111-143-1',29,5,1,'Board',1992);
INSERT INTO book VALUES ('978-1-11111-144-1',30,1,1,'Board',1952);
INSERT INTO book VALUES ('978-1-11111-145-1',30,5,1,'Board',2001);
INSERT INTO book VALUES ('978-1-11111-146-1',31,5,1,'Board',1999);
INSERT INTO sale VALUES (1,1,'2021-10-13',510.00,'1234 5678 9101 1121',10,18);
INSERT INTO volume VALUES (1,'978-1-11111-111-1',3,'2019-06-12',175.00,175.00,1);
INSERT INTO volume VALUES (2,'978-1-11111-131-1',4,'2019-01-23',50.00,50.00,1);
INSERT INTO volume VALUES (3,'978-1-11111-133-1',2,'2018-04-05',300.00,285.00,1);
INSERT INTO sale VALUES (2,1,'2021-01-05',125.00,'1234 5678 9101 1121',10,18);
INSERT INTO volume VALUES (4,'978-1-11111-142-1',1,'2018-04-05',25.95,25.95,2);
INSERT INTO volume VALUES (5,'978-1-11111-146-1',1,'2018-04-05',22.95,22.95,2);
INSERT INTO volume VALUES (6,'978-1-11111-144-1',2,'2019-05-15',80.00,76.10,2);
INSERT INTO volume VALUES (7,'978-1-11111-137-1',2,'2019-06-20',80.00,NULL,NULL);
INSERT INTO volume VALUES (8,'978-1-11111-137-1',3,'2019-06-20',50.00,NULL,NULL);
INSERT INTO volume VALUES (9,'978-1-11111-136-1',1,'2018-12-20',75.00,NULL,NULL);
INSERT INTO volume VALUES (10,'978-1-11111-136-1',2,'2018-12-15',50.00,NULL,NULL);
INSERT INTO sale VALUES (3,1,'2021-06-15',58.00,'1234 5678 9101 1121',10,18);
INSERT INTO volume VALUES (11,'978-1-11111-143-1',1,'2019-04-05',25.00,25.00,3);
INSERT INTO volume VALUES (12,'978-1-11111-132-1',1,'2019-06-12',15.00,15.00,3);
INSERT INTO volume VALUES (13,'978-1-11111-133-1',3,'2019-04-20',18.00,18.00,3);
INSERT INTO sale VALUES (4,4,'2021-06-30',110.00,'1234 5678 9101 5555',7,17);
INSERT INTO volume VALUES (14,'978-1-11111-121-1',2,'2019-04-20',110.00,110.00,3);
INSERT INTO sale VALUES (5,6,'2021-06-30',110.00,'1234 5678 9101 6666',12,17);
INSERT INTO volume VALUES (15,'978-1-11111-121-1',2,'2019-04-20',110.00,110.00,5);
INSERT INTO volume VALUES (16,'978-1-11111-121-1',2,'2019-04-20',110.00,NULL,NULL);
INSERT INTO volume VALUES (17,'978-1-11111-124-1',2,'2020-01-12',75.00,NULL,NULL);
INSERT INTO sale VALUES (6,12,'2021-07-05',505.00,'1234 5678 9101 7777',7,16);
INSERT INTO volume VALUES (18,'978-1-11111-146-1',1,'2019-05-11',30.00,30.00,6);
INSERT INTO volume VALUES (19,'978-1-11111-122-1',2,'2019-05-06',75.00,75.00,6);
INSERT INTO volume VALUES (20,'978-1-11111-130-1',2,'2019-04-20',150,120.00,6);
INSERT INTO volume VALUES (21,'978-1-11111-126-1',2,'2019-04-20',110,110.00,6);
INSERT INTO volume VALUES (22,'978-1-11111-139-1',2,'2019-05-16',200.00,170.00,6);
INSERT INTO sale VALUES (7,8,'2021-07-05',80.00,'1234 5678 9101 8888',8,16);
INSERT INTO volume VALUES (23,'978-1-11111-125-1',2,'2019-05-16',45.00,45.00,7);
INSERT INTO volume VALUES (24,'978-1-11111-131-1',3,'2019-04-20',35.00,35.00,7);
INSERT INTO sale VALUES (8,5,'2021-07-07',55.00,'1234 5678 9101 9999',9,15);
INSERT INTO volume VALUES (25,'978-1-11111-126-1',2,'2019-11-16',35.00,55.00,8);
INSERT INTO volume VALUES (27,'978-1-11111-141-1',1,'2019-11-06',24.95,NULL,NULL);
INSERT INTO volume VALUES (28,'978-1-11111-141-1',1,'2019-11-06',24.95,NULL,NULL);
INSERT INTO volume VALUES (29,'978-1-11111-141-1',1,'2019-11-06',24.95,NULL,NULL);
INSERT INTO volume VALUES (30,'978-1-11111-145-1',1,'2019-11-06',27.95,NULL,NULL);
INSERT INTO volume VALUES (31,'978-1-11111-145-1',1,'2019-11-06',27.95,NULL,NULL);
INSERT INTO volume VALUES (32,'978-1-11111-145-1',1,'2019-11-06',27.95,NULL,NULL);
INSERT INTO sale VALUES (9,8,'2021-07-07',50.00,'1234 5678 9101 8888',8,16);
INSERT INTO volume VALUES (33,'978-1-11111-139-1',2,'2019-10-06',75.00,50.00,9);
INSERT INTO sale VALUES (10,11,'2021-07-10',125.00,'1234 5678 9101 1010',11,16);
INSERT INTO volume VALUES (34,'978-1-11111-133-1',1,'2019-11-16',125.00,125.00,10);
INSERT INTO sale VALUES (11,9,'2020-07-10',200.00,'1234 5678 9101 0909',11,15);
INSERT INTO volume VALUES (35,'978-1-11111-126-1',1,'2019-10-06',75,75.00,11);
INSERT INTO volume VALUES (36,'978-1-11111-130-1',3,'2018-12-06',50.00,50.00,11);
INSERT INTO volume VALUES (37,'978-1-11111-136-1',3,'2018-12-06',75.00,75.00,11);
INSERT INTO sale VALUES (12,10,'2021-07-10',225.00,'1234 5678 9101 0101',10,15);
INSERT INTO volume VALUES (38,'978-1-11111-130-1',2,'2019-04-06',200,150,12);
INSERT INTO volume VALUES (39,'978-1-11111-132-1',3,'2019-04-06',75,75,12);
INSERT INTO sale VALUES (13,2,'2021-07-10',25.95,'1234 5678 9101 2222',2,15);
INSERT INTO volume VALUES (40,'978-1-11111-129-1',1,'2012-04-06',25.95,25.95,13);
INSERT INTO sale VALUES (14,6,'2021-07-10',80,'1234 5678 9101 6666',12,17);
INSERT INTO volume VALUES (41,'978-1-11111-141-1',1,'2019-05-16',40,40,14);
INSERT INTO volume VALUES (42,'978-1-11111-141-1',1,'2019-05-16',40,40,14);
INSERT INTO volume VALUES (43,'978-1-11111-132-1',1,'2019-11-12',17.95,NULL,NULL);
INSERT INTO volume VALUES (44,'978-1-11111-138-1',1,'2019-11-12',75.95,NULL,NULL);
INSERT INTO volume VALUES (45,'978-1-11111-138-1',1,'2019-11-12',75.95,NULL,NULL);
INSERT INTO volume VALUES (46,'978-1-11111-131-1',3,'2019-11-12',15.95,NULL,NULL);
INSERT INTO volume VALUES (47,'978-1-11111-140-1',3,'2019-11-12',25.95,NULL,NULL);
INSERT INTO volume VALUES (48,'978-1-11111-123-1',2,'2019-08-16',24.95,NULL,NULL);
INSERT INTO volume VALUES (49,'978-1-11111-127-1',2,'2019-08-16',27.95,NULL,NULL);
INSERT INTO sale VALUES (15,11,'2021-07-12',100,'1234 5678 9101 1231',11,17);
INSERT INTO volume VALUES (50,'978-1-11111-127-1',2,'2020-01-06',50,50,15);
INSERT INTO volume VALUES (51,'978-1-11111-141-1',2,'2020-01-06',50,50,15);
INSERT INTO sale VALUES (16,2,'2021-07-25',130,'1234 5678 9101 2222',2,15);
INSERT INTO volume VALUES (52,'978-1-11111-141-1',2,'2020-01-06',50,50,16);
INSERT INTO volume VALUES (53,'978-1-11111-123-1',2,'2020-01-06',40,40,16);
INSERT INTO volume VALUES (54,'978-1-11111-127-1',2,'2020-01-06',40,40,16);
INSERT INTO sale VALUES (17,1,'2021-07-25',100,'1234 5678 9101 1121',10,18);
INSERT INTO volume VALUES (55,'978-1-11111-133-1',2,'2020-02-06',60,60,17);
INSERT INTO volume VALUES (56,'978-1-11111-127-1',2,'2019-02-16',40,40,17);
INSERT INTO sale VALUES (18,5,'2021-08-22',100,'1234 5678 9101 9999',9,15);
INSERT INTO volume VALUES (57,'978-1-11111-135-1',2,'2019-02-16',40,40,18);
INSERT INTO volume VALUES (58,'978-1-11111-131-1',2,'2020-02-16',25,25,18);
INSERT INTO volume VALUES (59,'978-1-11111-127-1',2,'2020-02-25',35,35,18);
INSERT INTO sale VALUES (19,6,'2021-09-01',95,'1234 5678 9101 7777',7,16);
INSERT INTO volume VALUES (60,'978-1-11111-128-1',2,'2019-12-16',50,45,19);
INSERT INTO volume VALUES (61,'978-1-11111-136-1',3,'2019-10-22',50,50,19);
INSERT INTO sale VALUES (20,2,'2021-09-01',75,'1234 5678 9101 2222',2,15);
INSERT INTO volume VALUES (62,'978-1-11111-115-1',2,'2019-10-22',75,75,20);
INSERT INTO volume VALUES (63,'978-1-11111-130-1',2,'2019-07-16',500,NULL,NULL);
INSERT INTO volume VALUES (64,'978-1-11111-136-1',2,'2019-03-06',125,NULL,NULL);
INSERT INTO volume VALUES (65,'978-1-11111-136-1',2,'2019-03-06',125,NULL,NULL);
INSERT INTO volume VALUES (66,'978-1-11111-137-1',2,'2019-03-06',125,NULL,NULL);
INSERT INTO volume VALUES (67,'978-1-11111-137-1',2,'2019-03-06',125,NULL,NULL);
INSERT INTO volume VALUES (68,'978-1-11111-138-1',2,'2019-03-06',125,NULL,NULL);
INSERT INTO volume VALUES (69,'978-1-11111-138-1',2,'2019-03-06',125,NULL,NULL);
INSERT INTO volume VALUES (70,'978-1-11111-139-1',2,'2019-03-06',125,NULL,NULL);
INSERT INTO volume VALUES (71,'978-1-11111-139-1',2,'2019-03-06',125,NULL,NULL);

SELECT 
    cc.condition_description,
    COUNT(*) AS in_stock_count
FROM 
    Volume v
JOIN 
    Condition_Codes cc ON v.condition_code = cc.condition_code
WHERE 
    v.sale_id IS NULL
GROUP BY 
    cc.condition_description;
    
SELECT 
    cc.condition_description,
    SUM(v.selling_price) AS total_sales
FROM 
    Volume v
JOIN 
    Condition_Codes cc ON v.condition_code = cc.condition_code
WHERE 
    v.sale_id IS NOT NULL
GROUP BY 
    cc.condition_description
ORDER BY 
    total_sales DESC;

SELECT 
    a.author_last_first AS author_name,
    w.title AS book_title,
    COUNT(*) AS in_stock_count
FROM 
    Volume v
JOIN 
    Book b ON v.ISBN = b.ISBN
JOIN 
    Work w ON b.work_numb = w.work_numb
JOIN 
    Author a ON w.author_numb = a.author_numb
WHERE 
    v.sale_id IS NULL
GROUP BY 
    a.author_last_first, w.title
ORDER BY 
    a.author_last_first ASC, w.title ASC;

SELECT 
    b.ISBN,
    w.title,
    p.publisher_name,
    b.edition,
    b.binding,
    b.copyright_year,
    COUNT(*) AS in_stock_count
FROM 
    Volume v
JOIN 
    Book b ON v.ISBN = b.ISBN
JOIN 
    Publisher p ON b.publisher_id = p.publisher_id
JOIN 
    Work w ON b.work_numb = w.work_numb
WHERE 
    v.sale_id IS NULL
GROUP BY 
    b.ISBN, w.title, p.publisher_name, b.edition, b.binding, b.copyright_year
ORDER BY 
    p.publisher_name ASC;

SELECT
    YEAR(s.sale_date) AS year,
    MONTH(s.sale_date) AS month,
    DAY(s.sale_date) AS day,
    SUM(v.selling_price) AS sales
FROM
    Sale s
JOIN
    Volume v ON s.sale_id = v.sale_id
WHERE
    YEAR(s.sale_date) = 2021
GROUP BY
    YEAR(s.sale_date),
    MONTH(s.sale_date),
    DAY(s.sale_date) WITH ROLLUP
ORDER BY
    year, month, day;
    
SELECT 
    v.inventory_id,
    w.title,
    cc.condition_description,
    v.selling_price
FROM 
    Volume v
JOIN 
    Book b ON v.ISBN = b.ISBN
JOIN 
    Work w ON b.work_numb = w.work_numb
JOIN 
    Condition_Codes cc ON v.condition_code = cc.condition_code
JOIN 
    Sale s ON v.sale_id = s.sale_id
WHERE 
    v.selling_price > (
        SELECT AVG(v2.selling_price)
        FROM Volume v2
        JOIN Sale s2 ON v2.sale_id = s2.sale_id
        WHERE MONTH(s2.sale_date) = 7 AND YEAR(s2.sale_date) = 2021
    )
ORDER BY 
    w.title;
    
SELECT 
    a.author_last_first AS author,
    w.title,
    COUNT(v.inventory_id) AS copies_sold,
    SUM(v.selling_price) AS total_sales
FROM 
    Volume v
JOIN 
    Book b ON v.ISBN = b.ISBN
JOIN 
    Work w ON b.work_numb = w.work_numb
JOIN 
    Author a ON w.author_numb = a.author_numb
JOIN 
    Sale s ON v.sale_id = s.sale_id
WHERE 
    MONTH(s.sale_date) = 7 AND YEAR(s.sale_date) = 2021
GROUP BY 
    a.author_last_first,
    w.title
ORDER BY 
    copies_sold DESC;
    
INSERT INTO Sale (customer_numb, sale_date, sale_total_amt, credit_card_numb, exp_month, exp_year)
VALUES (3, '2021-11-03', 125.00, '1234 5678 9101 4321', 7, 23);

SET @last_sale_id = LAST_INSERT_ID();

UPDATE Volume
SET sale_id = @last_sale_id, selling_price = 125.00
WHERE inventory_id = 67;

INSERT INTO Publisher (publisher_name) VALUES ('Thorndike Press');


INSERT INTO Author (author_last_first) VALUES ('Rowling, JK');


INSERT INTO Work (author_numb, title) 
VALUES ((SELECT author_numb FROM Author WHERE author_last_first = 'Rowling, JK'), 'Harry Potter and Sorcerer''s Stone');


INSERT INTO Book (ISBN, work_numb, publisher_id, edition, binding, copyright_year) 
VALUES ('978-0-78622-272-8', 
        (SELECT work_numb FROM Work WHERE title = 'Harry Potter and Sorcerer''s Stone'), 
        (SELECT publisher_id FROM Publisher WHERE publisher_name = 'Thorndike Press'), 
        1, 'Leather', '1999');


INSERT INTO Volume (ISBN, condition_code, date_acquired, asking_price, selling_price, sale_id) 
VALUES ('978-0-78622-272-8', 
        (SELECT condition_code FROM Condition_Codes WHERE condition_description = 'Excellent'), 
        '2018-03-01', 100.00, NULL, NULL);

USE rarebooks;


DELETE v
FROM Volume v
JOIN Book b ON v.ISBN = b.ISBN
JOIN Publisher p ON b.publisher_id = p.publisher_id
WHERE p.publisher_name = 'Thorndike Press';


DELETE b
FROM Book b
JOIN Publisher p ON b.publisher_id = p.publisher_id
WHERE p.publisher_name = 'Thorndike Press';


DELETE FROM Publisher
WHERE publisher_name = 'Thorndike Press';





