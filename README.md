# Workplace Safety SQL Project

## Project Overview

**Project Title**: Workplace Safety Analysis 
**Database**:`SQL DB`
**Tech Used**: `SQL Server`

This project is designed to demonstrate SQL skills and techniques typically used by data analysts to explore, clean, and analyze the dataset. The project involves setting up  Workplace safety dataset in an SQL database, performing exploratory data analysis (EDA), and answering specific business questions through SQL queries.

## Objectives

1. **Set up a database**: Populate a database with the provided worksafety data.
2. **Data Cleaning**: Identify and remove any records with wrong datasets, missing or null values.
3. **Exploratory Data Analysis (EDA)**: Perform basic exploratory data analysis to understand the dataset.
4. **Business Analysis**: Use SQL to answer specific business questions and derive insights from the dataset.

## Project Structure

### 1. Database Setup

- **Database Set up**: The project starts by setting up on an existing database created with this code
  ``` CREATE DATABASE [SQL DB]; ```
- **Table Creation**: The table, ```['Workplace Safety Data$']```  was imported into the SQL server.


### 2. Data Cleaning

- **Null Value Check**: View tables and check for any null values in the dataset and delete records with missing data.
- **Datatype Check**: View tables and check datatype and alter columns with wrong datatypes.

```sql
USE [SQL DB]
GO

SELECT [EmpID]
      ,[EmpFname]
      ,[EmpLname]
      ,[Department]
      ,[Project]
      ,[Address]
      ,[DOB]
      ,[Gender]
  FROM [dbo].['Workplace Safety Data$']

GO

DELETE FROM [dbo].['Workplace Safety Data$']
WHERE Department IS NULL;

ALTER TABLE [dbo].['Workplace Safety Data$']
alter column Date DATETIME,
alter column [Incident Cost] MONEY;
```

### 3. Exploratory Data Analysis & Findings

The following SQL queries were developed to answer specific business questions:

-- Q1: How many incidents occurred at each plant?
```sql
SELECT Plant,
COUNT([Incident Type]) AS [Incident Count]
FROM [dbo].['Workplace Safety Data$']
GROUP BY [Plant];
```
-- Q2: What is the total incident cost per department?
```sql
SELECT Department,
SUM([Incident Cost]) As [Incident Cost Per Department]
FROM [dbo].['Workplace Safety Data$']
GROUP BY Department
ORDER BY [Incident Cost Per Department] DESC;
```
-- Q3: Which incident type resulted in the highest total days lost?
```sql
SELECT TOP(1) [Incident Type],
SUM ([Days Lost]) AS [Total Days Lost] 
FROM [dbo].['Workplace Safety Data$']
GROUP BY [Incident Type]
ORDER BY [Total Days Lost] DESC;
```
-- Q4: What is the distribution of incident types by shift?
```sql
SELECT Shift, [Incident Type], 
COUNT([Incident Type]) AS [Incident Count]
FROM [dbo].['Workplace Safety Data$']
GROUP BY Shift, [Incident Type]
ORDER BY Shift, [Incident Type];
```
-- Q5: What is the average incident cost for each injury location?
```sql
SELECT [Injury Location],
AVG([Incident Cost]) AS [Incident Average]
FROM [dbo].['Workplace Safety Data$']
GROUP BY [Injury Location]
```
-- Q6: Which age group has the highest number of incidents?
```sql
SELECT TOP (1) [Age Group],
COUNT([Incident Type]) AS [Incident Count]
FROM [dbo].['Workplace Safety Data$']
GROUP BY [Age Group]
ORDER BY [Incident Count] DESC;
```
-- Q7: How many incidents were reported as 'Lost Time' by each plant?
```sql
SELECT Plant,
COUNT ([Incident Type]) AS [Lost Time Incident Count]
FROM [dbo].['Workplace Safety Data$']
WHERE [Report Type] = 'Lost Time'
GROUP BY Plant
ORDER BY [Lost Time Incident Count] DESC;
```
-- Q8: Which department had the highest number of 'Crush & Pinch' incidents?
```sql
SELECT TOP (1)
Department,
COUNT ([Incident Type]) AS [Crush & Pinch Incident Count]
FROM [dbo].['Workplace Safety Data$']
WHERE [Incident Type] = 'Crush & Pinch'
GROUP BY Department
ORDER BY [Crush & Pinch Incident Count] DESC;
```
-- Q9: Which plants reported the most "Near Miss" incidents?
```sql
SELECT TOP (3)
Plant, 
COUNT([Report Type]) AS [Near Miss Count]
FROM [dbo].['Workplace Safety Data$']
WHERE [Report Type] = 'Near Miss'
GROUP BY Plant
ORDER BY [Near Miss Count] DESC;
```
-- Q10: What is the total number of incidents by year and month?
```sql
SELECT Month, Year,
COUNT ([Incident Type]) AS [Incident Count]
FROM [dbo].['Workplace Safety Data$']
GROUP BY Month, Year
ORDER BY Month, Year;
```
-- Q11: Which gender has the most reported incidents?
```sql
SELECT TOP (1)
Gender,
COUNT ([Incident Type]) AS [Incident Count]
FROM [dbo].['Workplace Safety Data$']
GROUP BY Gender
ORDER BY Gender DESC;
 ```
-- Q12:What is the total cost of incidents per year?
```sql
SELECT Year,
SUM ([Incident Cost]) AS [Total Incident Cost]
FROM [dbo].['Workplace Safety Data$']
GROUP BY Year
ORDER BY [Total Incident Cost] DESC;
```
-- Q13: Which incident resulted in the highest cost?
```sql
SELECT TOP (1)
[Incident Type],
SUM ([Incident Cost]) AS [Total Incident Cost]
FROM [dbo].['Workplace Safety Data$']
GROUP BY [Incident Type]
ORDER BY [Total Incident Cost] DESC;
```
-- Q14: What is the total cost of incidents for each report type?
```sql
SELECT [Report Type],
SUM([Incident Cost]) AS [Total Incident Cost]
FROM [dbo].['Workplace Safety Data$']
GROUP BY [Report Type]
ORDER BY [Total Incident Cost] DESC;
```
-- Q15: Which departments had incidents with more than 2 days lost?
```sql
SELECT DISTINCT Department
FROM [dbo].['Workplace Safety Data$']
WHERE [Days Lost] > 2
ORDER BY Department;

SELECT Department
FROM [dbo].['Workplace Safety Data$']
WHERE [Days Lost] > 2
GROUP BY Department
ORDER BY Department;
```
-- Q16: What is the average number of days lost per incident type?
```sql
SELECT [Incident Type],
ROUND (AVG ([Days Lost]),2) AS [Average Days Lost]
FROM [dbo].['Workplace Safety Data$']
GROUP BY [Incident Type]
ORDER BY [Average Days Lost] DESC;
```
-- Q17: What is the distribution of incidents by shift (Day, Afternoon, Night)?
```sql
SELECT Shift,  
COUNT([Incident Type]) AS [Incident Count]
FROM [dbo].['Workplace Safety Data$']
GROUP BY Shift
ORDER BY [Incident Count] DESC;
```
-- Q18: Which months have the highest number of incidents?
```sql
SELECT Month,
COUNT ([Incident Type]) AS [Incident Count]
FROM [dbo].['Workplace Safety Data$']
GROUP BY Month
ORDER BY [Incident Count] DESC;
 ```
-- Q19: What is the total cost of "Vehicle" related incidents?
```sql
SELECT 
[Incident Type],
SUM ([Incident Cost]) AS [Total Cost]
FROM [dbo].['Workplace Safety Data$']
WHERE [Incident Type] = 'Vehicle'
GROUP BY [Incident Type];
```
-- 20: Which age group is most affected by "Falling Object" incidents?
```sql
SELECT TOP (1) 
[Age Group],
COUNT ([Incident Type]) AS [Incident Count]
FROM [dbo].['Workplace Safety Data$']
WHERE [Incident Type] = 'Falling Object'
GROUP BY [Age Group]
ORDER BY [Incident Count] DESC ;
```
## Findings

- Incident Distribution by Plant: Each plant recorded varying numbers of incidents, with Montana showing higher risk exposure.
- Departmental Costs: Maintenance department incurred the highest incident costs.
- Incident Severity: Equipment incident type, caused the highest days lost.
- Age Group Trends: 25-34 age group reported the most incidents overall.
- Cost Drivers: Burn incident types contributed heavily to overall costs.


## Conclusion
This project demonstrates how SQL can be applied to workplace safety data for cleaning, aggregation, and analysis. By querying the dataset, we identified:
- Plants with higher incident exposure, particularly Montana.
- Departments incurring the greatest financial burden, with Maintenance leading.
- Incident types driving operational disruption, such as equipment-related cases with high days lost.
- Demographic patterns, with the 25–34 age group most affected.
- Cost drivers, where burn incidents significantly increased overall expenses.
Overall, the analysis highlights how SQL queries can uncover critical safety insights, enabling organizations to prioritize risk reduction strategies, target high-cost incident types, and strengthen preventive measures across plants and departments.


#### Author - Tega Abada

