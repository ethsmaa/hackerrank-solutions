select distinct city from station 
where city not rlike '^[aeiou].*[aeiou]$'