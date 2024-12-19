#!/bin/bash

# Print the initial ASCII art and info
clear
echo "________ ________"
echo "|        \\|        \\"
echo " \\$$$$$$$$ \\$$$$$$$$______    ______   ______ ____"
echo "    /  $$    | $$  /      \\  /      \\ |      \\    \\"
echo "   /  $$     | $$ |  $$$$$$\\|  $$$$$$\\| $$$$$$\\$$$$\\"
echo "  /  $$      | $$ | $$    $$| $$   \\$$| $$ | $$ | $$"
echo " /  $$___    | $$ | $$$$$$$$| $$      | $$ | $$ | $$"
echo "|  $$    \\   | $$  \\$$     \\| $$      | $$ | $$ | $$"
echo " \\$$$$$$$$    \\$$   \\$$$$$$$ \\$$       \\$$  \\$$  \\$$"
echo
echo "Type 'help' for a list of commands"

# Function for the Number Guessing Game
number_guessing_game() {
    local secret=$(( RANDOM % 100 + 1 ))
    local guess=0
    local attempts=0

    echo "Welcome to the Number Guessing Game! Guess a number between 1 and 100."

    while [[ $guess -ne $secret ]]; do
        read -p "Enter your guess: " guess
        ((attempts++))

        if [[ $guess -lt $secret ]]; then
            echo "Too low! Try again."
        elif [[ $guess -gt $secret ]]; then
            echo "Too high! Try again."
        else
            echo "Congratulations! You guessed the number in $attempts attempts."
        fi
    done
}

# Function for the Dice Roll Game
dice_roll() {
    local result=$(( RANDOM % 6 + 1 ))
    echo "You rolled a $result!"
}

# Function for the Rock, Paper, Scissors Game
rock_paper_scissors() {
    echo "Welcome to Rock, Paper, Scissors!"
    echo "Type 'rock', 'paper', or 'scissors'."
    
    read -p "Your move: " user_choice
    choices=("rock" "paper" "scissors")
    computer_choice=${choices[$(( RANDOM % 3 ))]}

    echo "Computer chose: $computer_choice"
    
    if [[ $user_choice == $computer_choice ]]; then
        echo "It's a tie!"
    elif [[ ($user_choice == "rock" && $computer_choice == "scissors") ||
            ($user_choice == "paper" && $computer_choice == "rock") ||
            ($user_choice == "scissors" && $computer_choice == "paper") ]]; then
        echo "You win!"
    else
        echo "You lose!"
    fi
}

# Function for Hangman Game
hangman_game() {
    local word="coding"
    local guessed_word=$(echo "$word" | sed 's/./_/g')
    local tries=6
    local guessed_letters=""

    echo "Welcome to Hangman!"
    echo "Try to guess the word. You have $tries tries."
    echo "$guessed_word"

    while [[ $tries -gt 0 && "$guessed_word" != "$word" ]]; do
        read -p "Guess a letter: " letter

        if [[ "$guessed_letters" == *"$letter"* ]]; then
            echo "You've already guessed that letter!"
            continue
        fi

        guessed_letters+="$letter"

        if [[ "$word" == *"$letter"* ]]; then
            echo "Good guess!"
            guessed_word=$(echo "$word" | sed "s/[^$guessed_letters]/_/g")
        else
            ((tries--))
            echo "Incorrect guess! You have $tries tries left."
        fi

        echo "$guessed_word"
    done

    if [[ "$guessed_word" == "$word" ]]; then
        echo "Congratulations! You've guessed the word!"
    else
        echo "Game over! The word was $word."
    fi
}

# Function for Tic-Tac-Toe Game
tictactoe_game() {
    echo "Welcome to Tic-Tac-Toe!"
    echo "Player 1 is X, Player 2 is O"
    # Implement Tic-Tac-Toe logic here (this is a simplified version)

    board=("1" "2" "3" "4" "5" "6" "7" "8" "9")
    current_player="X"

    print_board() {
        echo -e "${board[0]} | ${board[1]} | ${board[2]}"
        echo "---------"
        echo -e "${board[3]} | ${board[4]} | ${board[5]}"
        echo "---------"
        echo -e "${board[6]} | ${board[7]} | ${board[8]}"
    }

    make_move() {
        local move
        while true; do
            read -p "Player $current_player, choose a position (1-9): " move
            if [[ ${board[$((move - 1))]} != "X" && ${board[$((move - 1))]} != "O" && $move -ge 1 && $move -le 9 ]]; then
                board[$((move - 1))]=$current_player
                break
            else
                echo "Invalid move. Try again."
            fi
        done
    }

    check_winner() {
        local lines=(
            "0 1 2" "3 4 5" "6 7 8"
            "0 3 6" "1 4 7" "2 5 8"
            "0 4 8" "2 4 6"
        )
        for line in "${lines[@]}"; do
            set -- $line
            if [[ ${board[$1]} == ${board[$2]} && ${board[$2]} == ${board[$3]} ]]; then
                echo "Player $current_player wins!"
                return 1
            fi
        done
        return 0
    }

    while true; do
        print_board
        make_move
        if check_winner; then
            print_board
            break
        fi
        current_player="X"
        if [[ $current_player == "X" ]]; then
            current_player="O"
        else
            current_player="X"
        fi
    done
}

# Main command loop
while true; do
    echo -n "ZTerm> "
    read command

    case $command in
        help)
            echo "Available commands:"
            echo "  help        - Show this list of commands"
            echo "  clear       - Clear the screen"
            echo "  exit        - Exit ZTerm"
            echo "  time        - Show current time"
            echo "  date        - Show current date"
            echo "  guess       - Number Guessing Game"
            echo "  rockpaperscissors - Rock, Paper, Scissors"
            echo "  roll        - Dice Roller Game"
            echo "  hangman     - Hangman Game"
            echo "  snake       - Snake Game (ASCII)"
            echo "  tictactoe   - Tic Tac Toe"
            ;;
        clear)
            clear
            ;;
        exit)
            exit
            ;;
        time)
            date +"%T"
            ;;
        date)
            date +"%Y-%m-%d"
            ;;
        guess)
            number_guessing_game
            ;;
        roll)
            dice_roll
            ;;
        rockpaperscissors)
            rock_paper_scissors
            ;;
        hangman)
            hangman_game
            ;;
        tictactoe)
            tictactoe_game
            ;;
        *)
            echo "Unknown command: $command. Type 'help' for a list of commands."
            ;;
    esac
done
