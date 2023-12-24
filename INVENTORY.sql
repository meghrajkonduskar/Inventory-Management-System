-- CREATE DATABASE INVENTORY --
CREATE DATABASE INVENTORY;

-- USE THE DATABASE INVENTORY -- 
USE INVENTORY;

-- CREATE TABLE SUPPLIER -- 
CREATE TABLE SUPPLIER(
SID CHAR(5) NOT NULL UNIQUE,
SNAME VARCHAR(30) NOT NULL,
SADD VARCHAR (50) NOT NULL,
SCITY VARCHAR (30) DEFAULT 'DELHI',
SPHONE CHAR (15) NOT NULL UNIQUE,
EMAIL VARCHAR (50) NOT NULL UNIQUE,
PRIMARY KEY (SID)
);

-- CREATE TABLE PRODUCT --
CREATE TABLE PRODUCT(
PID CHAR(5) NOT NULL UNIQUE,
PDESC VARCHAR(50) NOT NULL,
PRICE DECIMAL(10,2) NOT NULL CHECK (PRICE > 0),
CATEGORY VARCHAR(10) NOT NULL CHECK (CATEGORY IN ('IT','HA', 'HC')),
SID CHAR(5) NOT NULL REFERENCES SUPPLIER (SID)
PRIMARY KEY (PID)
);

-- CREATE TABLE STOCK --
CREATE TABLE STOCK(
PID CHAR(5) NOT NULL REFERENCES PRODUCT (PID),
SQTY INT NOT NULL CHECK(SQTY>=0),
ROL INT NOT NULL CHECK(ROL>0),
MOQ INT NOT NULL CHECK(MOQ>=5),
);

-- CREATE TABLE CUST --
CREATE TABLE CUST(
CID CHAR(5) NOT NULL UNIQUE,
CNAME VARCHAR(30) NOT NULL,
"ADDRESS" VARCHAR(50) NOT NULL,
CITY VARCHAR(30) NOT NULL,
PHONE CHAR(15) NOT NULL UNIQUE,
EMAIL VARCHAR(50) NOT NULL UNIQUE,
DOB DATE NOT NULL CHECK(DOB<'1-JAN-2000')
PRIMARY KEY (CID)
);

-- CREATE TABLE ORDERS --
CREATE TABLE ORDERS(
OID CHAR(5) NOT NULL UNIQUE,
ODATE DATE NOT NULL,
PID CHAR(5) REFERENCES PRODUCT(PID),
CID CHAR(5) REFERENCES CUST(CID),
OQTY INT NOT NULL CHECK(OQTY>=1)
PRIMARY KEY (OID)
);

-- INSERTING VALUES INTO SUPPLIER TABLE -- 
INSERT INTO SUPPLIER VALUES
('S0001', 'HP', 'SECTOR 12', 'DELHI', '9851388987', 'HP@GMAIL.COM'),
('S0002', 'DELL', 'SECTOR 26', 'FARIDABAD', '9865198989', 'DELL@YAHOO.COM'),
('S0003', 'ACER', 'SECTOR 70', 'NOIDA', '8516151656', 'ACER@GMAIL.COM'),
('S0004', 'ASUS', 'SECTOR 01', 'FARIDABAD', '7898948569', 'ASUS@YAHOO.COM'),
('S0005', 'NVIDIA', 'SECTOR 02', 'DELHI', '9259555989', 'NVIDIA@GMAIL.COM'),
('S0006', 'APPLE', 'SECTOR 08', 'GUDGAON', '7448498189', 'APPLE@YAHOO.COM'),
('S0007', 'LENOVO', 'SECTOR 12', 'DELHI', '8338959598', 'LENOVO@GMAIL.COM'),
('S0008', 'MSI', 'SECTOR 32', 'NOIDA', '9986269997', 'MSI@YAHOO.COM');

-- INSERTING VALUES INTO PRODUCT TABLE --
INSERT INTO PRODUCT VALUES
('P0001', 'HP LAPTOP 15S', 577490.00, 'IT', 'S0001'),
('P0002', 'DELL INSPIRON LAPTOP', 32490.00, 'IT', 'S0002'), 
('P0003', 'HP MOUSE', 1000.00, 'HA', 'S0001'),
('P0004', 'APPLE MACHBOOK PRO', 99999.00, 'IT', 'S0006'),
('P0005', 'MSI LAPTOP', 45000.00, 'IT', 'S0008'),
('P0006', 'NVIDIA GPU 3080TI', 190000.00, 'HA', 'S0005'),
('P0007', 'LENOVO IDEAPAD', 200000, 'IT', 'S0007'),
('P0008', 'ACER PREDATOR HELIOS 300', 75000, 'IT', 'S0003'),
('P0009', 'NVIDIA GPU 1050TI', 10000, 'HA', 'S0005'),
('P0010', 'ASUS ROG PC CASE', 16000.00, 'HC', 'S0004'),
('P0011', 'MSI LAPTOP', 48000, 'IT', 'S0008'),
('P0012', 'HP SPECTRE', 89000, 'IT', 'S0001'),
('P0013', 'DELL ALIENWARE', 95000, 'IT', 'S0002'),
('P0014', 'ACER TUF LAPTOP', 42000.00, 'IT', 'S0003'),
('P0015', 'LENOVO  MOUSE', 700, 'HA', 'S0007'),
('P0016', 'NVIDIA GPU 2070', 20000, 'HA', 'S0005'),
('P0017', 'ASUS ROG VIPER MOUSE', 1200, 'HA', 'S0004'),
('P0018', 'HP CHROMEBOOK', 15000, 'IT', 'S0001'),
('P0019', 'APPLE IPAD', 60000, 'IT', 'S0006'),
('P0020', 'ACER PREDATOR HELIOS 500', 90000, 'IT', 'S0003');

-- INSERTING VALUES INTO STOCK TABLE --
INSERT INTO STOCK VALUES
('P0010' , 20, 2, 7),
('P0007' , 34, 4, 5),
('P0004' , 15, 2, 6),
('P0002' , 10, 1, 9),
('P0005' , 40, 3, 8),
('P0015' , 30, 5, 6),
('P0018' , 18, 4, 5),
('P0020' , 25, 1, 10),
('P0006' , 36, 2, 9),
('P0014' , 19, 3, 7);

-- INSERTING VALUES INTO CUST TABLE --
INSERT INTO CUST VALUES
('C0001', 'MEGHRAJ KONDUSKAR', 'SECTOR 12', 'DELHI', '9834805425', 'megh.konduskar@gmail.com', '06 Jan 1999'),
('C0002', 'KAPIL SHARMA', 'SECTOR 02', 'GUDGAON', '9865984891', 'kapilsharma@gmail.com','10 MARCH 1992'),
('C0003', 'TANVI NAIK', 'SECTOR 10', 'FARIDABAD', '8198135878', 'tanvinaik@yahoo.com', '11 july 1998'),
('C0004', 'NEETA SHAH', 'SECTOR 15', 'NOIDA', '9684886168', 'neetashah@yahoo.com', '27 august 1996'),
('C0005', 'AMIT SINGH', 'SECTOR 22', 'GUDGAON', '8998198535', 'amit.singh@gmail.com', '12 may 1991'),
('C0006', 'RAJ JADHAV', 'SECTOR 20', 'FARIDABAD', '9831886988', 'rajjadhav@gmail.com', '09 january 1997'),
('C0007', 'HARSH SHARMA', 'SECTOR 12', 'DELHI', '9518998991', 'harsh.sharma@yahoo.com', '23 july 1993');

-- INSERTING VALUES INTO ORDERS TABLE --
INSERT INTO ORDERS VALUES
('O0001', '05-SEP-2023','P0002','C0001',2),
('O0002', '13-JAN-2023','P0001','C0003',1),
('O0003', '21-AUG-2023','P0004','C0002',3),
('O0004', '07-NOV-2023','P0006','C0007',5),
('O0005', '06-DEC-2023','P0007','C0004',4);

-- CREATING A VIEW TO GET THE BILL --
CREATE VIEW BILL AS (
	SELECT OID, ODATE, CNAME, "ADDRESS", PHONE, PDESC, PRICE, OQTY, PRICE*OQTY AS 'AMOUNT'
	FROM ORDERS 
	LEFT JOIN CUST ON ORDERS.CID = CUST.CID
	LEFT JOIN PRODUCT ON ORDERS.PID = PRODUCT.PID);

SELECT * FROM BILL;

-- CREATING PROCEDURES TO ADD SUPPLIERS, PRODUCTS, CUSTOMERS AND ORDERS --

-- CREATING SQUENCES FOR AUTOGENRATING ID --

CREATE SEQUENCE SUPPLIERSEQ
START WITH 9
INCREMENT BY 1;

CREATE SEQUENCE PRODUCTSEQ
START WITH 21
INCREMENT BY 1;

CREATE SEQUENCE CUSTOMERSEQ
START WITH 8
INCREMENT BY 1;

CREATE SEQUENCE ORDERSEQ
START WITH 6
INCREMENT BY 1;

-- CREATING FUNCTION TO AUTO GENERATE ID --
CREATE FUNCTION GENID (@C CHAR (1) , @I INT)
RETURNS CHAR(5)
AS
BEGIN
	DECLARE @R CHAR(5);
	DECLARE @ID CHAR(5);
	SELECT @R = CASE
					WHEN @I < 10 THEN CONCAT(@C,'000',@I)
					WHEN @I < 100 THEN CONCAT(@C,'00',@I)
					WHEN @I < 1000 THEN CONCAT(@C,'0',@I)
					WHEN @I < 10000 THEN CONCAT(@C,@I)
					ELSE 'NULL'
				END;
	RETURN @R
END;

-- PROCEDURE TO ADD SUPPLIER --
SELECT * FROM SUPPLIER;

CREATE PROCEDURE ADDSUPPLIER @N VARCHAR(20), @A VARCHAR(30), @C VARCHAR(20), @P CHAR(15), @E VARCHAR(100) 
AS
BEGIN
	SET NOCOUNT ON;
	DECLARE @I AS INT
	DECLARE @ID AS CHAR(5)
	SET @I = (NEXT VALUE FOR SUPPLIERSEQ); 
	SET @ID = DBO.GENID('S', @I);
	INSERT INTO SUPPLIER VALUES
	(@ID, @N, @A, @C, @P, @E);

	SELECT * FROM SUPPLIER 
	WHERE SID = @ID;
END;

ADDSUPPLIER 'LOGITECH', 'SECTOR 70', 'DELHI', '9874456258', 'LOGITECH@YAHOO.COM';

-- ADD PRODUCT PROCEDURE -- 

SELECT * FROM PRODUCT;

CREATE PROCEDURE ADDPRO @D VARCHAR(30), @P DECIMAL(10,2), @C VARCHAR(10), @SID CHAR(5)
AS
BEGIN
	SET NOCOUNT ON;
	DECLARE @I AS INT
	DECLARE @ID AS CHAR(5)
	SET @I = (NEXT VALUE FOR PRODUCTSEQ); 
	SET @ID = DBO.GENID('P', @I);
	INSERT INTO PRODUCT VALUES
	(@ID, @D, @P, @C, @SID);
	
	SELECT * FROM PRODUCT
	WHERE PID = @ID; 
END;


ADDPRO 'LOGITECH G302 MOUSE', 2400.00, 'HA', 'S0009';

-- PROCEDURE TO ADD CUST --

SELECT * FROM CUST;

CREATE PROCEDURE ADDCUST @N VARCHAR(30), @A VARCHAR(50), @C VARCHAR(20), @P CHAR(15), @E VARCHAR(50), @DOB DATE
AS
BEGIN
	SET NOCOUNT ON;
	DECLARE @I AS INT;
	DECLARE @ID AS CHAR(5);
	SET @I = (NEXT VALUE FOR CUSTOMERSEQ); 
	SET @ID = DBO.GENID('C', @I);
	INSERT INTO CUST VALUES
	(@ID, @N, @A, @C, @P, @E, @DOB);

	SELECT * FROM CUST
	WHERE CID = @ID;

END;

ADDCUST 'RAUNAK JOSHI', 'SECTOR 17', 'FARIDABAD', '9655812547', 'raunakjoshi@gmail.com', '28-AUG-1991';

-- PROCEDURE TO ADD ORDER --

SELECT * FROM ORDERS;

CREATE PROCEDURE ADDORDER @PID CHAR(5), @CID CHAR(5), @QTY INT
AS
BEGIN
	SET NOCOUNT ON;
	DECLARE @I AS INT;
	DECLARE @ID AS CHAR(5);
	SET @I = (NEXT VALUE FOR ORDERSEQ); 
	SET @ID = DBO.GENID('O', @I);
	INSERT INTO ORDERS VALUES
	(@ID, GETDATE(), @PID, @CID, @QTY);

	SELECT * FROM ORDERS
	WHERE OID = @ID;
END;

ADDORDER 'P0021', 'C0006', 2;
