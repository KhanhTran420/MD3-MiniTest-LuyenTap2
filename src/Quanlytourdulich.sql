CREATE DATABASE QuanLyTourDuLich;
USE QuanLyTourDuLich;
CREATE TABLE City(
                     cityID      INT       PRIMARY KEY ,
                     cityName VARCHAR(20) NOT NULL
);
CREATE TABLE LocalTour(
    localtourID          INT         NOT NULL AUTO_INCREMENT PRIMARY KEY ,
    localtourName        VARCHAR(30) NOT NULL ,
    localtourDescription VARCHAR(50) NOT NULL ,
    localtourPriceAVG    INT         NOT NULL ,
    localtourCity_ID     INT         NOT NULL ,
    FOREIGN KEY (localtourCity_ID) REFERENCES City(cityID)
);
CREATE TABLE CustomerBook(
    customerbookID        INT        NOT NULL  AUTO_INCREMENT PRIMARY KEY ,
    customerbookName     VARCHAR(30) NOT NULL ,
    numberID             VARCHAR(20) NOT NULL ,
    birthdayCustomer      DATE       NOT NULL ,
    localtourCity_ID     INT         NOT NULL ,
    FOREIGN KEY (localtourCity_ID) REFERENCES City(cityID)
);
CREATE TABLE TourType(
                         tourtypeID INT NOT NULL AUTO_INCREMENT PRIMARY KEY,
                         typeID VARCHAR(10),
                         typeName VARCHAR(50)
);

CREATE TABLE Tourist(
    touristID INT NOT NULL AUTO_INCREMENT PRIMARY KEY ,
    touristNumID VARCHAR(10) NOT NULL ,
    touristPrice INT NOT NULL ,
    touristType_id INT NOT NULL ,
    startDate DATETIME,
    endDate DATETIME,
    FOREIGN KEY (touristType_id) REFERENCES TourType(tourtypeID)
);

CREATE TABLE TourBill(
    tourbillID INT PRIMARY KEY ,
    tourist_ID INT NOT NULL ,
    customerbook_ID INT NOT NULL ,
    status BIT,
    FOREIGN KEY (tourist_ID) REFERENCES Tourist(touristID),
    FOREIGN KEY (customerbook_ID) REFERENCES CustomerBook(customerbookID)
);
INSERT INTO City(cityID, cityName) VALUES
(1,'Phu Tho'),(2,'Nam Dinh'),(3,'Hai Phong'),(4,'Ha Noi'),(5,'Quang Ninh');
INSERT INTO LocalTour(localtourID, localtourName, localtourDescription, localtourPriceAVG, localtourCity_ID) VALUES
(1,'Den Hung','Tuyet Dep',4,1),
(2,'Ha Long','Nhieu Gai Xinh',5,5),
(3,'Quat Lam','An Ghe 45 Kg',6,2),
(4,'Do Son','Cau Muc 7 Ngay',7,3),
(5,'Tran Duy Hung','Thien Duong Nhan Gian',8,4);
INSERT INTO CustomerBook(customerbookID, customerbookName, numberID, birthdayCustomer, localtourCity_ID) VALUES
(1,'Tran Quoc Khanh','696969','1996-8-8',4),
(2,'Nguyen Phan Giang','898989','1997-7-9',3),
(3,'Nguyen Minh Tuan','454545','1998-6-10',2),
(4,'Tran Thanh Dat','393939','1995-5-11',1),
(5,'Nguyen Khanh Huong','090909','1994-4-1',5),
(6,'Tran Van Anh','131313','1996-3-2',4),
(7,'Le Minh Duc','151515','1998-2-3',3),
(8,'Le Duc Canh','464646','1997-9-4',2),
(9,'Vu Van Luong','686868','1996-10-5',1),
(10,'Le Anh Thu','232323','1994-11-6',5);

INSERT INTO TourType(tourtypeID, typeID, typeName) VALUES
(1,'A1','Dat Tien'),
(2,'A2','Re Tien');

INSERT INTO Tourist(touristID, touristNumID, touristPrice, touristType_id, startDate, endDate) VALUES
(1,'T1',6,1,'2022-6-9','2022-6-12'),
(2,'T2',7,1,'2022-6-10','2022-6-13'),
(3,'T3',8,1,'2022-6-11','2022-6-14'),
(4,'T4',9,1,'2022-6-12','2022-6-15'),
(5,'T5',10,1,'2022-6-13','2022-6-16'),
(6,'T6',5,1,'2022-6-14','2022-6-17'),
(7,'T7',6,1,'2022-6-15','2022-6-18'),
(8,'T8',7,1,'2022-6-16','2022-6-19'),
(9,'T9',8,1,'2022-6-17','2022-6-20'),
(10,'T10',9,1,'2022-6-18','2022-6-21'),
(11,'T11',10,1,'2022-6-19','2022-6-22'),
(12,'T12',6,1,'2022-6-20','2022-6-23'),
(13,'T13',7,1,'2022-6-21','2022-6-24'),
(14,'T14',8,1,'2022-6-22','2022-6-25'),
(15,'T15',9,1,'2022-6-23','2022-6-26');

INSERT INTO TourBill(tourbillID, tourist_ID, customerbook_ID, status) VALUES
(1,2,1,1),
(2,4,2,1),
(3,6,3,1),
(4,8,4,1),
(5,10,5,1),
(6,12,6,1),
(7,14,7,1),
(8,3,8,1),
(9,9,9,1),
(10,15,10,1);


SELECT cityName AS "Tên Thành Phố", COUNT(customerbookName) AS "Số Tour Book"  FROM City JOIN CustomerBook CB on City.cityID = CB.localtourCity_ID GROUP BY cityName;
SELECT count(touristID)AS 'Số Tour Trong Tháng 3' from Tourist where month(startDate)=3;
SELECT count(touristID)AS 'Số Tour Trong Tháng 3' from Tourist where month(endDate)=4;
