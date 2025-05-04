create database cricket ;
use cricket;
CREATE TABLE Tournament (
    Team1 VARCHAR(50),
    Team2 VARCHAR(50),
    Winner VARCHAR(50)
);


INSERT INTO Tournament (Team1, Team2, Winner) VALUES ('RCB', 'CSK', 'RCB');
INSERT INTO Tournament (Team1, Team2, Winner) VALUES ('MI', 'CSK', 'MI');
INSERT INTO Tournament (Team1, Team2, Winner) VALUES ('RCB', 'MI', 'RCB');
INSERT INTO Tournament (Team1, Team2, Winner) VALUES ('CSK', 'MI', 'CSK');
INSERT INTO Tournament (Team1, Team2, Winner) VALUES ('MI', 'RCB', 'MI');
INSERT INTO Tournament (Team1, Team2, Winner) VALUES ('CSK', 'RCB', 'CSK');
INSERT INTO Tournament (Team1, Team2, Winner) VALUES ('MI', 'CSK', 'MI');
INSERT INTO Tournament (Team1, Team2, Winner) VALUES ('RCB', 'CSK', 'RCB');
INSERT INTO Tournament (Team1, Team2, Winner) VALUES ('RCB', 'MI', 'RCB');
INSERT INTO Tournament (Team1, Team2, Winner) VALUES ('MI', 'CSK', 'MI');
INSERT INTO Tournament (Team1, Team2, Winner) VALUES ('CSK', 'RCB', 'CSK');
INSERT INTO Tournament (Team1, Team2, Winner) VALUES ('MI', 'CSK', 'MI');
INSERT INTO Tournament (Team1, Team2, Winner) VALUES ('RCB', 'MI', 'RCB');
INSERT INTO Tournament (Team1, Team2, Winner) VALUES ('CSK', 'RCB', 'CSK');
INSERT INTO Tournament (Team1, Team2, Winner) VALUES ('CSK', 'MI', NULL);
INSERT INTO Tournament (Team1, Team2, Winner) VALUES ('MI', 'RCB', 'MI');
INSERT INTO Tournament (Team1, Team2, Winner) VALUES ('RCB', 'MI', 'RCB');
INSERT INTO Tournament (Team1, Team2, Winner) VALUES ('RCB', 'CSK', 'RCB');
INSERT INTO Tournament (Team1, Team2, Winner) VALUES ('MI', 'CSK', 'MI');
INSERT INTO Tournament (Team1, Team2, Winner) VALUES ('CSK', 'RCB', 'CSK');
INSERT INTO Tournament (Team1, Team2, Winner) VALUES ('CSK', 'MI', NULL);
INSERT INTO Tournament (Team1, Team2, Winner) VALUES ('MI', 'RCB', 'MI');
INSERT INTO Tournament (Team1, Team2, Winner) VALUES ('RCB', 'MI', 'RCB');
INSERT INTO Tournament (Team1, Team2, Winner) VALUES ('CSK', 'RCB', 'CSK');
INSERT INTO Tournament (Team1, Team2, Winner) VALUES ('MI', 'CSK', 'MI');
INSERT INTO Tournament (Team1, Team2, Winner) VALUES ('RCB', 'CSK', 'RCB');
INSERT INTO Tournament (Team1, Team2, Winner) VALUES ('CSK', 'MI', NULL);
INSERT INTO Tournament (Team1, Team2, Winner) VALUES ('MI', 'RCB', 'MI');
INSERT INTO Tournament (Team1, Team2, Winner) VALUES ('RCB', 'MI', 'RCB');
INSERT INTO Tournament (Team1, Team2, Winner) VALUES ('CSK', 'RCB', 'CSK');
select * from Tournament;
SELECT
    Team,
    COUNT(*) AS Matches,
    SUM(CASE WHEN Winner = Team THEN 1 ELSE 0 END) AS Won,
    COUNT(*) - SUM(CASE WHEN Winner = Team THEN 1 ELSE 0 END) - (SELECT COUNT(*) FROM Tournament WHERE Winner IS NULL) AS Lost,
    0 AS Draw,
    SUM(CASE WHEN Winner = Team THEN 2 ELSE 0 END) AS Points
FROM (
    SELECT Team1 AS Team, Winner FROM Tournament
    UNION ALL
    SELECT Team2 AS Team, Winner FROM Tournament
) AS Combined
GROUP BY Team;