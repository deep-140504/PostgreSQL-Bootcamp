----------------------------------------------------------------------------------------------------
-- [1] Boolean
CREATE TABLE TABLE_BOOLEAN (
	PRODUCT_ID SERIAL PRIMARY KEY,
	IS_AVAILABLE BOOLEAN NOT NULL
);

DELETE FROM TABLE_BOOLEAN;

INSERT INTO
	TABLE_BOOLEAN (IS_AVAILABLE)
VALUES
	(FALSE),
	(TRUE),
	('y'),
	('n'),
	('0'),
	('1'),
	('no'),
	('yes'),
	('true'),
	('false');

SELECT
	*
FROM
	TABLE_BOOLEAN;

SELECT
	*
FROM
	TABLE_BOOLEAN
WHERE
	IS_AVAILABLE = TRUE;

SELECT
	*
FROM
	TABLE_BOOLEAN
WHERE
	IS_AVAILABLE;

SELECT
	*
FROM
	TABLE_BOOLEAN
WHERE
	NOT IS_AVAILABLE = TRUE;

ALTER TABLE TABLE_BOOLEAN
ALTER COLUMN IS_AVAILABLE
SET DEFAULT FALSE;

INSERT INTO
	TABLE_BOOLEAN (PRODUCT_ID)
VALUES
	(23);

----------------------------------------------------------------------------------------------------
-- [2] character data type
-- [2.1] char(n) and character(n)
SELECT
	CAST('DEEP' AS CHARACTER(10)) AS "Name";

"DEEP      "
SELECT
	'Deep'::CHAR(10) AS "name";

"Deep      "
SELECT
	CAST('Deep' AS CHARACTER(10)) AS "Name1",
	'Deep'::CHAR(10) AS "Name2";

"Deep      " "Deep      "
-- [2.2] varChar(n)
SELECT
	'Deep'::VARCHAR(10) AS "Name";

"Deep"
SELECT
	'This is a test statement'::CHARACTER VARYING(10) AS "Statement";

"This is a "
SELECT
	'This is a test statement'::VARCHAR AS "Statement";

"This is a test statement"
-- [2.3] text
SELECT
	'This is a test statement'::TEXT AS "Statement";

CREATE TABLE CHARACTERS (
	COL_CHAR CHAR(10),
	COL_VARCHAR VARCHAR(10),
	COL_TEXT TEXT
);

INSERT INTO
	CHARACTERS (COL_CHAR, COL_VARCHAR, COL_TEXT)
VALUES
	('abc', 'abc', 'abc'),
	('xyz', 'xyz', 'xyz');

SELECT
	*
FROM
	CHARACTERS;

"abc       " "abc" "abc";

"xyz       " "xyz" "xyz";

----------------------------------------------------------------------------------------------------
-- [3] Numeric data types
-- [3.1] integer
CREATE TABLE SERIAL (
	COL_SMALLINT SMALLINT,
	COL_INT INT,
	COL_BIGINT BIGINT,
	COL_SMALLSERIAL SMALLSERIAL,
	COL_SERIAL SERIAL PRIMARY KEY,
	COL_BIGSERIAL BIGSERIAL,
	PRODUCT_NAME VARCHAR(100)
);

INSERT INTO
	SERIAL (COL_SMALLINT, COL_INT, COL_BIGINT, PRODUCT_NAME)
VALUES
	(1, 1, 1, 'pen'),
	(2, 2, 2, 'pencil'),
	(3, 3, 3, 'erasor');

SELECT
	*
FROM
	SERIAL;

-- [3.2] decimal
CREATE TABLE DECIMAL(
	COL_NUMERIC NUMERIC(20, 5),
	COL_DECIMAL DECIMAL(20, 3),
	COL_REAL REAL,
	COL_DOUBLE DOUBLE PRECISION
);

INSERT INTO
	DECIMAL(COL_NUMERIC, COL_DECIMAL, COL_REAL, COL_DOUBLE)
VALUES
	(.9, .9, .9, .9),
	(3.13579, 3.13579, 3.13579, 3.13579),
	(
		4.135787654,
		4.135787654,
		4.135787654,
		4.135787654
	);

SELECT
	*
FROM
	DECIMAL;

0.90000 0.900 0.9 0.9;

3.13579 3.136 3.13579 3.13579;

4.13579 4.136 4.1357875 4.135787654;

----------------------------------------------------------------------------------------------------
-- [4] Date/Time data types
-- [4.1] Date
CREATE TABLE DATES (
	ID SERIAL PRIMARY KEY,
	EMPLOYEE_NAME VARCHAR(100) NOT NULL,
	HIRED_DATE DATE NOT NULL,
	ADD_DATE DATE DEFAULT CURRENT_DATE
);

INSERT INTO
	DATES (EMPLOYEE_NAME, HIRED_DATE)
VALUES
	('Adam', '2020-01-01'),
	('Linda', '2020-02-01');

SELECT
	*
FROM
	DATES;

SELECT
	CURRENT_DATE;

SELECT
	NOW();

-- [4.2] TIME
CREATE TABLE TABLE_TIME (
	ID SERIAL PRIMARY KEY,
	CLASS_NAME VARCHAR(100) NOT NULL,
	START_TIME TIME NOT NULL,
	END_TIME TIME NOT NULL
);

SELECT
	*
FROM
	TABLE_TIME;

INSERT INTO
	TABLE_TIME (CLASS_NAME, START_TIME, END_TIME)
VALUES
	('Math', '08:00:00', '09:00:00'),
	('Chemistry', '09:01:00', '10:00:00');

SELECT
	CURRENT_TIME;

SELECT
	CURRENT_TIME(4);

SELECT
	LOCALTIME(4),
	CURRENT_TIME(4);

SELECT
	LOCALTIME(4),
	LOCALTIME;

SELECT
	TIME '10:00' - TIME '04:00' AS RESULT;

SELECT
	CURRENT_TIME,
	CURRENT_TIME + INTERVAL '-2 hours' AS "Updated Time";

-- [4.3] TIMESTAMP, TIMESTAMPTZ
CREATE TABLE TABLE_TIME_TZ (TS TIMESTAMP, TSTZ TIMESTAMPTZ);

INSERT INTO
	TABLE_TIME_TZ (TS, TSTZ)
VALUES
	(
		'2020-02-22 10:10:10-07',
		'2020-02-22 10:10:10-07'
	);

SELECT
	*
FROM
	TABLE_TIME_TZ;

SHOW TIMEZONE;

SELECT
	TIMEZONE ('Asia/Singapore', '2020-01-01 02:00:00');

SELECT
	TIMEZONE ('America/New_York', '2020-01-01 02:00:00');

----------------------------------------------------------------------------------------------------
-- [5] UUID
-- 32 digits
-- hexadecimal digits
-- separated by hyphens
-- we will use uuid-ossp to generate uuid
CREATE EXTENSION IF NOT EXISTS "uuid-ossp";

SELECT
	UUID_GENERATE_V1 ();

-- this version of uuid generator uses mac address, currenet time stamp and some random numbers to generate unique id, each time
SELECT
	UUID_GENERATE_V4 ();

-- this version of uuid generator does not use anything like mac address, current time stamp in order to generate this uuid
-- id being generated is completely random
CREATE TABLE TABLE_UUID (
	PRODUCT_ID UUID DEFAULT UUID_GENERATE_V1 (),
	PRODUCT_NAME VARCHAR(100) NOT NULL
);

SELECT
	*
FROM
	TABLE_UUID;

INSERT INTO
	TABLE_UUID (PRODUCT_NAME)
VALUES
	('abc'),
	('def'),
	('ghi'),
	('jkl'),
	('mno'),
	('pqr'),
	('stu'),
	('vwx'),
	('yz');

ALTER TABLE TABLE_UUID
ALTER COLUMN PRODUCT_ID
SET DEFAULT UUID_GENERATE_V4 ();

----------------------------------------------------------------------------------------------------
-- [6] Array
CREATE TABLE TABLE_ARRAY (ID SERIAL, NAME VARCHAR(100), PHONES TEXT[]);

INSERT INTO
	TABLE_ARRAY (NAME, PHONES)
VALUES
	('Adam', ARRAY['(801)-123-4567', '(819)-555-2222']),
	(
		'Linda',
		ARRAY['(201)-123-4567', '(214)-222-3333']
	);

SELECT
	*
FROM
	TABLE_ARRAY;

SELECT
	NAME,
	PHONES[1]
FROM
	TABLE_ARRAY;

SELECT
	NAME
FROM
	TABLE_ARRAY
WHERE
	PHONES[2] = '(214)-222-3333';

----------------------------------------------------------------------------------------------------
-- [7] hstore
/*
1. hstore is a datatype that stores value in a key value pair
2. hstore module implements the hstore data type
3. the keys and values are just text strings only
4. if there is a requirement of adding any aditional data, then it is possible to do so using the hstore
*/
CREATE EXTENSION IF NOT EXISTS HSTORE;

CREATE TABLE TABLE_HSTORE (
	BOOK_ID SERIAL PRIMARY KEY,
	TITLE VARCHAR(100) NOT NULL,
	BOOK_INFO HSTORE
);

INSERT INTO
	TABLE_HSTORE (TITLE, BOOK_INFO)
VALUES
	(
		'Title 2',
		'
		"publisher" => "bcd",
		"paper cost" => "20.00",
		"e_cost" => "5.86"		
	'
	);

SELECT
	*
FROM
	TABLE_HSTORE;

SELECT
	BOOK_INFO -> 'publisher' AS "PUBLISHER",
	BOOK_INFO -> 'e_cost' AS "Electronic Cost"
FROM
	TABLE_HSTORE;

----------------------------------------------------------------------------------------------------
-- [8] JSON
CREATE TABLE TABLE_JSON (ID SERIAL PRIMARY KEY, DOCS JSON);

SELECT
	*
FROM
	TABLE_JSON;

INSERT INTO
	TABLE_JSON (DOCS)
VALUES
	('[1, 2, 3, 4, 5, 6]'),
	('[2, 3, 4, 5, 6, 7]'),
	('{"key": "value"}');

SELECT
	DOCS
FROM
	TABLE_JSON;

SELECT
	*
FROM
	TABLE_JSON
WHERE
	DOCS @> '2';

ALTER TABLE TABLE_JSON
ALTER COLUMN DOCS TYPE JSONB;

INSERT INTO
	TABLE_JSON (DOCS)
VALUES
	('{"2": "value"}');

CREATE INDEX ON TABLE_JSON USING GIN (DOCS JSONB_PATH_OPS);

--  after running above query, fetching json data will be much faster, as of it using the GIN indexing
----------------------------------------------------------------------------------------------------
-- [9] Network Addresses
CREATE TABLE TABLE_NETADDR (ID SERIAL PRIMARY KEY, IP INET);

INSERT INTO
	TABLE_NETADDR (IP)
VALUES
	('4.35.221.243'),
	('4.152.207.126'),
	('4.152.207.238'),
	('4.249.111.162'),
	('12.1.223.132'),
	('12.8.192.60');

SELECT
	*
FROM
	TABLE_NETADDR;

SELECT
	IP,
	SET_MASKLEN(IP, 24) AS INET_24
FROM
	TABLE_NETADDR;

SELECT
	IP,
	SET_MASKLEN(IP, 24) AS INET_24,
	SET_MASKLEN(IP::CIDR, 24) AS CIDR_24
FROM
	TABLE_NETADDR;

SELECT
	IP,
	SET_MASKLEN(IP, 24) AS INET_24,
	SET_MASKLEN(IP::CIDR, 24) AS CIDR_24,
	SET_MASKLEN(IP::CIDR, 27) AS CIDR_27,
	SET_MASKLEN(IP::CIDR, 27) AS CIDR_28
FROM
	TABLE_NETADDR;