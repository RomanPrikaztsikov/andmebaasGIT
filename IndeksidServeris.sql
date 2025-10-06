--Indeksid Serveris ulesanned
Select * from DimEmployee where BaseRate > 10 and BaseRate < 15

Create Index IX_DimEmployee_BaseRate
ON DimEmployee (BaseRate ASC)

Execute sp_helptext DimEmployee

Drop Index DimEmployee.IX_DimEmployee_BaseRate