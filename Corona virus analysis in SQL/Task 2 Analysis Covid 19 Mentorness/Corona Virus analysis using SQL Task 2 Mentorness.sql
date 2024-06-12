select *
from
['Corona Virus Dataset$']



-- To avoid any errors, check missing value / null value 
-- Q1. Write a code to check NULL values
select *
from
['Corona Virus Dataset$']
WHERE 
Province IS NULL
OR 
[Country/Region] IS NULL
OR 
Latitude IS NULL
OR 
Longitude IS NULL
OR 
Date IS NULL
OR 
Confirmed IS NULL 
OR 
Deaths IS NULL 
OR 
Recovered IS NULL


--Q2. If NULL values are present, update them with zeros for all columns. 

-- There Are No Null Values in Dataset so 0 Rows Affected 

UPDATE ['Corona Virus Dataset$']
set Province = 0 
WHERE 
Province IS NULL 

UPDATE ['Corona Virus Dataset$']
set [Country/Region] = 0 
WHERE 
[Country/Region] IS NULL 

UPDATE ['Corona Virus Dataset$']
set Latitude = 0 
WHERE 
Latitude IS NULL 

UPDATE ['Corona Virus Dataset$']
set Longitude = 0 
WHERE 
Longitude IS NULL 

UPDATE ['Corona Virus Dataset$']
set Date = 0 
WHERE 
Date IS NULL 

UPDATE ['Corona Virus Dataset$']
set Confirmed = 0 
WHERE 
Confirmed IS NULL 

UPDATE ['Corona Virus Dataset$']
set Deaths = 0 
WHERE 
Deaths IS NULL 

UPDATE ['Corona Virus Dataset$']
set Recovered = 0 
WHERE 
Recovered IS NULL 

-- Q3. check total number of rows
select
count(*) AS total_Rows
from
['Corona Virus Dataset$']

-- Q4. Check what is start_date and end_date
-- Converted Date into proper Date format excpet of String 
select
MIN(TRY_CONVERT(datetime,Date,105)) AS MIN_Start_Date_Proper_Date,
MAX(TRY_CONVERT(datetime,Date,105)) AS MAX_Start_Date_Proper_Date
from
['Corona Virus Dataset$']
WHERE 
TRY_CONVERT(datetime,Date,105) IS NOT NULL


-- Q5. Number of month present in dataset
-- 12 months--
select
COUNT(DISTINCT MONTH(Date)) AS Number_of_Months
from
['Corona Virus Dataset$']

-- Q6. Find monthly average for confirmed, deaths, recovered
select 
DISTINCT 
MONTH(Date) AS Month,
ROUND(AVG(Confirmed),2) AS Confirmed_Average,
ROUND(AVG(Deaths),2) AS Deaths_Average,
ROUND(AVG(Recovered),2) AS Recovered_Average
from 
['Corona Virus Dataset$']
group by MONTH(Date)
ORDER BY MONTH(Date)

-- Q7. Find most frequent value for confirmed, deaths, recovered each month 
-- Confirmed Value---
SELECT 
TOP 1
Confirmed,
COUNT(Confirmed) AS Confirmed_Value
FROM 
['Corona Virus Dataset$']
GROUP BY 
Confirmed
ORDER BY 
COUNT(Confirmed) DESC;
-- Confirmed Value---

-- Deaths_value--
SELECT 
TOP 1
Deaths,
COUNT(Deaths) AS Deaths_Value
FROM 
['Corona Virus Dataset$']
GROUP BY 
Deaths
ORDER BY 
COUNT(Deaths) DESC;
-- Deaths_value--

--Recovered_value--
SELECT 
top 1
Recovered,
COUNT(Recovered) AS Recovered_Value
FROM 
['Corona Virus Dataset$']
GROUP BY 
Recovered
ORDER BY 
COUNT(Recovered) DESC;

--Recovered_value--

-----WITH DEATHS_CTE AS(
--select 
--DISTINCT
--Deaths,
--COUNT(Deaths) AS Deaths_Value,
--ROW_NUMBER() over(partition by deaths ORDER BY COUNT(Deaths) DESC) AS Occurance_Of_Value
--from 
--['Corona Virus Dataset$']
--GROUP BY 
--Deaths
--)
--select
--*
--from
--DEATHS_CTE


select
*
from 
['Corona Virus Dataset$']

-- Q8. Find minimum values for confirmed, deaths, recovered per year
  select
  MIN(Confirmed) AS Min_confirmed_Value,
  MIN(Deaths) AS Min_Deaths_Value,
  MIN(Recovered) AS Min_Recovered_Value
  from
  ['Corona Virus Dataset$']
-- Q9. Find maximum values of confirmed, deaths, recovered per year
SELECT
  MAX(Confirmed) AS MAX_confirmed_Value,
  MAX(Deaths) AS MAX_Deaths_Value,
  MAX(Recovered) AS MAX_Recovered_Value
  from
  ['Corona Virus Dataset$']
-- Q10. The total number of case of confirmed, deaths, recovered each month
select
SUM(Confirmed) AS Total_Confirmed_Cases,
SUM(Deaths) AS Total_Deaths,
SUM(Recovered) AS Total_Recovered
from
['Corona Virus Dataset$']
-- Q11. Check how corona virus spread out with respect to confirmed case
--      (Eg.: total confirmed cases, their average, variance & STDEV )
 SELECT
 DISTINCT
 CASE
 WHEN MONTH(Date) ='1' THEN 'January'
 WHEN MONTH(Date) ='2' THEN 'Feburary'
 WHEN MONTH(Date) ='3' THEN 'March'
 WHEN MONTH(Date) ='4' THEN 'April'
 WHEN MONTH(Date) ='5' THEN 'May'
 WHEN MONTH(Date) ='6' THEN 'June'
 WHEN MONTH(Date) ='7' THEN 'July'
 WHEN MONTH(Date) ='8' THEN 'August'
 WHEN MONTH(Date) ='9' THEN 'September'
 WHEN MONTH(Date) ='10' THEN 'October'
 WHEN MONTH(Date) ='11' THEN 'November'
 WHEN MONTH(Date) ='12' THEN 'December'
 ELSE 'error'
 END AS Months,
 SUM(Confirmed) AS Total_Confirmed_Cases,
 AVG(Confirmed) AS Average_Confirmed_Cases,
 VAR(Confirmed) AS Variance_Confirmed_Cases,
 STDEV(Confirmed) AS Standard_Deviation_Confirmed_Cases
 from
 ['Corona Virus Dataset$']
 group by
 MONTH(Date)
 order by SUM(Confirmed),
 AVG(Confirmed) ,
 VAR(Confirmed),
 STDEV(Confirmed) 
-- Q12. Check how corona virus spread out with respect to death case per month
--      (Eg.: total confirmed cases, their average, variance & STDEV )
 SELECT
 DISTINCT
 CASE
 WHEN MONTH(Date) ='1' THEN 'January'
 WHEN MONTH(Date) ='2' THEN 'Feburary'
 WHEN MONTH(Date) ='3' THEN 'March'
 WHEN MONTH(Date) ='4' THEN 'April'
 WHEN MONTH(Date) ='5' THEN 'May'
 WHEN MONTH(Date) ='6' THEN 'June'
 WHEN MONTH(Date) ='7' THEN 'July'
 WHEN MONTH(Date) ='8' THEN 'August'
 WHEN MONTH(Date) ='9' THEN 'September'
 WHEN MONTH(Date) ='10' THEN 'October'
 WHEN MONTH(Date) ='11' THEN 'November'
 WHEN MONTH(Date) ='12' THEN 'December'
 ELSE 'error'
 END AS Months,
 SUM(Deaths) AS Total_Death_Cases,
 AVG(Deaths) AS Average_Death_Cases,
 VAR(Deaths) AS Variance_Death_Cases,
 STDEV(Deaths) AS Standard_Deviation_Death_Cases
 from
 ['Corona Virus Dataset$']
 group by
 MONTH(Date)
 order by SUM(Deaths),
 AVG(Deaths) ,
 VAR(Deaths),
 STDEV(Deaths) 


-- Q13. Check how corona virus spread out with respect to recovered case
--      (Eg.: total confirmed cases, their average, variance & STDEV )
SELECT
 DISTINCT
 CASE
 WHEN MONTH(Date) ='1' THEN 'January'
 WHEN MONTH(Date) ='2' THEN 'Feburary'
 WHEN MONTH(Date) ='3' THEN 'March'
 WHEN MONTH(Date) ='4' THEN 'April'
 WHEN MONTH(Date) ='5' THEN 'May'
 WHEN MONTH(Date) ='6' THEN 'June'
 WHEN MONTH(Date) ='7' THEN 'July'
 WHEN MONTH(Date) ='8' THEN 'August'
 WHEN MONTH(Date) ='9' THEN 'September'
 WHEN MONTH(Date) ='10' THEN 'October'
 WHEN MONTH(Date) ='11' THEN 'November'
 WHEN MONTH(Date) ='12' THEN 'December'
 ELSE 'error'
 END AS Months,
 SUM(Recovered) AS Total_Recovered_Cases,
 AVG(Recovered) AS Average_Recovered_Cases,
 VAR(Recovered) AS Variance_Recovered_Cases,
 STDEV(Recovered) AS Standard_Deviation_Recovered_Cases
 from
 ['Corona Virus Dataset$']
 group by
 MONTH(Date)
 order by SUM(Recovered),
 AVG(Recovered) ,
 VAR(Recovered),
 STDEV(Recovered) 



-- Q14. Find Country having highest number of the Confirmed case
-- USA had most Cases---
 select
 top 5
 Province,
 SUM(Confirmed) AS Cases_Count
 from
 ['Corona Virus Dataset$']
 GROUP BY Province
 order by  SUM(Confirmed) DESC
-- Q15. Find Country having lowest number of the death case
select
 top 1
 Province,
 SUM(Deaths) AS Death_Cases
 from
 ['Corona Virus Dataset$']
 GROUP BY Province
 order by  SUM(Deaths) ASC
-- Q16. Find top 5 countries having highest recovered case
select
 top 5
 Province,
 SUM(Recovered) AS Recovered_Cases
 from
 ['Corona Virus Dataset$']
 GROUP BY Province
 order by  SUM(Recovered) DESC