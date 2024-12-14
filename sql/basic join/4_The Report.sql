select
    case
        when g.grade < 8 then null
        else s.name
    end as name,
    g.grade as grade,
    s.marks as marks
from students as s
join grades as g
where s.marks between g.min_mark and g.max_mark
order by g.grade desc, s.name asc;