#!/bin/bash

# Delete previous runs
rm -rf playwright-install && mkdir -p playwright-install

# Change directory to playwright-install or exit if it fails
cd playwright-install || exit

# Initialize npm (Node Package Manager)
npm init -y

# Install Playwright library as a development dependency
npm install playwright@^1.0.0 --save-dev

# Install Playwright Test library as a development dependency
npm install --save-dev @playwright/test

# Install Playwright browsers (downloads the necessary browser binaries)
npx playwright install

# Create the e2e (end-to-end) folder if it doesn't exist
mkdir -p e2e

# Create the Playwright test spec file
spec_file="e2e/example.spec.js"
# Use 'cat' command with input redirection to create the file and populate it with JavaScript code
cat >$spec_file <<EOL
const { test, expect } = require('@playwright/test');

test('has title', async ({ page }) => {
  await page.goto('https://playwright.dev/');
  await expect(page).toHaveTitle(/Playwright/);
});

test('get started link', async ({ page }) => {
  await page.goto('https://playwright.dev/');
  await page.getByRole('link', { name: 'Get started' }).click();
  await expect(page).toHaveURL(/.*intro/);
});
EOL

# Create the Playwright Config file
config_file="playwright.config.js"
cat >$config_file <<EOL
const { defineConfig, devices } = require('@playwright/test');
module.exports = defineConfig({
  testDir: './e2e',
  fullyParallel: true,
  reporter: 'html'
});
EOL

# Output messages to indicate the creation of the spec file and config file
echo "Created $spec_file"
echo "Created $config_file"

# Run the Playwright test using npx (npx allows executing packages without installing them globally)
npx playwright test
