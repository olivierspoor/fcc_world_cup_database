#!/bin/bash

PSQL="psql -x --username=freecodecamp --dbname=worldcup --tuples-only -c"

CREATE_TEAMS_TABLE=$($PSQL "
CREATE TABLE teams(
  team_id SERIAL PRIMARY KEY,
  name VARCHAR(30) NOT NULL UNIQUE
)")

CREATE_GAMES_TABLE=$($PSQL "
CREATE TABLE games(
  game_id SERIAL PRIMARY KEY,
  year INT NOT NULL,
  round VARCHAR(30) NOT NULL,
  winner_id INT NOT NULL,
  opponent_id INT NOT NULL,
  winner_goals INT NOT NULL,
  opponent_goals INT NOT NULL
)")

SET_FOREIGN_KEY_WINNER_ID=$($PSQL "
ALTER TABLE games
    ADD FOREIGN KEY(winner_id) REFERENCES teams(team_id)
")

SET_FOREIGN_KEY_OPPONENT_ID=$($PSQL "
ALTER TABLE games
    ADD FOREIGN KEY(opponent_id) REFERENCES teams(team_id)
")
