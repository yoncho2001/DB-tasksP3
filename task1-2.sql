use pc

SELECT *
FROM pc;

SELECT code, model, speed as MHz, hd as GB
FROM pc
WHERE price < 850;

SELECT DISTINCT  maker
FROM product
WHERE type = 'Printer';

SELECT code, model, hd , screen
FROM laptop
WHERE price > 1000;

SELECT *
FROM printer
WHERE color = 'y';

SELECT code, model, speed as MHz, hd as GB
FROM pc
WHERE cd = '12x'
OR cd = '16x'
AND price < 2000;