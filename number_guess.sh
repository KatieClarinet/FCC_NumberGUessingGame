#!/bin/bash
PSQL="psql --username=freecodecamp --dbname=game --no-align -q -t -c"
if [[ $1 ]]
  then
    echo -e "\n$1"
  fi
  RANDOM_NUM=$($PSQL "SELECT floor(random() * 1000 + 1)::int;")
  GAMES_PLAYED=0
  GUESSES_PER_GAME=0
# prompt user for username
echo "Enter your username:"
read INPUT


GUESS() {
    # echo $GAME_COMPLETE
   read GUESS
       # check if the input is a number
    if [[ $GUESS =~ ^[0-9]+$ ]]
      then
      # IF GUESS IS CORRECT
      if [[ $GUESS = $RANDOM_NUM ]]
         then
         # insert it into table
            let GAMES_PLAYED++ 
            let GUESSES_PER_GAME++
            # CHECK IF GUESSES PER GAME IS LOWER THAN BEST GUESS
              if [[ $GUESSES_PER_GAME < $BEST_GUESS || -z $BEST_GUESS ]]
              then
            echo $($PSQL "UPDATE player SET best_guess = $GUESSES_PER_GAME WHERE username = '$INPUT';")
            echo $($PSQL "UPDATE player SET games_played = games_played + 1 WHERE username = '$INPUT';")
            echo "You guessed it in $GUESSES_PER_GAME tries. The secret number was $RANDOM_NUM. Nice job!"
            else
             echo $($PSQL "UPDATE player SET games_played = games_played + 1 WHERE username = '$INPUT';")
            echo "You guessed it in $GUESSES_PER_GAME tries. The secret number was $RANDOM_NUM. Nice job!"
              fi
          else
            # not correct answer
                if [[ $GUESS -gt $RANDOM_NUM ]]
                then
                echo "It's lower than that, guess again:"
               let GUESSES_PER_GAME++
                GUESS
                else
                echo "It's higher than that, guess again:"
                let GUESSES_PER_GAME++
                GUESS
                fi
          fi
        else
         echo "That is not an integer, guess again:"
          GUESS
    
     fi
}

 PLAYER() {
# # check if username already in USER TABLE,
USERNAME_EXISTS=$($PSQL "SELECT username FROM player WHERE EXISTS (SELECT username FROM player WHERE username = '$INPUT');")
  BEST_GUESS=$($PSQL "SELECT best_guess FROM player WHERE username = '$INPUT'");
  if [[ -z $USERNAME_EXISTS ]]
  then
  echo "Welcome, $INPUT! It looks like this is your first time here."
    echo $($PSQL "INSERT INTO player(username, games_played) VALUES ('$INPUT', $GAMES_PLAYED);")
    USERNAME=$($PSQL "SELECT username FROM player WHERE username = '$INPUT';")
  else
  USERNAME=$($PSQL "SELECT username FROM player WHERE username = '$INPUT';")
  PLAYED=$($PSQL "SELECT games_played FROM player WHERE username = '$INPUT';")
  echo -e "Welcome back, $USERNAME! You have played $PLAYED games, and your best game took $BEST_GUESS guesses."
  fi
# generate a random number between 1 - 1000
echo "Guess the secret number between 1 and 1000:"
GUESS
} 
PLAYER
