-- IS NULL CONDITION

CREATE TABLE insanlar2
(
ssn char(9),
name varchar(50),  
adres varchar(50)
);

INSERT INTO insanlar2 VALUES(123456789, 'Ali Can', 'Istanbul');  
INSERT INTO insanlar2 VALUES(234567890, 'Veli Cem', 'Ankara');  
INSERT INTO insanlar2 VALUES(345678901, 'Mine Bulut', 'Izmir');  
INSERT INTO insanlar2 (ssn, adres) VALUES(456789012, 'Bursa'); 
INSERT INTO insanlar2 (ssn, adres) VALUES(567890123, 'Denizli');

select * from insanlar2

-- Name sutununda null olan değerleri listeleyelim

SELECT name FROM insanlar2 WHERE name 

--Insanlar tablosunda sadece null olmayan degerleri listeleyiniz
SELECT name FROM insanlar2 WHERE name IS NOT NULL

--Insanlar toblasinda null deger almis verileri no name olarak degistiriniz
UPDATE insnalar
SET name ='No Name'
WHERE name is null;


