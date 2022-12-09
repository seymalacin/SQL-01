--ALIASES--
CREATE TABLE calisanlar3
(
calisan_id char(9),
calisan_isim varchar(50),
calisan_dogdugu_sehir varchar(50)
);
INSERT INTO calisanlar3 VALUES(123456789, 'Ali Can', 'Istanbul');  
INSERT INTO calisanlar3 VALUES(234567890, 'Veli Cem', 'Ankara');  
INSERT INTO calisanlar3 VALUES(345678901, 'Mine Bulut', 'Izmir');

select * from calisanlar3

SELECT calisan_id AS id FROM calisanlar3

-- Eğer iki sutunun verilerini birleştirmek istersek concat sembolu || kullanırız
SELECT calisan_id AS id, calisan_isim||' '||calisan_dogdugu_sehir AS calisan_bilgisi FROM calisanlar3

--2. YOl
SELECT calisan_id AS id, concat (calisan_isim,' ',calisan_dogdugu_sehir) AS calisan_bilgisi FROM calisanlar3




