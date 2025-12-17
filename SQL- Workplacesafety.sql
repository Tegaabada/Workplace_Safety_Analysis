USE [SQL DB]
GO

SELECT [Date]
      ,[Injury Location]
      ,[Gender]
      ,[Age Group]
      ,[Incident Type]
      ,[Days Lost]
      ,[Plant]
      ,[Report Type]
      ,[Shift]
      ,[Department]
      ,[Incident Cost]
      ,[WkDay]
      ,[Month]
      ,[Year]
  FROM [dbo].['Workplace Safety Data$']

GO

-- Q1: How many incidents occurred at each plant?

SELECT Plant,
COUNT([Incident Type]) AS [Incident Count]
FROM [dbo].['Workplace Safety Data$']
GROUP BY [Plant];

-- Q2: What is the total incident cost per department?

SELECT Department,
SUM([Incident Cost]) As [Incident Cost Per Department]
FROM [dbo].['Workplace Safety Data$']
GROUP BY Department
ORDER BY [Incident Cost Per Department] DESC;

-- Q3: Which incident type resulted in the highest total days lost?

SELECT TOP(1) [Incident Type],
SUM ([Days Lost]) AS [Total Days Lost] 
FROM [dbo].['Workplace Safety Data$']
GROUP BY [Incident Type]
ORDER BY [Total Days Lost] DESC;

-- Q4: What is the distribution of incident types by shift?

SELECT Shift, [Incident Type], 
COUNT([Incident Type]) AS [Incident Count]
FROM [dbo].['Workplace Safety Data$']
GROUP BY Shift, [Incident Type]
ORDER BY Shift, [Incident Type];

-- Q5: What is the average incident cost for each injury location?

SELECT [Injury Location],
AVG([Incident Cost]) AS [Incident Average]
FROM [dbo].['Workplace Safety Data$']
GROUP BY [Injury Location]

-- Q6: Which age group has the highest number of incidents?


SELECT TOP (1) [Age Group],
COUNT([Incident Type]) AS [Incident Count]
FROM [dbo].['Workplace Safety Data$']
GROUP BY [Age Group]
ORDER BY [Incident Count] DESC;

-- Q7: How many incidents were reported as 'Lost Time' by each plant?

SELECT Plant,
COUNT ([Incident Type]) AS [Lost Time Incident Count]
FROM [dbo].['Workplace Safety Data$']
WHERE [Report Type] = 'Lost Time'
GROUP BY Plant
ORDER BY [Lost Time Incident Count] DESC
;

-- Q8: Which department had the highest number of 'Crush & Pinch' incidents?

SELECT TOP (1)
Department,
COUNT ([Incident Type]) AS [Crush & Pinch Incident Count]
FROM [dbo].['Workplace Safety Data$']
WHERE [Incident Type] = 'Crush & Pinch'
GROUP BY Department
ORDER BY [Crush & Pinch Incident Count] DESC;

-- Q9: Which plants reported the most "Near Miss" incidents?

SELECT TOP (3)
Plant, 
COUNT([Report Type]) AS [Near Miss Count]
FROM [dbo].['Workplace Safety Data$']
WHERE [Report Type] = 'Near Miss'
GROUP BY Plant
ORDER BY [Near Miss Count] DESC;

-- Q10: What is the total number of incidents by year and month?

SELECT Month, Year,
COUNT ([Incident Type]) AS [Incident Count]
FROM [dbo].['Workplace Safety Data$']
GROUP BY Month, Year
ORDER BY Month, Year;

-- Q11: Which gender has the most reported incidents?

SELECT TOP (1)
Gender,
COUNT ([Incident Type]) AS [Incident Count]
FROM [dbo].['Workplace Safety Data$']
GROUP BY Gender
ORDER BY Gender DESC;
 
-- Q12:What is the total cost of incidents per year?

SELECT Year,
SUM ([Incident Cost]) AS [Total Incident Cost]
FROM [dbo].['Workplace Safety Data$']
GROUP BY Year
ORDER BY [Total Incident Cost] DESC;

-- Q13: Which incident resulted in the highest cost?

SELECT TOP (1)
[Incident Type],
SUM ([Incident Cost]) AS [Total Incident Cost]
FROM [dbo].['Workplace Safety Data$']
GROUP BY [Incident Type]
ORDER BY [Total Incident Cost] DESC;

-- Q14: What is the total cost of incidents for each report type?

SELECT [Report Type],
SUM([Incident Cost]) AS [Total Incident Cost]
FROM [dbo].['Workplace Safety Data$']
GROUP BY [Report Type]
ORDER BY [Total Incident Cost] DESC;

-- Q15: Which departments had incidents with more than 2 days lost?

SELECT DISTINCT Department
FROM [dbo].['Workplace Safety Data$']
WHERE [Days Lost] > 2
ORDER BY Department;

SELECT Department
FROM [dbo].['Workplace Safety Data$']
WHERE [Days Lost] > 2
GROUP BY Department
ORDER BY Department;

-- Q16: What is the average number of days lost per incident type?

SELECT [Incident Type],
ROUND (AVG ([Days Lost]),2) AS [Average Days Lost]
FROM [dbo].['Workplace Safety Data$']
GROUP BY [Incident Type]
ORDER BY [Average Days Lost] DESC;

-- Q17: What is the distribution of incidents by shift (Day, Afternoon, Night)?

SELECT Shift,  
COUNT([Incident Type]) AS [Incident Count]
FROM [dbo].['Workplace Safety Data$']
GROUP BY Shift
ORDER BY [Incident Count] DESC;

-- Q18: Which months have the highest number of incidents?

SELECT Month,
COUNT ([Incident Type]) AS [Incident Count]
FROM [dbo].['Workplace Safety Data$']
GROUP BY Month
ORDER BY [Incident Count] DESC;
 
-- Q19: What is the total cost of "Vehicle" related incidents?

SELECT 
[Incident Type],
SUM ([Incident Cost]) AS [Total Cost]
FROM [dbo].['Workplace Safety Data$']
WHERE [Incident Type] = 'Vehicle'
GROUP BY [Incident Type];

-- 20: Which age group is most affected by "Falling Object" incidents?

SELECT TOP (1) 
[Age Group],
COUNT ([Incident Type]) AS [Incident Count]
FROM [dbo].['Workplace Safety Data$']
WHERE [Incident Type] = 'Falling Object'
GROUP BY [Age Group]
ORDER BY [Incident Count] DESC ;



