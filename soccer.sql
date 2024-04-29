-- from the terminal run:
-- psql < soccer.sql
DROP DATABASE IF EXISTS soccer;

CREATE DATABASE soccer;

\c soccer

CREATE TABLE
    teams (id SERIAL PRIMARY KEY, name TEXT NOT NULL);

CREATE TABLE
    players (
        id SERIAL PRIMARY KEY,
        name TEXT UNIQUE NOT NULL,
        team_id INTEGER REFERENCES teams
    );

CREATE TABLE
    referees (
        id SERIAL PRIMARY KEY,
        name TEXT UNIQUE NOT NULL
    );

CREATE TABLE
    seasons (
        id SERIAL PRIMARY KEY,
        start_date DATE NOT NULL,
        end_date DATE NOT NULL
    );

CREATE TABLE
    matches (
        id SERIAL PRIMARY KEY,
        home_team INTEGER NOT NULL REFERENCES teams,
        away_team INTEGER NOT NULL REFERENCES teams,
        season_id INTEGER REFERENCES seasons,
        referee_id INTEGER REFERENCES referees
    );

CREATE TABLE
    goals (
        id SERIAL PRIMARY KEY,
        match_id INTEGER NOT NULL REFERENCES matches,
        player_id INTEGER NOT NULL REFERENCES players
    );

CREATE TABLE
    results (
        id SERIAL PRIMARY KEY,
        team_id INTEGER NOT NULL REFERENCES teams,
        match_id INTEGER NOT NULL REFERENCES matches,
        result TEXT NOT NULL CHECK (
            result = 'win'
            OR result = 'loss'
            OR result = 'tie'
        )
    );

-- Insert mock data into the teams table
INSERT INTO teams (name) VALUES
    ('Red'),
    ('Blue');

-- Insert mock data into the players table
INSERT INTO players (name, team_id) VALUES
    ('John Smith', 1),
    ('Emma Johnson', 1),
    ('Michael Williams', 2),
    ('Sarah Davis', 2);

-- Insert mock data into the referees table
INSERT INTO referees (name) VALUES
    ('David Brown'),
    ('Lisa Taylor');



-- Insert mock data into the seasons table
INSERT INTO seasons (start_date, end_date) VALUES
    ('2023-01-01', '2023-12-31'),
    ('2024-01-01', '2024-12-31');

-- Insert mock data into the matches table
INSERT INTO matches (home_team, away_team, season_id, referee_id) VALUES
    (1, 2, 1, 1),
    (2, 1, 2, 2);

-- Insert mock data into the goals table
INSERT INTO goals (match_id, player_id) VALUES
    (1, 1),
    (1, 3);

-- Insert mock data into the results table
INSERT INTO results (team_id, match_id, result) VALUES
    (1, 1, 'win'),
    (2, 1, 'loss'),
    (2, 2, 'win'),
    (1, 2, 'loss');

