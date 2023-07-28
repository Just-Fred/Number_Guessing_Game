#!/bin/bash

# database connector
PSQL="psql -X --username=freecodecamp --dbname=number_guess --tuples-only -c"

# generate random number
random_number=$(( $RANDOM % 1000 + 1 ))

echo "Enter your username:"
read username

user=$($PSQL "SELECT username, games_played, best_game FROM users WHERE username = '$username'")

# welcome user
if [[ -z $user ]]
then
  echo "Welcome, $username! It looks like this is your first time here."
else
  echo "$user" | while read username bar games_played bar best_game
  do
    echo "Welcome back, $username! You have played $games_played games, and your best game took $best_game guesses."
  done
fi

# request for secret number
echo "Guess the secret number between 1 and 1000:"

guess_count=0
while [[ $guess != $random_number ]]
do
  read guess

  guess_count=$(($guess_count + 1))

  if [[ ! $guess =~ ^[0-9]+$ ]]
  then
    echo "That is not an integer, guess again:"
  else
    if [[ $guess > $random_number ]]
    then
      echo "It's lower than that, guess again:"
    elif [[ $guess < $random_number ]]
    then
      echo "It's higher than that, guess again:"
    else
      echo "You guessed it in $guess_count tries. The secret number was $random_number. Nice job!"
      break
    fi

  fi

done

if [[ -z $user ]]
then
  # insert user data
  insert_user=$($PSQL "INSERT INTO users(username, games_played, best_game) VALUES('$username', 1, $guess_count)")
else
  # update user data
  new_games_played=$(( $games_played + 1 ))
  if [[ $best_game < $guess_count ]]
  then
    new_best_game=$guess_count
  fi
  update_games_played=$($PSQL "UPDATE users SET games_played = $new_games_played WHERE username = '$username'")
  update_best_game=$($PSQL "UPDATE users SET best_game = $new_best_game WHERE username = '$username'")
fi
