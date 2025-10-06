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

Create Unique NonClustered Index UIX_DimEmployee_FirstName_LastName
On DimEmployee(FirstName, LastName)

ALTER TABLE DimEmployee 
ADD CONSTRAINT UQ_DimEmployee_DepartmentName 
UNIQUE NONCLUSTERED (DepartmentName)

