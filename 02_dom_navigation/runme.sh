#!/bin/bash

# This script excutes all the scripts in the setup folder, which runs the tests for each framework
bash ./setup/cypress/runme.sh
bash ./setup/playwright/runme.sh
# bash ./setup/puppeteer/runme.sh
# bash ./setup/selenium/runme.sh

# Stop and remove the containers, networks, and volumes defined in the 'docker-compose.yml' file
docker-compose down