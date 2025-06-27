SELECT Job_Involvement,COUNT(*) AS Total_Employees,
SUM(CASE WHEN attrition = 'Yes' THEN 1 ELSE 0 END) AS Left_Employees,
SUM(CASE WHEN attrition = 'No' THEN 1 ELSE 0 END) AS Stayed_Employees, 
ROUND(100.00 * SUM(CASE WHEN attrition = 'Yes' THEN 1 ELSE 0 END) / COUNT(*), 2) AS attrition_rate,
ROUND(100.00 * SUM(CASE WHEN attrition = 'No' THEN 1 ELSE 0 END) / COUNT(*), 2) AS retention_rate
FROM employee_attrition
GROUP BY Stock_Option_Level;