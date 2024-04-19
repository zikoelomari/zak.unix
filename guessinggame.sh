Bash
#!/bin/bash

# Function to check if the guess is correct
function check_guess {
  local guess=$1
  local num_files=$2
  if [[ $guess -eq $num_files ]]; then
    echo "Congratulations! You guessed the number of files correctly."
  elif [[ $guess -lt $num_files ]]; then
    echo "Your guess is too low. Try again."
  else
    echo "Your guess is too high. Try again."
  fi
}

# Get the number of files in the current directory
num_files=$(ls -l | grep -c ^-)

# Start the guessing game loop
while true; do
  echo "How many files are in the current directory?"
  read guess

  # Call the check_guess function
  check_guess $guess $num_files

  # Check if the guess is correct and exit the loop if so
  if [[ $? -eq 0 ]]; then
    break
  fi
done