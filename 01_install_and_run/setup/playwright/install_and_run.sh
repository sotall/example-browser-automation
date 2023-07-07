#!/bin/bash

# Delete previous install
rm -rf installs/playwright-demo

# Create the install folder
mkdir -p installs/playwright-demo

# Change directory to playwright-demo
cd installs/playwright-demo || exit

# Initialize npm (Node Package Manager)
npm init -y > /dev/null

# Install latest Playwright library as a development dependency
npm install playwright@^1.0.0 --save-dev

# Install Playwright Test library as a development dependency
npm install @playwright/test --save-dev

# Install Playwright browsers (downloads the necessary browser binaries)
npx playwright install

# Create the e2e folder
mkdir -p e2e

# Copy test file
cp ../../setup/playwright/example.spec.js e2e/example.spec.js

# Copy config file
cp ../../setup/playwright/playwright.config.js playwright.config.js

# Copy dockerfile
cp ../../setup/playwright/Dockerfile Dockerfile

# Remove any previous Docker images with the same name
docker image rm playwright-demo

# Finnally, build the Docker image
docker build -t playwright-demo .

# Run the Docker image
docker run -it --rm --name playwright-demo playwright-demo
