create database Olyampic;
use Olyampic;
show tables;
select * from athlete_events;
select * from noc_regions;

-- join
SELECT ae.name, ae.team, nr.region, ae.sport, ae.medal
FROM athlete_events ae
JOIN noc_regions nr ON ae.noc = nr.noc
WHERE ae.medal IS NOT NULL;

-- 1. Top 10 Countries by Total Medals.
SELECT 
    nr.region AS Country,
    COUNT(ae.medal) AS Total_Medals
FROM 
    athlete_events ae
JOIN 
    noc_regions nr ON ae.noc = nr.noc
WHERE 
    ae.medal IS NOT NULL
GROUP BY 
    nr.region
ORDER BY 
    Total_Medals DESC
LIMIT 10;

-- 2. Gold, Silver, Bronze Medal Breakdown by Country.
SELECT 
    nr.region AS Country,
    SUM(CASE WHEN ae.medal = 'Gold' THEN 1 ELSE 0 END) AS Gold,
    SUM(CASE WHEN ae.medal = 'Silver' THEN 1 ELSE 0 END) AS Silver,
    SUM(CASE WHEN ae.medal = 'Bronze' THEN 1 ELSE 0 END) AS Bronze
FROM 
    athlete_events ae
JOIN 
    noc_regions nr ON ae.noc = nr.noc
WHERE 
    ae.medal IS NOT NULL
GROUP BY 
    nr.region
ORDER BY 
    Gold DESC
LIMIT 10;

-- 3. Gender Participation Over Time by Country.
SELECT 
    nr.region AS Country,
    ae.year,
    ae.sex,
    COUNT(DISTINCT ae.id) AS Athletes
FROM 
    athlete_events ae
JOIN 
    noc_regions nr ON ae.noc = nr.noc
GROUP BY 
    nr.region, ae.year, ae.sex
ORDER BY 
    nr.region, ae.year, ae.sex;

--  4. Top 10 Sports by Number of Medals (with Countries).
SELECT 
    ae.sport,
    nr.region AS Country,
    COUNT(ae.medal) AS Total_Medals
FROM 
    athlete_events ae
JOIN 
    noc_regions nr ON ae.noc = nr.noc
WHERE 
    ae.medal IS NOT NULL
GROUP BY 
    ae.sport, nr.region
ORDER BY 
    Total_Medals DESC
LIMIT 10;

-- 5. Average Age of Medalists by Sport, Gender, and Country.
SELECT 
    nr.region AS Country,
    ae.sport,
    ae.sex,
    ROUND(AVG(ae.age), 2) AS Avg_Age
FROM 
    athlete_events ae
JOIN 
    noc_regions nr ON ae.noc = nr.noc
WHERE 
    ae.medal IS NOT NULL AND ae.age IS NOT NULL
GROUP BY 
    nr.region, ae.sport, ae.sex
ORDER BY 
    nr.region, ae.sport;
    
-- 6. Oldest Medal Winner (with Region). 
SELECT 
    ae.name, ae.age, ae.sex, ae.sport, ae.event, ae.year, nr.region AS Country
FROM 
    athlete_events ae
JOIN 
    noc_regions nr ON ae.noc = nr.noc
WHERE 
    ae.medal IS NOT NULL AND ae.age IS NOT NULL
ORDER BY 
    ae.age DESC
LIMIT 1;

-- 7. Youngest Gold Medalist (with Region).
SELECT 
    ae.name, ae.age, ae.sex, ae.sport, ae.event, ae.year, nr.region AS Country
FROM 
    athlete_events ae
JOIN 
    noc_regions nr ON ae.noc = nr.noc
WHERE 
    ae.medal = 'Gold' AND ae.age IS NOT NULL
ORDER BY 
    ae.age ASC
LIMIT 1;
SELECT 
    ae.name, ae.age, ae.sex, ae.sport, ae.event, ae.year, nr.region AS Country
FROM 
    athlete_events ae
JOIN 
    noc_regions nr ON ae.noc = nr.noc
WHERE 
    ae.medal = 'Gold' AND ae.age IS NOT NULL
ORDER BY 
    ae.age ASC
LIMIT 1;

-- 8. Medal Trends Over Years for a Specific Country (e.g., India).
SELECT 
    ae.year,
    COUNT(*) AS Total_Medals
FROM 
    athlete_events ae
JOIN 
    noc_regions nr ON ae.noc = nr.noc
WHERE 
    ae.medal IS NOT NULL AND nr.region = 'India'
GROUP BY 
    ae.year
ORDER BY 
    ae.year;
    
-- 9. Sports with the Most Diverse Medal-Winning Countries. 
SELECT 
    ae.sport,
    COUNT(DISTINCT nr.region) AS Unique_Countries
FROM 
    athlete_events ae
JOIN 
    noc_regions nr ON ae.noc = nr.noc
WHERE 
    ae.medal IS NOT NULL
GROUP BY 
    ae.sport
ORDER BY 
    Unique_Countries DESC
LIMIT 10;

-- 10. Gender-wise Medal Distribution by Country.
SELECT 
    nr.region AS Country,
    ae.sex,
    COUNT(ae.medal) AS Total_Medals
FROM 
    athlete_events ae
JOIN 
    noc_regions nr ON ae.noc = nr.noc
WHERE 
    ae.medal IS NOT NULL
GROUP BY 
    nr.region, ae.sex
ORDER BY 
    Country, ae.sex;
    
-- 11. Top Events by Medal Count.
SELECT 
    ae.event,
    ae.sport,
    COUNT(ae.medal) AS Total_Medals
FROM 
    athlete_events ae
WHERE 
    ae.medal IS NOT NULL
GROUP BY 
    ae.event, ae.sport
ORDER BY 
    Total_Medals DESC
LIMIT 10;

-- 12. 6. Number of Unique Sports in Each Olympic Year.
SELECT 
    year,
    COUNT(DISTINCT sport) AS Total_Sports
FROM 
    athlete_events
GROUP BY 
    year
ORDER BY 
    year;
    
-- 13. Most Successful Athletes by Number of Golds. 
SELECT 
    ae.name,
    nr.region AS Country,
    COUNT(*) AS Gold_Medals
FROM 
    athlete_events ae
JOIN 
    noc_regions nr ON ae.noc = nr.noc
WHERE 
    ae.medal = 'Gold'
GROUP BY 
    ae.name, nr.region
ORDER BY 
    Gold_Medals DESC
LIMIT 10;

-- 14. Most Frequently Played Sports (Across All Olympics).
SELECT 
    sport,
    COUNT(DISTINCT year) AS Years_Present
FROM 
    athlete_events
GROUP BY 
    sport
ORDER BY 
    Years_Present DESC;
    
-- 15. How many male and female athletes participated overall?
SELECT 
    sex,
    COUNT(DISTINCT id) AS total_athletes
FROM 
    athlete_events
GROUP BY 
    sex;

-- 16. What are the different types of medals?
SELECT 
    DISTINCT medal
FROM 
    athlete_events
WHERE 
    medal IS NOT NULL;
    
-- 17. Number of athletes by country.
SELECT 
    nr.region AS country,
    COUNT(DISTINCT ae.id) AS total_athletes
FROM 
    athlete_events ae
JOIN 
    noc_regions nr ON ae.noc = nr.noc
GROUP BY 
    nr.region
ORDER BY 
    total_athletes DESC
LIMIT 10;

-- 18. How many medals were won in total?
SELECT 
    COUNT(*) AS total_medals
FROM 
    athlete_events
WHERE 
    medal IS NOT NULL;
    
-- 19. Which cities hosted the Olympics and how many times?
SELECT 
    city,
    COUNT(DISTINCT year) AS times_hosted
FROM 
    athlete_events
GROUP BY 
    city
ORDER BY 
    times_hosted DESC;
    
-- 20. How many countries participated in the Olympics?
SELECT 
    COUNT(DISTINCT nr.region) AS total_countries
FROM 
    athlete_events ae
JOIN 
    noc_regions nr ON ae.noc = nr.noc;






















   



















