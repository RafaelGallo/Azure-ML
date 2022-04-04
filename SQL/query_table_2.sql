# DBA - Bike Rental UCI dataset

select temp, cnt 
from t1
where cnt > 420;

select avg(t1.cnt), weekday
from t1
group by weekday;