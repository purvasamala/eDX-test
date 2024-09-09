#!/bin/bash

# A script to calculate simple interest

# Function to calculate simple interest
calculate_simple_interest() {
    local principal=$1
    local rate=$2
    local time=$3
    local interest=$(echo "scale=2; $principal * $rate * $time / 100" | bc)
    echo "Simple Interest: \$${interest}"
}

# Prompt user for input
read -p "Enter the principal amount: " principal
read -p "Enter the annual interest rate (in percentage): " rate
read -p "Enter the time period (in years): " time

# Validate input
if [[ ! "$principal" =~ ^[0-9]+(\.[0-9]+)?$ ]] || [[ ! "$rate" =~ ^[0-9]+(\.[0-9]+)?$ ]] || [[ ! "$time" =~ ^[0-9]+(\.[0-9]+)?$ ]]; then
    echo "Invalid input. Please enter numeric values."
    exit 1
fi

# Calculate and display the simple interest
calculate_simple_interest "$principal" "$rate" "$time"
