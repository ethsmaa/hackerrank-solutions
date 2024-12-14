select w.id, wp.age, w.coins_needed, w.power
from wands as w
join Wands_Property as wp
on wp.code = w.code
where wp.is_evil = 0 and coins_needed = (select min(coins_needed)
                                        from wands as a
                                         join Wands_Property as b
                                         on b.code = a.code
                                         where wp.age = b.age and w.power = a.power)
order by w.power desc, wp.age desc
                                