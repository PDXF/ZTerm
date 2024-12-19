#!/bin/bash

# Clear the screen at the start
clear

# ASCII Art Header
echo " ________ ________ "
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

# Command loop
while true; do
    # Prompt for command input
    read -p "ZTerm> " input

    case $input in
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
        guess)
            # Add the guessing game code here
            ;;
        rockpaperscissors)
            # Add the rock-paper-scissors game code here
            ;;
        roll)
            # Add the dice rolling code here
            ;;
        hangman)
            # Add the hangman code here
            ;;
        snake)
            # Add the snake game placeholder here
            ;;
        tictactoe)
            # Add the tic-tac-toe code here
            ;;
        clear)
            clear
            ;;
        exit)
            echo "Exiting ZTerm..."
            break
            ;;
        *)
            echo "Unknown command: $input. Type 'help' for a list of commands."
            ;;
    esac
done
