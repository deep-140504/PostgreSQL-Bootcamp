----------------------------------------------------------------------------------------------------
-- Schema Operations
CREATE SCHEMA SALES;

CREATE SCHEMA HR;

ALTER SCHEMA SALES
RENAME TO PROGRAMMING;

DROP SCHEMA PROGRAMMING;

SELECT
	*
FROM
	HR.PUBLIC.EMPLOYEES;

SELECT
	*
FROM
	HR.HR.EMPLOYEES;

----------------------------------------------------------------------------------------------------
-- Move a table to a new schema
ALTER TABLE HR.ORDERS
SET SCHEMA PUBLIC;

SELECT
	CURRENT_SCHEMA();

SHOW SEARCH_PATH;

SET
	SEARCH_PATH TO '$user',
	HR,
	PUBLIC;

SELECT
	*
FROM
	TEST;

INSERT INTO
	HR.TEST
VALUES
	(1),
	(2);

SELECT
	*
FROM
	TEST;

SET
	SEARCH_PATH TO '$user',
	PUBLIC,
	HR;

SELECT
	*
FROM
	TEST;

SET
	SEARCH_PATH TO '$user',
	HR;

SELECT
	*
FROM
	ORDERS;

SELECT
	*
FROM
	PUBLIC.ORDERS;

ALTER SCHEMA HR OWNER TO "Deep";

CREATE DATABASE TEST_SCHEMA;

CREATE TABLE TEST_SCHEMA.PUBLIC.SONGS (
	SONG_ID SERIAL PRIMARY KEY,
	SONG_TITLE VARCHAR(100)
);

INSERT INTO
	TEST_SCHEMA.PUBLIC.SONGS (SONG_TITLE)
VALUES
	('Roses'),
	('Still dont know my name');

SELECT
	*
FROM
	TEST_SCHEMA.PUBLIC.SONGS;

PG_DUMP - D TEST_SCHEMA - H LOCALHOST - U POSTGRES - N PUBLIC > DUMP.SQL
-- USING PGADMIN GUI : RENAME OLD SCHEMA public to old_schema
PSQL - H LOCALHOST - U POSTGRES - D TEST_SCHEMA - F DUMP.SQL
SHOW SEARCH_PATH;

SET
	SEARCH_PATH TO '$user',
	PUBLIC,
	PG_CATALOG;

SELECT
	*
FROM
	INFORMATION_SCHEMA.SCHEMATA;

----------------------------------------------------------------------------------------------------
-- Compare tables and columns in two schemas
SELECT
	COALESCE(C1.TABLE_NAME, C2.TABLE_NAME) AS TABLE_NAME,
	COALESCE(C1.COLUMN_NAME, C2.COLUMN_NAME) AS COLUMN_NAME,
	C1.COLUMN_NAME AS SCHEMA1,
	C2.COLUMN_NAME AS SCHEMA2
FROM
	(
		SELECT
			TABLE_NAME,
			COLUMN_NAME
		FROM
			INFORMATION_SCHEMA.COLUMNS AS C
		WHERE
			C.TABLE_SCHEMA = 'public'
	) AS C1
	FULL JOIN (
		SELECT
			TABLE_NAME,
			COLUMN_NAME
		FROM
			INFORMATION_SCHEMA.COLUMNS AS C
		WHERE
			C.TABLE_SCHEMA = 'humanresources'
	) AS C2 ON C1.TABLE_NAME = C2.TABLE_NAME
	AND C1.COLUMN_NAME = C2.COLUMN_NAME
WHERE
	C1.COLUMN_NAME IS NULL
	OR C2.COLUMN_NAME IS NULL
ORDER BY
	TABLE_NAME,
	COLUMN_NAME;

----------------------------------------------------------------------------------------------------
-- SCHEMAS AND PREVILEGES
-- USING PGADMIN GUI : CREATE SCHEMA private
-- USING PGADMIN GUI : CREATE TABLE t1
SELECT
	*
FROM
	PRIVATE.T1;

-- psql -h localhost -U Deep -d hr this will give error as the permsion is not granted
GRANT USAGE ON SCHEMA PRIVATE TO "Deep";
-- still user will not be able to access table on. select * from private.t1;,
-- as permision to schema is allowed but not of the tables;
-- remember that only previledge of select is granted, not other commands
GRANT
SELECT
	ON ALL TABLES IN SCHEMA PRIVATE TO "Deep";

GRANT CREATE ON SCHEMA PRIVATE TO "Deep";

CREATE TABLE PRIVATE.ABC (ID INT);