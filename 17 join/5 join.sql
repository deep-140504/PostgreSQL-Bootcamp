----------------------------------------------------------------------------------------------------
-- Joining multiple tables
SELECT
	T1.COL,
	T2.COL,
	T3.COL
FROM
	TABLE1 T1
	JOIN TABLE2 T2 ON T1.COL = T2.COL
	JOIN TABLE3 T2 ON T1.COL = T3.COL;

-- JOINING MOVIES, DIRECTORS AND MOVIE REVENUES TABLES
SELECT
	*
FROM
	MOVIES MV
	JOIN DIRECTORS D ON D.DIRECTOR_ID = MV.DIRECTOR_ID
	-- JOIN MOVIES_REVENUES R ON R.MOVIE_ID = D.MOVIE_ID
	JOIN MOVIES_REVENUES R ON R.MOVIE_ID = MV.MOVIE_ID;

SELECT
	*
FROM
	MOVIES MV
	JOIN MOVIES_REVENUES R ON R.MOVIE_ID = MV.MOVIE_ID
	JOIN DIRECTORS D ON D.DIRECTOR_ID = MV.DIRECTOR_ID;

SELECT
	*
FROM
	ACTORS AS AC
	JOIN MOVIES_ACTORS AS MA USING (ACTOR_ID)
	JOIN MOVIES AS MV USING (MOVIE_ID)
	JOIN DIRECTORS AS DR USING (DIRECTOR_ID)
	JOIN MOVIES_REVENUES AS MR USING (MOVIE_ID);
