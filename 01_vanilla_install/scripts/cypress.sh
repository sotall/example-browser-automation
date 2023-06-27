#!/bin/bash

# Delete previous runs
rm -rf cypress-install && mkdir -p cypress-install

# Change directory
cd cypress-install || exit

# Initialize npm
npm init -y

# Install Cypress
npm install cypress@12.0.0 --save-dev

# Create the e2e folder if it doesn't exist
mkdir -p cypress/e2e

# Create the Cypress test spec file
spec_file="cypress/e2e/example.cy.js"
cat >$spec_file <<EOL
describe('template spec', () => {
  it('passes', () => {
    cy.visit('https://example.cypress.io')
  })
})
EOL

# Create the Cypress Config file
config_file="Cypress.config.js"
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

echo "Created $spec_file"
echo "Created $config_file"

# Run the test
npx cypress run --browser chrome
