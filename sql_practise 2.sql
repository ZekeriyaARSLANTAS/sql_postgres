CREATE TABLE workers
(
  id int,
  name varchar(20),
  title varchar(60),
  manager_id int
);
INSERT INTO workers VALUES(1, 'Ali Can', 'Dev', 2);
INSERT INTO workers VALUES(2, 'John Davis', 'QA', 3);
INSERT INTO workers VALUES(3, 'Angie Star', 'Dev Lead', 4);
INSERT INTO workers VALUES(4, 'Amy Sky', 'CEO', 5);

select * from workers;

--1 Tabloya company_industry isminde sütun ekleyiniz
ALTER TABLE workers
ADD COLUMN company_industry varchar(50);

--2 TABLOYA worker_address sütunu ve defaullt olarakta 'Miami, FL, USA' adresini ekleyiniz.
ALTER TABLE workers
ADD COLUMN worker_address varchar(50)default 'Miami, FL, USA';

--3 tablodaki worker_address sütununu siliniz
ALTER TABLE workers
drop column worker_address

--4 Tablodaki company_industry sütununu, company_profession olarak değiştiriniz.
ALTER TABLE workers
rename company_industry  to company_profession
select * from workers;

--5 Tablonun ismini employees olarak değişitiriniz.
ALTER TABLE  workers rename to employees 
select * from employees ;
--6 Tablodaki title sütununa data tipini VARCHAR(50) olarak değiştiriniz.
alter table employees  alter  title type varchar(50);

--7 Tablodaki title sütununa "UNIQUE" kıstlaması ekleyiniz.
alter table employees 
add unique ( title )

ALTER TABLE employees
ADD UNIQUE (title);



