select distinct city from station 
where city not rlike '^[aeiou]' and city not rlike '[aeiou]$'