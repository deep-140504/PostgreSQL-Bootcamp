----------------------------------------------------------------------------------------------------
-- DATE/TIME DATA TYPES
----------------------------------------------------------------------------------------------------
-- SYSTEM STYLE FOR DATE
SHOW DATESTYLE;

-- => (type, format)
----------------------------------------------------------------------------------------------------
-- STRING TO DATE CONVERSION
SELECT
	TO_DATE('2004-05-14', 'YYYY-MM-DD');

SELECT
	TO_DATE('20040514', 'YYYYMMDD');

SELECT
	TO_DATE('14-05-2004', 'DD-MM-YYYY');

-- ERROR
SELECT
	TO_DATE('2021-01-01', 'DD-MM-YYYY');

SELECT
	TO_DATE('May 14, 2004', 'Month DD, YYYY');

SELECT
	TO_DATE('May 14, 2004', 'Mon DD, YYYY');

SELECT
	TO_DATE('14th MAY, 2004', 'DDth MONTH, YYYY');

----------------------------------------------------------------------------------------------------
-- Using TO_TIMESTAMP function
SELECT
	TO_TIMESTAMP('2004-05-14 10:30:20', 'YYYY-MM-DD HH24:MI:SS');

SELECT
	TO_TIMESTAMP('2004-05-14 10:30', 'YYYY-MM-DD HH24:MI');

SELECT
	TO_TIMESTAMP('2004-05-14 10', 'YYYY-MM-DD HH24');

SELECT
	TO_TIMESTAMP('2004-05-14 23:08:10', 'YYYY-MM-DD HH24:MI:SS');

SELECT
	TO_TIMESTAMP('14-05-2004 10:08', 'DD-MM-YYYY HH24:MI');

SELECT
	TO_TIMESTAMP('14-05-2004 10:04', 'DD-MM-YYYY HH24:MI');

----------------------------------------------------------------------------------------------------
-- Formatting Dates
SELECT
	CURRENT_TIMESTAMP;

SELECT
	CURRENT_TIMESTAMP,
	TO_CHAR('2004-05-14 10:00:00'::TIMESTAMP, 'YYYY Month DD');

SELECT
	TO_CHAR('2004-05-14 16:30:00'::TIMESTAMP, 'YYYY Month DD'),
	TO_CHAR(
		'2004-05-14 16:30:00'::TIMESTAMPTZ,
		'YYYY Month DD'
	);

SELECT
	TO_CHAR('2004-05-14 16:30:00'::TIMESTAMP, 'YYYY Month DD'),
	TO_CHAR(
		'2004-05-14 16:30:00'::TIMESTAMPTZ,
		'YYYY Month DD'
	),
	TO_CHAR(
		'2004-05-14 16:30:00-6:00'::TIMESTAMPTZ,
		'YYYY Month DD HH:MI:SS TZ'
	);

SELECT
	TO_CHAR('2004-05-14 16:30:00'::TIMESTAMP, 'YYYY Month DD'),
	TO_CHAR(
		'2004-05-14 16:30:00'::TIMESTAMPTZ,
		'YYYY Month DD'
	),
	TO_CHAR(
		'2004-05-14T16:30:00-6:00'::TIMESTAMPTZ,
		'YYYY Month DD HH:MI:SS TZ'
	),
	TO_CHAR(
		'2004-05-14T16:30:00-6:00'::TIMESTAMPTZ,
		'FMMonth DDth YYYY HH:MI:SS TZ'
	);

SELECT
	MOVIE_NAME,
	RELEASE_DATE,
	TO_CHAR(RELEASE_DATE, 'FMMonth DDth, YYYY') AS "Release Date"
FROM
	MOVIES;

SELECT
	MOVIE_NAME,
	RELEASE_DATE,
	TO_CHAR(RELEASE_DATE, 'FMMonth DDth, YYYY HH:MI:SS TZ') AS "Release Date"
FROM
	MOVIES;

SELECT
	MOVIE_NAME,
	RELEASE_DATE
FROM
	MOVIES;

SELECT
	MOVIE_NAME,
	RELEASE_DATE,
	TO_CHAR(RELEASE_DATE, 'FMMonth DDth, YYYY hh:mm:ss tz')
FROM
	MOVIES;

----------------------------------------------------------------------------------------------------
-- DATE CONSTRUCTION FUNCTIONS
-- MAKE_DATE FUNCTION
SELECT
	MAKE_DATE(2004, 05, 14);

-- MAKE_TIME FUNCTION
SELECT
	MAKE_TIME(5, 55, 55.00);

--MAKE_TIMESTAMP FUNCTION
SELECT
	MAKE_TIMESTAMP(2004, 05, 14, 5, 55, 55);

-- MAKE_INTERVAL FUNCTION 
SELECT
	MAKE_INTERVAL(2004, 05, 14, 5, 55, 55);

SELECT
	MAKE_INTERVAL(2004, 05, 14, 5, 55, 55),
	MAKE_INTERVAL(2004, 05, 14, 10, 55, 55);

SELECT
	MAKE_INTERVAL(DAYS => 14);

SELECT
	MAKE_INTERVAL(MONTHS => 5, DAYS => 14, MINS => 55);

SELECT
	MAKE_INTERVAL(WEEKS => 2);

-- MAKE_TIMESTAMPTZ FUNCTION
SELECT
	MAKE_TIMESTAMPTZ(2004, 05, 14, 5, 55, 55.00);

SELECT
	PG_TYPEOF(MAKE_TIMESTAMPTZ(2004, 05, 14, 5, 55, 55.00));

SELECT
	*
FROM
	PG_TIMEZONE_NAMES;

SELECT
	*
FROM
	PG_TIMEZONE_ABBREVS;

SELECT
	MAKE_TIMESTAMPTZ(2004, 05, 14, 5, 55, 55.00, 'Asia/Kolkata');

----------------------------------------------------------------------------------------------------
-- Date Value Extractors functions
SELECT
	EXTRACT(
		'DAY'
		FROM
			CURRENT_TIMESTAMP
	);

SELECT
	EXTRACT(
		'DAY'
		FROM
			CURRENT_TIMESTAMP
	) "DAY",
	EXTRACT(
		'MONTH'
		FROM
			CURRENT_TIMESTAMP
	) "MONTH",
	EXTRACT(
		'YEAR'
		FROM
			CURRENT_TIMESTAMP
	) "YEAR";

SELECT
	EXTRACT(
		'EPOCH'
		FROM
			CURRENT_TIMESTAMP
	);

SELECT
	EXTRACT(
		'CENTURY'
		FROM
			INTERVAL '500 YEARS 2 MONTHS 11 DAYS'
	);

----------------------------------------------------------------------------------------------------
-- Using math operators with dates
SELECT
	DATE '20040514' + 5;

SELECT
	'20040514'::DATE + 5;

SELECT
	TIME '23:59:59' + INTERVAL '1 SECOND';

SELECT
	TIME '23:59:59' + INTERVAL '2 SECOND';

SELECT
	CURRENT_TIMESTAMP + '1:01:01';

SELECT
	DATE '20200101' + TIME '10:25:10';

SELECT
	DATE '20200101' - INTERVAL '1 HOUR' AS "AN HOUR AGO";

SELECT
	INTERVAL '30 MINUTES' + INTERVAL '30 MINUTES';

SELECT
	INTERVAL '30 MINUTES' - INTERVAL '15 MINUTES' AS "QUARTER HOUR";

SELECT
	INTERVAL '30 MINUTES' + INTERVAL '1 DAY';

SELECT
	INTERVAL '2:00' / 2;

----------------------------------------------------------------------------------------------------
-- OVERLAPS Operator
SELECT
	(DATE '2020-01-01', DATE '2020-12-31') OVERLAPS (DATE '2020-10-12', DATE '2020-12-01');

SELECT
	(DATE '2020-01-01', INTERVAL '100 DAYS') OVERLAPS (DATE '2020-10-12', DATE '2020-12-01');

----------------------------------------------------------------------------------------------------
-- Date / Time Functions
SELECT
	CURRENT_DATE;

SELECT
	CURRENT_DATE,
	CURRENT_TIME;

SELECT
	CURRENT_DATE,
	CURRENT_TIME,
	CURRENT_TIMESTAMP;

SELECT
	LOCALTIME;

SELECT
	LOCALTIMESTAMP;

SELECT
	CURRENT_TIME,
	CURRENT_TIME(2),
	CURRENT_TIMESTAMP,
	CURRENT_TIMESTAMP(2),
	LOCALTIME,
	LOCALTIME(3),
	LOCALTIMESTAMP,
	LOCALTIMESTAMP(6);

----------------------------------------------------------------------------------------------------
-- PostgreSQL Date / Time Functions
SELECT
	NOW(),
	TRANSACTION_TIMESTAMP(),
	STATEMENT_TIMESTAMP(),
	CLOCK_TIMESTAMP(),
	TIMEOFDAY();

----------------------------------------------------------------------------------------------------
-- AGE FUNCTION
SELECT
	AGE ('2020-01-01', '2019-10-01');

SELECT
	AGE (TIMESTAMP '2019-02-07');

SELECT
	AGE (CURRENT_DATE, TIMESTAMP '2019-02-07');

SELECT
	AGE (TIMESTAMP '2004-05-14');

SELECT
	AGE ('2010-01-01', '2020-01-01');

----------------------------------------------------------------------------------------------------
-- CURRENT_DATE function
SELECT
	CURRENT_DATE + 5 - 10;

----------------------------------------------------------------------------------------------------
-- CURRENT_TIME function
CREATE TABLE LOGS (
	LOG_ID SERIAL PRIMARY KEY,
	ADD_DATE DATE DEFAULT CURRENT_DATE,
	ADD_TIME TIME DEFAULT CURRENT_TIME
);

INSERT INTO
	LOGS (LOG_ID)
VALUES
	(1),
	(2),
	(3),
	(4);

SELECT
	*
FROM
	LOGS;

----------------------------------------------------------------------------------------------------
-- Date accuracy with EPOCH
SELECT
	AGE (TIMESTAMP '2020-12-20', TIMESTAMP '2020-10-20');

SELECT
	EXTRACT(
		'EPOCH'
		FROM
			TIMESTAMPTZ '2020-12-20'
	) - EXTRACT(
		'EPOCH'
		FROM
			TIMESTAMPTZ '2020-10-20'
	);

SELECT
	(
		EXTRACT(
			'EPOCH'
			FROM
				TIMESTAMPTZ '2020-12-20'
		) - EXTRACT(
			'EPOCH'
			FROM
				TIMESTAMPTZ '2020-10-20'
		)
	) / 60 / 60 / 24;

SELECT
	(
		EXTRACT(
			'EPOCH'
			FROM
				TIMESTAMPTZ '2020-12-20'
		) - EXTRACT(
			'EPOCH'
			FROM
				TIMESTAMPTZ '2020-10-20'
		)
	) / 60 / 60 / 24,
	TIMESTAMPTZ '2020-12-20' - TIMESTAMPTZ '2020-10-20',
	AGE (
		TIMESTAMPTZ '2020-12-20',
		TIMESTAMPTZ '2020-10-20'
	);

----------------------------------------------------------------------------------------------------
-- Using Date, time, timestamp in tables
CREATE TABLE TIMES (
	TIMES_ID SERIAL PRIMARY KEY,
	START_DATE DATE,
	START_TIME TIME,
	START_TIMESTAMP TIMESTAMP
);

INSERT INTO
	TIMES (START_DATE, START_TIME, START_TIMESTAMP)
VALUES
	('epoch', 'allballs', 'infinity');

INSERT INTO
	TIMES (START_DATE, START_TIME, START_TIMESTAMP)
VALUES
	('epoch', 'allballs', '-infinity');

INSERT INTO
	TIMES (START_DATE, START_TIME, START_TIMESTAMP)
VALUES
	(NOW(), 'allballs', 'tomorrow');

SELECT
	*
FROM
	TIMES;

----------------------------------------------------------------------------------------------------
-- TIMEZONE
SHOW TIMEZONE;

SHOW TIME ZONE;

SET
	TIMEZONE = 'US/Alaska';

SET
	TIME ZONE 'America/New_York';

ALTER TABLE TIMES
ADD COLUMN END_TIMESTAMP TIMESTAMP WITH TIME ZONE,
ADD COLUMN END_TIME TIME WITH TIME ZONE;

INSERT INTO
	TIMES (END_TIMESTAMP, END_TIME)
VALUES
	('2020-01-20 11:30:00 US/Pacific', '11:30:00+6'),
	('2020-06-20 11:30:00 US/Pacific', '11:30:00+6');

SELECT
	*
FROM
	TIMES;

SET
	TIME ZONE 'US/Pacific';

SELECT
	*
FROM
	TIMES;

----------------------------------------------------------------------------------------------------
-- DATE_PART FUNCTION
SELECT
	DATE_PART('YEAR', TIMESTAMP '2017-01-01');

SELECT
	DATE_PART('YEAR', TIMESTAMP '2017-01-01'),
	DATE_PART('QUARTER', TIMESTAMP '2017-05-01'),
	DATE_PART('MONTH', TIMESTAMP '2017-01-01'),
	DATE_PART('DECADE', TIMESTAMP '2017-01-01'),
	DATE_PART('CENTURY', TIMESTAMP '2017-01-01');

SELECT
	DATE_PART('WEEK', TIMESTAMP '2017-01-01'),
	DATE_PART('DOW', TIMESTAMP '2017-01-01'),
	DATE_PART('DOY', TIMESTAMP '2017-01-01'),
	DATE_PART('DAY', TIMESTAMP '2017-01-01'),
	DATE_PART('HOUR', TIMESTAMP '2017-01-01 10:20:30'),
	DATE_PART('MINUTE', TIMESTAMP '2017-01-01 10:20:30'),
	DATE_PART('SECOND', TIMESTAMP '2017-01-01 10:20:20.45');

SELECT
	MOVIE_NAME,
	RELEASE_DATE,
	DATE_PART('WEEK', RELEASE_DATE) AS "Release Week",
	DATE_PART('MONTH', RELEASE_DATE) AS "Release Month"
FROM
	MOVIES
ORDER BY
	4;

----------------------------------------------------------------------------------------------------
-- DATE_TRUNC FUNCTION
SELECT
	DATE_TRUNC('HOUR', TIMESTAMP '2020-10-01 05:15:45');

SELECT
	DATE_TRUNC('HOUR', TIMESTAMP '2020-10-01 05:15:45'),
	DATE_TRUNC('MINUTE', TIMESTAMP '2020-10-01 05:15:45'),
	DATE_TRUNC('SECOND', TIMESTAMP '2020-10-01 05:15:45.35222');

SELECT
	DATE_TRUNC('MONTH', RELEASE_DATE) AS "Release Month",
	COUNT(MOVIE_NAME)
FROM
	MOVIES
GROUP BY
	"Release Month"
ORDER BY
	2 DESC;