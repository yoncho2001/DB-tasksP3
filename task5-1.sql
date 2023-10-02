use pc

SELECT *
FROM PRINTER;

SELECT *
FROM product;
 /*task1*/
SELECT CAST(AVG(speed) AS DECIMAL(10,2))as AVG
FROM pc;

 /*task2*/
SELECT maker, AVG(laptop.screen)
FROM laptop ,product
WHERE laptop.model = product.model
GROUP BY maker;

 /*task3*/
SELECT CAST(AVG(speed) AS DECIMAL(10,2))as AVG
FROM laptop
where price > 1000;

 /*task4*/
SELECT CAST(AVG(pc.price) AS DECIMAL(10,2))as AVG
FROM pc ,product
WHERE pc.model = product.model
AND maker =  'A';

 /*task5*/
SELECT AVG(PRISE) as AVG
FROM (SELECT maker AS MAKER,price AS PRISE
		FROM pc ,product
		WHERE pc.model = product.model
		UNION
		SELECT maker,price
		FROM laptop ,product
		WhERE laptop.model = product.model) AS makers
WHERE MAKER = 'B';

 /*task6*/
SELECT speed, CAST(AVG(pc.price) AS DECIMAL(10,2))as AVG
FROM pc
GROUP BY speed;

 /*task7*/
SELECT maker,COUNT(maker) AS COUNT
FROM pc ,product
WHERE pc.model = product.model
GROUP BY maker
HAVING COUNT(maker)>= 3;

 /*task8*/
SELECT maker
FROM pc ,product
WHERE pc.model = product.model
AND price = (SELECT MAX(price) FROM pc);

 /*task9*/
SELECT speed,CAST(AVG(pc.price) AS DECIMAL(10,2))as AVG
FROM pc
GROUP BY speed
HAVING speed > 500;

 /*task10*/
SELECT DISTINCT makers.maker, AVG
FROM printer ,product,(SELECT maker,CAST(AVG(pc.hd) AS DECIMAL(10,2))as AVG
						FROM pc ,product
						WHERE pc.model = product.model
						GROUP BY maker) as makers
WHERE printer.model = product.model
and product.maker = makers.maker;