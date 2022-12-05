--DATABASE(Veri Tabani)Olusturma
Create Database evren;

create database erol;

--DDL -DATA DEFINITION LANG.
--CREATE -TABLO OLUSTURMA
CREATE TABLE ogrenciler2
(
ogrenci_no char(7),
	isim varchar(20),
	soyisim varchar(25),
	not_ort real,--ondalikli sayilar icin kullanilir (double gibi)
	kayit_tarih date

);

--VAROLAN TABLODAN YENİ BİR TABLO OLUSTURMA
CREATE TABLE ogrenci_notlari
AS-- benzer tablodaki başlıklarla ve data tipleriyle yeni bir tablo olusturmak icin
--parantezler yerine AS kullanip select komutuylaalmak istedigimiz verileri alairiz
SELECT isim,soyisim,not_ort From ogrenciler2;

--DML - DATA MANUPULATION LANG.
--INSERT(Database'e veri ekleme)

INSERT INTO ogrenciler2 VALUES('1234567','Seyma','Lacin',85.5,now());
INSERT INTO ogrenciler2 VALUES('1234567','Seyma','Lacin',85.5,'2020-12-11');

--BIR TABLOYA PARÇALI VERİ EKLEMEK İSTERSEK

INSERT INTO ogrenciler2 (isim,soyisim) VALUES ('Erol','Evren');

--DQL - DATA QUERY LANG.
--SELECT

select * FROM ogrenciler2;-- Burdaki * sembolu hersey anlamindadır



