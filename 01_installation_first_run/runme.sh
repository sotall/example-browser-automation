#!/bin/bash

# This script excutes all the scripts in the setup folder, which installs and runs the tests for each framework
bash ./setup/cypress/runme.sh
bash ./setup/playwright/runme.sh
# bash ./setup/puppeteer/runme.sh
# bash ./setup/selenium/runme.sh
