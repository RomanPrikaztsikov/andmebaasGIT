--funktsioonid
select * from DimEmployee

Create Function fn_ILTVF_GetEmployees()

Returns Table
as
Return (Select EmployeeKey,FirstName, Cast(BirthDate as Date) as DOB
from dbo.DimEmployee);

select * from fn_ILTVF_GetEmployees();

--Õpilane teeb päringu ja näitab koodi kirja ning tulemust pildi kujul.
Create Function fn_MSTVF_GetEmployees()

Returns @Table Table (EmployeeKey int,FirstName varchar(20), DOB Date)
as
begin
Insert into @Table
Select EmployeeKey,FirstName, Cast(BirthDate as Date)
from dbo.DimEmployee

Return
End

select * from fn_ILTVF_GetEmployees()
select * from fn_MSTVF_GetEmployees()

Update fn_ILTVF_GetEmployees()set FirstName="Sam1" Where id=1

--employeename
Create function fn_GetEmployeeNameByID(@Id int)
Returns nvarchar(20)
as
begin
Return (Select FirstName from DimEmployees Where Id=@Id
End

--alter 
Alter Function fn_GetEmployeeNameByID(@Id int)
Returns nvarchar(20)
With Encryption
as
begin
Return(Select FirstName from DimEmployees Where EmployeeKey=@Id)
End