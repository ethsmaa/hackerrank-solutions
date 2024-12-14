select h.hacker_id, h.name, ts.total_score
from hackers h
join (
    select hacker_id, sum(max_score) as total_score
    from ( 
        select s.hacker_id, max(s.score) as max_score
        from submissions s
        group by s.hacker_id, s.challenge_id
    ) as maxScores -- her hackerin her challenge icin en yuksek skoru 
    group by hacker_id
) as ts -- her hackerin toplam skoru
on h.hacker_id = ts.hacker_id
where ts.total_score <> 0 -- toplam skoru 0 olanlar haric
order by ts.total_score desc, h.hacker_id asc;


-- bu versiyon kabul edilmiyormus (mysql versiyon 8 oncesi)
/*
with maxScore as (
    SELECT s.hacker_id, MAX(s.score) AS max_score
                  FROM Submissions s
                GROUP BY hacker_id, challenge_id
),
totalScore as (
    select m.hacker_id, sum(m.max_score) as total_score
    from maxScore m
    group by hacker_id
)
select h.hacker_id, h.name, ts.total_score
from hackers h
join totalScore ts
on h.hacker_id = ts.hacker_id
WHERE ts.total_score <> 0
 ORDER BY total_score DESC, hacker_id;
*/