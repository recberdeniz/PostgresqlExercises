-- KANAL TABLOSU OLUŞTURMA
CREATE TABLE kanal (id numeric(12) NOT NULL PRIMARY KEY,
				   kanal_adi varchar(30),
				   frekans numeric(12),
				   ucretli_mi numeric(1));

-- PROGRAM TABLOSU OLUŞTURMA				   
CREATE TABLE program (id numeric(12) NOT NULL PRIMARY KEY,
					 program_adi varchar(50),
					 program_konu varchar(50),
					 kanal_id numeric(12),
					 CONSTRAINT fk_kanal FOREIGN KEY (kanal_id)
					 REFERENCES kanal(id));

-- OYUNCU TABLOSU OLUŞTURMA
CREATE TABLE oyuncu (id numeric(12) NOT NULL PRIMARY KEY,
					oyuncu_adi varchar(30),
					oyuncu_soyadi varchar(30),
					yasi numeric(12));

-- PROGRAM_OYUNCU TABLOSU OLUŞTURMA
CREATE TABLE program_oyuncu (id numeric(12) NOT NULL PRIMARY KEY,
							oyuncu_id numeric(12),
							program_id numeric(12),
							daimi_mi numeric(1),
							CONSTRAINT fk_oyuncu_id FOREIGN KEY (oyuncu_id)
							REFERENCES oyuncu(id),
							CONSTRAINT fk_program_id FOREIGN KEY (program_id)
							REFERENCES program(id));

-- RATING TABLOSU OLUŞTURMA
CREATE TABLE rating (kanal_id numeric(12),
					rating numeric(10),
					rating_date date,
					CONSTRAINT fk_kanal_rating_id FOREIGN KEY (kanal_id)
					REFERENCES kanal(id));

-- KANAL TABLOSUNA KANAL BILGILERI EKLEME
INSERT INTO kanal VALUES(nextval('seq_kanal'),
						'SHOWTV',
						12219,
						0);
INSERT INTO kanal VALUES(nextval('seq_kanal'),
						'KANALD',
						11977,
						0);
INSERT INTO kanal VALUES(nextval('seq_kanal'),
						'STARTV',
						12015,
						0);
INSERT INTO kanal VALUES(nextval('seq_kanal'),
						'FOXTV',
						12326,
						0);
INSERT INTO kanal VALUES(nextval('seq_kanal'),
						'KANAL-X',
						10950,
						1);
INSERT INTO kanal VALUES(nextval('seq_kanal'),
						'KANAL-M',
						14569,
						1);
INSERT INTO kanal VALUES(nextval('seq_kanal'),
						'ABC',
						12560,
						1);

-- PROGRAM TABLOSUNA PROGRAM BILGILERI EKLEME
INSERT INTO program VALUES(nextval('seq_program'),
						  'GELSIN HAYAT BILDIGI GIBI',
						  'DRAM',
						  1);
INSERT INTO program VALUES(nextval('seq_program'),
						  'GELSIN HAYAT BILDIGI GIBI',
						  'DRAM',
						  2);		
INSERT INTO program VALUES(nextval('seq_program'),
						  'YALI CAPKINI',
						  'DRAM',
						  3);
INSERT INTO program VALUES(nextval('seq_program'),
						  'ADIM FARAH',
						  'DRAM',
						  4);
INSERT INTO program VALUES(nextval('seq_program'),
						  'YEDI NUMARA',
						  'KOMEDI',
						  5);
INSERT INTO program VALUES(nextval('seq_program'),
						  'HAYAT BILGISI',
						  'GENCLIK',
						  6);
INSERT INTO program VALUES(nextval('seq_program'),
						  'KOCUM BENIM',
						  'GENCLIK',
						  7);
INSERT INTO program VALUES(nextval('seq_program'),
						  'AILE',
						  'DRAM',
						  1);

-- OYUNCU TABLOSUNA OYUNCU BILGILERI EKLEME
INSERT INTO oyuncu VALUES(nextval('seq_oyuncu'),
						 'ALPER',
						 'ALTINAY',
						 '33');
INSERT INTO oyuncu VALUES(nextval('seq_oyuncu'),
						 'DENIZ',
						 'RECBER',
						 '28');
INSERT INTO oyuncu VALUES(nextval('seq_oyuncu'),
						 'OZAN',
						 'RECBER',
						 '32');
INSERT INTO oyuncu VALUES(nextval('seq_oyuncu'),
						 'BURCU',
						 'BIRICIK',
						 '33');
INSERT INTO oyuncu VALUES(nextval('seq_oyuncu'),
						 'ENIS',
						 'ARIKAN',
						 '40');
INSERT INTO oyuncu VALUES(nextval('seq_oyuncu'),
						 'DEVRIM',
						 'OZKAN',
						 '24');
INSERT INTO oyuncu VALUES(nextval('seq_oyuncu'),
						 'ERTAN',
						 'SABAN',
						 '45');
INSERT INTO oyuncu VALUES(nextval('seq_oyuncu'),
						 'AFRA',
						 'SARACOGLU',
						 '25');
INSERT INTO oyuncu VALUES(nextval('seq_oyuncu'),
						 'EMRE',
						 'ALTUG',
						 '53');
INSERT INTO oyuncu VALUES(nextval('seq_oyuncu'),
						 'ASLI',
						 'ENVER',
						 '38');
INSERT INTO oyuncu VALUES(nextval('seq_oyuncu'),
						 'FIRAT',
						 'TANIS',
						 '47');
INSERT INTO oyuncu VALUES(nextval('seq_oyuncu'),
						 'ALI',
						 'SURMELI',
						 '63');
INSERT INTO oyuncu VALUES(nextval('seq_oyuncu'),
						 'ENGIN',
						 'ALKAN',
						 '57');
INSERT INTO oyuncu VALUES(nextval('seq_oyuncu'),
						 'SEBNEM',
						 'SONMEZ',
						 '54');
INSERT INTO oyuncu VALUES(nextval('seq_oyuncu'),
						 'PERRAN',
						 'KUTMAN',
						 '73');
INSERT INTO oyuncu VALUES(nextval('seq_oyuncu'),
						 'GOKCE',
						 'BAHADIR',
						 '41');
INSERT INTO oyuncu VALUES(nextval('seq_oyuncu'),
						 'FERIT',
						 'AKTUG',
						 '44');
INSERT INTO oyuncu VALUES(nextval('seq_oyuncu'),
						 'FIGEN',
						 'EVREN',
						 '58');
INSERT INTO oyuncu VALUES(nextval('seq_oyuncu'),
						 'KIVANC',
						 'TATLITUG',
						 '39');
INSERT INTO oyuncu VALUES(nextval('seq_oyuncu'),
						 'SERENAY',
						 'SARIKAYA',
						 '30');

-- PROGRAM_OYUNCU TABLOSUNA VERI EKLEME
INSERT INTO program_oyuncu VALUES(nextval('seq_pr_oy'),
								 6,1,1);
INSERT INTO program_oyuncu VALUES(nextval('seq_pr_oy'),
								 7,1,1);								 
INSERT INTO program_oyuncu VALUES(nextval('seq_pr_oy'),
								 4,2,1);
INSERT INTO program_oyuncu VALUES(nextval('seq_pr_oy'),
								 5,2,1);								 
INSERT INTO program_oyuncu VALUES(nextval('seq_pr_oy'),
								 8,3,1);
INSERT INTO program_oyuncu VALUES(nextval('seq_pr_oy'),
								 9,3,1);								 
INSERT INTO program_oyuncu VALUES(nextval('seq_pr_oy'),
								 10,4,1);
INSERT INTO program_oyuncu VALUES(nextval('seq_pr_oy'),
								 11,4,1);								 
INSERT INTO program_oyuncu VALUES(nextval('seq_pr_oy'),
								 12,4,1);
INSERT INTO program_oyuncu VALUES(nextval('seq_pr_oy'),
								 2,5,1);
INSERT INTO program_oyuncu VALUES(nextval('seq_pr_oy'),
								 13,5,1);								 
INSERT INTO program_oyuncu VALUES(nextval('seq_pr_oy'),
								 14,5,1);
INSERT INTO program_oyuncu VALUES(nextval('seq_pr_oy'),
								 1,6,1);
INSERT INTO program_oyuncu VALUES(nextval('seq_pr_oy'),
								 15,6,1);								 
INSERT INTO program_oyuncu VALUES(nextval('seq_pr_oy'),
								 16,6,1);
INSERT INTO program_oyuncu VALUES(nextval('seq_pr_oy'),
								 3,7,1);
INSERT INTO program_oyuncu VALUES(nextval('seq_pr_oy'),
								 17,7,1);								 
INSERT INTO program_oyuncu VALUES(nextval('seq_pr_oy'),
								 18,7,1);
INSERT INTO program_oyuncu VALUES(nextval('seq_pr_oy'),
								 19,8,1);
INSERT INTO program_oyuncu VALUES(nextval('seq_pr_oy'),
								 20,8,1);
INSERT INTO program_oyuncu VALUES(nextval('seq_pr_oy'),
								 1,1,0);
INSERT INTO program_oyuncu VALUES(nextval('seq_pr_oy'),
								 2,8,0);
INSERT INTO program_oyuncu VALUES(nextval('seq_pr_oy'),
								 3,3,0);
INSERT INTO program_oyuncu VALUES(nextval('seq_pr_oy'),
								 2,8,0);								 
INSERT INTO rating VALUES(1,5,(CURRENT_DATE));
INSERT INTO rating VALUES(2,3,(CURRENT_DATE));
INSERT INTO rating VALUES(3,4,(CURRENT_DATE));
INSERT INTO rating VALUES(4,2,(CURRENT_DATE));
INSERT INTO rating VALUES(5,3,(CURRENT_DATE));
INSERT INTO rating VALUES(6,4,(CURRENT_DATE));
INSERT INTO rating VALUES(7,4,(CURRENT_DATE));

INSERT INTO rating VALUES(1,3,('2023-03-15'));
INSERT INTO rating VALUES(2,3,('2023-03-15'));
INSERT INTO rating VALUES(3,4,('2023-03-15'));
INSERT INTO rating VALUES(4,4,('2023-03-15'));
INSERT INTO rating VALUES(5,5,('2023-03-15'));
INSERT INTO rating VALUES(6,4,('2023-03-15'));
INSERT INTO rating VALUES(7,4,('2023-03-15'));

INSERT INTO rating VALUES(1,5,('2023-03-14'));
INSERT INTO rating VALUES(2,3,('2023-03-14'));
INSERT INTO rating VALUES(3,3,('2023-03-14'));
INSERT INTO rating VALUES(4,2,('2023-03-14'));
INSERT INTO rating VALUES(5,4,('2023-03-14'));
INSERT INTO rating VALUES(6,4,('2023-03-14'));
INSERT INTO rating VALUES(7,4,('2023-03-14'));

SELECT * FROM rating;
SELECT * FROM program;
SELECT * FROM program_oyuncu;

-- ALPER ISIMLI OYUNCUNUN KATILDIGI PROGRAM BILGISI
SELECT p.* FROM program p
JOIN program_oyuncu po ON po.program_id = p.id
JOIN oyuncu o ON o.id = po.oyuncu_id
WHERE o.oyuncu_adi = 'ALPER';

-- BUGUN RATINGI EN YUKSEK OLAN KANALDAKI PROGRAMLARIN LISTESI
SELECT p.* FROM program p
JOIN kanal k ON k.id = p.kanal_id
JOIN rating r ON r.kanal_id = k.id
WHERE r.rating_date = CURRENT_DATE
ORDER BY r.rating DESC LIMIT 1;

-- KANAL-X KANALININ PROGRAMLARINDAKI DAIMI OYUNCU LISTESI
SELECT o.* FROM oyuncu o
JOIN program_oyuncu po ON po.oyuncu_id = o.id
JOIN program p ON p.id = po.program_id
JOIN kanal k ON k.id = p.kanal_id
WHERE po.daimi_mi = 1 AND k.kanal_adi = 'KANAL-X';

-- Ücretli kanal adlarının ve son gün reytingi en yüksek olan 5 kanal
-- adlarının tek bir listede getirilmesi. Çoklu kayıt varsa da çoklu
-- olarak getirilmelidir.
SELECT k.kanal_adi FROM kanal k
WHERE k.ucretli_mi = 1
UNION ALL
(SELECT k2.kanal_adi FROM kanal k2
JOIN rating r ON r.kanal_id = k2.id
WHERE r.rating_date = '2023-03-16'
ORDER BY r.rating DESC LIMIT 5);

-- YASI 50 DEN BUYUK OYUNCU OYNATAN PROGRAMLARIN LISTESI
SELECT DISTINCT p.* FROM program p
JOIN program_oyuncu po ON po.program_id = p.id
JOIN oyuncu o ON o.id = po.oyuncu_id
WHERE o.yasi > 50;

-- UCRETSIZ KANALLARDAKI TUM KONUK OYUNCULARIN LISTESI
SELECT DISTINCT o.* FROM oyuncu o
JOIN program_oyuncu po ON po.oyuncu_id = o.id
JOIN program p ON p.id = po.program_id
JOIN kanal k ON k.id = p.kanal_id
WHERE k.ucretli_mi = 0 AND po.daimi_mi = 0;

--FREKANSI 2000 DEN YUKSEK OLAN KANALDAKI OYUNCULARIN ORTALAMA YASI
SELECT AVG(o.yasi) FROM oyuncu o
JOIN program_oyuncu po ON po.oyuncu_id = o.id
JOIN program p ON p.id = po.program_id
JOIN kanal k ON k.id = p.kanal_id
WHERE k.frekans > 2000;



