-- 1. look into the dataset
SELECT * FROM churn.`02 churn-dataset`;

-- 2. finding duplicates in Customer Id
SELECT ï»¿customerID, count(ï»¿customerID) as Duplicate
FROM churn.`02 churn-dataset`
Group by ï»¿customerID
Having count(ï»¿customerID) > 1;

-- 3. total number of customer
SELECT Count(distinct ï»¿customerID) as Count_Customreid
FROM churn.`02 churn-dataset`;

-- 4. Total no of churn customer 
SELECT count(Churn) as Churn_customer
FROM churn.`02 churn-dataset`
where Churn = 'Yes';

-- 5. how likely to be churn customer in respect to their contracts --
SELECT distinct(Contract) as contract, count(*) as churn_count
FROM churn.`02 churn-dataset`
WHERE Churn='Yes'
GROUP BY Contract;


-- 6. Number of churn custome by Gender
SELECT distinct(gender) as Gender, count(*) as churn_count
FROM churn.`02 churn-dataset`
WHERE Churn='Yes'
GROUP BY Gender;

-- 7. avarage monthly charge for Churn customer

SELECT avg(MonthlyCharges)
FROM churn.`02 churn-dataset`
where Churn = 'Yes';

-- 8. avarage monthly charge for not churned customers

SELECT avg(MonthlyCharges)
FROM churn.`02 churn-dataset`
where Churn = 'No';

-- 9. what tenure months for customre churned
SELECT  avg(tenure) as avg_tenure_months
FROM churn.`02 churn-dataset`
where Churn = 'Yes'

-- 10. what tenure months for customre churned
SELECT  avg(tenure) as avg_tenure_months
FROM churn.`02 churn-dataset`
where Churn = 'No';

-- 11 which payment mathod uses by Churned Customer
select PaymentMethod, count(PaymentMethod)
FROM churn.`02 churn-dataset`
where Churn ='Yes'
group by PaymentMethod


--  12. which services uses by  Customer
SELECT sum(SeniorCitizen)
FROM churn.`02 churn-dataset`
where Churn = 'Yes'
group by Churn;



--- 13. Churned customer parcentage
SELECT 
  COUNT(CASE WHEN Churn = 'Yes' THEN 1 END) AS Churn_customer,
  COUNT(*) AS Total_customer,
  COUNT(CASE WHEN Churn = 'Yes' THEN 1 END) / COUNT(*) * 100 AS Churn_percentage
FROM churn.`02 churn-dataset`;


-- 14. Parcentage of total churn Senior Customer
SELECT 
  SUM(CASE WHEN SeniorCitizen = 1 THEN 1 ELSE 0 END) AS TotalSenior_customer,
  SUM(CASE WHEN Churn = 'Yes' AND SeniorCitizen = 1 THEN 1 ELSE 0 END) AS SeniorChurn_customer,
  SUM(CASE WHEN Churn = 'Yes' THEN 1 ELSE 0 END) AS TotalChurn_customer,
  SUM(CASE WHEN Churn = 'Yes' AND SeniorCitizen = 1 THEN 1 ELSE 0 END) / CAST(SUM(CASE WHEN Churn = 'Yes' THEN 1 ELSE 0 END) AS FLOAT) * 100 AS SeniorChurn_percentage
FROM churn.`02 churn-dataset`;


-- 15. Services 
SELECT
  COUNT(*) AS Total_customer,
  SUM(CASE WHEN Churn = 'Yes' THEN 1 ELSE 0 END) AS TotalChurn_customer,
  SUM(CASE WHEN PhoneService = 'Yes' AND Churn = 'Yes' THEN 1 ELSE 0 END) AS PhoneService_Churn,
  SUM(CASE WHEN MultipleLines = 'Yes' AND Churn = 'Yes' THEN 1 ELSE 0 END) AS MultipleLines_Churn,
  SUM(CASE WHEN InternetService != 'No' AND Churn = 'Yes' THEN 1 ELSE 0 END) AS InternetService_Churn,
  SUM(CASE WHEN OnlineSecurity = 'Yes' AND Churn = 'Yes' THEN 1 ELSE 0 END) AS OnlineSecurity_Churn,
  SUM(CASE WHEN OnlineBackup = 'Yes' AND Churn = 'Yes' THEN 1 ELSE 0 END) AS OnlineBackup_Churn,
  SUM(CASE WHEN DeviceProtection = 'Yes' AND Churn = 'Yes' THEN 1 ELSE 0 END) AS DeviceProtection_Churn,
  SUM(CASE WHEN TechSupport = 'Yes' AND Churn = 'Yes' THEN 1 ELSE 0 END) AS TechSupport_Churn,
  SUM(CASE WHEN StreamingTV = 'Yes' AND Churn = 'Yes' THEN 1 ELSE 0 END) AS StreamingTV_Churn,
  SUM(CASE WHEN StreamingMovies = 'Yes' AND Churn = 'Yes' THEN 1 ELSE 0 END) AS StreamingMovies_Churn
FROM churn.`02 churn-dataset`
WHERE PhoneService = 'Yes' OR MultipleLines = 'Yes' OR InternetService != 'No' OR OnlineSecurity = 'Yes' OR OnlineBackup = 'Yes' OR DeviceProtection = 'Yes' OR TechSupport = 'Yes' OR StreamingTV = 'Yes' OR StreamingMovies = 'Yes';


-- 17. parcentage of contract influence the churn customes 
SELECT Contract, 
COUNT(*) AS Total_customers, 
ROUND(CAST(COUNT(*) AS FLOAT) / (SELECT COUNT(*) FROM churn.`02 churn-dataset`) * 100, 2) AS Total_customer_percentage,
COUNT(CASE WHEN Churn = 'Yes' THEN 1 ELSE NULL END) AS Churn_customers, 
ROUND(CAST(COUNT(CASE WHEN Churn = 'Yes' THEN 1 ELSE NULL END) AS FLOAT) / (SELECT COUNT(*) FROM churn.`02 churn-dataset` WHERE Churn = 'Yes') * 100, 2) AS Churn_percentage
FROM churn.`02 churn-dataset`
GROUP BY Contract;


