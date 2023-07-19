#!/bin/bash

# Remove the 'example-login-app' Docker image if it exists, redirecting any error output to /dev/null
docker image rm example-api-app 2>/dev/null

# Build a Docker image with the tag 'example-login-app', using the current directory as the build context
docker build -t example-api-app .

# Start the 'cypress' service defined in the 'docker-compose.yml' file and wait for it to exit
# The '--abort-on-container-exit' flag stops all containers after the 'cypress' container exits
docker-compose up cypress --abort-on-container-exit

# # Start the 'playwright' service defined in the 'docker-compose.yml' file and wait for it to exit
# # The '--abort-on-container-exit' flag stops all containers after the 'playwright' container exits
# docker-compose up playwright --abort-on-container-exit

# # Stop and remove the Docker containers specified in the docker-compose.yml file
# docker-compose down
