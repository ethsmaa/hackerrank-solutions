with challenge_counts as (
    select h.hacker_id, h.name, count(h.hacker_id) as challenge_count
    from hackers h
    join challenges c
    on h.hacker_id = c.hacker_id
    group by h.hacker_id, h.name
), -- her hackerin kac tane challenge yaptigini buluyoruz 
maxChallenge as (
    select max(challenge_count) as max_count
    from challenge_counts
), -- en fazla challenge yapan hackerin kac tane challenge yaptigini buluyoruz
filtered as (
    select cc.hacker_id, cc.name, cc.challenge_count
    from challenge_counts cc
    where cc.challenge_count = (select max_count from maxchallenge) -- en fazla challenge yapan hackerin challenge_countu
       or not exists (
            select 1
            from challenge_counts cc2
            where cc2.challenge_count = cc.challenge_count  -- ayni challenge_counta sahip 
              and cc2.hacker_id <> cc.hacker_id -- baska hacker
       ) -- yoksa
)
select f.hacker_id, f.name, f.challenge_count
from filtered f
order by f.challenge_count desc, f.hacker_id asc;
