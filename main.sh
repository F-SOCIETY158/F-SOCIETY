#!/bin/bash

# ---------------------------------------------------------------------------
# HACKING EFFECT SCRIPT
# Creates animated hacking effects followed by F-SOCIETY installation display
# Finally executes run.sh script if present
# ---------------------------------------------------------------------------

# Clear terminal and hide cursor for cleaner effects[citation:10]
clear
tput civis

# Function to restore cursor and exit cleanly[citation:10]
cleanup() {
    tput cnorm  # Restore cursor visibility
    exit 0
}

# Trap Ctrl+C to ensure cursor is restored[citation:10]
trap cleanup SIGINT

# Function for matrix-like digital rain effect (simplified version)[citation:10]
matrix_effect() {
    local duration=$1
    local start_time=$(date +%s)
    local chars=("0" "1" "2" "3" "4" "5" "6" "7" "8" "9" "A" "B" "C" "D" "E" "F")
    local rows=$(tput lines)
    local cols=$(tput cols)
    
    while [ $(($(date +%s) - start_time)) -lt $duration ]; do
        local col=$((RANDOM % cols))
        local row=$((RANDOM % rows))
        local char=${chars[$((RANDOM % ${#chars[@]}))]}
        
        # Print character in green (hacker-style)[citation:10]
        tput cup $row $col
        echo -ne "\033[32m$char\033[0m"
        
        # Random speed variation
        sleep 0.05
    done
    clear
}

# Function for loading animation with spinner[citation:7]
loading_animation() {
    local message="$1"
    local duration="$2"
    local elapsed=0
    local loading_animation=('|' '/' '-' '\')
    
    echo -n "$message "
    
    while [ "$elapsed" -lt "$duration" ]; do
        for frame in "${loading_animation[@]}"; do
            printf "%s\b" "$frame"
            sleep 0.1
        done
        elapsed=$((elapsed + 1))
    done
    printf " \b\n"
}

# Function for "hacking" progress bars
hacking_progress() {
    echo -e "\033[34m"
    echo "╔══════════════════════════════════════════════════════════════╗"
    echo "║                    INITIATING SYSTEM SCAN                    ║"
    echo "╚══════════════════════════════════════════════════════════════╝"
    echo -e "\033[0m"
    
    local tasks=("BYPASSING FIREWALL" "ACCESSING MAINFRAME" "DECRYPTING DATA" "EXTRACTING FILES")
    
    for task in "${tasks[@]}"; do
        echo -n "$task "
        for i in {1..20}; do
            echo -n "█"
            sleep 0.1
        done
        echo " ✓"
        sleep 0.5
    done
    echo
}

# Function to display F-SOCIETY ASCII art[citation:4]
display_fsociety() {
    echo -e "\033[31m"  # Red color
    cat << "EOF"
⣿⠛⠛⠛⠛⠛⠛⠛⠛⠛⠛⣛⣛⣛⣛⣛⣛⣛⣛⡛⠛⠛⠛⠛⠛⠛⠛⠛⠛⣿
⣿⠀⠀⠀⠀⢀⣠⣤⣶⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣶⣦⣤⣀⠀⠀⠀⠀⣿
⣿⠀⠀⣠⣾⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣷⣤⡀⠀⣿
⣿⣠⣾⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣤⣿
⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿
⣿⠀⠈⢻⣿⠿⠛⠛⠛⠛⠛⢿⣿⣿⣿⣿⣿⣿⡿⠟⠛⠛⠛⠛⠻⣿⣿⠋⠀⣿
⣿⠛⠁⢸⣥⣴⣾⣿⣷⣦⡀⠀⠈⠛⣿⣿⠛⠋⠀⢀⣠⣾⣿⣷⣦⣤⡿⠈⢉⣿
⣿⢋⣩⣼⡿⣿⣿⣿⡿⠿⢿⣷⣤⣤⣿⣿⣦⣤⣴⣿⠿⠿⣿⣿⣿⢿⣷⣬⣉⣿
⣿⣿⣿⣿⣷⣿⡟⠁⠀⠀⠀⠈⢿⣿⣿⣿⢿⣿⠋⠀⠀⠀⠈⢻⣿⣧⣿⣿⣿⣿
⣿⣿⣿⣿⣿⣿⣥⣶⣶⣶⣤⣴⣿⡿⣼⣿⡿⣿⣇⣤⣴⣶⣶⣾⣿⣿⣿⣿⣿⣿
⣿⣿⣿⡿⢛⣿⣿⣿⣿⣿⣿⡿⣯⣾⣿⣿⣿⣮⣿⣿⣿⣿⣿⣿⣿⡟⠿⣿⣿⣿
⣿⣿⡏⠀⠸⣿⣿⣿⣿⣿⠿⠓⠛⢿⣿⣿⡿⠛⠛⠻⢿⣿⣿⣿⣿⡇⠀⠹⣿⣿
⣿⣿⡁⠀⠀⠈⠙⠛⠉⠀⠀⠀⠀⠀⠉⠉⠀⠀⠀⠀⠀⠈⠙⠛⠉⠀⠀⠀⣿⣿
⣿⠛⢇⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⡸⠛⣿
⣿⠀⠈⢳⣶⣤⣤⣤⣤⡄⠀⠀⠠⠤⠤⠤⠤⠤⠀⠀⢀⣤⣤⣤⣤⣴⣾⠃⠀⣿
⣿⠀⠀⠈⣿⣿⣿⣿⣿⣿⣦⣀⡀⠀⠀⠀⠀⠀⣀⣤⣾⣿⣿⣿⣿⣿⠇⠀⠀⣿
⣿⠀⠀⠀⢹⣿⣿⣿⣿⣿⣿⣿⣿⣷⣶⣶⣶⣿⣿⣿⣿⣿⣿⣿⣿⣿⠀⠀⠀⣿
⣿⠀⠀⠀⠈⢿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⠃⠀⠀⠀⣿
⣿⠀⠀⠀⠀⠀⠻⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⠿⠁⠀⠀⠀⠀⣿
⣿⠀⠀⠀⠀⠀⠀⠈⠙⢿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⠟⠁⠀⠀⠀⠀⠀⠀⣿
EOF
    echo -e "\033[0m"
}

# Function to check if setup.sh exists and execute it[citation:2][citation:6]
check_and_run_script() {
    if [ ! -f "setup.sh" ]; then
        echo -e "\033[31mERROR: setup.sh not found in current directory!\033[0m"
        echo "Please ensure setup.sh exists and is executable."
        return 1
    fi
    
    if [ ! -x "setup.sh" ]; then
        echo -e "\033[33mMaking setup.sh executable...\033[0m"
        chmod +x setup.sh
    fi
    
    echo -e "\033[32mExecuting setup.sh...\033[0m"
    echo "══════════════════════════════════════════════════════════════"
    ./setup.sh
}

# ---------------------------------------------------------------------------
# MAIN SCRIPT EXECUTION
# ---------------------------------------------------------------------------

echo -e "\033[36m"
echo "██╗  ██╗ █████╗  ██████╗██╗  ██╗███████╗██████╗ ██████╗ "
echo "██║  ██║██╔══██╗██╔════╝██║ ██╔╝██╔════╝██╔══██╗██╔══██╗"
echo "███████║███████║██║     █████╔╝ █████╗  ██████╔╝██████╔╝"
echo "██╔══██║██╔══██║██║     ██╔═██╗ ██╔══╝  ██╔══██╗██╔══██╗"
echo "██║  ██║██║  ██║╚██████╗██║  ██╗███████╗██║  ██║██║  ██║"
echo "╚═╝  ╚═╝╚═╝  ╚═╝ ╚═════╝╚═╝  ╚═╝╚══════╝╚═╝  ╚═╝╚═╝  ╚═╝"
echo -e "\033[0m"
sleep 2

# Phase 1: Initial hacking effects
echo -e "\033[35m[+] Starting cyber intrusion simulation...\033[0m"
sleep 1

matrix_effect 5
hacking_progress

# Phase 2: Installation simulation
echo -e "\033[34m"
echo "╔══════════════════════════════════════════════════════════════╗"
echo "║                  F-SOCIETY PACKAGE INSTALL                   ║"
echo "╚══════════════════════════════════════════════════════════════╝"
echo -e "\033[0m"

loading_animation "Downloading components" 3
loading_animation "Verifying signatures" 2
loading_animation "Installing core modules" 4
loading_animation "Configuring system" 2

display_fsociety
sleep 2

# Phase 3: Final message
echo -e "\033[1;33m"
echo "┏━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━┓"
echo "┃                                                              ┃"
echo "┃          THIS IS THE POWER OF (ATHEX BLACK HAT)              ┃"
echo "┃                                                              ┃"
echo "┗━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━┛"
echo -e "\033[0m"

sleep 3

# Phase 4: Execute run.sh
echo
echo -e "\033[36m[*] Initialization complete. Launching primary payload...\033[0m"
sleep 1

check_and_run_script

# Restore cursor before exit
cleanup