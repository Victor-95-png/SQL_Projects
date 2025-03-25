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


--Q8. Identify any other key debt trends and summarize your findings.

# Summary;
--Introduction
--In this project, I analyzed a dataset on international debt to understand how much different countries owe, what types of debt exist, and which nations have the highest depts. Using SQL, I wrote queries to answer key questions below.

-- Question 1: How much debt do all the countries in the dataset owe in total?
-- I used SQL to sum up all the debt values in the dataset.
-- The total debt across all countries is in the trillions of dollars, showing that many nations rely heavily on borrowing.

--Question2: How many unique countries are included in the dataset?
-- I counted the number of distinct country names in the dataset.
-- The dataset includes many different countries, making it a strong representation of global debt trends.

--Question3: What are the different debt indicators, and what do they represent?
-- I listed the unique debt indicator names from the dataset.
-- The dataset tracks various types of debt, including:
--External debt stocks: The total amount a country owes.
--Principal repayments: The amount a country has already paid back.
--Interest payments: The extra cost of borrowing money.

-- Question4: Which country has the highest total debt?
-- I summed the debt for each country and sorted the results to find the country with the highest amount.
-- The most indebted country owes hundreds of billions of dollars, raising concerns about its ability to repay.

--Question5: What is the average debt across different debt categories?
-- I calculated the average debt for each type of debt indicator.
-- Some debt indicators, like external debt stocks, have much higher average values than others, suggesting that this type of debt is the biggest contributor to financial obligations.

--Question6: Which country has repaid the most debt?
-- I filtered the data to focus only on principal repayments and found the country with the highest total repayments.
-- One country has paid back billions, possibly due to strong financial management or high debt obligations.

-- Question7: Which debt indicator appears the most across all countries?
-- I counted the number of times each debt indicator appears in the dataset and sorted the results.
-- The most commonly recorded type of debt is external debt stocks, meaning most countries track their total outstanding debt as a key financial measure.

-- Question 8: Exploring Additional Debt Trends
-- Debt by region – Some regions owe far more than others.

-- COnclusion:
--The total global debt is enormous, showing how much countries rely on borrowing.
-- Some countries have extremely high debt, while others are paying it back at a fast rate.
-- External debt stocks are the most common type of debt.
-- Global debt levels are continuously increasing, highlighting potential financial risks.
