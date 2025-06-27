SELECT 
COUNT(*) AS Total_Employees, 
SUM(CASE WHEN attrition = 'No' THEN 1 ELSE 0 END) AS Stayed_Employees,
ROUND(100.00 * SUM(CASE WHEN attrition = 'No' THEN 1 ELSE 0 END) / COUNT(*), 2) AS Retention_Rate
FROM employee_attrition;