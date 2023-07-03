#!/bin/bash


docker-compose up --abort-on-container-exit --exit-code-from cypress
docker-compose down


# -------------------------------------------------------- #
# -------------------------------------------------------- #
# -------------------------------------------------------- #
# -------------------------------------------------------- #

# # Remove logs from previous runs
# rm -rf ./logs && mkdir -p ./logs

# # Start the containers
# docker-compose up -d

# # Wait for Cypress tests to complete
# docker-compose logs -f cypress | tee ./logs/cypress_logs.txt | grep -m 1 "All specs passed!"
# echo "Cypress tests completed successfully."

# # Wait for Playwright tests to complete
# docker-compose logs -f playwright | tee ./logs/playwright_logs.txt | grep -m 1 "All tests passed"
# echo "Playwright tests completed successfully."

# # Output the logs after test completion
# echo "Cypress Container Logs:"
# cat ./logs/cypress_logs.txt

# echo "Playwright Container Logs:"
# cat ./logs/playwright_logs.txt

# # Stop the containers
# docker-compose down

# -------------------------------------------------------- #
# -------------------------------------------------------- #
# -------------------------------------------------------- #
# -------------------------------------------------------- #






# docker build -t my-webapp . && docker run -it --rm --name web -p 8081:80 my-webapp
# docker run -it --rm --name cypress -v ./cypress-demo:/e2e -w /e2e --entrypoint /bin/bash cypress/included:12.15.0
# docker run -it --rm --name playwright -v ./playwright-demo:/playwright/e2e -w /e2e --entrypoint /bin/bash mcr.microsoft.com/playwright:latest

# docker run -it --rm --name cypress -v ./cypress-demo:/cypress-demo/cypress/e2e cypress-demo
# docker run -it --rm --name cypress -v ./cypress-demo:/cypress-demo/cypress/e2e --entrypoint /bin/bash cypress-demo --spec "cypress/e2e/parentsUntil.cy.js"
# docker run -it --rm --name cypress --entrypoint /bin/bash cypress-demo

# docker run -it --rm --name playwright-demo --entrypoint /bin/bash playwright-demo
# docker run -it --rm --name playwright-demo playwright-demo

# npx playwright test --browser=all --reporter=list

# docker-compose exec web playwright /bin/bash

# ======================================================== #
# ======================================================== #
# ======================================================== #
# docker run -it --entrypoint /bin/bash gprestes/the-internet:v2.6.5
# docker run -it --rm --name web -p 7080:5000 gprestes/the-internet:v2.6.5

# ======================================================== #
# ======================================================== #
# ======================================================== #
# Build the image
# bash "../runme.sh"

# docker run -it --rm --name cypress-demo -p 7080:5000 -v "$PWD":/e2e -w /e2e/cypress-demo gprestes/the-internet npx cypress run
# docker run -it --rm --name cypress-demo -p 7080:5000 -v "$PWD":/e2e -w /e2e/cypress-demo --entrypoint /bin/bash cypress-demo
# docker run -it  automation:cypress-12.9.0-chromium

# docker run -it --rm --name otl-automation-test-run -v \"$(cd ..; pwd)\":/e2e -w /e2e/test automation:cypress-12.13.0-chromium --env host=docker -b chromium",

# docker build -t cypress-demo .
# # docker run -it --rm -p 7080:5000 cypress-demo /bin/bash
# docker run -it --rm -p 7080:5000 cypress-demo
