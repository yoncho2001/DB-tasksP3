use pc

SELECT *
FROM PC;

SELECT *
FROM product;

SELECT maker
FROM product
WHERE type = 'PC'
AND product.model IN (SELECT model
		FROM  pc
		WHERE speed > 400);
