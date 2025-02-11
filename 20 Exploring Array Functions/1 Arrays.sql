SELECT
	INT4RANGE (1, 6) AS "(CLOSE-OPEN)[)",
	NUMRANGE (1.234, 3.14, '[]'),
	DATERANGE ('20040514', '20250101', '()'),
	TSRANGE (
		LOCALTIMESTAMP,
		LOCALTIMESTAMP + INTERVAL '8 Days',
		'(]'
	);

SELECT
	ARRAY[1, 2, 3] AS "Int Array",
	ARRAY[2.12225::FLOAT] AS " Float Array",
	ARRAY[2.12225::INT] AS "FLOAT TO INT Array",
	ARRAY[CURRENT_DATE, CURRENT_DATE + 5] AS "Date Array";

----------------------------------------------------------------------------------------------------
-- Using comparison operators
SELECT
	ARRAY[1, 2, 3] || ARRAY[4, 5, 6];

SELECT
	ARRAY_CAT(ARRAY[1, 2, 3], ARRAY[4, 5, 6]);

SELECT
	4 || ARRAY[1, 2, 3];

SELECT
	ARRAY_PREPEND(4, ARRAY[1, 2, 3]);

SELECT
	ARRAY[1, 2, 3] || 4;

SELECT
	ARRAY_APPEND(ARRAY[1, 2, 3], 4);

----------------------------------------------------------------------------------------------------
-- ARRAY METADATA FUNCTIONS
-- ARRAY_NDIMS FUNCTION
SELECT
	ARRAY_NDIMS(ARRAY[1, 2, 3, 4]);

SELECT
	ARRAY_NDIMS(ARRAY[[1], [2]]);

SELECT
	ARRAY_NDIMS(ARRAY[[1, 2, 3], [4, 5, 6]]);

-- ARRAY_DIMS FUNCTION
SELECT
	ARRAY_DIMS(ARRAY[[1], [2]]);

-- ARRAY_LENGTH FUNCTION
SELECT
	ARRAY_LENGTH(ARRAY[1, 2, 3, 4], 1);

SELECT
	ARRAY_LENGTH(ARRAY[]::INTEGER[], 1);

-- ARRAY_LOWER FUNCTION
SELECT
	ARRAY_LOWER(ARRAY[1, 2, 3, 4], 1);

-- ARRAY_UPPER FUNCTION
SELECT
	ARRAY_UPPER(ARRAY[1, 2, 3, 4], 1);

-- CARDINALITY FUNCTION
SELECT
	CARDINALITY(ARRAY[[1], [2], [3], [4]]),
	CARDINALITY(ARRAY[[1], [2], [3], [4], [5]]);

----------------------------------------------------------------------------------------------------
-- Array search functions
-- ARRAY_POSITION FUNCTION
SELECT
	ARRAY_POSITION(ARRAY['Jan', 'Feb', 'March', 'Apr'], 'Feb');

SELECT
	ARRAY_POSITION(ARRAY[1, 2, 2, 3, 4], 2);

SELECT
	ARRAY_POSITION(ARRAY[1, 2, 2, 3, 4], 2, 3);

-- ARRAY_POSITIONS FUNCTION
SELECT
	ARRAY_POSITIONS(ARRAY[1, 2, 2, 3, 4], 2);

SELECT
	ARRAY_POSITIONS(ARRAY[1, 2, 2, 3, 4], 10);

----------------------------------------------------------------------------------------------------
-- Array modification functions
SELECT
	ARRAY_CAT(ARRAY['Jan', 'Feb'], ARRAY['Mar', 'Apr']);

SELECT
	ARRAY_APPEND(ARRAY[1, 2, 3], 4);

SELECT
	ARRAY_PREPEND(4, ARRAY[1, 2, 3]);

-- ARRAY_REMOVE FUNCTION
SELECT
	ARRAY_REMOVE(ARRAY[1, 2, 3, 4], 4);

-- ARRAY_REPLACE FUNCTION
SELECT
	ARRAY_REPLACE(ARRAY[1, 2, 3, 4], 2, 5);

SELECT
	ARRAY_REPLACE(ARRAY[1, 2, 3, 2, 4], 2, 5);

----------------------------------------------------------------------------------------------------
-- IN OPERATOR
SELECT
	20 IN (1, 2, 20, 40) AS "Is There";

SELECT
	25 IN (1, 2, 20, 40) AS "Is There";

-- NOT IN OPERATOR
SELECT
	20 NOT IN (1, 2, 20, 40) AS "Is Not There";

SELECT
	25 NOT IN (1, 2, 20, 40) AS "Is Not There";

-- ALL OPERATOR
SELECT
	25 = ALL (ARRAY[20, 25, 30, 35, 40]) AS "Is All";

SELECT
	25 = ALL (ARRAY[25, 25]) AS "Is All";

-- ANY/SOME OPERATOR
SELECT
	25 = ANY (ARRAY[1, 2, 25]) AS "Is Any";

SELECT
	20 = ANY (ARRAY[1, 2, 25]) AS "Is Any";

SELECT
	25 = ANY (ARRAY[1, 2, 25, NULL]) AS "Is Any";

SELECT
	25 <> ANY (ARRAY[1, 2, 25, NULL]) AS "Is Any";

SELECT
	25 = SOME (ARRAY[1, 2, 3, 4]) AS "Is Some";

SELECT
	25 = SOME (ARRAY[1, 2, 3, 4, 25]) AS "Is Some";

----------------------------------------------------------------------------------------------------
-- FORMATTING AND CONVERTING
-- STRING_TO_ARRAY FUNCTION
SELECT
	STRING_TO_ARRAY('1, 2, 3, 4, 5', ', ');

SELECT
	STRING_TO_ARRAY('1, 2, 3, 4, abc', ', ', 'abc');

SELECT
	STRING_TO_ARRAY('1, 2, 3, 4, , 6', ', ', '');

-- ARRAY_TO_STRING FUNCTION
SELECT
	ARRAY_TO_STRING(ARRAY[1, 2, 3, 4], '|');

SELECT
	ARRAY_TO_STRING(ARRAY[1, 2, NULL, 4], '|');

SELECT
	ARRAY_TO_STRING(ARRAY[1, 2, NULL, 4], '|', 'EMPTY_DATA');

----------------------------------------------------------------------------------------------------
-- Insert data into arrays
CREATE TABLE TEACHERS2 (
	TEACHER_ID SERIAL PRIMARY KEY,
	NAME VARCHAR(150),
	PHONES TEXT ARRAY[1]
);

INSERT INTO
	TEACHERS2 (NAME, PHONES)
VALUES
	('Adam', ARRAY['(111)-222-3333', '(555)-666-7777']);

SELECT
	*
FROM
	TEACHERS2;

----------------------------------------------------------------------------------------------------
-- QUERY ARRAY DATA
-- DISPLAY ARRAY ELEMENTS
SELECT
	TEACHER_ID,
	NAME,
	UNNEST(PHONES)
FROM
	TEACHERS2;

SELECT
	TEACHER_ID,
	NAME,
	UNNEST(PHONES)
FROM
	TEACHERS2
ORDER BY
	3;

-- MULTI DIMENSIONAL ARRAYS
CREATE TABLE STUDENTS (
	STUDENT_ID SERIAL PRIMARY KEY,
	STUDENT_NAME VARCHAR(100),
	STUDENT_GRADE INTEGER[] []
);

INSERT INTO
	STUDENTS (STUDENT_NAME, STUDENT_GRADE)
VALUES
	('S1', '{90, 2020}');

SELECT
	*
FROM
	STUDENTS;

INSERT INTO
	STUDENTS (STUDENT_NAME, STUDENT_GRADE)
VALUES
	('S2', '{80, 2020}'),
	('S3', '{70, 2019}'),
	('S2', '{60, 2019}');

SELECT
	*
FROM
	STUDENTS;

SELECT
	STUDENT_GRADE[1]
FROM
	STUDENTS;

SELECT
	STUDENT_GRADE[2]
FROM
	STUDENTS;

SELECT
	*
FROM
	STUDENTS
WHERE
	STUDENT_GRADE[2] = '2020';

SELECT
	*
FROM
	STUDENTS
WHERE
	STUDENT_GRADE @> '{2020}';

SELECT
	*
FROM
	STUDENTS
WHERE
	2020 = ANY (STUDENT_GRADE);

SELECT
	*
FROM
	STUDENTS
WHERE
	STUDENT_GRADE[1] > '80';