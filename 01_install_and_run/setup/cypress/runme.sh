#!/bin/bash

# Remove the 'example-cypress' directory if it exists
rm -rf installs/example-cypress

# Create the 'example-cypress' directory and its parent directories
mkdir -p installs/example-cypress

# Change the current directory to 'installs/example-cypress'
# If the directory does not exist, exit the script
cd installs/example-cypress || exit

# Initialize an npm package in the current directory with default values
# Redirect the output to /dev/null to suppress the console output
npm init -y >/dev/null

# Install Cypress package with a version greater than or equal to 12.0.0 as a dev dependency
npm install cypress@^12.0.0 --save-dev

# Create the 'cypress/e2e' directory
mkdir -p cypress/e2e

# Copy the 'example.cy.js' file from the '../../setup/cypress/' directory to 'cypress/e2e' directory
cp ../../setup/cypress/example.cy.js cypress/e2e/example.cy.js

# Copy the 'cypress.config.js' file from the '../../setup/cypress/' directory to the current directory
cp ../../setup/cypress/cypress.config.js cypress.config.js

# Copy the 'Dockerfile' from the '../../setup/cypress/' directory to the current directory
cp ../../setup/cypress/Dockerfile Dockerfile

# Remove the 'example-cypress' Docker image if it exists
# Redirect the error output to /dev/null to suppress the error message
docker image rm example-cypress 2>/dev/null

# Build a Docker image with the tag 'example-cypress' using the current directory as the build context
docker build -t example-cypress .

# Run a new Docker container with the name 'my-cypress-container'
# The container is based on the 'example-cypress' image and runs interactively
# The '--rm' flag removes the container automatically after it stops
docker run -it --rm --name my-cypress-container example-cypress
