create schema project;

select*  from cleaned_hr_data;


-- calculating Attrition Rate by Department This helps identify which part of the business is losing the most people
SELECT 
    Department,
    COUNT(EmployeeNumber) AS Total_Employees,
    SUM(CASE WHEN Attrition = 'Yes' THEN 1 ELSE 0 END) AS Attrition_Count,
    ROUND(
        (SUM(CASE WHEN Attrition = 'Yes' THEN 1 ELSE 0 END) * 100.0) / COUNT(EmployeeNumber), 
        2
    ) AS Attrition_Rate_Percent
FROM 
    cleaned_hr_data
GROUP BY 
    Department
ORDER BY 
    Attrition_Rate_Percent DESC;
    
-- Analyzing the Impact of Overtime on Attrition This directly addresses "identifying trends and patterns."
    SELECT 
    OverTime,
    COUNT(EmployeeNumber) AS Total_Staff,
    SUM(CASE WHEN Attrition = 'Yes' THEN 1 ELSE 0 END) AS People_Who_Left,
    ROUND(
        (SUM(CASE WHEN Attrition = 'Yes' THEN 1 ELSE 0 END) * 100.0) / COUNT(EmployeeNumber), 
        2
    ) AS Attrition_Rate
FROM 
     cleaned_hr_data
GROUP BY 
    OverTime;
    
-- Income vs. Job Satisfaction Analysis
    SELECT 
    JobSatisfaction,
    AVG(MonthlyIncome) AS Average_Income,
    AVG(YearsAtCompany) AS Average_Tenure
FROM 
    cleaned_hr_data
GROUP BY 
    JobSatisfaction
ORDER BY 
    JobSatisfaction DESC;