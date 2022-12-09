-- HAVING KULLANIMI

/*
Having komutu yanlızca group by komutu ile kullanılır. 
Eğer gruplamadan sonra bir şart varsa having komutu kullanılır
Where kullanımı ile aynı mantıkta çalışır
*/

-- 1) Her sirketin MIN	maaslarini eger 4000’den buyukse goster
SELECT * FROM personel

SELECT sirket,min(maas) as en_dusuk_maas FROM personel
GROUP BY sirket
HAVING min(maas)>4000

-- Ayni isimdeki kisilerin aldigi toplam gelir 10000 liradan fazla ise ismi  ve toplam maasi gosteren sorgu yaziniz

SELECT isim,sum(maas) as toplam_maas FROM personel
GROUP BY isim
HAVING sum(maas)>10000

-- Eger bir sehirde calisan personel sayisi 1’den coksa sehir ismini ve personel sayisini veren sorgu yaziniz

SELECT sehir,count(isim) as toplam_personel_sayisi FROM personel
GROUP BY sehir
HAVING count(isim)>1

-- Eger bir sehirde alinan MAX maas 5000’den dusukse sehir ismini ve MAX maasi veren sorgu yaziniz

SELECT sehir,max(maas) as en_yuksek_maas FROM personel
GROUP BY sehir
HAVING max(maas)<5000
