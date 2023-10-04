use pc_without_constraints

/*TASK1*/
SELECT *
FROM product

SELECT *
FROM pc

insert into pc values(12,'1100',2400,2048,500,'52x',299);
insert into product values('C','1100','PC');

/*TASK2*/
SELECT *
FROM product

SELECT *
FROM pc

DELETE 
FROM pc 
WHERE model = 1100;

/*TASK3*/
SELECT *
FROM product

SELECT *
FROM laptop

DELETE FROM laptop
WHERE model IN (
    SELECT laptop.model 
    FROM laptop, product 
    WHERE laptop.model = product.model
	AND product.maker NOT IN (
			SELECT maker 
			FROM product 
			WHERE type = 'Printer'
    )
);

/*TASK4*/
SELECT *
FROM product

UPDATE product
SET maker = 'A'
WHERE maker = 'B';

/*TASK5*/
SELECT *
FROM pc

UPDATE pc
SET price = price/2, hd += 20;

/*TASK6*/
SELECT *
FROM pc

UPDATE pc
SET price = price/2, hd += 20;

/*TASK6*/
SELECT *
FROM laptop

UPDATE laptop
SET screen += 1
WHERE model IN(
    SELECT laptop.model 
    FROM laptop, product 
    WHERE laptop.model = product.model
	AND product.maker = 'B');