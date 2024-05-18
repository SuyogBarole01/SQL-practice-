Show databases;
Use practice;
CREATE TABLE Hackers (
    hacker_id INTEGER,
    name VARCHAR(255)
);
CREATE TABLE Challenges (
    challenge_id INTEGER,
    hacker_id INTEGER
);
INSERT INTO Hackers (hacker_id, name)
VALUES (5077, 'Rose'),
       (21283, 'Angela'),
       (62743, 'Frank'),
       (88255, 'Patrick'),
       (96196, 'Lisa');
INSERT INTO Challenges (challenge_id, hacker_id)
VALUES (47127, 88255),
       (23457, 96196),
       (65734, 62743),
       (9727, 88255),
       (97688, 5077),
       (10234, 88255),
       (14403, 62743),
       (14145, 21283);       
with ranks as (
    select 
        h.hacker_id
        , h.name
        , count(c.challenge_id) as challenge_count
        , rank() over (order by count(c.challenge_id) desc) position
    from hackers h
    inner join challenges c
    on h.hacker_id = c.hacker_id
    group by h.hacker_id, h.name
),dupes as (
select position, count(*) as pos_count
from ranks
group by position
)
select hacker_id, name, challenge_count
from ranks r
inner join dupes d
on r.position = d.position and (d.position = 1 or d.pos_count = 1)
order by challenge_count desc, hacker_id asc;