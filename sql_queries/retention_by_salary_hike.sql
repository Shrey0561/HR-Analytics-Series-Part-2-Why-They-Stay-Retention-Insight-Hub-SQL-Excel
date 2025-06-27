SELECT 
CASE 
 WHEN Percent_Salary_Hike BETWEEN 11 AND 13 THEN '11-13%'
 WHEN Percent_Salary_Hike BETWEEN 14 AND 16 THEN '14-16%'
 WHEN Percent_Salary_Hike BETWEEN 17 AND 19 THEN '17-19%'
 WHEN Percent_Salary_Hike BETWEEN 20 AND 22 THEN '20-22%'
 WHEN Percent_Salary_Hike BETWEEN >= 23 THEN '23+%'
 ELSE 'Other'
END AS salary_hike_band
ROUND(AVG(Percent_Salary_Hike), 2) AS Avg_Hike_Percent, 
ROUND(100.00 * SUM(CASE WHEN attrition = 'No' THEN 1 ELSE 0 END) / COUNT(*), 2) AS Retention_Percent
FROM employee_attrition
GROUP BY salary_hike_band
ORDER BY salary_hike_band;