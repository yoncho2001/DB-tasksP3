use ships

SELECT *
FROM OUTCOMES;

SELECT NAME
FROM CLASSES,SHIPS
WHERE CLASSES.CLASS = SHIPS.CLASS
AND DISPLACEMENT>50000;

SELECT NAME,DISPLACEMENT,NUMGUNS
FROM CLASSES,SHIPS,OUTCOMES
WHERE CLASSES.CLASS = SHIPS.CLASS
AND OUTCOMES.SHIP = SHIPS.NAME
AND BATTLE = 'Guadalcanal';

SELECT COUNTRY
FROM CLASSES 
WHERE TYPE = 'bb' 
AND COUNTRY IN (SELECT DISTINCT COUNTRY 
					FROM CLASSES 
					WHERE TYPE = 'bc');

SELECT O1.SHIP
FROM OUTCOMES O1, OUTCOMES O2,BATTLES
WHERE O1.BATTLE != O2.BATTLE 
AND O1.RESULT = 'damaged';


SELECT O1.SHIP
FROM OUTCOMES O1
JOIN OUTCOMES O2 ON O1.SHIP = O2.SHIP
JOIN BATTLES B1 ON O1.BATTLE = B1.NAME
JOIN BATTLES B2 ON O2.BATTLE = B2.NAME
WHERE O1.RESULT = 'damaged' AND B1.DATE < B2.DATE;