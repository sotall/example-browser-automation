#!/bin/bash

# Delete previous runs
rm -rf installs/cypress-demo

# Create the installs folder if it doesn't exist
mkdir -p installs/cypress-demo

# Change directory to cypress-demo or exit if it fails
cd installs/cypress-demo || exit

# Initialize npm (Node Package Manager)
npm init -y > /dev/null

# Install latest Cypress library as a development dependency
npm install cypress@^12.0.0 --save-dev

# Create the e2e (end-to-end) folder if it doesn't exist
mkdir -p cypress/e2e

# Create the Cypress test spec file
spec_file="cypress/e2e/example.cy.js"
# Use 'cat' command with input redirection to create the file and populate it with JavaScript code
cat >$spec_file <<EOL
describe('template spec', () => {
  it('passes', () => {
    cy.visit('https://example.cypress.io')
  })
})
EOL

# Create the Cypress Config file
config_file="cypress.config.js"
cat >$config_file <<EOL
const { defineConfig } = require("cypress");

module.exports = defineConfig({
  e2e: {
    supportFile: false,
    specPattern: 'cypress/e2e/**/*.cy.{js,jsx,ts,tsx}',
    setupNodeEvents(on, config) {
      // implement node event listeners here
    },
  },
});
EOL

# Output messages to indicate the creation of the spec file and config file
echo "Created $spec_file"
echo "Created $config_file"

# Run the Cypress test using npx (npx allows executing packages without installing them globally)
# npx cypress run --browser chrome

# Create a Dockerfile
config_file="Dockerfile"
cat >$config_file <<EOL
FROM cypress/included:12.15.0

# Copy files from the host to the container
COPY . /cypress-demo

# Set the working directory
WORKDIR /cypress-demo

# Install dependencies
RUN npm update
ENTRYPOINT ["cypress", "run"]
EOL

# Remove any previous Docker images with the same name
docker image rm cypress-demo

# Finnally, build the Docker image
docker build -t cypress-demo .

# Run the Docker image
docker run -it --rm --name cypress-demo -w /cypress-demo cypress-demo
