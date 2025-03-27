select * from dataanalytics.international_debt;

-- Q1. What is the total amount of debt owed by all countries in the dataset?
select (sum(debt)/100000)::numeric(20,2) as total_debt
from dataanalytics.international_debt;


-- Q2. How many distinct countries are recorded in the dataset?
select count(distinct country_name) as country_count59
from dataanalytics.international_debt;


--Q3. What are the distinct types of debt indicators, and what do they represent?
select distinct Indicator_name
from dataanalytics.international_debt id;


--Q4. Which country has the highest total debt, and how much does it owe?
select country_name,(SUM(debt)/1000000)::numeric(20,2) as  total_debt
from dataanalytics.international_debt
group by country_name 
order by total_debt desc
limit 1;


-- Q5. What is the average debt across different debt indicators?
select (avg(debt)/1000000)::numeric(20,2)as average_debt_millions,indicator_code 
from international_debt
group by indicator_code 
order by average_debt_millions Desc


-- Q6. Which country has made the highest amount of principal repayments?
select country_name, sum(debt) "Highest Principal Repayment",indicator_name, indicator_code
from datanalytics.international_debt
where indicator_code = 'DT.AMT.DLXF.CD'
group by country_name ,indicator_name,indicator_code
order by 2 desc;


--Q7. What is the most common debt indicator across all countries?
select count (*)as total_indicator_count,indicator_code,indicator_name
from international_debt
group by indicator_name, indicator_code
order by total_indicator_count desc
limit 1;


--Q8. Identify any other key debt trends and summarize your findings.(Article in README.md)

