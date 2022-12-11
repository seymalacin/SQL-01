--LIKE CONDITION

drop table musteriler

CREATE TABLE musteriler  (
id int UNIQUE,
isim varchar(50) NOT NULL,
gelir int
);

INSERT INTO musteriler (id, isim, gelir) VALUES (1001, 'Ali', 62000);  
INSERT INTO musteriler (id, isim, gelir) VALUES (1002, 'Ayse', 57500);  
INSERT INTO musteriler (id, isim, gelir) VALUES (1003, 'Feride', 71000);
INSERT INTO musteriler (id, isim, gelir) VALUES (1004, 'Fatma', 42000);  
INSERT INTO musteriler (id, isim, gelir) VALUES (1005, 'Kasim', 44000);
INSERT INTO musteriler (id, isim, gelir) VALUES (1006, 'ahmet', 82000);
INSERT INTO musteriler (id, isim, gelir) VALUES (1007, 'erhan', 92000);

-- Ismi A harfi ile baslayan musterilerin tum bilgilerini yazdiran QUERY yazin

/*
LIKE kullanımında büyük küçük harf gözetmeksizin sonuç almak istersek ILIKE kullanırız
LIKE yerine ~~ sembollerini kullanabiliriz. Eğer büyük küçük harf gözetmeksizin kullanmak istersek ~~* sembollerini kullanırız
*/
SELECT * FROM musteriler WHERE isim LIKE 'A%'
SELECT * FROM musteriler WHERE isim ~~* 'A%'

--Ismi e harfi ile biten musterilerin isimlerini ve gelir’lerini yazdiran QUERY yazin
SELECT isim,gelir FROM musteriler WHERE isim ~~ '%e'

--Isminin icinde er olan musterilerin isimlerini ve gelir’lerini yazdiran QUERY yazin
SELECT isim,gelir FROM musteriler WHERE isim like '%er%'

--Ismi 5 harfli olup son 4 harfi atma olan musterilerin tum bilgilerini yazdiran QUERY yazin
SELECT * FROM musteriler WHERE isim ~~ '_atma'

--Ikinci harfi a olan musterilerin tum bilgilerini yazdiran QUERY yazin
SELECT * FROM musteriler WHERE isim like '_a%'

--Ucuncu harfi s olan musterilerin tum bilgilerini yazdiran QUERY yazin
SELECT * FROM musteriler WHERE isim ~~ '__s%'



