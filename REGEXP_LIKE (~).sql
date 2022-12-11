-- REGEXP_LIKE (~) KULLANIMI

CREATE TABLE kelimeler  (
id int UNIQUE,
kelime varchar(50) NOT NULL,  Harf_sayisi int
);

INSERT INTO kelimeler VALUES (1001, 'hot', 3);  
INSERT INTO kelimeler VALUES (1002, 'hat', 3);  
INSERT INTO kelimeler VALUES (1003, 'hit', 3);  
INSERT INTO kelimeler VALUES (1004, 'hbt', 3);  
INSERT INTO kelimeler VALUES (1008, 'hct', 3);  
INSERT INTO kelimeler VALUES (1005, 'adem', 4);  
INSERT INTO kelimeler VALUES (1006, 'selim', 5);  
INSERT INTO kelimeler VALUES (1007, 'yusuf', 5);
INSERT INTO kelimeler VALUES (1009, 'hAt', 5); 

-- SORU : Ilk harfi h,son harfi t olup 2.harfi a veya i olan 3 harfli kelimelerin tum bilgilerini  yazdiran
-- QUERY yazin
SELECT * FROM kelimeler WHERE kelime ~* 'h[ai]t'

-- SORU : Ilk harfi h,son harfi t olup 2.harfi a ile k arasinda olan 3 harfli kelimelerin  tum bilgilerini  yazdiran 
-- QUERY yazin
SELECT * FROM kelimeler WHERE kelime ~* 'h[a-k]t'

-- SORU : a veya s ile baslayan kelimelerin tum bilgilerini yazdiran QUERY yazin
SELECT * FROM kelimeler WHERE kelime ~* '^[as]'

-- SORU : m veya f ile biten kelimelerin tum bilgilerini yazdiran QUERY yazin
SELECT * FROM kelimeler WHERE kelime ~* '[mf]$'

-- UPPER – LOWER - INITCAP

-- Kelimeler tablosundaki kelime sutunundaki verileri önce hepsi büyük harf, sonra küçük harf ve ilk harfleri 
-- büyük harf olucak şekilde yazdıralım
SELECT UPPER(kelime) as büyükkelime FROM kelimeler
SELECT LOWER(kelime) as kelime FROM kelimeler
SELECT INITCAP(kelime) as kelime FROM kelimeler -- INITCAP istediğimiz sutundaki verilerin ilk harfini büyük yazar

-- Musteriler tablosundan bütün isimleri büyük harf yapınız
SELECT UPPER(isim) FROM musteriler

/*
Eğer birden fazla sütundaki verileri büyük küçük harf yapmak istersek
select lower(title),UPPER(isim) from personel şekilde yapabiliriz
*/
select lower(title),UPPER(isim) from personel4
