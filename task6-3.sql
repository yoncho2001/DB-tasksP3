use pc

SELECT *
FROM pc;

SELECT *
FROM product;

/*TASK1*/
SELECT model,screen	
FROM LAPTOP
WHERE screen = 15
OR screen = 11;

/*TASK2*/
SELECT DISTINCT pc.model
FROM pc,product, (SELECT maker,MIN(price)as min
					FROM laptop,product
					WHERE  laptop.model = product.model
					GROUP BY maker)as min_prise
WHERE pc.model = product.model
and product.maker = min_prise.maker
and pc.price < min_prise.min ;

/*TASK3*/
SELECT pc.model,AVG(pc.price)
FROM pc,product,(SELECT maker, MIN(price) AS MIN_LAPTOP_PRISE
				 FROM laptop ,product
				 where laptop.model = product.model
				 GROUP BY maker) AS MIN_PRISE
where pc.model = product.model
and product.maker = MIN_PRISE.maker
GROUP BY pc.model, MIN_PRISE.MIN_LAPTOP_PRISE
HAVING AVG(pc.price) < MIN_PRISE.MIN_LAPTOP_PRISE

/*TASK4*/

SELECT  pc1.code,product.maker,count(pc2.code)
FROM pc pc1,pc pc2,product
where pc1.price <= pc2.price
and pc1.model = product.model
GROUP BY pc1.code, product.maker
ORDER BY pc1.code
