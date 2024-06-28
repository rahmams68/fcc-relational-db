#!/bin/bash

PSQL="psql --username=freecodecamp --dbname=number_guess -t --no-align -c"

echo "Enter your username:"
read USERNAME

USER_ID=$($PSQL "SELECT user_id FROM users WHERE name='$USERNAME'")

if [[ -z $USER_ID ]]
then
  INSERT_NEW_USER=$($PSQL "INSERT INTO users(name) VALUES('$USERNAME')")
  USER_ID=$($PSQL "SELECT user_id FROM users WHERE name='$USERNAME'")

  echo -e "\nWelcome, $USERNAME! It looks like this is your first time here.\n"
else
  GAMES_PLAYED=$($PSQL "SELECT COUNT(game_id) FROM games WHERE user_id=$USER_ID")
  BEST_GAME=$($PSQL "SELECT MIN(number_of_guesses) FROM games WHERE user_id=$USER_ID")
  
  echo -e "\nWelcome back, $USERNAME! You have played $GAMES_PLAYED games, and your best game took $BEST_GAME guesses.\n"
fi

RANDOM_NUMBER=$((1 + $RANDOM % 1000))
NUMBER_OF_GUESSES=1

echo "Guess the secret number between 1 and 1000:"
read NUMBER_GUESSED

RESULT() {

  if [[ $1 =~ [0-9]+ ]]
  then
    if (( $1 == $RANDOM_NUMBER ))
    then
      INSERT_GAME_HISTORY=$($PSQL "INSERT INTO games(user_id, number_of_guesses) VALUES($USER_ID, $NUMBER_OF_GUESSES)")
      echo -e "\nYou guessed it in $NUMBER_OF_GUESSES tries. The secret number was $RANDOM_NUMBER. Nice job!"
    else
      if (( $1 > $RANDOM_NUMBER ))
      then
        echo -e "\nIt's lower than that, guess again:"
      else
        echo -e "\nIt's higher than that, guess again:"
      fi
      
      ((NUMBER_OF_GUESSES++))

      read NUMBER_GUESSED
      RESULT $NUMBER_GUESSED
    fi
  else
    echo "That is not an integer, guess again:"
  fi
}

RESULT $NUMBER_GUESSED
