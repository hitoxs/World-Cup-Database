#! /bin/bash

if [[ $1 == "test" ]]
then
  PSQL="psql --username=postgres --dbname=worldcuptest -t --no-align -c"
else
  PSQL="psql --username=freecodecamp --dbname=worldcup -t --no-align -c"
fi

# Do not change code above this line. Use the PSQL variable above to query your database.

$($PSQL "TRUNCATE TABLE games, teams;")

# Insert teams
$($PSQL "COPY teams (name) FROM STDIN WITH CSV HEADER;" < teams.csv)

# Insert games
$($PSQL "COPY games (year, round, winner_id, opponent_id, winner_goals, opponent_goals) FROM STDIN WITH CSV HEADER;" < games.csv)
