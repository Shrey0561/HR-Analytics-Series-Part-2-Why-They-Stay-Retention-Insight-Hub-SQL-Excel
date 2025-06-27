SELECT
CASE
 WHEN Years_With_Current_Manager <1 THEN '0-1 Years'
 WHEN Years_With_Current_Manager BETWEEN 2 AND 3 THEN '2-3 Years'
 WHEN Years_With_Current_Manager BETWEEN 4 AND 5 THEN '4-5 Years'
 ELSE '6+ Years'
END AS Manager_Tenure_Band,
COUNT(*) AS Total_Employees,
SUM(CASE WHEN attrition = 'Yes' THEN 1 ELSE 0 END) AS Left_Employees,
SUM(CASE WHEN attrition = 'No' THEN 1 ELSE 0 END) AS Stayed_Employees,
ROUND(100.00 * SUM(CASE WHEN attrition = 'Yes' THEN 1 ELSE 0 END) / COUNT(*), 2) AS attrition_rate,
ROUND(100.00 * SUM(CASE WHEN attrition = 'No' THEN 1 ELSE 0 END) / COUNT(*), 2) AS retention_rate
FROM employee_attrition
GROUP BY Manager_Tenure_Band;