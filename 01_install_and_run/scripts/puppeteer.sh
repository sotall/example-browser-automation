#!/bin/bash

# Create the installs folder if it doesn't exist
mkdir -p installs/puppeteer-demo

# Change directory to puppeteer-demo or exit if it fails
cd installs/puppeteer-demo || exit

# Initialize npm (Node Package Manager)
npm init -y

# Create the specs (tests) folder if it doesn't exist
mkdir -p specs

# Install Puppeteer
npm install jest puppeteer jest-puppeteer --save-dev

# Create the Cypress test spec file
spec_file="specs/example.spec.js"
# Use 'cat' command with input redirection to create the file and populate it with JavaScript code
cat >$spec_file <<EOL
const puppeteer = require('puppeteer');

let browser;
let page;

beforeAll(async () => {
  browser = await puppeteer.launch({ headless: new });
  page = await browser.newPage();
});

afterAll(async () => {
  await browser.close();
});

test('Page title is correct', async () => {
  await page.goto('https://example.com');
  const title = await page.title();
  expect(title).toBe('Example Domain');
});
EOL

# # Create the Puppeteer Config file
# config_file="puppeteer.config.js"
# cat >$config_file <<EOL
# const {join} = require('path');
# /**
#  * @type {import("puppeteer").Configuration}
#  */
# module.exports = {
#   // Changes the cache location for Puppeteer.
#   // cacheDirectory: join(__dirname, '.cache', 'puppeteer'),
# };
# EOL

# Create the Jest Config file
config_file="jest.config.js"
cat >$config_file <<EOL
module.exports = {
    preset: "jest-puppeteer",
    globals: {
        URL: "https://sabe.io"
    },
    testMatch: [
        "**/test/**/*.test.js"
    ],
    verbose: true
}
EOL

# Create the Jest Puppeteer Config file
config_file="jest-puppeteer.config.js"
cat >$config_file <<EOL
module.exports = {
    launch: {
        headless: true,
        slowMo: false,
        devtools: true
    }
}
EOL


npx jest
