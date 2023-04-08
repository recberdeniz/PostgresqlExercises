create table sirket(id numeric(12) NOT NULL PRIMARY KEY,
				  adi VARCHAR(30),
				  sehir VARCHAR(20),
				  vergi_levha VARCHAR(30),
				  son_yil_ciro numeric(12));
create table bolum(id numeric(12) NOT NULL PRIMARY KEY,
				  bolum_adi VARCHAR(30),
				  arge_mi numeric(1),--1 arge , 0 degil
				  sirket_id numeric(12),
				  CONSTRAINT fk_sirket FOREIGN KEY (sirket_id) References sirket(id));
create table calisan(id numeric(12) NOT NULL PRIMARY KEY,
				  calisan_adi VARCHAR(30) NOT NULL,
				  calisan_soyadi VARCHAR(30) NOT NULL,
				  yasi numeric(3),
				  maasi numeric(10),
				  bolum_id numeric(12),
				  CONSTRAINT fk_bolum FOREIGN KEY (bolum_id) References bolum(id));


insert into sirket values(1,'XSOFT','ANKARA','FG87349JN34',122806453);
insert into sirket values(2,'ABCSOFT','ANKARA','KG87DE9JH64',56806400);
insert into sirket values(3,'HELIUM','ISTANBUL','KY87459JN33',1012806453);
insert into sirket values(4,'KANVAS','ISTANBUL','AG87349BF34',582806500);
insert into sirket values(5,'XTRA','IZMIR','ZZ87349HT55',872806113);

insert into bolum values(1,'ARGE',1,1);
insert into bolum values(2,'BILISIM',1,1);
insert into bolum values(3,'IK',0,1);
insert into bolum values(4,'ARGE',1,2);
insert into bolum values(5,'IK',0,2);
insert into bolum values(6,'DEVOPS',1,3);
insert into bolum values(7,'HUKUK',0,3);
insert into bolum values(8,'IK',0,3);
insert into bolum values(9,'ARGE',1,4);
insert into bolum values(10,'MUHASEBE',0,4);
insert into bolum values(11,'YAZILIM',1,5);

insert into calisan values(1,'ALI','AK',35,20000,1);
insert into calisan values(2,'ALP','AS',25,15000,1);
insert into calisan values(3,'BERK','OK',33,25000,1);
insert into calisan values(4,'ALI','AKAY',30,23000,2);
insert into calisan values(5,'AHMET','KARA',45,30000,2);
insert into calisan values(6,'ZEYNEP','ATA',31,20000,3);
insert into calisan values(7,'AYSE','OKU',34,21000,4);
insert into calisan values(8,'MUSTAFA','YAZ',25,20000,5);
insert into calisan values(9,'FURKAN','HAK',28,25000,4);
insert into calisan values(10,'BURAK','YAK',29,28000,6);
insert into calisan values(11,'FIKRET','KARA',39,30000,7);
insert into calisan values(12,'OSMAN','YAMAN',25,20000,8);
insert into calisan values(13,'MEHMET','TAS',24,21000,9);
insert into calisan values(14,'ALI','HAS',51,40000,10);
insert into calisan values(15,'VELI','YAZ',34,30000,11);
insert into calisan values(16,'MUSTAFA','BUL',52,41000,3);
insert into calisan values(17,'ALI','SANI',33,21000,5);
insert into calisan values(18,'BURAK','KANI',23,15000,6);
insert into calisan values(19,'YUSUF','HAK',35,24000,8);
insert into calisan values(20,'ENES','RENK',36,29000,9);
insert into calisan values(21,'BERKAN','KUTLU',55,30000,10);
--tum calisanlar içerisinde arge bolumunde(arge_mi) 
--calisan en yuksek maasli 5 kisinin adı, soyadı, maaşı 
--ve bölümün adını listeleyiniz
select * from bolum;
select * from calisan;
select c.calisan_adi, c.calisan_soyadi, c.maasi, b.bolum_adi from calisan c, bolum b
where b.arge_mi = 1 and  c.bolum_id = b.id order by c.maasi desc limit 5;

--ARGE adında bir bölümü olmayan sirketleri listeleyiniz.
select * from bolum;
select * from sirket;
select * from bolum where arge_mi = 0;
select * from sirket where id NOT IN (Select sirket_id
									 from bolum
									 where arge_mi = 1 and bolum_adi = 'ARGE');

--Ankara da çalışan en yüksek maaşlı calısan kimdir?

select * from calisan;
select * from sirket where sehir = 'ANKARA';
select c.*, s.adi from calisan c, sirket s where s.sehir = 'ANKARA'
order by c.maasi desc limit 1;

--50 yas ustu calisani olan ISTANBUL daki sirketlerin listesi(her kayıt 1 kere yazdırılmış olsun)
select distinct s.adi, c.* from sirket s, calisan c,
bolum b where s.sehir = 'ISTANBUL'
and c.yasi > 50 and b.id = c.bolum_id and s.id = b.sirket_id;

--vergi levhası K ile başlayan sirketlerin 
--arge bölümlerinin listesi; bölüm adı, sirket adı 
--ve vergi levhası bilgileri yazdırılarak sirket adına 
--göre azalan sırada(Z den A ya dogru) listelenmesi
select * from sirket where vergi_levha like 'K%';
select b.bolum_adi, s.adi, s.vergi_levha, c.calisan_adi, c.calisan_soyadi from 
bolum b, sirket s, calisan c where s.id = b.sirket_id and s.vergi_levha like 'K%'
and b.bolum_adi = 'ARGE' and c.bolum_id = b.id order by c.calisan_adi desc;

--yıllık cirosu 500.000.000 dan fazla olan sirketlerin arge bölümünde çalışanların listesi
select distinct s.adi from sirket s where s.son_yil_ciro > 500000000;
select distinct s.adi, s.son_yil_ciro, c.*, b.bolum_adi 
from sirket s, calisan c, bolum b where s.son_yil_ciro > 500000000 
and b.bolum_adi = 'ARGE' and b.id = c.bolum_id and s.id = b.sirket_id;

--yıllık cirosu 100.000.000 dan az olan sirketlerin arge bölümünde çalışan 30 yas altı calışanlar

select distinct s.adi, s.son_yil_ciro, c.*, b.bolum_adi
from sirket s, calisan c, bolum b where s.son_yil_ciro < 100000000
and b.bolum_adi = 'ARGE' and b.id = c.bolum_id and s.id = b.sirket_id
and c.yasi < 30;

--içerisinde birden fazla sirket olan sehirlerdeki sirketlerin bölümlerinin listesi
select b.bolum_adi, s.adi from bolum b, sirket s
where s.id = b.sirket_id and s.sehir IN(Select sehir from sirket group by sehir 
						   having count(*) > 1);
						   
--içerisinde sadece bir sirket bulunduran sehirlerdeki 
--sirketlerin 40 yas altı çalışanları
select c.* from bolum b, sirket s, calisan c
where s.id = b.sirket_id and c.bolum_id = b.id and c.yasi < 40 and s.sehir
IN(Select sehir from sirket group by sehir having count(*) < 2);

--maaşı 25000 den fazla olan ve 30 yas altı çalışanlar
select * from calisan;
select c.* from calisan c where c.maasi > 25000 and c.yasi<30;

--adı en cok olan çalışanların(aynı ada sahip) 
--içerinden en yüksek maaş alan calışanın bilgisi
select count(id), calisan_adi, maasi from calisan group by calisan_adi, maasi
order by count(*) desc limit 1;