#!/bin/bash

PSQL="psql -x --username=freecodecamp --dbname=worldcup --tuples-only -c"

# Clear database
CLEAR_DATABASE=$($PSQL "DROP TABLE teams, games")
