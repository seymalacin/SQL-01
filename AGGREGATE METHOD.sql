--AGGREGATE METHOD

--Calisanlar tablosunda maksimum maası listeleyiniz
SELECT max(maas) FROM calisanlar2
SELECT max(maas) AS maksimum_maas FROM calisanlar2;

/*
    Eğer bir sütuna geçici olarak bir isim vermek istersek AS komutunu yazdıktan sonra vermek
istediğimiz ismi yazarız
*/

--Calisanlar tablosundaki minumum maası listeleyelim

SELECT min(maas) AS en_dusuk_maas FROM calisanlar2

--Caisanlar tablosundaki maas'larin toplamini listeleyin
SELECT sum(maas) FROM calisanlar2

--Caisanlar tablosundaki maas'larin ortalamasini listeleyin
SELECT avg(maas) FROM calisanlar2
SELECT round(avg(maas),2) FROM calisanlar2

--Caisanlar tablosundaki maas'larin sayisini listeleyin
SELECT count(*) FROM calisanlar2

/*
Eger count(*) kullanirsak tablodaki tum satirların sayısını verır 
stun adı kullanırsak o stundaki sayıarı verır
*/
SELECT count(maas)AS maas_sayısı FROM calisanlar2

--AGGREGATE METHODLARDA SUBQUERY

-- Her markanin id’sini, ismini ve toplam kaç şehirde 
-- bulunduğunu listeleyen bir SORGU yaziniz

SELECT marka_id,marka_isim,(SELECT count(sehir) FROM calisanlar2 WHERE marka_isim=isyeri) FROM markalar;

--  Her markanin ismini, calisan sayisini ve o markaya ait calisanlarin 
--  toplam maaşini listeleyiniz
CREATE view summaas
as
SELECT marka_isim,calisan_sayisi,(SELECT sum(maas)FROM calisanlar2 WHERE isyeri=marka_isim) FROM markalar

SELECT * FROM summaas
-- Her markanin ismini, calisan sayisini ve o markaya ait calisanlarin 
-- maksimum ve minumum maaşini listeleyen bir Sorgu yaziniz.

SELECT marka_isim,calisan_sayisi,
(SELECT max(maas) FROM calisanlar2 WHERE isyeri=marka_isim) as enyuksekmaas,
(SELECT min(maas) FROM calisanlar2 WHERE isyeri=marka_isim) as endusukmaas
From markalar

-- VIEW Kullanımı
/*
Yaptığımız sorguları hafızaya alır ve tekrar bizden istenen sorgulama yenine
view'e atadığımız ismi SELECT komutuyla çağırırız
*/
CREATE VIEW maxminmaas
AS
SELECT marka_isim,calisan_sayisi,
(SELECT max(maas) FROM calisanlar2 WHERE isyeri=marka_isim) as enyuksekmaas,
(SELECT min(maas) FROM calisanlar2 WHERE isyeri=marka_isim) as endusukmaas
From markalar;

SELECT * FROM maxminmaas;
SELECT * FROM summaas;
























