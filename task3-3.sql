use ships

SELECT *
FROM CLASSES;

SELECT DISTINCT COUNTRY
FROM CLASSES
WHERE NUMGUNS = (
    SELECT MAX(NUMGUNS) 
    FROM CLASSES );

SELECT NAME,CLASS
FROM SHIPS
WHERE NAME IN (SELECT SHIP
				FROM OUTCOMES
				WHERE RESULT = 'sunk');

SELECT NAME,CLASS
FROM SHIPS
WHERE CLASS IN (
    SELECT CLASS 
    FROM CLASSES
	WHERE BORE = 16)
ORDER BY CLASS;

SELECT *
FROM OUTCOMES
WHERE SHIP IN (
    SELECT NAME 
    FROM SHIPS
	WHERE CLASS = 'Kongo');

SELECT S.NAME , C.CLASS
FROM SHIPS S,CLASSES C
WHERE S.CLASS = C.CLASS
AND C.NUMGUNS >= ALL (SELECT C1.NUMGUNS
                        FROM CLASSES C1
                        WHERE C1.BORE = C.BORE AND C1.CLASS != C.CLASS);