select concat(name, '(', substring(occupation, 1, 1), ')') as name
from occupations
order by name; -- esma(b)

select concat('There are a total of ', count(occupation), ' ', lower(occupation), 's.') as result
from occupations
group by occupation
order by count(occupation), occupation ; -- ikinci sorgu