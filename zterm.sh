#!/bin/bash

# Function to set colors
set_color() {
    case $1 in
        "red") echo -e "\e[31m" ;;     # Red
        "green") echo -e "\e[32m" ;;   # Green
        "yellow") echo -e "\e[33m" ;;  # Yellow
        "blue") echo -e "\e[34m" ;;    # Blue
        "purple") echo -e "\e[35m" ;;  # Purple
        "cyan") echo -e "\e[36m" ;;    # Cyan
        "white") echo -e "\e[37m" ;;   # White
        *) echo -e "\e[0m" ;;          # Default (reset)
    esac
}

# Reset color to default
reset_color() {
    echo -e "\e[0m"
}

# Function to print ASCII Art
print_ascii_art() {
    echo -e "\e[34m" # Blue text color
    echo "________ ________"
    echo "|        \|        \"
    echo " \$$$$$$$$ \$$$$$$$$______    ______   ______ ____"
    echo "    /  $$    | $$  /      \  /      \ |      \    \ "
    echo "   /  $$     | $$ |  $$$$$$\|  $$$$$$\| $$$$$$\$$$$\"
    echo "  /  $$      | $$ | $$    $$| $$   \$$| $$ | $$ | $$"
    echo " /  $$___    | $$ | $$$$$$$$| $$      | $$ | $$ | $$"
    echo "|  $$    \   | $$  \$$     \| $$      | $$ | $$ | $$"
    echo " \$$$$$$$$    \$$   \$$$$$$$ \$$       \$$  \$$  \$$"
    reset_color
}

# Function to display info
show_info() {
    echo -e "\e[32m" # Green color
    echo "Type 'help' for a list of commands"
    reset_color
}

# Custom prompt format
set_prompt() {
    PS1="┌──(\u㉿\h)-[\w]$(tput sgr0)\n└─$ "
}

# Function to clear the screen
clear_command() {
    clear
}

# Function to show current time
show_time() {
    date +"%T"
}

# Function to show current date
show_date() {
    date +"%D"
}

# Function to show system info
sysinfo_command() {
    echo -e "\e[36mSystem Information:\e[0m"
    uname -a
}

# Function to show network information
network_info() {
    echo -e "\e[36mNetwork Information:\e[0m"
    ifconfig
}

# Function for simple calculator
calc_command() {
    echo -n "Enter an expression to calculate: "
    read expr
    echo "Result: $(($expr))"
}

# Function to display the weather (mocked for now)
weather_command() {
    echo "Weather: Sunny, 25°C"
}

# Function for uptime
uptime_command() {
    uptime
}

# Function to display a random joke
joke_command() {
    echo "Why don’t skeletons fight each other? They don’t have the guts."
}

# Function to display fortune (mocked for now)
fortune_command() {
    echo "A random fortune: You will have a pleasant surprise soon!"
}

# Function to display available commands
help_command() {
    echo -e "\e[32mAvailable commands:"
    echo "  help        - Show this list of commands"
    echo "  clear       - Clear the screen"
    echo "  exit        - Exit ZTerm"
    echo "  time        - Show current time"
    echo "  date        - Show current date"
    echo "  calc        - Simple calculator"
    echo "  sysinfo     - Show system info"
    echo "  network     - Show network information"
    echo "  weather     - Show weather information"
    echo "  uptime      - Show system uptime"
    echo "  joke        - Show a random joke"
    echo "  fortune     - Show a random fortune"
    echo "  echo        - Echo text with delay"
    echo "  color       - Change text color"
    echo "  roll        - Dice Roller Game"
    echo "  hangman     - Hangman Game"
    echo "  snake       - Snake Game (ASCII)"
    echo "  tictactoe   - Tic Tac Toe"
    reset_color
}

# Echo command with delay
echo_with_delay() {
    echo -n "Enter the number of times to echo: "
    read num
    echo -n "Enter a message: "
    read message
    echo -n "Enter the delay in seconds (default is 1): "
    read delay
    delay=${delay:-1} # Default delay is 1 second
    for i in $(seq 1 $num); do
        echo -e "$message"
        sleep $delay
    done
}

# Main ZTerm Loop
while true; do
    set_prompt
    print_ascii_art
    show_info
    echo -n "ZTerm> "
    read cmd

    case $cmd in
        help) help_command ;;
        clear) clear_command ;;
        exit) exit ;;
        time) show_time ;;
        date) show_date ;;
        calc) calc_command ;;
        sysinfo) sysinfo_command ;;
        network) network_info ;;
        weather) weather_command ;;
        uptime) uptime_command ;;
        joke) joke_command ;;
        fortune) fortune_command ;;
        echo) echo_with_delay ;;
        color) color_command ;;
        roll) echo "Dice Roller Game is coming soon!" ;;
        hangman) echo "Hangman Game is coming soon!" ;;
        snake) echo "Snake Game is coming soon!" ;;
        tictactoe) echo "Tic Tac Toe is coming soon!" ;;
        *) echo "Unknown command: $cmd. Type 'help' for a list of commands." ;;
    esac
done
