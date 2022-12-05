CREATE TABLE ogrenciler5
(
ogrenci_no char(7),-- Uzunlugunu bildigimiz strinkler icin Char kullanillir
	isim varchar(20),--Uzunlugunu bılmedigimziz setringler icin Varcahar kullanilir
	soyisim varchar(25),
	not_ort real,--ondalikli sayilar icin kullanilir (double gibi)
	kayit_tarih date

);
--VAR OLAN BİT TABLODAN YENİ BİR TABLO OLUSTURMA
CREATE TABLE NOTLAR
AS
SELECT isim,not_ort FROM ogrenciler5;

select * from notlar;

--TABLO İÇİNE VERİ EKLEME

INSERT INTO notlar VALUES ('Seyma',99.9);
INSERT INTO notlar VALUES ('Nur',99.8);
INSERT INTO notlar VALUES ('Lacin',99.5);

Create table talebeler
(
isim varchar(4),
notlar real

);
INSERT INTO notlar VALUES ('Seyma',99.9);
INSERT INTO notlar VALUES ('Nur',99.8);
INSERT INTO notlar VALUES ('Lacin',99.5);

select isim from notlar;

--CONSTRAINT
--UNIQUE
CREATE TABLE ogrenciler7
(
ogrenci_no char(7) unique,
	isim varchar(20)NOT NULL,
	soyisim varchar(25),
	not_ort real,
	kayit_tarih date
);
select * from ogrenciler7;
INSERT INTO ogrenciler7 VALUES ('1234567','ALİ','Veli',95.7,now());
INSERT INTO ogrenciler7 VALUES ('1234568','Azra','Eliz',95.7,now());
--PARCALİ VERİ EKLEME
INSERT INTO ogrenciler7 (ogrenci_no,soyisim,not_ort) VALUES ('1234569','EVREN',85.6)--NOT NULL kısıtlamasi oldugu ıcın bu veri eklenemez

--PRIMARY KEY ATAMASI

CREATE TABLE ogrenciler8
(
ogrenci_no char(7) PRIMARY KEY,
	isim varchar(20),
	soyisim varchar(25),
	not_ort real,
	kayit_tarih date
);

--PRIMARY KEY atamasi 2. yol
--Eger CONSTRAINT ismini kendimiz vermek istersek bu yolu kullanabiliriz

CREATE TABLE ogrenciler9
(
ogrenci_no char(7),
	isim varchar(20),
	soyisim varchar(25),
	not_ort real,
	kayit_tarih date,
	CONSTRAINT ogr PRIMARY KEY (ogrenci_no)
	
);


CREATE TABLE ogrenciler10
(
ogrenci_no char(7),
	isim varchar(20),
	soyisim varchar(25),
	not_ort real,
	kayit_tarih date,
	PRIMARY KEY (ogrenci_no)
	
);

--FOREIGN KEY 

/*

“tedarikciler3” isimli bir tablo olusturun. Tabloda “tedarikci_id”, “tedarikci_ismi”,  
“iletisim_isim” field’lari olsun ve “tedarikci_id” yi Primary Key yapin.
“urunler” isminde baska bir tablo olusturun “tedarikci_id” ve “urun_id” field’lari olsun ve
“tedarikci_id” yi Foreign Key yapin.
*/

CREATE TABLE tedarikciler3
(
tedarikci_id char(5) PRIMARY KEY,
tedarikci_ismi varchar(20),
iletisim_isim varchar(20)    
);
CREATE TABLE urunler
(
tedarikci_id char(5),
urun_id char(5),
FOREIGN KEY (tedarikci_id) REFERENCES tedarikciler3(tedarikci_id)  
);
CREATE TABLE urunler2
(
tedarikci_id char(5),
urun_id char(5),
CONSTRAINT urn_fk FOREIGN KEY (tedarikci_id) REFERENCES tedarikciler3(tedarikci_id)  
);
select*from tedarikciler3 ;
select*from urunler;


/*
“calisanlar” isimli bir Tablo olusturun. Icinde “id”, “isim”, “maas”, “ise_baslama”  
field’lari olsun. “id” yi Primary Key yapin, “isim” i Unique, “maas” i Not Null yapın. 
“adresler” isminde baska bir tablo olusturun.Icinde “adres_id”, “sokak”, “cadde” ve 
“sehir” fieldlari olsun.  “adres_id” field‘i ile Foreign Key oluşturun.
*/

CREATE TABLE calisanlar 
(
	id char(5) PRIMARY KEY,
	isim varchar(20)UNIQUE,
	maas int NOT NULL,
	ise_baslama date 
);

CREATE TABLE adresler
(
	adres_id char(5),
	sokak varchar (15),
	cadde varchar (15),
	sehir varchar(15),
	FOREIGN KEY (adres_id) REFEReNCES calisanlar(id)
);
INSERT INTO calisanlar VALUES('10002', 'Mehmet Yılmaz' ,12000, '2018-04-14'); 
INSERT INTO calisanlar VALUES('10008', null, 5000, '2018-04-14');
--INSERT INTO calisanlar VALUES('10010', 'Mehmet Yılmaz', 5000, '2018-04-14'); -- UNIQUE CONS. Kabul etmez
INSERT INTO calisanlar VALUES('10004', 'Veli Han', 5000, '2018-04-14');
INSERT INTO calisanlar VALUES('10005', 'Mustafa Ali', 5000, '2018-04-14');
--INSERT INTO calisanlar VALUES('10006', 'Canan Yaş', NULL, '2019-04-12'); -- NOT NULL CONS. Kabul etmez
INSERT INTO calisanlar VALUES('10003', 'CAN', 5000, '2018-04-14');
--INSERT INTO calisanlar VALUES('10007', 'CAN', 5000, '2018-04-14'); -- UNIQUE CONS. Kabul etmez
--INSERT INTO calisanlar VALUES('10009', 'cem', '', '2018-04-14'); -- INT / STRING
INSERT INTO calisanlar VALUES('', 'osman', 2000, '2018-04-14');
--INSERT INTO calisanlar VALUES('', 'osman can', 2000, '2018-04-14'); -- PRIMARY KEY
--INSERT INTO calisanlar VALUES( '10002', 'ayse Yılmaz' ,12000, '2018-04-14'); -- PRIMARY KEY 
--INSERT INTO calisanlar VALUES( null, 'filiz ' ,12000, '2018-04-14'); -- PRIMARY KEY


INSERT INTO adresler VALUES('10003','Mutlu Sok', '40.Cad.','IST');
INSERT INTO adresler VALUES('10003','Can Sok', '50.Cad.','Ankara');
INSERT INTO adresler VALUES('10002','Ağa Sok', '30.Cad.','Antep');
-- Parent tabloda olmayan id ile child a ekleme yapamayiz
INSERT INTO adresler VALUES('10012','Ağa Sok', '30.Cad.','Antep');
   
-- FK'ye null değeri atanabilir.
INSERT INTO adresler VALUES(NULL,'Ağa Sok', '30.Cad.','Antep');
INSERT INTO adresler VALUES(NULL,'Ağa Sok', '30.Cad.','Maraş');

SELECT * FROM calisanlar;
SELECT * FROM adresler;


CREATE TABLE calisanlar1 
(
	id char(5) PRIMARY KEY,
	isim varchar(20)UNIQUE,
	maas int CHECK (maas>10000),
	ise_baslama date 
);
INSERT INTO calisanlar1 VALUES('10002', 'Mehmet Yılmaz' ,19000, '2018-04-14'); 
SELECT* FROM calisanlar1

--DQL --WHERE KULLANIMI

SELECT * FROM calisanlar;
SELECT isim FROM calisanlar;

--Calşsanlar tablosundan maası 5000 den buyuk olan isimleri listeleyiniz
SELECT isim FROM calisanlar WHERE maas>5000; 

--Calisanlar tablosundan ismi Veli Han olan tum verileri listeleyiniz
SELECT * FROM calisanlar Where isim='Veli Han';

--Calisanlar tablosundan maasi 5000 olan tum verileri listeleyiniz
SELECT * FROM calisanlar WHERE maas=5000;

--DML --DELETE KOMUTU
DELETE FROM calisanlar;-- eger parent table baska bır child tablo ile iliskili ise önce child tablo silinmelidir
DELETE FROM adresler;

SELECT * FROM adresler;



--Adresler tablosundan sehri Antep olan verileri silelim

DELETE FROM adresler WHERE sehir = 'Antep';

CREATE TABLE ogrenciler3
(
id int,
isim VARCHAR(50),
veli_isim VARCHAR(50),
yazili_notu int       
);
INSERT INTO ogrenciler3 VALUES(123, 'Ali Can', 'Hasan',75);
INSERT INTO ogrenciler3 VALUES(124, 'Merve Gul', 'Ayse',85);
INSERT INTO ogrenciler3 VALUES(125, 'Kemal Yasa', 'Hasan',85);
INSERT INTO ogrenciler3 VALUES(126, 'Nesibe Yilmaz', 'Ayse',95);
INSERT INTO ogrenciler3 VALUES(127, 'Mustafa Bak', 'Can',99);
INSERT INTO ogrenciler3 VALUES(127, 'Mustafa Bak', 'Ali', 99);
