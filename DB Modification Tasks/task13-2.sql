USE pc;

SELECT DISTINCT maker
FROM product, laptop
WHERE laptop.model = product.model
AND product.maker IN (SELECT DISTINCT maker
					  FROM product, printer
					  WHERE printer.model = product.model);

SELECT DISTINCT maker
FROM product, laptop
WHERE laptop.model = product.model

UNION

SELECT DISTINCT maker
FROM product, printer
WHERE printer.model = product.model

UPDATE pc
SET price = price * 0.95
WHERE model IN (
    SELECT product.model
    FROM product, (SELECT maker
					FROM product, printer 
					WHERE  product.model = printer.model
	  				AND product.type = 'printer'
					GROUP BY maker
					HAVING AVG(printer.price) > 280) AS high_avg_printers
    WHERE product.maker = high_avg_printers.maker
	AND product.type = 'pc'
);

SELECT hd,min(price)as min_prise
FROM pc
WHERE hd>=10 
and hd<=30
group by hd

SELECT *
FROM pc

