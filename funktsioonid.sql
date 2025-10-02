--funktsioonid
select * from DimEmployee

Create Function fn_ILTVF_GetEmployees()

Returns Table
as
Return (Select EmployeeKey,FirstName, Cast(BirthDate as Date) as DOB
from dbo.DimEmployee);

select * from fn_ILTVF_GetEmployees();