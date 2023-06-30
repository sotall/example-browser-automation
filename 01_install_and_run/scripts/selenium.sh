#!/bin/bash

# Check if Java is installed
if command -v java > /dev/null; then
    echo "Java is installed"
    java -version
else
    echo "Java is not installed"
fi

# Create the installs folder if it doesn't exist
mkdir -p installs/selenium-demo

# Change directory to selenium-demo or exit if it fails
cd installs/selenium-demo || exit

# Initialize npm (Node Package Manager)
npm init -y

# Install Selenium WebDriver and Selenium Server as development dependencies
# npm install selenium-webdriver@^4.0.0 --save-dev
npm install selenium-standalone --save-dev
npx selenium-standalone install && npx selenium-standalone start






# # Create the e2e (end-to-end) folder if it doesn't exist
# mkdir -p cypress/e2e

# # Create the Selenium test spec file
# spec_file="cypress/e2e/selenium_example.js"
# # Use 'cat' command with input redirection to create the file and populate it with JavaScript code
# cat >$spec_file <<EOL
# const { Builder, By, Key, until } = require('selenium-webdriver');

# (async function example() {
#   let driver = await new Builder().forBrowser('chrome').build();
#   try {
#     await driver.get('https://example.com');
#     await driver.findElement(By.name('q')).sendKeys('Selenium', Key.RETURN);
#     await driver.wait(until.titleContains('Selenium'), 5000);
#   } finally {
#     await driver.quit();
#   }
# })();
# EOL

# # Output a message to indicate the creation of the spec file
# echo "Created $spec_file"

# # Create the Selenium Config file
# config_file="cypress/e2e/selenium_config.js"
# cat >$config_file <<EOL
# const { Config } = require('selenium-webdriver');

# module.exports = new Config().setAlertBehavior('ignore');
# EOL

# # Output a message to indicate the creation of the config file
# echo "Created $config_file"

# # Run the Selenium test
# node $spec_file
