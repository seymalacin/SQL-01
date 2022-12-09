-- ORDER BY KOMUTU
/*
Tablolardaki verileri sıralamak için ORDER BY komutu kullanırız
Büyükten küçüğe yada küçükten büyüğe sıralama yapabiliriz
Default olarak küçükten büyüğe sıralama yapar (ASC)
Eğer BÜYÜKTEN KÜÇÜĞE sıralmak istersek ORDER BY komutundan sonra DESC komutunu kullanırız
*/

CREATE TABLE insanlar3
(
ssn char(9),
isim varchar(50),
soyisim varchar(50),  
adres varchar(50)
);

INSERT INTO insanlar3 VALUES(123456789, 'Ali','Can', 'Istanbul');
INSERT INTO insanlar3 VALUES(234567890, 'Veli','Cem', 'Ankara');  
INSERT INTO insanlar3 VALUES(345678901, 'Mine','Bulut', 'Ankara');  
INSERT INTO insanlar3 VALUES(256789012, 'Mahmut','Bulut', 'Istanbul'); 
INSERT INTO insanlar3 VALUES (344678901, 'Mine','Yasa', 'Ankara');  
INSERT INTO insanlar3 VALUES (345678901, 'Veli','Yilmaz', 'Istanbul');

select * from insanlar3

--Insanlar tablosundaki datalari adres’e gore siralayin  
SELECT * FROM insanlar3 ORDER BY adres;

SELECT * FROM insanlar3 ORDER BY soyisim;

--Insanlar tablosundaki ismi Mine olanlari SSN sirali olarak listeleyin
SELECT * FROM insanlar3 WHERE isim='Mine' ORDER BY ssn

--NOT : Order By komutundan sonra field(sutun) ismi yerine field(sutun) numarasi da kullanilabilir
--Insanlar tablosundaki soyismi Bulut olanlari isim sirali olarak listeleyin 
SELECT * FROM insanlar3 WHERE soyisim='Bulut' ORDER BY 2

-- Insanlar tablosundaki tum kayitlari SSN numarasi buyukten kucuge olarak siralayin
SELECT * FROM insanlar3 ORDER BY ssn DESC;

-- Insanlar tablosundaki tum kayitlari isimler Natural sirali, Soyisimler ters sirali olarak listeleyin
SELECT * FROM insanlar3 ORDER BY isim ASC, soyisim DESC;

-- İsim ve soyisim değerlerini soyisim kelime uzunluklarına göre sıralayınız
/*
Eğer sutun uzunluğuna göre sıralamak istersek LENGTH komutu kullanırız 
Ve yine uzunluğu büyükten küçüğe sıralamak istersek sonuna DESC komutunu ekleriz
*/
SELECT isim,soyisim FROM insanlar3 ORDER BY LENGTH (soyisim) DESC;

-- Tüm isim ve soyisim değerlerini aynı sutunda çağırarak her bir sütun değerini uzunluğuna göre sıralayınız
--1.yol
SELECT isim||' '||soyisim AS isim_soyisim FROM insanlar3 ORDER BY LENGTH(isim||soyisim)
--2.yol
SELECT isim||' '||soyisim AS isim_soyisim FROM insanlar3 ORDER BY LENGTH (isim)+LENGTH (soyisim)
--3.yol
SELECT CONCAT(isim,' ',soyisim) AS isim_soyisim FROM insanlar3 ORDER BY LENGTH (isim)+LENGTH (soyisim)
--4.yol
SELECT CONCAT(isim,' ',soyisim) AS isim_soyisim FROM insanlar3 ORDER BY LENGTH (concat(isim,soyisim))

