--IN CONDITION

DROP TABLE if exists musteriler
 
CREATE TABLE musteriler  (
urun_id int,  
musteri_isim varchar(50), 
urun_isim varchar(50)
);
INSERT INTO musteriler VALUES (10, 'Mark', 'Orange');  
INSERT INTO musteriler VALUES (10, 'Mark', 'Orange');  
INSERT INTO musteriler VALUES (20, 'John', 'Apple');  
INSERT INTO musteriler VALUES (30, 'Amy', 'Palm');  
INSERT INTO musteriler VALUES (20, 'Mark', 'Apple');  
INSERT INTO musteriler VALUES (10, 'Adem', 'Orange');  
INSERT INTO musteriler VALUES (40, 'John', 'Apricot');  
INSERT INTO musteriler VALUES (20, 'Eddie', 'Apple');
 
SELECT * FROM musteriler

--Musteriler tablosundan urun ismi orange, apple ve aprictor olan verileri listeleyiniz
SELECT * FROM musteriler WHERE urun_isim ='Orange' OR urun_isim = 'Apple' OR urun_isim = 'Aprictor';

SELECT * FROM musteriler WHERE urun_isim ='Orange' and urun_id=10

--IN CONDİNATİON 
SELECT * FROM musteriler WHERE urun_isim IN ('Orange','Apple','Apricot');

-- NOT IN --> Yazdığımız verilerin dışındakileri getirir
SELECT * FROM musteriler WHERE urun_isim NOT IN ('Orange','Apple','Apricot');

--BETWEEN CONDITION

--Musteriler tablosundan id'si 20 ile 40 arasında olan tum verileri listeleyiniz
SELECT *FROM musteriler WHERE urun_id>=20 and urun_id<=40;

SELECT *FROM musteriler WHERE urun_id BETWEEN 20 and 40;--BETWEEN ile yapimi








