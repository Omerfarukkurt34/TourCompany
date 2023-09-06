-- Regions Tablosu
CREATE TABLE Regions (
    Region_ID INT PRIMARY KEY,
    Region_Name VARCHAR(30) NOT NULL,
    Fee DECIMAL(10, 2) NOT NULL CHECK (Fee >= 20)
);
-- Tours Tablosu
CREATE TABLE Tours (
    Tour_ID INT PRIMARY KEY,
    Tour_Name VARCHAR(150) NOT NULL,
    Tour_Fee DECIMAL(10, 2) CHECK (Tour_Fee >= 0)
);
-- TourRegions Tablosu
CREATE TABLE TourRegions (
    TourRegion_ID INT PRIMARY KEY,
    Tour_ID INT NOT NULL,
    Region_ID INT NOT NULL,
    Fee DECIMAL(10, 2) NOT NULL,
    FOREIGN KEY (Tour_ID) REFERENCES Tours (Tour_ID),
    FOREIGN KEY (Region_ID) REFERENCES Regions (Region_ID)
);
-- Tourists Tablosu
CREATE TABLE Tourists (
    Tourist_ID INT PRIMARY KEY,
    First_Name VARCHAR(20) NOT NULL,
    Last_Name VARCHAR(40) NOT NULL,
    Gender VARCHAR(10),
    Birthdate DATE,
    Nationality VARCHAR(50),
    Country VARCHAR(50)
);
-- Guides Tablosu
CREATE TABLE Guides (
    Guide_ID INT PRIMARY KEY,
    First_Name VARCHAR(20) NOT NULL,
    Last_Name VARCHAR(40) NOT NULL,
    Gender VARCHAR(10),
    Phone_Number VARCHAR(15),
    Language VARCHAR(30) NOT NULL,
    All_Regions_Info BIT DEFAULT 1
);
-- Sales Tablosu
CREATE TABLE Sales (
    Sale_ID INT PRIMARY KEY,
    Tour_ID INT NOT NULL,
    Tourist_ID INT NOT NULL,
    Sale_Date DATE NOT NULL,
    Guide_ID INT,
    FOREIGN KEY (Tour_ID) REFERENCES Tours (Tour_ID),
    FOREIGN KEY (Tourist_ID) REFERENCES Tourists (Tourist_ID),
    FOREIGN KEY (Guide_ID) REFERENCES Guides (Guide_ID)
);
-- Invoices Tablosu
CREATE TABLE Invoices (
    Invoice_ID INT PRIMARY KEY,
    Invoice_Number VARCHAR(20) UNIQUE NOT NULL,
    Invoice_Date DATE NOT NULL,
    Tourist_ID INT NOT NULL,
    Total_Fee DECIMAL(10, 2) NOT NULL,
    FOREIGN KEY (Tourist_ID) REFERENCES Tourists (Tourist_ID)
);

-- BU AŞAMADA TABLOLARA VERİ GİRİŞİ YAPTIM
INSERT INTO Regions (Region_ID, Region_Name, Fee)
VALUES
(1,'Hagia Sophia Mosque', 50),
(2,'Grand Bazaar', 55),
(3,'Topkapi Palace', 20),
(4,'Saddlebag Island', 25),
(5,'Basilica Cistern',50),
(6,'Bosphorus',55),
(7,'Kebap', 100),
(8,'Blue Mosque', 25),
(9,'Galata Tower', 30),
(10,'Dolmabahçe Palace', 25)

INSERT INTO Tours (Tour_ID, Tour_Name, Tour_Fee) VALUES 
    (1, 'Historical Peninsula Tour'0),
    (2, 'Grand Bazaar Tour',0),
    (3, 'Architecture Tour',0),
	(4, 'Art and Museum Tour',0),
	(5, 'Princes Islands Tour',0),
	(6, 'Bosphorus Tour',0),
	(7, 'Culinary Tour',0),
	(8, 'Historical Peninsula Tour',0),
	(9, 'Architecture Tour',0),
	(10, 'Architecture Tour',0)

	INSERT INTO TourRegions (TourRegion_ID, Tour_ID, Region_ID, Fee) VALUES
 (1, 1, 1, 50),
 (2, 2, 2, 55),
 (3, 3, 3, 20),
 (4, 4, 4, 25),
 (5, 5, 5, 50),
 (6, 6, 6, 55),
 (7, 7, 7, 100),
 (8, 8, 8, 25),
 (9, 9, 9, 30),
 (10, 10, 10, 25);

 INSERT INTO Tourists (Tourist_ID, First_Name, Last_Name, Gender, Birthdate, Nationality, Country)
VALUES
    (1, 'Wesley',   'Fofana',  'Male',   '1989-12-17',  'Senegalese',   'France'),
    (2, 'Ibrahima', 'Konate',  'Male',   '1980-04-22',  'Senegalese',   'France'),
    (3, 'Kylian',   'Mbappe',  'Male',   '1971-08-07',  'Senegalese',   'France'),
    (4, 'Kahleah',  'Copper',  'Female', '1990-11-30',  'Cameroon',     'USA'),
    (5, 'Ezi',      'Magbegor','Female', '1970-03-25',  'UK',           'USA'),
    (6, 'Teaira',   'McCowan', 'Female', '1987-07-12',  'Turkey',       'USA'),
    (7, 'Adele',    'Gates',   'Female', '1957-12-10',  'China',        'China'),
    (8, 'Emmy',     'Hamill',  'Female', '1958-04-18',  'Italy',        'Italy'),
    (9, 'Abel',     'Williams','Male',   '1959-06-22',  'Italy',        'Italy'),
    (10,'Donald',   'Kane',    'Male',   '1960-02-05',  'UK',           'USA')







INSERT INTO Guides (Guide_ID, First_Name, Last_Name, Gender, Phone_Number, Language, All_Regions_Info)
VALUES
    (1, 'Harry', 'Beckham', 'Male', '552-223-1907', 'English', 1),
    (2, 'Elisabeth', 'Taylor', 'Female', '552-123-1907', 'Spanish', 1);






INSERT INTO Sales (Sale_ID, Tour_ID, Tourist_ID, Sale_Date, Guide_ID)
VALUES
    (1, (SELECT Tour_ID FROM Tours WHERE Tour_ID = 1), 3, '2023-09-01', 2),
    (2, (SELECT Tour_ID FROM Tours WHERE Tour_ID = 2), 4, '2023-09-02', 1),
    (3, (SELECT Tour_ID FROM Tours WHERE Tour_ID = 3), 5, '2023-09-03', 2),
    (4, (SELECT Tour_ID FROM Tours WHERE Tour_ID = 1), 6, '2023-09-04', 1),
    (5, (SELECT Tour_ID FROM Tours WHERE Tour_ID = 2), 7, '2023-09-05', 1),
    (6, (SELECT Tour_ID FROM Tours WHERE Tour_ID = 3), 8, '2023-09-06', 2),
    (7, (SELECT Tour_ID FROM Tours WHERE Tour_ID = 1), 9, '2023-09-07', 1),
    (8, (SELECT Tour_ID FROM Tours WHERE Tour_ID = 2), 10, '2023-09-08', 2),
    (9, (SELECT Tour_ID FROM Tours WHERE Tour_ID = 3), 1, '2023-09-09', 2),
    (10, (SELECT Tour_ID FROM Tours WHERE Tour_ID = 1), 2, '2023-09-10', 1);


INSERT INTO Invoices (Invoice_ID, Invoice_Number, Invoice_Date, Tourist_ID, Total_Fee)
VALUES
    (1, 'FTR20230729001', '2023-09-29', 1, 30),
    (2, 'FTR20230730002', '2023-09-30', 2, 25),
	(3, 'FTR20230730003', '2023-09-30', 3, 50),
	(4, 'FTR20230730004', '2023-09-30', 4, 75),
	(5, 'FTR20230730005', '2023-09-30', 5, 80),
	(6, 'FTR20230730006', '2023-09-30', 6, 40),
	(7, 'FTR20230730007', '2023-09-30', 7, 35),
	(8, 'FTR20230730008', '2023-09-30', 8, 55),
	(9, 'FTR20230730009', '2023-09-30', 9, 90),
	(10, 'FTR20230730010', '2023-09-30', 10, 100)




	-- Yeni Bölge Ekleme
INSERT INTO Regions (Region_ID, Region_Name, Fee) 
VALUES
(11,'Miniaturk',30)

-- Var Olan Bölgeyi Silme
DELETE FROM Regions WHERE Region_ID =11


-- Bölge Hizmet Ücreti Değiştirme
UPDATE TourRegions
SET Fee = 30
WHERE TourRegion_ID = 2

-- Satışı Yapılmamış Tur Üzerinde Değişiklik Yapma
UPDATE Tours 
SET Tour_Name= 'Art and Museum Tour', Tour_Fee = 100
WHERE Tour_ID = 10


--Satış yapılan turları ve turistleri listeleme sorgusu
SELECT t.Tour_Name , s.Sale_Date , turist.First_Name as TuristAdi, turist.Last_Name as TuristSoyadi
FROM Sales S
INNER JOIN Tours T ON S.Tour_ID = T.Tour_ID
INNER JOIN Tourists turist on s.Tourist_ID =turist.Tourist_ID


--Tur satışlarının toplam tutarı ve indirimli tutarı hesaplama sorgusu
SELECT s.Sale_ID, tr.Fee AS FaturaUcreti, turist.First_Name AS TuristAdi, turist.Last_Name AS TuristSoyadi,
       CASE
           WHEN DATEDIFF(YEAR, turist.Birthdate, GETDATE()) >= 60 THEN tr.Fee * 0.85 
           ELSE tr.Fee
       END AS IndirimliUcret
FROM Sales s
INNER JOIN TourRegions tr ON s.Tour_ID = tr.Tour_ID
INNER JOIN Tourists turist ON s.Tourist_ID = turist.Tourist_ID;


-- Turistlere Karşılık gelen Rehberler
SELECT g.First_Name AS RehberAdi, g.Last_Name AS RehberSoyadi,
       t.First_Name AS TuristAdi, t.Last_Name AS TuristSoyadi
FROM Guides g
JOIN Tourists t ON g.Guide_ID = t.Guide_ID;
