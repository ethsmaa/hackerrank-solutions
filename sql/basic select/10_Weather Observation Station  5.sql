select city, length(city) 
from station 
order by length(city) desc, city asc limit 1;

select city, length(city)
from station 
order by length(city) asc, city asc limit 1;