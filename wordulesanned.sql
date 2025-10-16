select * from DimEmployee

select departmentname, gender, Sum(BaseRate) as BaseRateTotal
From dimEmployee
group by departmentname, gender

union all

select departmentname, null, Sum(BaseRate) as BaseRateTotal
From dimEmployee
group by departmentname

union all

select null, gender, Sum(BaseRate) as BaseRateTotal
From dimEmployee
group by gender

select null, null, Sum(BaseRate) as BaseRateTotal
from dimEmployee

select departmentname, gender, Sum(BaseRate) BaseRateTotal
From dimEmployee
group by
grouping sets 
(
(departmentname, gender),
(departmentname),
(gender),
()
)
order by grouping(departmentname), grouping(gender), gender



select departmentname, sum(baserate) as baseratetotal
from dimEmployee

group by rollup(departmentname)

select departmentname, sum(baserate) as baseratetotal
from dimEmployee

group by departmentname with rollup

select departmentname, sum(baserate) as baseratetotal
from dimEmployee

group by departmentname

union all

select null, sum(baserate) as baseratetotal
from dimEmployee

select departmentname, sum(baserate) as baseratetotal
from dimEmployee
group by grouping sets
(
(departmentname),
()
)


select departmentname, gender, sum(baserate) as baseratetotal
from dimEmployee

group by rollup(departmentname, gender)


select departmentname, sum(baserate) as baseratetotal

from dimEmployee
group by grouping sets
(
(departmentname, gender),
(departmentname),
()
)


select departmentname, gender, sum(baserate) as baseratetotal
from dimEmployee
group by cube(departmentname, gender)


select departmentname, gender, sum(baserate) as baseratetotal
from dimEmployee
group by
grouping sets
(
(departmentname, gender),
(departmentname),
(gender),
()
)




select departmentname, gender, Sum(BaseRate) as BaseRateTotal
From dimEmployee
group by departmentname, gender

union all

select departmentname, null, Sum(BaseRate) as BaseRateTotal
From dimEmployee
group by departmentname

union all

select null, gender, Sum(BaseRate) as BaseRateTotal
From dimEmployee

group by gender

union all

select null, null, sum(baserate) as baseratetotal
from dimEmployee

select * from prospectivebuyer


CREATE TABLE Sales
(
    Id INT PRIMARY KEY IDENTITY,
    Continent NVARCHAR(50),
    Country NVARCHAR(50),
    City NVARCHAR(50),
    SaleAmount INT
);
GO

INSERT INTO Sales VALUES ('Asia', 'India', 'Bangalore', 1000);
INSERT INTO Sales VALUES ('Asia', 'India', 'Chennai', 2000);
INSERT INTO Sales VALUES ('Asia', 'Japan', 'Tokyo', 4000);
INSERT INTO Sales VALUES ('Asia', 'Japan', 'Hiroshima', 5000);
INSERT INTO Sales VALUES ('Europe', 'United Kingdom', 'London', 1000);
INSERT INTO Sales VALUES ('Europe', 'United Kingdom', 'Manchester', 2000);
INSERT INTO Sales VALUES ('Europe', 'France', 'Paris', 4000);
INSERT INTO Sales VALUES ('Europe', 'France', 'Cannes', 5000);
GO

select Continent, Country, City, SUM(SaleAmount) as TotalSales
from sales
group by rollup(continent, country, city)

select Continent, Country, City, SUM(SaleAmount) as TotalSales
from sales
group by cube(continent, country, city)


select Continent, SUM(SaleAmount) as TotalSales
from sales
group by rollup(continent)

select Continent, Country, City, SUM(SaleAmount) as TotalSales,
grouping(Continent) AS GP_Continent,
grouping(Country) AS GP_Country,
grouping(City) AS GP_City
from sales
group by rollup(Continent, Country, City)


select
case when
grouping(Continent) = 1 then 'all' else isnull(Continent, 'Unkown')
end as Continent,
case when
grouping(Country) = 1 then 'all' else isnull(Country, 'Unkown')
end as Country,
case when
grouping(City) = 1 then 'all' else isnull(City, 'Unkown')
end as City,
sum(SaleAmount) AS TotalSales
from sales
group by rollup(Continent,Country,City)


update sales set city = null where id=1
select isnull(Continent, 'all') as Continent,
isnull(Country, 'all') as country,
isnull(City, 'all') as city,
sum(SaleAmount) as TotalSales
from sales

group by rollup(Continent,Country,City)



select Continent, Country, City, SUM(SaleAmount) as TotalSales,
cast(grouping(Continent) as nvarchar(1))+
cast(grouping(Country) as nvarchar(1))+
cast(grouping(City) as nvarchar(1)) as groupings,
grouping_id(Continent, Country, City) as GPID
from sales
group by rollup(Continent,Country,City)

select Continent, Country, City, sum(SaleAmount) as TotalSales,
grouping_id(Continent, Country, City) as GPID
from sales
group by rollup(Continent, Country, City)
order by GPID


select Continent, Country, City, sum(SaleAmount) as TotalSales,
grouping_id(Continent, Country, City) as GPID
from sales
group by rollup(Continent, Country, City)
having grouping_id(Continent, Country, City) = 3
