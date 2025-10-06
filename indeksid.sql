--Indeksid Serveris ulesanned
Select * from DimEmployee where BaseRate > 10 and BaseRate < 15

Create Index IX_DimEmployee_BaseRate
ON DimEmployee (BaseRate ASC)

Execute sp_helptext DimEmployee

Drop Index DimEmployee.IX_DimEmployee_BaseRate

--Klastreeritud ja mitte-klastreeritud indeksid
Create Clustered Index IX_Employee_FirstName
ON DimEmployee(FirstName)

--non cluster indekss
Create NonClustered Index IX_DimEmployee_FirstName
ON DimEmployee(FirstName)

Execute sp_helpindex DimEmployee

--unique nonclustered index
Create Unique NonClustered Index UIX_DimEmployee_FirstName_LastName
On DimEmployee(FirstName, LastName)

--alter table, add constraint
ALTER TABLE DimEmployee 
ADD CONSTRAINT UQ_DimEmployee_DepartmentName 
UNIQUE NONCLUSTERED (DepartmentName)

--unique index
CREATE UNIQUE INDEX IX_DimEmployee_StartDate_EmployeeKey
ON DimEmployee(StartDate, EmployeeKey)
WITH IGNORE_DUP_KEY
