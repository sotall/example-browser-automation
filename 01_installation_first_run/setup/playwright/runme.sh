#!/bin/bash

# Remove the 'example-playwright' directory if it exists
rm -rf installs/example-playwright

# Create the 'example-playwright' directory and its parent directories
mkdir -p installs/example-playwright

# Change the current directory to 'installs/example-playwright'
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

# =========================================== #
# Run Locally
# =========================================== #

# Run Playwright tests using the Playwright CLI option in the current directory
# - `npx playwright test`: Execute the Playwright test runner
# - `--browser=all`: Specify that the tests should be run in all available browsers
# - `--reporter=list`: Use the list reporter, which displays a concise list of test results
npx playwright test --browser=all --reporter=list

# =========================================== #
# Run Dockerized
# =========================================== #

# Run the Docker container with the specified options
# - `docker run`: Run a Docker container
# - `-it`: Enable interactive mode and allocate a pseudo-TTY
# - `--rm`: Automatically remove the container when it stops running
# - `--ipc=host`: Allow the container to access the host system's IPC (Inter-Process Communication) namespace
# - `-v "$PWD":/e2e`: Mount the current working directory as a volume inside the container at the path /e2e
# - `-w /e2e`: Set the working directory inside the container to /e2e
# - `mcr.microsoft.com/playwright:latest`: Use the Playwright image from Microsoft Container Registry with the latest tag
# - `npx playwright test`: Execute the Playwright test runner
# - `--browser=all`: Specify that the tests should be run in all available browsers
# - `--reporter=list`: Use the list reporter, which displays a concise list of test results
docker run -it --rm --ipc=host -v "$PWD":/e2e -w /e2e mcr.microsoft.com/playwright:latest npx playwright test --browser=all --reporter=list

# =========================================== #
# Run Dockerized - build image with tests
# =========================================== #

# Remove the 'example-playwright' Docker image if it exists
# Redirect the error output to /dev/null to suppress the error message
docker image rm example-playwright 2>/dev/null

# Build the Docker image with the specified options
# - `docker build`: Build a Docker image
# - `-t example-playwright`: Assign the name "example-playwright" to the image
# - `.`: Build the image using the Dockerfile located in the current directory
docker build -t example-playwright .

# Run the Docker container with the specified options
# - `docker run`: Run a Docker container
# - `-it`: Enable interactive mode and allocate a pseudo-TTY
# - `--rm`: Automatically remove the container when it stops running
# - `--name my-playwright-container`: Assign the name "my-playwright-container" to the container
# - `example-playwright`: Docker image name for Playwright
docker run -it --rm --name my-playwright-container example-playwright
