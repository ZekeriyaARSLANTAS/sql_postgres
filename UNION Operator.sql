/*
UNION Operator: 1) İki sorgu(query) sonucunu birleştirmek için kullanılır.
                2) Tekrarsız(unique) recordları  verir.
                3) Tek bir sütuna çok sütun koyabiliriz.
                4) Tek bir sütuna çok sütun koyarken mevcut data durumuna dikkat etmek gerekir.
*/
--salary değeri 3000'den yüksek olan state değerlerini ve salary değeri 2000'den küçük olan name değerlerini tekrarsız olarak bulun.
SELECT state AS "Name and State", salary
FROM workers
WHERE salary > 3000
UNION
SELECT name, salary
FROM workers
WHERE salary < 2000;
--salary değeri 3000'den yüksek olan state değerlerini ve 2000'den küçük olan name değerlerini tekrarlı olarak bulun.
SELECT state AS "Name and State", salary
FROM workers
WHERE salary > 3000
UNION ALL --> UNION ile aynı işi yapar. Ancak, tekrarlı değerleri de verir.
SELECT name, salary
FROM workers
WHERE salary < 2000;
--salary değeri 1000'den yüksek, 2000'den az olan "ortak" name değerlerini bulun.
SELECT name
FROM workers
WHERE salary > 1000
INTERSECT --INTERSECT Operator: İki sorgu (query) sonucunun ortak(common) değerlerini verir. Unique(tekrarsız) recordları verir.
SELECT name
FROM workers
WHERE salary < 2000;
--salary değeri 2000'den az olan ve company değeri  IBM, APPLE yada MICROSOFT olan ortak "name" değerlerini bulun.
SELECT name
FROM workers
WHERE salary < 2000
INTERSECT
SELECT name
FROM workers
WHERE company IN( 'IBM', 'APPLE', 'MICROSOFT');
--EXCEPT Operator : Bir sorgu sonucundan başka bir sorgu sonucunu çıkarmak için kullanılır. Unique(tekrarsız) recordları verir.
--salary değeri 3000'den az ve GOOGLE'da çalışmayan  name değerlerini bulun.
SELECT name
FROM workers
WHERE salary < 3000
EXCEPT
SELECT name
FROM workers
WHERE company = 'GOOGLE';