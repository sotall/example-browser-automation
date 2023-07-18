#!/bin/bash

# Remove the 'example-cypress' directory if it exists
rm -rf installs/example-cypress

# Create the 'example-cypress' directory and its parent directories
mkdir -p installs/example-cypress

# Change the current directory to 'installs/example-cypress'
cd installs/example-cypress

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

# =========================================== #
# Run Locally
# =========================================== #
# Run Cypress tests using the Cypress CLI option in the current directory
# npx: Executes the 'cypress' command using 'npx', which allows running locally-installed Node.js packages without the need for global installation
# run: The command to run Cypress tests from the CLI
npx cypress run

# =========================================== #
# Run Dockerized
# =========================================== #
# Now run the Cypress tests within a Docker container
# -it: Allocates a pseudo-TTY and keeps STDIN open, allowing interactive execution
# --rm: Automatically removes the container when it exits
# --name my-cypress-container: Assigns the name "my-cypress-container" to the container for easy reference
# -v $PWD:/e2e: Mounts the current working directory ($PWD) as a volume inside the container at the path /e2e
# -w /e2e: Sets the working directory inside the container to /e2e
# cypress/included:latest: Specifies the Docker image to use, in this case, the Cypress included image with the latest tag
docker run -it --rm --name my-cypress-container -v "$PWD":/e2e -w /e2e cypress/included:latest

# =========================================== #
# Run Dockerized - build image with tests
# =========================================== #
# Remove the 'example-cypress' Docker image if it exists
# Redirect the error output to /dev/null to suppress the error message
docker image rm example-cypress 2>/dev/null

# Build the Docker image with the specified options
# - `docker build`: Build a Docker image
# - `-t example-cypress`: Assign the name "example-cypress" to the image
# - `.`: Build the image using the Dockerfile located in the current directory
docker build -t example-cypress .

# Run the Docker container with the specified options
# - `docker run`: Run a Docker container
# - `-it`: Enable interactive mode and allocate a pseudo-TTY
# - `--rm`: Automatically remove the container when it stops running
# - `--name my-cypress-container`: Assign the name "my-cypress-container" to the container
# - `example-cypress`: Docker image name for Cypress
docker run -it --rm --name my-cypress-container example-cypress
