----------------------------------------------------------------------------------------------------
-- BASIC SYNTAX
CREATE DOMAIN domain_name AS data_type
DEFAULT default_value
NOT NULL
CHECK (condition);

----------------------------------------------------------------------------------------------------
-- CREATE A DOMAIN DATA TYPE, CREATE AN ADDRESS
CREATE DOMAIN ADDR VARCHAR(100) NOT NULL;

CREATE TABLE LOCATIONS (ADDRESS ADDR);

INSERT INTO
	LOCATIONS (ADDRESS)
VALUES
	('123 LONDON');

SELECT
	*
FROM
	LOCATIONS;

----------------------------------------------------------------------------------------------------
-- CREATE A DATA TYPE FOR A POSITIVE NUMBER
CREATE DOMAIN POSITIVE_NUMERIC INT NOT NULL CHECK (VALUE > 0);

CREATE TABLE SAMPLE (
	SAMPLE_ID SERIAL PRIMARY KEY,
	VALUE_NUM POSITIVE_NUMERIC
);

INSERT INTO
	SAMPLE (VALUE_NUM)
VALUES
	(-10);

----------------------------------------------------------------------------------------------------
-- DOMAIN FOR POSTAL CODE VALIDATION
CREATE DOMAIN US_POSTAL_CODE TEXT CHECK (
	VALUE ~ '^\D{5}$'
	OR VALUE ~ '^\D{5}-\D{4}'
);

CREATE TABLE ADDRESS (
	ADDRESS_ID SERIAL PRIMARY KEY,
	POSTAL_CODE US_POSTAL_CODE
);

INSERT INTO
	ADDRESS (POSTAL_CODE)
VALUES
	('10000-1000-10000');

SELECT
	*
FROM
	ADDRESS;

----------------------------------------------------------------------------------------------------
-- DOMAIN FOR EMAIL VALIDATION
CREATE DOMAIN PROPER_EMAIL VARCHAR(150) CHECK (
	VALUE ~ '^[A-ZA-Z0-9._%-]+@[A-ZA-Z0-9.-]+[.][A-ZA-Z]+$'
);

CREATE TABLE CLIENTS_NAMES (
	CLIENT_NAME_ID SERIAL PRIMARY KEY,
	EMAIL PROPER_EMAIL
);

INSERT INTO
	CLIENTS_NAMES (EMAIL)
VALUES
	('A@B.COM');

SELECT
	*
FROM
	CLIENTS_NAMES;

----------------------------------------------------------------------------------------------------
-- DOMAIN FOR ENUMERATION TYPE
DROP DOMAIN VALID_COLOR;

CREATE DOMAIN VALID_COLOR VARCHAR(10) CHECK (VALUE IN ('RED', 'GREEN', 'BLUE'));

CREATE TABLE COLORS (COLOR VALID_COLOR);

INSERT INTO
	COLORS (COLOR)
VALUES
	('RED');

INSERT INTO
	COLORS (COLOR)
VALUES
	('RED');

SELECT
	*
FROM
	COLORS;

CREATE DOMAIN USER_STATUS VARCHAR(10) CHECK (VALUE IN ('ENABLE', 'DISABLE', 'TEMP'));

CREATE TABLE USERS_CHECK (STATUS USER_STATUS);

----------------------------------------------------------------------------------------------------
-- GET ALL DOMAINS IN A SCHEMA
SELECT
	TYPNAME
FROM
	PG_CATALOG.PG_TYPE
	JOIN PG_CATALOG.PG_NAMESPACE ON PG_NAMESPACE.OID = PG_TYPE.TYPNAMESPACE
WHERE
	TYPTYPE = 'D'
	AND NSPNAME = 'PUBLIC';

----------------------------------------------------------------------------------------------------
-- drop domain

drop domain positive_numeric;

drop domain positive_numeric cascade;

drop domain valid_color;

drop domain valid_color cascade;