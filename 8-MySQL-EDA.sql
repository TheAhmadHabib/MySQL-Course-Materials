select * from `hr-employee-attrition` hea;

select hea.BusinessTravel, COUNT(hea.businesstravel) from `hr-employee-attrition` hea
group by hea.businesstravel;

select hea.department, COUNT(hea.department) 'count', (count(*) / (select count(*) from  `hr-employee-attrition`)) * 100 as 'percentage %' from `hr-employee-attrition` hea
group by hea.department;

-- we can also use a window function

SELECT
    Department,
    COUNT(Department) as Count,
    ROUND(COUNT(*) * 100.0 / sum(COUNT(*)) over(),2) `Percentage % WF`
FROM 
`hr-employee-attrition` hea
group by department;

select hea.EducationField, COUNT(hea.EducationField) from `hr-employee-attrition` hea
group by hea.EducationField;

select hea.JobRole ,count(hea.jobRole) from `hr-employee-attrition` hea
group by hea.JobRole
order by hea.JobRole ASC;

select hea.MaritalStatus ,count(hea.MaritalStatus) from `hr-employee-attrition` hea
group by hea.MaritalStatus
order by hea.MaritalStatus ASC;

select  from `hr-employee-attrition` hea