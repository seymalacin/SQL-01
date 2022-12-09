-- INTERSECT (Kesişim)

/*
Farkli iki tablodaki ortak verileri INTERSECT komutu ile getirebiliriz
*/
--Personel tablosundan Istanbul veya Ankara’da calisanlarin id’lerini yazdir
--Personel_bilgi tablosundan 2 veya 3 cocugu olanlarin id lerini yazdirin

SELECT id FROM personel WHERE sehir IN ('Istanbul','Ankara')
INTERSECT
SELECT id FROM personel_bilgi WHERE cocuk_sayisi IN (2,3)

select * from personel

--Honda,Ford ve Tofas’ta calisan ortak isimde personel varsa listeleyin

SELECT isim FROM personel WHERE sirket='Honda'
INTERSECT

SELECT isim FROM personel WHERE sirket='Ford'
INTERSECT

SELECT isim FROM personel WHERE sirket='Tofas'
