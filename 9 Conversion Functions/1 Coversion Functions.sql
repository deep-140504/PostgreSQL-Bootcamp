-- TO_CHAR
SELECT
	TO_CHAR(100000, '9,99999');

SELECT
	RELEASE_DATE,
	TO_CHAR(RELEASE_DATE, 'DD-MM-YYYY'),
	TO_CHAR(RELEASE_DATE, 'DY, MM, YYYY'),
	TO_CHAR(RELEASE_DATE, 'DD, MM, YYYY')
FROM
	MOVIES;

-- here it requires of explicit type cast from string to timestamp
SELECT
	TO_CHAR(TIMESTAMP '2020-01-01 10:30:45', 'HH24:MI:SS');

SELECT
	MOVIE_ID,
	REVENUES_DOMESTIC,
	TO_CHAR(REVENUES_DOMESTIC, '$999D99'),
	TO_CHAR(REVENUES_DOMESTIC, '$999.99')
FROM
	MOVIES_REVENUES;

-- TO_NUMBER FUNCTION
SELECT
	TO_NUMBER('1420.89', '9999.99');

SELECT
	TO_NUMBER('10,625.78-', '99G999D99S');

SELECT
	TO_NUMBER('$1,420.64', 'L9G999D99');

SELECT
	TO_NUMBER('1,234,567.89', '9G999G999');

SELECT
	TO_NUMBER('1,234,567.89', '9G999G999D99');

SELECT
	TO_NUMBER('$1,978,299.78', 'L9G999G999D99');

-- TO_DATE FUNCTION
-- to date functions converts the corresponding format into yyyy-mm-dd format
-- so in the function second arguments specifies the pattern of the first argument
SELECT
	TO_DATE('2020/10/22', 'YYYY/MM/DD');

-- in below two examples, it converts 20 to 2020 and 99 to 1999, so it is smart enough to understand what value to put 
SELECT
	TO_DATE('102220', 'MMDDYY');

SELECT
	TO_DATE('102299', 'MMDDYY');

SELECT
	TO_DATE('October 22, 2020', 'Month DD, YYYY');

SELECT
	TO_DATE('2020/10/22', 'YYYY/MM/DD');