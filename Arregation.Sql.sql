USE world;

-- Question 1
SELECT 
    c.Name AS Country,
    COUNT(ci.ID) AS Number_of_Cities
FROM Country c
LEFT JOIN City ci
    ON c.Code = ci.CountryCode
GROUP BY c.Name
ORDER BY Number_of_Cities DESC;

-- Question 2
SELECT
    Continent,
    COUNT(*) AS Number_of_Countries
FROM Country
GROUP BY Continent
HAVING COUNT(*) > 30
ORDER BY Number_of_Countries DESC;

-- Question 3
SELECT
    Name AS Country,
    Population
FROM Country
ORDER BY Population DESC
LIMIT 10;


-- Question 4: Find the top 5 continents by average GNP per country
SELECT 
    Continent,
    AVG(GNP) AS Average_GNP
FROM Country
GROUP BY Continent
ORDER BY Average_GNP DESC
LIMIT 5;

-- Question 5: Find the total number of official languages spoken in each continent
SELECT 
    c.Continent,
    COUNT(DISTINCT cl.Language) AS Official_Languages
FROM Country c
JOIN CountryLanguage cl
    ON c.Code = cl.CountryCode
WHERE cl.IsOfficial = 'T'
GROUP BY c.Continent
ORDER BY Official_Languages DESC;

-- Question 6: Find the maximum and minimum GNP for each continent
SELECT 
    Continent,
    MAX(GNP) AS Maximum_GNP,
    MIN(GNP) AS Minimum_GNP
FROM Country
GROUP BY Continent;


-- Question 7: Find the country with the highest average city population
SELECT 
    c.Name AS Country,
    AVG(ci.Population) AS Average_City_Population
FROM Country c
JOIN City ci
    ON c.Code = ci.CountryCode
GROUP BY c.Name
ORDER BY Average_City_Population DESC
LIMIT 1;

-- Question 8: List continents where the average city population is greater than 200,000
SELECT 
    c.Continent,
    AVG(ci.Population) AS Average_City_Population
FROM Country c
JOIN City ci
    ON c.Code = ci.CountryCode
GROUP BY c.Continent
HAVING AVG(ci.Population) > 200000
ORDER BY Average_City_Population DESC;

-- Question 9: Find total population and average life expectancy for each continent
-- ordered by average life expectancy descending
SELECT 
    Continent,
    SUM(Population) AS Total_Population,
    AVG(LifeExpectancy) AS Average_Life_Expectancy
FROM Country
GROUP BY Continent
ORDER BY Average_Life_Expectancy DESC;

-- Question 10: Find the top 3 continents with the highest average life expectancy
-- where total population is over 200 million
SELECT 
    Continent,
    SUM(Population) AS Total_Population,
    AVG(LifeExpectancy) AS Average_Life_Expectancy
FROM Country
GROUP BY Continent
HAVING SUM(Population) > 200000000
ORDER BY Average_Life_Expectancy DESC
LIMIT 3;