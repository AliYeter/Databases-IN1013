-- 1
SELECT opposing_team, COUNT(*)
FROM mccMatches
GROUP BY opposing_team;

-- 2
SELECT opposing_team, COUNT(*)
FROM mccMatches
WHERE ground_name = 'Leaside'
GROUP BY opposing_team;

-- 3
SELECT P.name, AVG(MP.batting_score)
FROM mccPlayer P
INNER JOIN mccMatch_performance MP ON P.registration_number = MP.registration_number
GROUP BY P.name;

-- 4
SELECT P.name, AVG(MP.batting_score)
FROM mccPlayer P
INNER JOIN mccMatch_performance MP ON P.registration_number = MP.registration_number
GROUP BY P.name
HAVING AVG(MP.batting_score) >= 30;

-- 5
SELECT P.name, AVG(MP.batting_score)
FROM mccPlayer P
INNER JOIN mccMatch_performance MP ON P.registration_number = MP.registration_number
WHERE MP.batting_score = 0
GROUP BY P.name;

-- 6 
SELECT P.name, AVG(MP.batting_score)
FROM mccPlayer P
INNER JOIN mccMatch_performance MP ON P.registration_number = MP.registration_number
WHERE MP.batting_score >= 100
GROUP BY P.name;

