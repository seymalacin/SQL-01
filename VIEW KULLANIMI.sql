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

