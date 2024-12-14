SELECT country.continent, floor(avg(city.population))
from city
join country
ON CITY.COUNTRYCODE = COUNTRY.CODE 
group by country.continent