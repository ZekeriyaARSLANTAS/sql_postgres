-- AGGREGATE METHOD KULLANIMI --
/*
-Aggregate Methodları (SUM(Topla),COUNT(Say),MIN(EN küçük değer),MAX(En büyük değer),AVG(Ortalama)) 
-Subquery içinde de kullanılır
-ANcak, sorgu tek bir değer döndürüyor olmalıdır
SYNTAX: sum() şeklinde olmalı sum () arasında boşluk olmamalı
*/
--ALIAS (AS) toplada geçici isim vermek istersek koşuldan sonra AS sutun_isim olarak kullanılır

-- bir tablodan tek deger getirebilmek icin ortalama AVG , toplam SUM, adet COUNT, MIN, MAX  gibi
-- fonksiyonlar kullanilir ve bu fonksiyonlara AGGREGATE FONKSIYONLAR denir

select * from calisanlar2
-- Çalısanlar2 tablosundaki en yüksek maaş değerini listeleyiniz
SELECT max(maas) from calisanlar2
--Calisanlar tablosundaki maaşların toplamını listeleyiniz
SELECT sum(maas) from calisanlar2
--Calıcanlar tablosundaki maas ortalamalını listeleyiniz
SELECT avg(maas) from calisanlar2
SELECT round(avg(maas)) from calisanlar2
SELECT round(avg(maas),2) from calisanlar2
--
--Calisanlar toplasundan en düşük maası listeleyiniz
SELECT min(maas) from calisanlar2
--Calisanlar tablosundaki kaç kişinin maaş aldığını listeleyiniz
SELECT count(maas) from calisanlar2

select * from calisanlar2
select * from markalar

-- Her markanin ismini, calisan sayisini ve o markaya ait calisanlarin toplam maaşini listeleyiniz
select marka_isim,calisan_sayisi,(SELECT sum(maas)from calisanlar2 where marka_isim=isyeri)
as toplam_maas from markalar 



-- Her markanin ismini, calisan sayisini ve o markaya ait calisanlarin maksimum ve minumum maaşini listeleyen bir Sorgu yaziniz.
  select marka_isim, calisan_sayisi,
  (select max(maas) from calisanlar2 where marka_isim=isyeri) as max_maas,
  (select min(maas) from calisanlar2 where marka_isim=isyeri) as min_maas from markalar
  
  --Her markanin id’sini, ismini ve toplam kaç şehirde bulunduğunu listeleyen bir SORGU yaziniz.
  
  select marka_id,marka_isim ,(select count (sehir)from calisanlar2 where marka_isim=isyeri) as sehir_sayisi from markalar
  
  --Interview Question: En yüksek ikinci maas değerini çağırın.
  
  SELECT max(maas) as enyuksek_ikici_maas from calisanlar2
  where maas<(select max(maas)from calisanlar2)
  
  ----Interview Question: En düşük ikinci maas değerini çağırın.
  SELECT min(maas) as endusuk_ikici_maas from calisanlar2
  where maas>(select min(maas)from calisanlar2)
  
  --En yüksek üçüncü maas değerini bulun
   SELECT max(maas) as enyuksek_ucuncu_maas from calisanlar2
  where maas<(select max(maas)from calisanlar2 where maas<(select max(maas)from calisanlar2))
  
  --En dusuk üçüncü maas değerini bulun
  
  SELECT min(maas) as endusuk_ikici_maas from calisanlar2
  where maas>(select min(maas)from calisanlar2 where maas>( select min(maas)from calisanlar2))
  