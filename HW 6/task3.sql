-- 1 
SELECT team_name, ground_name, g_street
FROM mccMatches
WHERE g_town = 'Tynemouth';

-- 2 
SELECT name
FROM mccPlayer P
INNER JOIN mccMatch_performance MP
ON P.registration_number = MP.registration_number
WHERE batting_score = 0
AND match_date = '2013-07-05';

-- 3
SELECT name
FROM mccPlayer P
INNER JOIN mccMatch_performance MP
ON P.registration_number = MP.registration_number
INNER JOIN mccMatches M
ON MP.match_date = M.match_date
WHERE batting_score > 50
AND ground_name = 'Gasworks';

-- 4
SELECT ground_name, g_town
FROM mccPlayer P
INNER JOIN mccMatch_performance MP
ON P.registration_number = MP.registration_number
INNER JOIN mccMatches M
ON MP.match_date = M.match_date
WHERE name = 'Shane Watson'
AND batting_score >= 150;

-- 5
SELECT P.name, MP.match_date, M.opposing_team_name
FROM mccPlayer P
INNER JOIN mccMatch_performance MP
ON P.registration_number = MP.registration_number
INNER JOIN mccMatches M
ON MP.match_date = M.match_date
WHERE batting_score < P.age;

-- 6
SELECT G2.ground_name
FROM mccGround G1
INNER JOIN mccGround G2
ON G1.g_town = G2.g_town
WHERE G1.ground_name = 'Leaside'
AND G2.ground_name != 'Leaside';

-- 7
SELECT P2.name
FROM mccPlayer P1
INNER JOIN mccPlayer P2
ON P1.p_town = P2.p_town
WHERE P1.name = 'Shane Watson'
AND P2.name != 'Shane Watson';
