SELECT
CASE
 WHEN Monthly_Income < 3000 THEN 'Low'
 WHEN Monthly_Income BETWEEN 3000 AND 7000 THEN 'Mid'
 ELSE 'High'
END AS Income_Band,
ROUND(AVG(Percent_Salary_Hike), 2) AS Average_Salary_Hike,
ROUND(100.00 * SUM(CASE WHEN attrition = 'No' THEN 1 ELSE 0 END) / COUNT(*), 2) AS retention_percent
FROM employee_attrition
GROUP BY Income_Band
ORDER BY Income_Band;