#!/bin/bash

# Delete previous install
rm -rf installs/cypress-demo

# Create the install folder
mkdir -p installs/cypress-demo

# Change directory to cypress-demo
cd installs/cypress-demo || exit

# Initialize npm (Node Package Manager)
npm init -y > /dev/null

# Install latest Cypress library as a development dependency
npm install cypress@^12.0.0 --save-dev

# Create the e2e folder
mkdir -p cypress/e2e

# Copy test file
cp ../../setup/cypress/example.cy.js cypress/e2e/example.cy.js

# Copy config file
cp ../../setup/cypress/cypress.config.js cypress.config.js

# Copy dockerfile
cp ../../setup/cypress/Dockerfile Dockerfile

# Remove any previous Docker images with the same name
docker image rm cypress-demo

# Finnally, build the Docker image
docker build -t cypress-demo .

# Run the Docker image
docker run -it --rm --name cypress-demo cypress-demo
