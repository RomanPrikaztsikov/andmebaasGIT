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

create view vWITDepartment_Employees
as
select EmployeeKey, FirstName, BaseRate, Gender, departmentname
from DimEmployee
join DimDepartmentGroup
on DimEmployee.departmentname = dimdepartmentgroup.departmentgroupname
where dimdepartmentgroup.departmentgroupname = 'Marketing';

select * from vWITDepartment_Employees


create view vWEmployeesNonConfidentialData
as
select EmployeeKey, FirstName, Gender, departmentname
from DimEmployee
join dimdepartmentgroup
on DimEmployee.departmentname = dimdepartmentgroup.departmentgroupname

select * from vWEmployeesNonConfidentialData

create view vWEmployeesCountByDepartment
as
select departmentname, count(employeekey) as TotalEmployees
from DimEmployee
join Dimdepartmentgroup
on DimEmployee.departmentname = dimdepartmentgroup.departmentgroupname
Group by departmentname

select * from vWEmployeesCountByDepartment
