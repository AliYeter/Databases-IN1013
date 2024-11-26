-- 1
SELECT team_name
FROM mccMatch M
WHERE M.ground_name IN 
    (SELECT ground_name
     FROM mccGround
     WHERE g_town = 'Tynemouth');

-- 2
SELECT name
FROM mccPlayer
WHERE registration_number IN
    (SELECT registration_number
     FROM mccMatch_performance
     WHERE batting_score = 0 AND match_date = '2013-07-05');

-- 3
SELECT ground_name
FROM mccMatch M
WHERE M.match_id IN
    (SELECT match_id
     FROM mccMatch_performance MP
     INNER JOIN mccPlayer P ON MP.registration_number = P.registration_number
     WHERE P.name = 'Shane Watson');

-- 4 
SELECT name
FROM mccPlayer
WHERE registration_number NOT IN
    (SELECT MP.registration_number
     FROM mccMatch_performance MP
     INNER JOIN mccMatches M ON MP.match_id = M.match_id
     INNER JOIN mccPlayer P ON MP.registration_number = P.registration_number
     WHERE M.opposing_team = 'Shane Watson');

-- 5 
SELECT ground_name
FROM mccGround G
WHERE G.ground_name NOT IN
    (SELECT M.ground_name
     FROM mccMatch M
     INNER JOIN mccMatch_performance MP ON M.match_id = MP.match_id
     INNER JOIN mccPlayer P ON MP.registration_number = P.registration_number
     WHERE P.name = 'Shane Watson');

-- 6
SELECT name
FROM mccPlayer
WHERE registration_number IN
    (SELECT registration_number
     FROM mccMatch_performance MP
     INNER JOIN mccMatches M ON MP.match_id = M.match_id
     WHERE M.opposing_team = 'Darlington' AND MP.batting_score >= 50);

-- 7
SELECT name
FROM mccPlayer
WHERE registration_number IN
    (SELECT MP.registration_number
     FROM mccMatch_performance MP
     INNER JOIN mccMatches M ON MP.match_id = M.match_id
     WHERE M.match_id IN
         (SELECT MP2.match_id
          FROM mccMatch_performance MP2
          INNER JOIN mccPlayer P2 ON MP2.registration_number = P2.registration_number
          WHERE P2.name = 'Sachin Tendulkar'));

-- 8
SELECT DISTINCT opposing_team
FROM mccMatches
WHERE opposing_team NOT IN
    (SELECT M.opposing_team
     FROM mccMatch_performance MP
     INNER JOIN mccMatches M ON MP.match_id = M.match_id
     INNER JOIN mccPlayer P ON MP.registration_number = P.registration_number
     WHERE P.name = 'Sachin Tendulkar');
