CREATE TABLE film
(
id int ,
title VARCHAR(50),
type VARCHAR(50),
length int
);

INSERT INTO film VALUES (1, 'Kuzuların Sessizliği', 'Korku',130);
INSERT INTO film VALUES (2, 'Esaretin Bedeli', 'Macera', 125);
INSERT INTO film VALUES (3, 'Kısa Film', 'Macera',40);
INSERT INTO film VALUES (4, 'Shrek', 'Animasyon',85);

CREATE TABLE actor
(
id int ,
isim VARCHAR(50),
soyisim VARCHAR(50)
);
INSERT INTO actor VALUES (1, 'Christian', 'Bale');
INSERT INTO actor VALUES (2, 'Kevin', 'Spacey');
INSERT INTO actor VALUES (3, 'Edward', 'Norton');

do $$

declare
  film_count integer :=0;
  
begin
  select count (*) -- kac tane film varsa sayısını getirir
  into film_count  -- Query den gelen neticeyi film_count isimli degıskene atar
  from film;  -- tabloyu seciyorum
  
  raise notice 'The number of films is %', film_count; -- % ,sareti yer tutucu olarak kullanılıyor

end  $$ ;

------------- VERİABLES - CONTAİNS----------
DO $$ 
DECLARE 
  counter  integer :=1;
  first_name  varchar(50) := 'Jhon';
  last_name  varchar(50) := 'Done';
  payment  numeric(4,2) :=20.5;
  
begin 
  raise notice '% % % has been paid % USD',
               counter,
			   first_name,
			   last_name,
			   payment;
end $$;			   

-- Task 1 : değişkenler oluşturarak ekrana " Ahmet ve Mehmet beyler 120 tl ye bilet aldılar. "" cümlesini ekrana basınız
do $$
declare
	first_person	varchar(50)	:= 'Ahmet';
	second_person 	varchar(50) := 'Mehmet';
	payment			numeric(3)	:= 120;
begin
	raise notice '% ve % beyler % tl ye bilet aldılar',
				first_person,
				second_person,
				payment;
end $$;

---------------BEKLEME KOMUTU--------------------------------

DO $$
DECLARE
  created_at  time := now();
begin 
   raise notice '%', created_at;
   perform pg_sleep(10); --- 10 sanıye beklenıyor
   raise notice '%', created_at;  ---cıktıda aynı deger goruncek
end $$;   
  
--------- TABLODAN DATA TİPİNİ KOPYALAMA---------------
   
   /*
		-> variable_name  table_name.column_name%type;
		->( Tablodaki datanın aynı data türünde variable oluşturmaya yarıyor)
	*/
do $$
declare
	film_title film.title%type;  -- varchar;
begin
	-- 1 id li filmin ismini getirelim
	select title
	from film
	into film_title  -- film_title = 'Kuzuların Sessizliği'
	where id=1;
	
	raise notice 'Film title id 1 : %' , film_title;
end $$ ;
	


