select * from factinternetsales

select productkey, sum(unitprice) as totalsales
from factinternetsales
group by productkey
