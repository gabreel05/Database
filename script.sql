CREATE DATABASE IF NOT EXISTS championship;

USE championship;

CREATE TABLE IF NOT EXISTS players(
	player_id INTEGER PRIMARY KEY AUTO_INCREMENT,
    player_name VARCHAR(255) NOT NULL,
    player_shirt_number INTEGER NOT NULL,
    player_height DOUBLE NOT NULL,
    player_weight DOUBLE NOT NULL,
    player_goals INTEGER NOT NULL,
    player_assists INTEGER NOT NULL,
    players_passes INTEGER NOT NULL,
	team_id INTEGER NOT NULL,
    FOREIGN KEY (team_id) REFERENCES teams(team_id)
);

CREATE TABLE IF NOT EXISTS teams(
	team_id INTEGER PRIMARY KEY AUTO_INCREMENT,
    team_name VARCHAR(255) NOT NULL,
    team_victories INTEGER NOT NULL,
    team_defeats INTEGER NOT NULL,
    team_draws INTEGER NOT NULL,
	table_id INTEGER NOT NULL,
    FOREIGN KEY (table_id) REFERENCES tables(table_id)
);

CREATE TABLE IF NOT EXISTS games(
	game_id INTEGER PRIMARY KEY AUTO_INCREMENT,
    game_result CHAR(5) NOT NULL,
    game_public INTEGER NOT NULL,
    game_red_card_numbers INTEGER NOT NULL,
    game_yellow_card_numbers INTEGER NOT NULL,
    game_faults INTEGER NOT NULL,
    winner_id INTEGER NOT NULL,
    FOREIGN KEY (winner_id) REFERENCES teams(winner_id),
    loser_id INTEGER NOT NULL,
    FOREIGN KEY (loser_id) REFERENCES teams(loser_id),
	referee_id INTEGER NOT NULL,
    FOREIGN KEY (referee_id) REFERENCES referees(referee_id),
	transmission_id INTEGER NOT NULL,
    FOREIGN KEY (transmission_id) REFERENCES transmissions(transmission_id),
	stadium_id INTEGER NOT NULL,
    FOREIGN KEY (stadium_id) REFERENCES stadiums(stadium_id)
);
	
CREATE TABLE IF NOT EXISTS game_teams(
	principal_id INTEGER PRIMARY KEY,
    FOREIGN KEY (principal_id) REFERENCES teams(principal_id),
    visitant_id INTEGER PRIMARY KEY,
    FOREIGN KEY (visitant_id) REFERENCES teams(visitant_id),
    game_id INTEGER PRIMARY KEY,
    FOREIGN KEY (game_id) REFERENCES games(game_id)
);

CREATE TABLE IF NOT EXISTS tables(
	table_id INTEGER PRIMARY KEY AUTO_INCREMENT,
    referee_id INTEGER NOT NULL,
    FOREIGN KEY (referee_id) REFERENCES referees(referee_id),
    game_id INTEGER NOT NULL,
    FOREIGN KEY (game_id) REFERENCES games(game_id)
);

CREATE TABLE IF NOT EXISTS referees(
	referee_id INTEGER PRIMARY KEY AUTO_INCREMENT,
    referee_name VARCHAR(255) NOT NULL
);

CREATE TABLE IF NOT EXISTS stadiums(
	stadium_id INTEGER PRIMARY KEY AUTO_INCREMENT,
    stadium_name VARCHAR(255) NOT NULL,
    stadium_capacity INTEGER NOT NULL,
    team_id INTEGER NOT NULL,
    FOREIGN KEY (team_id) REFERENCES teams(team_id)
);

CREATE TABLE IF NOT EXISTS transmissions(
	transmission_id INTEGER PRIMARY KEY AUTO_INCREMENT,
    transmission_narrator VARCHAR(255) NOT NULL,
    transmission_commentator VARCHAR(255) NOT NULL,
    transmission_broadcaster VARCHAR(255) NOT NULL
);

CREATE TABLE IF NOT EXISTS fans(
	fan_id INTEGER PRIMARY KEY AUTO_INCREMENT,
    fan_name VARCHAR(255) NOT NULL,
	team_id INTEGER NOT NULL,
    FOREIGN KEY (team_id) REFERENCES teams(team_id)
);
