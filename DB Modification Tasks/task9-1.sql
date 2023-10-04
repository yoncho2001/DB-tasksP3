CREATE DATABASE task9
GO
USE task9
GO
/*TASK1*/
CREATE TABLE PRODUCT(
  MODEL VARCHAR(4)  ,
  MAKER CHAR(1)  ,
  TYPE VARCHAR(7)  
);


CREATE TABLE PRINTER (
    CODE INT ,
    MODEL VARCHAR(4),
    PRICE DECIMAL(10, 2)
);

/*TASK2*/
insert into PRODUCT values('1211','A','Printer');
insert into PRODUCT values('1251','B','Printer');
insert into PRODUCT values('1721','C','Printer');
insert into PRODUCT values('1655','A','Printer');
insert into PRODUCT values('1771','B','Printer');
insert into PRODUCT values('1636','C','Printer');
insert into PRODUCT values('1882','A','Printer');

insert into PRINTER values(1,'1721',500);
insert into PRINTER values(2,'1882',100);
insert into PRINTER values(3,'1211',456);
insert into PRINTER values(4,'1882',852);
insert into PRINTER values(5,'1771',454);
insert into PRINTER values(6,'1636',7888);
insert into PRINTER values(7,'1276',272);
insert into PRINTER values(8,'1771',6333);

/*TASK3*/
SELECT *
FROM PRODUCT

SELECT *
FROM PRINTER


ALTER TABLE PRINTER
ADD TYPE VARCHAR(6) CHECK (TYPE IN ('laser', 'matrix', 'jet'));

ALTER TABLE PRINTER
ADD COLOR CHAR(1) DEFAULT 'n' CHECK (color IN ('y', 'n'));

insert into PRINTER values(9,'1276',292,'laser','y');
insert into PRINTER values(10,'1771',6333,'matrix',DEFAULT);

/*TASK4*/
ALTER TABLE PRINTER
DROP COLUMN PRICE;

/*TASK5*/
DROP TABLE PRODUCT;
DROP TABLE PRINTER;