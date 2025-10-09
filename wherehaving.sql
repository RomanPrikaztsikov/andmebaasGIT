select * from factinternetsales

select productkey, sum(unitprice) as totalsales
from factinternetsales
group by productkey


select productkey, sum(unitprice) as totalsales
from factinternetsales
group by productkey
having sum (unitprice) > 1000
