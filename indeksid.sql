--Klastreeritud ja mitte-klastreeritud indeksid
Create Clustered Index IX_Employee_FirstName
ON DimEmployee(FirstName)

--non cluster indekss
Create NonClustered Index IX_DimEmployee_FirstName
ON DimEmployee(FirstName)

