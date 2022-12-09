CREATE TABLE ogrenciler4
(
id int,
isim VARCHAR(50),
veli_isim VARCHAR(50),
yazili_notu int       
);
INSERT INTO ogrenciler4 VALUES(123, 'Ali Can', 'Hasan',75);
INSERT INTO ogrenciler4 VALUES(124, 'Merve Gul', 'Ayse',85);
INSERT INTO ogrenciler4 VALUES(125, 'Kemal Yasa', 'Hasan',85);
INSERT INTO ogrenciler4 VALUES(126, 'Nesibe Yilmaz', 'Ayse',95);
INSERT INTO ogrenciler4 VALUES(127, 'Mustafa Bak', 'Can',99);
INSERT INTO ogrenciler4 VALUES(127, 'Mustafa Bak', 'Ali', 99);

select * from ogrenciler4

--İsmi Mustafa Bak ve Nesibe Yılmaz olan kayıtları silelim
DELETE FROM ogrenciler4 WHERE isim ='Mustafa Bak' or isim = 'Nesibe Yılmaz';

--Veli ismi datayi silelim
DELETE FROM ogrenciler4 WHERE veli_isim= 'Hasan';

--TRUNCATE--
--Bir tablodaki tum verileri geri alamayacagimiz sekilde siler. Şartlı silme yapmaz
TRUNCATE TABLE ogrenciler4--table'yi yazmasak da silme isllemi olur

--ON DELETE CASCADE
DROP TABLE exists  adresler--Eger tablo varsa tabloyu siler
CREATE TABLE talebe
(
id CHAR(3) primary key,  
isim VARCHAR(50),
veli_isim VARCHAR(50),
yazili_notu int
);

CREATE TABLE notlar1( 
talebe_id char(3),
ders_adi varchar(30),
yazili_notu int,
CONSTRAINT notlar_fk FOREIGN KEY (talebe_id) REFERENCES talebe(id)
on delete cascade
);

INSERT INTO talebe VALUES(123, 'Ali Can', 'Hasan',75);
INSERT INTO talebe VALUES(124, 'Merve Gul', 'Ayse',85);
INSERT INTO talebe VALUES(125, 'Kemal Yasa', 'Hasan',85);
INSERT INTO talebe VALUES(126, 'Nesibe Yılmaz', 'Ayse',95);
INSERT INTO talebe VALUES(127, 'Mustafa Bak', 'Can',99);

INSERT INTO notlar1 VALUES ('123','kimya',75);
INSERT INTO notlar1 VALUES ('124', 'fizik',65);
INSERT INTO notlar1 VALUES ('125', 'tarih',90);
INSERT INTO notlar1 VALUES ('126', 'Matematik',90);

SELECT * FROM talebe;
SELECT *FROM  notlar1;

--Notlar tablosundan id'si 123 olan datayı silelim
DELETE FROM notlar1 WHERE talebe_id='123';

-- Talebeler tablosundan id'si 126 olan datayı silelim
DELETE FROM talebe WHERE id='126'

CREATE TABLE talebe1
(
id CHAR(3) primary key,  
isim VARCHAR(50),
veli_isim VARCHAR(50),
yazili_notu int
);

CREATE TABLE notlar2( 
talebe_id char(3),
ders_adi varchar(30),
yazili_notu int,
CONSTRAINT notlar_fk FOREIGN KEY (talebe_id) REFERENCES talebe(id)
on delete cascade
);

INSERT INTO talebe1 VALUES(123, 'Ali Can', 'Hasan',75);
INSERT INTO talebe1 VALUES(124, 'Merve Gul', 'Ayse',85);
INSERT INTO talebe1 VALUES(125, 'Kemal Yasa', 'Hasan',85);
INSERT INTO talebe1 VALUES(126, 'Nesibe Yılmaz', 'Ayse',95);
INSERT INTO talebe1 VALUES(127, 'Mustafa Bak', 'Can',99);

INSERT INTO notlar2 VALUES ('123','kimya',75);
INSERT INTO notlar2 VALUES ('124', 'fizik',65);
INSERT INTO notlar2 VALUES ('125', 'tarih',90);
INSERT INTO notlar2 VALUES ('126', 'Matematik',90);

select * from talebe1
select * from notlar2

/*
    Her defasında önce child tablodaki verileri silmek yerine ON DELETE CASCADE silme özelliği ile
parent tablo dan da veri silebiliriz. Yanlız ON DELETE CASCADE komutu kullanımında parent tablodan sildiğimiz
data child tablo dan da silinir
*/


