SELECT
	COLUMN1,
	COLUMN2
FROM
	TABLE1
UNION
SELECT
	COLUMN1,
	COLUMN2
FROM
	TABLE2;

SELECT
	PRODUCT_ID,
	PRODUCT_NAME
FROM
	LEFT_PRODUCTS
UNION
SELECT
	PRODUCT_ID,
	PRODUCT_NAME
FROM
	RIGHT_PRODUCTS;

INSERT INTO
	RIGHT_PRODUCTS (PRODUCT_ID, PRODUCT_NAME)
VALUES
	(8, 'A');

SELECT
	FIRST_NAME,
	LAST_NAME
FROM
	DIRECTORS
UNION
SELECT
	FIRST_NAME,
	LAST_NAME
FROM
	ACTORS;

SELECT
	FIRST_NAME,
	LAST_NAME,
	'DIRECTORS' AS "TABLENAME"
FROM
	DIRECTORS
UNION
SELECT
	FIRST_NAME,
	LAST_NAME,
	'ACTORS' AS "TABLENAME"
FROM
	ACTORS
ORDER BY
	FIRST_NAME;

-- DATA TYPES IN UNION MUST BE MATCHED
----------------------------------------------------------------------------------------------------
-- UNION with filters and conditions
-- COMBINING DIRECTORS OF NATIONALITY 'American', 'Chinese', 'Japanese', AND ACTRESSES
SELECT
	FIRST_NAME,
	LAST_NAME,
	'DIRECTORS' AS "TABLENAME"
FROM
	DIRECTORS
WHERE
	NATIONALITY IN ('American', 'Chinese', 'Japanese')
UNION
SELECT
	FIRST_NAME,
	LAST_NAME,
	'ACTORS' AS "TABLENAME"
FROM
	ACTORS
WHERE
	GENDER = 'F';

-- FIRST NAME, AND LAST NAME OF ALL DIRECTORS AND ACTORS WHICH ARE BORN AFTER 1990.
SELECT
	FIRST_NAME,
	LAST_NAME,
	DATE_OF_BIRTH,
	'ACTORS' AS "TABLENAME"
FROM
	ACTORS
WHERE
	DATE_OF_BIRTH > '1990-12-31'
UNION
SELECT
	FIRST_NAME,
	LAST_NAME,
	DATE_OF_BIRTH,
	'DIRECTORS' AS "TABLENAME"
FROM
	DIRECTORS
WHERE
	DATE_OF_BIRTH > '1990-12-31';

-- FIRST NAME AND LAST NAME ALL ACTORS AND DIRECTORS WHERE FIRST NAME STARTS WITH A
SELECT
	FIRST_NAME,
	LAST_NAME,
	'DIRECTORS' AS "TABLENAME"
FROM
	DIRECTORS
WHERE
	FIRST_NAME ~ '^A\w*'
UNION
SELECT
	FIRST_NAME,
	LAST_NAME,
	'ACTORS' AS "TABLENAME"
FROM
	ACTORS
WHERE
	FIRST_NAME ~ '^A\w*';

SELECT
	FIRST_NAME,
	LAST_NAME,
	'DIRECTORS' AS "TABLENAME"
FROM
	DIRECTORS
WHERE
	FIRST_NAME LIKE 'A%'
UNION
SELECT
	FIRST_NAME,
	LAST_NAME,
	'ACTORS' AS "TABLENAME"
FROM
	ACTORS
WHERE
	FIRST_NAME LIKE 'A%';

SELECT
	FIRST_NAME,
	LAST_NAME,
	'DIRECTORS' AS "TABLENAME"
FROM
	DIRECTORS
WHERE
	FIRST_NAME LIKE 'A%'
UNION
SELECT
	FIRST_NAME,
	LAST_NAME,
	'ACTORS' AS "TABLENAME"
FROM
	ACTORS
WHERE
	FIRST_NAME STARTING;

-- COMBINING DIFFERENT NUMBER OF COLUMNS FROM EACH QUERY
-- NO THIS IS NOT POSSIBLE AS TABLES INVOLOVED MUST INCLUDE SAME NUMBER OF COLUMNS, WITH SAME DATA TYPE
-- THERE IS A WAY TO DO SO, MENTIONED BELOW:
----------------------------------------------------------------------------------------------------
-- UNION tables with different number of columns
CREATE TABLE TAB1 (COL1 INT, COL2 INT);

CREATE TABLE TAB2 (COL3 INT);

SELECT
	COL1,
	COL2
FROM
	TAB1
UNION
SELECT
	NULL,
	COL3
FROM
	TAB2;

----------------------------------------------------------------------------------------------------
-- INTERSECT with tables
-- THE INTERSECT OPERATOR RETURNS ANT ROWS THAT ARE AVAILABLE IN BOTH RESULT SETS
-- THE ORDER AND NUMBER OF THE COLUMN IN THE SELECT LIST OF ALL QUERIES MUST BE THE SAME
-- THE DATA TYPE MUST BE COMPITABLE TOO
INSERT INTO
	RIGHT_PRODUCTS (PRODUCT_ID, PRODUCT_NAME)
VALUES
	(6, 'P');

SELECT
	PRODUCT_ID,
	PRODUCT_NAME
FROM
	LEFT_PRODUCTS
INTERSECT
SELECT
	PRODUCT_ID,
	PRODUCT_NAME
FROM
	RIGHT_PRODUCTS;

-- WE DO NOT GET DUPLICATE RECORDS ON RUNNING INTERSECT
-- INTERSECTING FIRST NAME AND LAST NAME OF THE DIRECTORS AND ACTORS TABLE
SELECT
	FIRST_NAME,
	LAST_NAME
FROM
	DIRECTORS
INTERSECT
SELECT
	FIRST_NAME,
	LAST_NAME
FROM
	ACTORS;

----------------------------------------------------------------------------------------------------
-- EXCEPT with tables
-- THE EXCEPT OPERATOR RETURNS THE ROW IN THE FIRST QUERY THAT DO NOT APPEAT IN THE OUTPUT OF THE SECOND QUERY
-- THE ORDER OF THE NUMBER OF THE COLUMNS IN THE SELECT LIST OF ALL QUERIES MUST BE THE SAME
-- THE DATA TYPE MUST BE COMPITABLE TOO
SELECT
	COL1,
	COL2
FROM
	TABLE1
EXCEPT
SELECT
	COL1,
	COL2
FROM
	TABLE2;

SELECT
	PRODUCT_ID,
	PRODUCT_NAME
FROM
	LEFT_PRODUCTS
EXCEPT
SELECT
	PRODUCT_ID,
	PRODUCT_NAME
FROM
	RIGHT_PRODUCTS;

SELECT
	FIRST_NAME,
	LAST_NAME
FROM
	DIRECTORS
EXCEPT
SELECT
	FIRST_NAME,
	LAST_NAME
FROM ACTORS;

-- LIST ALL THE FIRST_NAME LAST_NAME IN THE DIRECTORS, UNLESS THEY HAVE SAME FIRST_NAME OF FEMALE ACTORS 
SELECT
	FIRST_NAME,
	LAST_NAME
FROM
	DIRECTORS
EXCEPT
SELECT
	FIRST_NAME,
	LAST_NAME
FROM 
	ACTORS
WHERE
	GENDER = 'F';