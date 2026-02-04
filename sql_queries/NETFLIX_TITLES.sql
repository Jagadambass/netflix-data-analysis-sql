/*
		-- 15 Business Problems & Solutions

		1. Count the number of Movies vs TV Shows
		2. Find the most common rating for movies and TV shows
		3. List all movies released in a specific year (e.g., 2020)
		4. Find the top 5 countries with the most content on Netflix
		5. Identify the longest movie
		6. Find content added in the last 5 years
		7. Find all the movies/TV shows by director 'Rajiv Chilaka'!
		8. List all TV shows with more than 5 seasons
		9. Count the number of content items in each genre
		10.Find each year and the average numbers of content released in India on netflix. 
		return top 5 year with highest avg content release!
		11. List all movies that are documentaries
		12. Find all content without a director
		13. Find how many movies actor 'Salman Khan' appeared in the last 10 years!
		14. Find the top 10 actors who have appeared in the highest number of movies produced in India.
		15.
		Categorize the content based on the presence of the keywords 'kill' and 'violence' in 
		the description field. Label content containing these keywords as 'Bad' and all other 
		content as 'Good'. Count how many items fall into each category.

*/
-- show_id	type	title	director	cast	country	date_added	release_year	rating	duration	listed_in	description
CREATE DATABASE JAY_NETFLIX;
USE JAY_NETFLIX;


CREATE TABLE netflix (
	show_id        VARCHAR(20) PRIMARY KEY,
	type           VARCHAR(20),
	title          VARCHAR(255),
	director       VARCHAR(255),
	cast           TEXT,
	country        VARCHAR(255),
	date_added     DATE,
	release_year   INT,
	rating         VARCHAR(20),
	duration       VARCHAR(50),
	listed_in      VARCHAR(255),
	description    TEXT
);

SHOW WARNINGS ;

DESCRIBE netflix;

/* 
		✅ 2️⃣ Convert columns to proper data types
		🔹 A. Convert show_id
 */
ALTER TABLE netflix
MODIFY show_id VARCHAR(20);

-- 		🔹 B. Convert type, title, director, country, rating

ALTER TABLE netflix
MODIFY type VARCHAR(20),
MODIFY title VARCHAR(255),
MODIFY director VARCHAR(255),
MODIFY country VARCHAR(255),
MODIFY rating VARCHAR(20);

ALTER TABLE netflix
MODIFY cast TEXT;

ALTER TABLE netflix
MODIFY release_year INT;

ALTER TABLE netflix
MODIFY duration VARCHAR(50);

SET SQL_SAFE_UPDATES = 0;

-- September 9, 2023
-- Step 1: Convert text → DATE safely
UPDATE netflix
SET date_added = STR_TO_DATE(date_added, '%D %M, %Y')
WHERE date_added IS NOT NULL;

-- Step 2: Change column type

ALTER TABLE netflix
MODIFY date_added DATE;

--  3️⃣ Final clean structure (recommended)

ALTER TABLE netflix
MODIFY show_id VARCHAR(20) PRIMARY KEY,
MODIFY type VARCHAR(20),
MODIFY title VARCHAR(255),
MODIFY director VARCHAR(255),
MODIFY cast TEXT,
MODIFY country VARCHAR(255),
MODIFY date_added DATE,
MODIFY release_year INT,
MODIFY rating VARCHAR(20),
MODIFY duration VARCHAR(50);

-- 🔍 Verify

DESCRIBE netflix;


SELECT date_added
FROM netflix
WHERE STR_TO_DATE(date_added, '%M %d, %Y') IS NULL
AND date_added IS NOT NULL;


-- VERIFY DATA SETS 

SELECT release_year, COUNT(*) ALL_MOVIES_YEAR_WISE
FROM netflix
GROUP BY release_year
ORDER BY ALL_MOVIES_YEAR_WISE DESC;

SELECT type, COUNT(*) ALL_MOVIES 
FROM netflix
GROUP BY type;

DESCRIBE netflix;
SELECT * FROM netflix;

INSERT INTO NETFLIX
(show_id, type, title, director, cast, country, date_added, release_year, rating, duration, listed_in, description)
VALUES
('s08808', 'Movie', 'Radhe: Your Most Wanted Bhai', 'Prabhu Deva',
 'Salman Khan, Disha Patani, Randeep Hooda',
 'India', NULL, 2021, '1.8', '114 min',
 'Action, Thriller',
 'An undercover officer sets out to eliminate a dangerous drug mafia.'),

('s08809', 'Movie', 'Antim: The Final Truth', 'Mahesh Manjrekar',
 'Salman Khan, Aayush Sharma, Mahima Makwana',
 'India', NULL, 2021, '6.3', '135 min',
 'Action, Drama',
 'A cop battles a rising gangster whose ideology challenges the system.'),

('s08810', 'Movie', 'Tiger 3', 'Maneesh Sharma',
 'Salman Khan, Katrina Kaif, Emraan Hashmi',
 'India', NULL, 2023, '5.6', '156 min',
 'Action, Thriller, Spy',
 'Tiger and Zoya fight a new enemy threatening national security.'),

('s08811', 'Movie', 'Kisi Ka Bhai Kisi Ki Jaan', 'Farhad Samji',
 'Salman Khan, Pooja Hegde, Venkatesh Daggubati',
 'India', NULL, 2023, '3.9', '145 min',
 'Action, Family, Drama',
 'An elder brother sacrifices love to keep his family united.'),

('s08812', 'Movie', 'Sikandar', 'A. R. Murugadoss',
 'Salman Khan, Rashmika Mandanna, Kajal Aggarwal',
 'India', NULL, 2025, 'N/A', '150 min',
 'Action, Drama',
 'A powerful man rises against corruption and injustice.'),

('s08813', 'Movie', 'Jai Ho', 'Sohail Khan',
 'Salman Khan, Daisy Shah',
 'India', NULL, 2014, '5.0', '145 min',
 'Action, Drama',
 'A former army officer helps common people fight corruption.'),

('s08814', 'Movie', 'Kick', 'Sajid Nadiadwala',
 'Salman Khan, Jacqueline Fernandez, Randeep Hooda',
 'India', NULL, 2014, '5.4', '146 min',
 'Action, Comedy',
 'A thrill-seeking man becomes a vigilante pursued by a tough cop.'),

('s08815', 'Movie', 'Bajrangi Bhaijaan', 'Kabir Khan',
 'Salman Khan, Kareena Kapoor, Harshaali Malhotra',
 'India', NULL, 2015, '8.1', '159 min',
 'Drama, Adventure',
 'A man sets out to reunite a mute Pakistani girl with her family.'),

('s08816', 'Movie', 'Prem Ratan Dhan Payo', 'Sooraj R. Barjatya',
 'Salman Khan, Sonam Kapoor',
 'India', NULL, 2015, '4.4', '164 min',
 'Romance, Drama',
 'A look-alike steps in to protect a royal heir and restore family values.'),

('s08817', 'Movie', 'Sultan', 'Ali Abbas Zafar',
 'Salman Khan, Anushka Sharma',
 'India', NULL, 2016, '7.0', '170 min',
 'Action, Sports, Drama',
 'A wrestler battles personal loss and makes a powerful comeback.'),

('s08818', 'Movie', 'Tubelight', 'Kabir Khan',
 'Salman Khan, Sohail Khan, Zhu Zhu',
 'India', NULL, 2017, '4.0', '136 min',
 'Drama, War',
 'A simple man believes love and faith can overcome war.'),

('s08819', 'Movie', 'Tiger Zinda Hai', 'Ali Abbas Zafar',
 'Salman Khan, Katrina Kaif',
 'India', NULL, 2017, '5.9', '161 min',
 'Action, Thriller, Spy',
 'RAW agent Tiger returns to rescue hostages from terrorists.'),

('s08820', 'Movie', 'Race 3', 'Remo D''Souza',
 'Salman Khan, Anil Kapoor, Bobby Deol',
 'India', NULL, 2018, '1.9', '160 min',
 'Action, Thriller',
 'A crime family faces betrayal, revenge, and power struggles.'),

('s08821', 'Movie', 'Bharat', 'Ali Abbas Zafar',
 'Salman Khan, Katrina Kaif, Sunil Grover',
 'India', NULL, 2019, '5.0', '155 min',
 'Drama',
 'A man’s journey mirrors India’s post-independence history.'),

('s08822', 'Movie', 'Dabangg 3', 'Prabhu Deva',
 'Salman Khan, Sonakshi Sinha',
 'India', NULL, 2019, '3.0', '160 min',
 'Action, Comedy',
 'Chulbul Pandey faces enemies from his past in this cop drama.');
/*
##################################################################################################################
		1. Count the number of Movies vs TV Shows
##################################################################################################################
*/

SELECT * FROM netflix;
SELECT 
    TYPE,
    COUNT(type) AS COUNT_OF_MOVIES,
    COUNT(type) AS COUNT_OF_TVSHOWS
FROM
    netflix
GROUP BY TYPE ;
/*
##################################################################################################################
		2. Find the most common rating for movies and TV shows
##################################################################################################################
*/
SELECT 
    TYPE,
    RATING,
    COUNT(*) AS RATING_COUNT,
    COUNT(RATING) AS MOST_RATING_COUNT
FROM
    netflix
WHERE
    RATING IS NOT NULL
GROUP BY RATING
ORDER BY RATING_COUNT DESC
LIMIT 4;

/*
##################################################################################################################
		3. List all movies released in a specific year (e.g., 2020)
##################################################################################################################
*/

SELECT 
    TITLE, RELEASE_YEAR
FROM
    netflix
WHERE
    TYPE = 'MOVIE' AND RELEASE_YEAR = 2020
        OR RELEASE_YEAR = 2019 ; -- YEAR YOU CAN CHANGE AND CHECK TABLE DATA

/*   ##################################################################################################################
		4. Find the top 5 countries with the most content on Netflix
##################################################################################################################   */

SELECT 
    TYPE,
    RATING,
    country,
    COUNT(*) AS RATING_COUNT,
    COUNT(country) AS MOST_country_COUNT
FROM
    netflix
WHERE
    country IS NOT NULL
GROUP BY country
ORDER BY MOST_country_COUNT DESC
LIMIT 6;

/*
##################################################################################################################
		5. Identify the longest movie
##################################################################################################################
*/
SELECT 
    TYPE, duration, COUNT(DURATION) AS MOST_DURATION_COUNT
FROM
    netflix
WHERE
    DURATION = '1 Season'
        OR DURATION = '2 Seasons'  OR DURATION = '3 Seasons'
        OR DURATION = '4 Seasons'  OR DURATION = '5 Seasons'
		OR DURATION = '6 Seasons'  OR DURATION = '7 Seasons'
        OR DURATION = '8 Seasons'  OR DURATION = '9 Seasons'
        AND DURATION LIKE '__SEASON_'    OR DURATION LIKE "___MIN"
GROUP BY DURATION
ORDER BY MOST_DURATION_COUNT DESC
LIMIT 5;

SELECT * FROM netflix;

/*
##################################################################################################################
		5. Identify the longest movie OR TV SHOWS(SEASON)
##################################################################################################################
*/
SELECT 
    TYPE,
    TITLE,
    DURATION,
    RELEASE_YEAR,
    director,
    COUNT(DURATION) AS COUNT_DURATION,
    AVG(DURATION) AS AVG_DURATION
FROM
    netflix
GROUP BY DURATION
HAVING AVG_DURATION >= 100
    AND COUNT_DURATION >= 2;

/*
##################################################################################################################
		6. Find all the movies/TV shows by COUNTRY 'UNITED STATES'!
##################################################################################################################
*/
SELECT 
    TYPE,
    TITLE,
    DIRECTOR,
    DURATION,
    AVG(DURATION) AS AVG_DURATION_ABOVE,
    COUNTRY
FROM
    netflix
WHERE
    COUNTRY = 'United States'
GROUP BY DURATION
HAVING AVG_DURATION_ABOVE >= 100;

/*
##################################################################################################################
		7. List all TV shows with more than 5 seasons
##################################################################################################################
*/
 
 SELECT * FROM netflix;
 
SELECT 
    show_id, TYPE, title, duration 
FROM
    netflix
WHERE
    type = 'TV Show'
        AND CAST(SUBSTRING_INDEX(duration, ' ', 1) AS UNSIGNED) > 5
ORDER BY show_id OR DURATION DESC;

/* 
##########################################################################################################
		8. Count the number of content items in each genre       
##########################################################################################################
*/
 WITH RECURSIVE genre_split AS (
    SELECT 
        show_id,  TRIM(SUBSTRING_INDEX(listed_in, ',', 1)) AS genre,
        SUBSTRING(listed_in, LENGTH(SUBSTRING_INDEX(listed_in, ',', 1)) + 2) AS rest
    FROM netflix
    UNION ALL
    SELECT  show_id,  TRIM(SUBSTRING_INDEX(rest, ',', 1)) AS genre,
        SUBSTRING(rest, LENGTH(SUBSTRING_INDEX(rest, ',', 1)) + 2)
    FROM genre_split
    WHERE rest <> ''
)
SELECT genre, COUNT(*) AS total_content
FROM genre_split
GROUP BY genre
ORDER BY total_content DESC
LIMIT 10;

/*
#########################################################################################################
			9. Find each year and the average numbers of content released in India on netflix. 
#########################################################################################################
*/
SELECT
    release_year, COUNT(*) AS total_content
FROM
        netflix
WHERE
    country LIKE '%India%'
GROUP BY release_year
ORDER BY release_year ;

SELECT release_year , 
    AVG(yearly_count) AS avg_content_per_year
FROM
    (SELECT 
        release_year, COUNT(*) AS yearly_count, 
        AVG(RELEASE_YEAR) AVG_RELEASE
    FROM
        netflix
    WHERE
        country LIKE '%India%'
    GROUP BY release_year) AS year_data;

/*
#########################################################################################################
			10. List all movies that are documentaries
#########################################################################################################
*/
SELECT 
    TYPE, TITLE, LISTED_IN, RELEASE_YEAR, DURATION
FROM NETFLIX
WHERE
    TYPE = 'MOVIE'
        AND LISTED_IN = 'Documentary'
ORDER BY RELEASE_YEAR DESC;

/*
#########################################################################################################
			11. Find all content without a director
#########################################################################################################
*/
SELECT     TYPE, TITLE, DIRECTOR
FROM
    NETFLIX
WHERE
    DIRECTOR IS NULL OR DIRECTOR = '';

/*
#########################################################################################################
			12. Find how many movies actor 'Salman Khan' appeared in the last 11 years!
#########################################################################################################
*/
SELECT * FROM NETFLIX;
SELECT 
    TYPE, TITLE, DIRECTOR, CAST, COUNTRY,RELEASE_YEAR 
FROM NETFLIX
WHERE CAST LIKE '%Salman Khan%'
    AND release_year BETWEEN 2014 AND 2025
ORDER BY release_YEAR;
    
SELECT TYPE, COUNT(*) AS movie_count
FROM netflix
WHERE type = 'Movie'
  AND cast LIKE '%Salman Khan%'
  -- AND release_year >= YEAR(CURDATE()) - 10;
  AND release_year BETWEEN 2014 AND 2024;

/*
#########################################################################################################
			13. Find the top 10 actors who have appeared in the highest number of movies produced in India.
#########################################################################################################
*/
-- 13. Find the top 10 actors who have appeared in the highest number of movies produced in India.
SELECT TRIM(SUBSTRING_INDEX(SUBSTRING_INDEX(n.cast, ',', numbers.n), ',', -1)) AS actor,
       COUNT(*) AS movie_count
FROM netflix n
JOIN (
    SELECT 1 n UNION ALL SELECT 2 UNION ALL SELECT 3 UNION ALL SELECT 4 UNION ALL
    SELECT 5 UNION ALL SELECT 6 UNION ALL SELECT 7 UNION ALL SELECT 8 UNION ALL
    SELECT 9 UNION ALL SELECT 10
) numbers
ON CHAR_LENGTH(n.cast) - CHAR_LENGTH(REPLACE(n.cast, ',', '')) >= numbers.n - 1
WHERE n.type = 'Movie' AND n.country LIKE '%India%' AND n.cast IS NOT NULL
GROUP BY actor
ORDER BY movie_count DESC
LIMIT 10;
/* ########################################################################################################
	15.	Categorize the content based on the presence of the keywords 'kill' and 'violence' in 
		the description field. Label content containing these keywords as 'Bad' and all other 
		content as 'Good'. Count AND Sumhow many items fall into each category.
###########################################################################################################*/
SELECT * FROM NETFLIX;
SELECT 
	CASE
		WHEN LOWER(description) like "%kill%"
		or LOWER(description) like "%violence%"
		THEN "BAD"
		ELSE "GOOD"
	END CONTANT_CATEGORY,
    SUM(duration) SUM_OF_MINTUS,
    COUNT(*) TOTAL_ITEMS
FROM NETFLIX
GROUP BY CONTANT_CATEGORY  ;
