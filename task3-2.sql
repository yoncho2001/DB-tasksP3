use pc

SELECT *
FROM pc;

SELECT *
FROM product;

SELECT DISTINCT maker
FROM product
WHERE type = 'PC'
AND product.model IN (SELECT model
		FROM  pc
		WHERE speed > 500);

SELECT code, model, price
FROM printer
WHERE price = (SELECT MAX(price) 
				FROM printer);

SELECT *
FROM laptop
WHERE speed <= (SELECT MIN(speed) 
	 			FROM pc);

SELECT product.model, COALESCE(laptop.price, pc.price, printer.price) AS price
FROM product
LEFT JOIN laptop ON product.model = laptop.model
LEFT JOIN pc ON product.model = pc.model
LEFT JOIN printer ON product.model = printer.model
WHERE COALESCE(laptop.price, pc.price, printer.price) 
IN ( SELECT MAX(price)
		FROM (SELECT COALESCE(laptop.price, pc.price, printer.price) as price
				 FROM product
				 LEFT JOIN laptop ON product.model = laptop.model
				 LEFT JOIN pc ON product.model = pc.model
				 LEFT JOIN printer ON product.model = printer.model) as price);

SELECT product.maker
FROM product,printer
WHERE product.model = printer.model
AND color = 'y'
AND price = (SELECT MIN(price) 
	 			FROM printer
				WHERE color = 'y' );

SELECT *
FROM product,pc
WHERE product.model = pc.model
AND ram = (
    SELECT MIN(ram) 
    FROM pc 
    WHERE speed = (
        SELECT MAX(speed)
        FROM pc
        WHERE ram = (SELECT MIN(ram) FROM pc)
    )
);
