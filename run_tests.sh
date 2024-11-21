#!/bin/bash

# Define the base directory for the demo-java repository
BASE_REPO_URL="https://github.com/saucelabs-training/demo-java.git"
BASE_DIR="/tmp/demo-java"
BRANCH="main"  # The branch you want to use, usually "main" or "master"

# Clone the repository into the specified base directory
echo "Cloning the demo-java repository..."
git clone --branch $BRANCH $BASE_REPO_URL $BASE_DIR

# List of directories within the demo-java repo to run tests in
DIRS=(
  "best-practice"
  "playwright-examples"
  "selenium-examples"
)

# Loop through each directory and run mvn clean test
for DIR in "${DIRS[@]}"; do
  echo "Navigating to $DIR and running mvn clean test..."
  
  # Change into the directory
  cd "$BASE_DIR/$DIR" || { echo "Directory $DIR does not exist!"; exit 1; }

  # Run the tests
  mvn clean test

  # Go back to the base directory to prepare for the next iteration
  cd $BASE_DIR
done

# Notify when done
echo "Test run completed for all specified directories!"
