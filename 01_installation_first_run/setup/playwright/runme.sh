#!/bin/bash

# Remove the 'example-playwright' directory if it exists
rm -rf installs/example-playwright

# Create the 'example-playwright' directory and its parent directories
mkdir -p installs/example-playwright

# Change the current directory to 'installs/example-playwright'
# If the directory does not exist, exit the script
cd installs/example-playwright || exit

# Initialize an npm package in the current directory with default values
# Redirect the output to /dev/null to suppress the console output
npm init -y >/dev/null

# Install Playwright package with a version greater than or equal to 1.0.0 as a dev dependency
npm install playwright@^1.0.0 --save-dev

# Install the Playwright test runner package as a dev dependency
npm install @playwright/test --save-dev

# Install the Playwright browsers for the current platform
npx playwright install

# Create the 'e2e' directory
mkdir -p e2e

# Copy the 'example.spec.js' file from the '../../setup/playwright/' directory to the 'e2e' directory
cp ../../setup/playwright/example.spec.js e2e/example.spec.js

# Copy the 'playwright.config.js' file from the '../../setup/playwright/' directory to the current directory
cp ../../setup/playwright/playwright.config.js playwright.config.js

# Copy the 'Dockerfile' from the '../../setup/playwright/' directory to the current directory
cp ../../setup/playwright/Dockerfile Dockerfile

# Remove the 'example-playwright' Docker image if it exists
# Redirect the error output to /dev/null to suppress the error message
docker image rm example-playwright 2>/dev/null

# Build a Docker image with the tag 'example-playwright' using the current directory as the build context
docker build -t example-playwright .

# Run a new Docker container with the name 'my-playwright-container'
# The container is based on the 'example-playwright' image and runs interactively
# The '--rm' flag removes the container automatically after it stops
docker run -it --rm --name my-playwright-container example-playwright
