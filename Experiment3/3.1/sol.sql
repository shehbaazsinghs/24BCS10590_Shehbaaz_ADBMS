SELECT department, 
COUNT(CASE WHEN marks> 80 THEN 1 ELSE NULL END) as Dept_HighScore_Count
FROM student
GROUP BY department;