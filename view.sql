--VIEWS
SELECT EmployeeKey, FirstName, BaseRate, Gender, DepartmentName
FROM DimEmployee
JOIN DimDepartmentGroup
ON DimEmployee.DepartmentName = DimDepartmentGroup.DepartmentGroupKey

create view vwemployeesbydepartment
as
select employeekey, firstname, baserate, gender, departmentname
from dimemployee
join dimdepartmentgroup
on dimemployee.departmentname = dimdepartmentgroup.departmentgroupname;

select * from vwemployeesbydepartment;

select * from DimEmployee
