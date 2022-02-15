/* CREATE TABLES */
CREATE TABLE dbo.Driver_Data (
Driver_ID int NOT NULL,
Driver_Name char(20) NOT NULL,
Driver_PhoneNumber int NOT NULL,
PRIMARY KEY (Driver_ID),
CONSTRAINT PhonenoCheck CHECK (Driver_PhoneNumber<9999999999)
);

CREATE TABLE dbo.Customer_Data (
Customer_ID int NOT NULL,
Customer_Name char(20) NOT NULL,
Customer_PhoneNumber int NOT NULL,
Customer_EmailID char(40) NOT NULL,
Customer_Address char(100) NOT NULL,
PRIMARY KEY (Customer_ID),
CONSTRAINT Phonenocheckcust CHECK (Customer_PhoneNumber<9999999999),
);

CREATE TABLE dbo.Car_Data (
Car_Number char(15) NOT NULL,
Car_Model char(10) NOT NULL,
Car_Colour char(10) NOT NULL,
Driver_ID int,
PRIMARY KEY (Car_Number),
FOREIGN KEY (Driver_ID)
REFERENCES Driver_Data(Driver_ID)
);

CREATE TABLE dbo.Booking_Data (
Booking_ID int NOT NULL,
Customer_ID int,
Driver_ID int,
PRIMARY KEY (Booking_ID),
FOREIGN KEY (Driver_ID)
REFERENCES Driver_Data(Driver_ID),
FOREIGN KEY (Customer_ID)
REFERENCES Customer_Data(Customer_ID),
);

/* INSERTING DATA*/

INSERT INTO dbo.Driver_Data (Driver_ID,Driver_Name,Driver_PhoneNumber)
VALUES (1,'KUSHAL JAIN',95647),
(2,'DEVASHISH UPADHYAY',45678),
(3, 'RISHIT KAPADIYA',21354),
(4,'JAY BHUTORIA',85461);

INSERT INTO dbo.Customer_Data (Customer_ID,Customer_Name,Customer_PhoneNumber,Customer_Address,Customer_EmailID)
VALUES (56,'NANCY MAYER',956470,'B-64 MUMBAI','nacy@ok.com'),
(65,'SURESH',434478,'B-454 UDAIPUR','suresh@ok.com'),
(89,'KAILASH',956450,'N-956 DELHI','kailash@ok.com'),
(15,'Donald Trump',923140,'G-64 JAIPUR','donaldduck@ok.com');

INSERT INTO dbo.Car_Data (Car_Number, Car_Model,Car_Colour, Driver_ID)
VALUES ('RJ27OK1236','BMW','BLUE',1),
('MP57JK1289','TOYOTA','BLACK',2), 
('MH01LK4886','TESLA','PURPLE',3);

INSERT INTO dbo.Booking_Data(Booking_ID,Driver_ID,Customer_ID)
VALUES (655,1, 56),
(546,2, 15);
