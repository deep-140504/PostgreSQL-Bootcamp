-- where with condition (AND | OR)
-- AND Operation
SELECT
	*
FROM
	MOVIES;

SELECT
	*
FROM
	MOVIES
WHERE
	MOVIE_LANGUAGE = 'English';

SELECT
	*
FROM
	MOVIES
WHERE
	MOVIE_LANGUAGE = 'Japanese';

SELECT
	*
FROM
	MOVIES
WHERE
	MOVIE_LANGUAGE = 'Chinese'
	AND AGE_CERTIFICATE = '15';

-- OR Operator
SELECT
	*
FROM
	MOVIES
WHERE
	MOVIE_LANGUAGE = 'English'
	OR MOVIE_LANGUAGE = 'Chinese'
ORDER BY
	MOVIE_LANGUAGE;

SELECT
	*
FROM
	MOVIES
WHERE
	MOVIE_LANGUAGE = 'English'
	AND DIRECTOR_ID = '8';

-- Combining and, or operators
SELECT
	*
FROM
	MOVIES
WHERE
	(
		MOVIE_LANGUAGE = 'English'
		OR MOVIE_LANGUAGE = 'Chinese'
	)
	AND AGE_CERTIFICATE = '12'
ORDER BY
	MOVIE_LANGUAGE;

-- to avoid conflicts, use parenthisis
-- can not use "" and on w/o any ''
-- only '' is permitted
-- 	• Aliases  can not be put inside of the single quotes ''
-- 	• Aliases can also be without quotation, only if the aliases are of single words, no special characters, and case insensitive, as the PostgreSQL converts the unquoted aliases into the lowercase as a convection
-- It is preferred to put aliases into the ""
-- where clause
SELECT
	*
FROM
	MOVIES
WHERE
	MOVIE_LANGUAGE = 'English'
	-- EXECUTION ORDER OF AND, OR OPERATORS
	/*
	AND OPERATOR IS PROCESSED FIRST AND OR OPERATOR IS PROCESSES SECOND
	UNLESS PARENTHESES ARE USED
	*/
	-- EXECUTION ORDER OF SELECT, FROM, WHERE AND ORDER BY
	/*
	FROM IS PROCESSED FIRST
	THEN WHERE IS PROCESSED SECOND
	THEN SELECT IS PROCESSED THIRD
	THEN ORDER BY IS PROCESSED LAST
	*/