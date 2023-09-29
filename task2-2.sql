use pc

SELECT *
FROM PC;

SELECT *
FROM product;

SELECT code ,maker, speed
FROM product, laptop
WHERE laptop.model = product.model
AND hd >= 9;

SELECT code ,maker, speed
FROM product, laptop
WHERE laptop.model = product.model
AND hd >= 9;


SELECT product.model, COALESCE(laptop.price, pc.price, printer.price) AS price
FROM product
LEFT JOIN laptop ON product.model = laptop.model
LEFT JOIN pc ON product.model = pc.model
LEFT JOIN printer ON product.model = printer.model
WHERE product.maker = 'B';

SELECT maker
FROM product 
WHERE type = 'Laptop' 
AND maker NOT IN (SELECT DISTINCT maker 
					FROM product 
					WHERE type = 'PC');

SELECT hd 
FROM pc 
GROUP BY hd
HAVING COUNT(code)>1;

SELECT DISTINCT pc1.model AS model1, pc2.model AS model2
FROM pc pc1, pc pc2
WHERE pc1.speed = pc2.speed
AND pc1.ram = pc2.ram;

SELECT maker, COUNT( code)
FROM product
JOIN pc ON product.model = pc.model
WHERE speed >= 400
GROUP BY maker
HAVING COUNT( code) >= 2;

