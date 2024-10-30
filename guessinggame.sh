#!/bin/bash

# set correct answer to random number between zero and 9
correct_answer=$((RANDOM % 9 + 1))




clear
# Ask Player 1 to set the number of guesses for Player 2
echo "Welcome to ..."
sleep 1
echo "  ________                            .__                   ________                       
 /  _____/ __ __   ____   ______ _____|__| ____    ____    /  _____/_____    _____   ____  
/   \  ___|  |  \_/ __ \ /  ___//  ___/  |/    \  / ___\  /   \  ___\__  \  /     \_/ __ \ 
\    \_\  \  |  /\  ___/ \___ \ \___ \|  |   |  \/ /_/  > \    \_\  \/ __ \|  Y Y  \  ___/ 
 \______  /____/  \___  >____  >____  >__|___|  /\___  /   \______  (____  /__|_|  /\___  >
        \/            \/     \/     \/        \//_____/           \/     \/      \/     \/"
sleep 1

# Color codes
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[0;33m'
BLUE='\033[0;34m'
NC='\033[0m' # No Color

echo -e "${YELLOW}Welcome to the guessing game!${YELLOW}"
sleep 1
echo -n "Initializing game"
for i in {1..6}; do
    echo -n "."
    sleep 0.5
done
echo -e "\033[5;32mGame Starting!\033[0m"
sleep 3  # Flash for 1 second
clear

echo "Please enter a player name"
read name
clear
echo "Please enter a difficulty:"
echo "Please enter 'easy', 'medium', or 'hard'"
read difficulty
clear

# Validate that the difficulty input is either "easy," "medium," or "hard"
while [[ "$difficulty" != "easy" && "$difficulty" != "medium" && "$difficulty" != "hard" ]]; do
    echo "Invalid input. Please enter 'easy', 'medium', or 'hard':"
    read difficulty
done

# Set the number of guesses based on the selected difficulty level
if [ "$difficulty" = "easy" ]; then
    max_guesses=3
elif [ "$difficulty" = "medium" ]; then
    max_guesses=2
elif [ "$difficulty" = "hard" ]; then
    max_guesses=1
fi




# Initialize remaining guesses counter
remaining_guesses=$max_guesses

while [ "$remaining_guesses" -gt 0 ]; do
    echo "Guesses left: $remaining_guesses . Please guess a number between 0 and 9:"
    read input

    # Check Player's guess

    if ! [[ "$input" =~ ^[0-9]$ ]]; then
    echo "Invalid input. Please enter a number between 0 and 9."
    continue
    fi

    if [ "$input" -eq "$correct_answer" ]; then
        echo "Congratulations, $name! You guessed correctly!"
        break
    elif [ "$input" -lt "$correct_answer" ]; then
        echo "Your number is too small."
    elif [ "$input" -gt "$correct_answer" ]; then
        echo "Your number is too big."
    else
        echo "Please enter a valid number."
        continue
    fi

    # Decrement the remaining guesses
    remaining_guesses=$((remaining_guesses - 1))

    # Check if Player 2 has run out of guesses
    if [ "$remaining_guesses" -eq 0 ]; then
        echo "Sorry, $name! You've run out of guesses. The correct number was $correct_answer."
    fi
done
