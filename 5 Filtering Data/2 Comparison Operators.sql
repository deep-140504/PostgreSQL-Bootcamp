-- greater than
SELECT
	*
FROM
	MOVIES
WHERE
	MOVIE_LENGTH > 100
ORDER BY
	MOVIE_LENGTH;

-- greater than or equal to
SELECT
	*
FROM
	MOVIES
WHERE
	MOVIE_LENGTH >= 100
ORDER BY
	MOVIE_LENGTH;

-- less than
SELECT
	*
FROM
	MOVIES
WHERE
	MOVIE_LENGTH < 100
ORDER BY
	MOVIE_LENGTH;

-- less than or equal to
SELECT
	*
FROM
	MOVIES
WHERE
	MOVIE_LENGTH <= 100
ORDER BY
	MOVIE_LENGTH;

-- logical comparison on date time column value
SELECT
	*
FROM
	MOVIES
WHERE
	-- release_date = 1999-12-31 this will give an error as of no quotes applied
	RELEASE_DATE > '1999-12-31'
ORDER BY
	RELEASE_DATE;

-- logical comparison on text type columns
SELECT
	*
FROM
	MOVIES
WHERE
	MOVIE_LANGUAGE > 'English'
	-- so, PostgreSQL does lexicographical comparison to yield the results
ORDER BY
	MOVIE_LANGUAGE;

SELECT
	*
FROM
	MOVIES
WHERE
	MOVIE_LANGUAGE < 'English'
	-- so, PostgreSQL does lexicographical comparison to yield the results
ORDER BY
	MOVIE_LANGUAGE;

SELECT
	*
FROM
	MOVIES
WHERE
	MOVIE_LANGUAGE != 'English'
	-- so, PostgreSQL does lexicographical comparison to yield the results
ORDER BY
	MOVIE_LANGUAGE;

SELECT
	*
FROM
	MOVIES
WHERE
	MOVIE_LENGTH > 100 -- this gives same result, with and without quotations
ORDER BY
	MOVIE_LENGTH;