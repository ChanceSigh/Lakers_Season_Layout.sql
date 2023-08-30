--MIS 3365
--Chancey Ivener
--Script and Inserts
DROP TABLE players_game;
DROP TABLE games;
DROP TABLE season;
DROP TABLE opponent;
DROP TABLE players_positions;
DROP TABLE positions;
DROP TABLE players;
DROP TABLE coach;

--Create Tables-------------------------------------------------------------------------------------------------
CREATE TABLE coach
(coach_id INT PRIMARY KEY,
last_name VARCHAR (35),
first_name VARCHAR (35),
start_date DATETIME,
end_date DATETIME,
experience INT); 

CREATE TABLE players
(player_id INT PRIMARY KEY,
last_name VARCHAR (35),
first_name VARCHAR (35),
jersey_number INT,
salary MONEY NOT NULL,
start_date DATETIME,
end_date DATETIME,
height DECIMAL (2,1),
weight INT,
wingspan DECIMAL (2, 1),
coach INT NOT NULL REFERENCES coach (coach_id));

CREATE TABLE positions
(position_id INT PRIMARY KEY,
position_name VARCHAR (35) CHECK (position_name = 'center' or position_name = 'power forward' or position_name = 'small forward' or position_name = 'point guard' or position_name = 'shooting guard' or position_name = 'hybrid position'));

CREATE TABLE players_positions
(players_position_id INT PRIMARY KEY,
time_played_in_position INT,
players INT NOT NULL REFERENCES players (player_id),
positions INT NOT NULL REFERENCES positions (position_id)); 

CREATE TABLE opponent
(opponent_id INT PRIMARY KEY,
opponent_name VARCHAR (35),
points_scored INT,
winloss_percentage DECIMAL (4, 3));
 
CREATE TABLE season
(season_id INT PRIMARY KEY,
season_year INT NOT NULL,
team_ranking_conference INT CHECK (team_ranking_conference >= 1 AND team_ranking_conference <= 15),
team_ranking_division INT CHECK (team_ranking_division >= 1 AND team_ranking_division <= 5));

CREATE TABLE games
(game_id INT PRIMARY KEY,
head_referee VARCHAR (35),
date_time DATETIME,
location VARCHAR (35),
winning_score INT,
losing_score INT,
opponent INT NOT NULL REFERENCES opponent (opponent_id),
season INT NOT NULL REFERENCES season (season_id));

CREATE TABLE players_game
(players_game_id INT PRIMARY KEY,
rebounds_game INT,
assists_game INT,
steals_game INT,
blocks_game INT,
turnovers_game INT,
starter BIT,
injury VARCHAR (50),
minutes_played DATETIME,
two_pointers INT,
three_pointers INT,
free_throws INT,
players INT NOT NULL REFERENCES players (player_id),
games INT NOT NULL REFERENCES games (game_id));

--Insert Data---------------------------------------------------------------------------------------------------
---insert into coach 
INSERT INTO coach
VALUES (1, 'Vogel' , 'Frank', 'January 1, 2019', NULL , 11);
INSERT INTO coach
VALUES (2, 'Fizdale' , 'David', 'January 1, 2020', NULL , 20);
INSERT INTO coach
VALUES (3, 'Handy' , 'Phil', 'January 1, 2019', NULL , 11);
INSERT INTO coach
VALUES (4, 'Simon' , 'Miles', 'January 1, 2018', NULL , 7);
INSERT INTO coach
VALUES (5, 'Crawford' , 'Quinton', 'January 1, 2020', NULL , 4);
--insert into players
INSERT INTO players
VALUES (101, 'Anthony' , 'Carmelo', 7 , 2159029 , 'January 1, 2022', NULL,6.7, 238, 6.11, 1 );
INSERT INTO players
VALUES (102, 'Ariza' , 'Trevor', 1 , 2150000 , 'January 1, 2020', NULL, 6.8, 215, 6.11, 1 );
INSERT INTO players
VALUES (103, 'Bradley' , 'Avery', 20 , 2050000 , 'January 1, 2019', NULL, 6.3 ,180, 6.5, 1 );
INSERT INTO players
VALUES (104, 'Davis' , 'Anthony', 3 , 3789029 , 'January 1, 2019', NULL, 6.10, 238, 7.1, 1 );
INSERT INTO players
VALUES (105, 'Horton' , 'Tucker', 5 , 1159029 , 'January 1, 2021', NULL, 6.4, 234, 6.6, 1 );
INSERT INTO players
VALUES (106, 'Howard' , 'Dwight', 39 , 1157029 , 'January 1, 2022', NULL, 6.10, 265, 7.0, 1 );
INSERT INTO players
VALUES (107, 'Monk' , 'Malik', 11 , 3159029 , 'January 1, 2022', NULL, 6.3, 200, 6.6, 1 );
INSERT INTO players
VALUES (108, 'Westbrook' , 'Russell', 0 , 5159029 , 'January 1, 2022', NULL, 6.3, 200, 6.5, 1 );
INSERT INTO players
VALUES (109, 'Reaves' , 'Austin', 15 , 159029 , 'January 1, 2022', NULL, 6.5, 197, 6.7, 1 );
INSERT INTO players
VALUES (110, 'James' , 'Lebron', 6 , 8159029 , 'January 1, 2018', NULL, 6.9, 250, 6.11, 1 );
--insert positions
INSERT INTO positions
VALUES (301, 'point guard')
INSERT INTO positions
VALUES (302, 'shooting guard')
INSERT INTO positions
VALUES (303, 'small forward')
INSERT INTO positions
VALUES (304, 'power forward')
INSERT INTO positions
VALUES (305, 'center')
INSERT INTO positions
VALUES (306, 'hybrid position')
--insert players_positions
INSERT INTO players_positions
VALUES (401, 32, 106, 305)
INSERT INTO players_positions
VALUES (402, 28, 107, 302)
INSERT INTO players_positions
VALUES (403, 38, 110, 303)
INSERT INTO players_positions
VALUES (404, 36, 104, 304)
INSERT INTO players_positions
VALUES (405, 33, 108, 306)
--insert opponents
INSERT INTO opponent
VALUES (501,'Golden State Warriors', 101, 0.545 )
INSERT INTO opponent
VALUES (502,'Miami Heat', 97, 0.455)
INSERT INTO opponent
VALUES (503,'Boston Celtics', 95, 0.500 )
INSERT INTO opponent
VALUES (504,'San Antonio Spurs', 84, 0.654)
INSERT INTO opponent
VALUES (505,'Los Angeles Clippers',110, 0.333)
--insert season
INSERT INTO season
VALUES (601, 2018, 8, 5)
INSERT INTO season
VALUES (602, 2019, 7, 5)
INSERT INTO season
VALUES (603, 2020, 5, 5)
INSERT INTO season
VALUES (604, 2021, 3, 2)
INSERT INTO season
VALUES (605, 2022, 1, 1)
--insert games
INSERT INTO games
VALUES (701, 'Jimbo Joe', 10/09/2018, 'Crypto.com Arena', 102, 101, 501, 601) 
INSERT INTO games
VALUES (702, 'Charles Burger', 12/05/2019, 'FTX Arena', 97, 90, 502, 602)  
INSERT INTO games
VALUES (703, 'Susy Martinez', 02/20/2020, 'TD Garden', 96, 95, 503, 603) 
INSERT INTO games
VALUES (704, 'Mary Smith', 01/15/2021, 'Crypto.com Arena', 84, 80, 504, 604)
INSERT INTO games
VALUES (705, 'Marco Polo', 03/12/2022, 'Crypto.com Arena', 113, 110, 505, 605)  
--insert players_game
INSERT INTO players_game
VALUES (801, 22, 30, 10, 20, 2, 1, NULL, '00:40:00', 16, 10, 10, 110, 705) 
INSERT INTO players_game
VALUES (802, 3, 1, 2, 4, 1, 1, 'Sprained Ankle', '00:08:00', 2, 2, 1, 101, 704) 
INSERT INTO players_game
VALUES (803, 35, 25, 30, 15, 3, 0, NULL, '00:12:00', 8, 3, 2, 104, 703) 
INSERT INTO players_game
VALUES (804, 15, 20, 6, 5, 0, 1, 'Torn ACL', '00:24:00', 6, 8, 1, 108, 701) 
INSERT INTO players_game
VALUES (805, 8, 12, 11, 10, 0, 0, NULL, '00:15:00', 4, 4, 3, 107, 702) 

--Queries----------------------------------------------------------------------------------------------------
--1 Players with salary over $5,000,000
SELECT first_name, last_name, salary
FROM players
WHERE salary > 5000000
ORDER BY salary;

--2 Show referee's with the letter M in their name
SELECT head_referee, location
FROM games
WHERE head_referee LIKE '%M%';

--3 Players that first name starts with a letter A
SELECT first_name, last_name, jersey_number
FROM players
WHERE first_name LIKE 'A%';

--4 Games played that are not in Crypto.com Arena
SELECT location, date_time, winning_score, losing_score
FROM games
WHERE location NOT IN ('Crypto.com Arena');

--Multiple tables
--5, show coaches and players that started in 2019
SELECT coach.first_name, coach.last_name, coach.start_date, players.first_name, players.last_name, players.start_date
FROM coach, players
WHERE coach.coach_id = players.coach
AND coach.start_date = 'January 1, 2019' AND players.start_date = 'January 1, 2019';

--6 show players first and last name and height that have played between 33 and 40 minutes. Sort by time played.
SELECT first_name, last_name, height, time_played_in_position
FROM players, players_positions
WHERE players.player_id = players_positions.players
AND time_played_in_position BETWEEN 33 AND 40
ORDER BY time_played_in_position DESC

--7 show players that were injured during a game. Sort by minutes_played.
SELECT first_name, last_name, jersey_number, injury, minutes_played
FROM players, players_game
WHERE players.player_id = players_game.players
AND injury IS NOT NULL
ORDER BY minutes_played

--8 show coaches and players last names that don't start with an H. 
SELECT coach.last_name, players.last_name
FROM coach, players
WHERE coach.coach_id = players.coach
AND coach.last_name NOT LIKE 'H%' AND players.last_name NOT LIKE 'H%';

--9 Opponents that have scored less than 100 points and didn't play in cyrpto arena. Sort by opponent name.
SELECT opponent_name, points_scored, winning_score, losing_score
FROM opponent, games
WHERE opponent.opponent_id = games.opponent
AND points_scored < 100 AND location != 'Crypto.com Arena'
ORDER BY opponent_name;

--10 show all seasons where the team conference ranking is #1, the season year, and the coach
SELECT team_ranking_conference, season_year, coach.first_name, coach.last_name, experience
FROM season, games, players_game, players, coach
WHERE coach.coach_id = players.coach
AND players.player_id = players_game.players
AND games.game_id = players_game.games
AND season.season_id = games.season
AND team_ranking_conference = 1;

--11 show players game stats for every position except center
SELECT first_name, last_name, height, position_name, rebounds_game, assists_game, turnovers_game, two_pointers, three_pointers, free_throws
FROM players, players_game, players_positions, positions
WHERE positions.position_id = players_positions.positions 
AND players.player_id = players_positions.players
AND players.player_id = players_game.players 
AND position_name != 'center';

--12 shows all players who have played in a game. 
SELECT first_name,last_name,jersey_number, minutes_played
FROM players LEFT OUTER JOIN players_game
ON players.player_id = players_game.players

--13, show all of opponents played against with scores. Sort by opponents
SELECT opponent_name, points_scored,location,winning_score,losing_score
FROM opponent FULL OUTER JOIN games
ON opponent.opponent_id = games.opponent
ORDER BY opponent_name ASC

--14, show all starters playing in the game on 3/12/2022
SELECT first_name, last_name, jersey_number, starter
FROM players, games, players_game 
WHERE players.player_id = players_game.players
AND games.game_id = players_game.games
AND starter = 1 AND date_time = 3/12/2022;

--15, show players with equal to or over 5 two pointers or equal to or over 4 three pointers. Sort by time played.
SELECT first_name, last_name, two_pointers, three_pointers, minutes_played
FROM players, games, players_game 
WHERE players.player_id = players_game.players
AND games.game_id = players_game.games
AND (two_pointers >= 5 OR three_pointers >= 4)
ORDER BY minutes_played;

