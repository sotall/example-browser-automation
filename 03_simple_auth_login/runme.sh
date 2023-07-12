#!/bin/bash

# Remove the 'example-login-app' Docker image if it exists, redirecting any error output to /dev/null
docker image rm example-login-app 2>/dev/null

# Build a Docker image with the tag 'example-login-app', using the current directory as the build context
docker build -t example-login-app .

# Start the Docker containers specified in the docker-compose.yml file and run the 'cypress' service, exiting when the containers stop
docker-compose up cypress --abort-on-container-exit

# Start the Docker containers specified in the docker-compose.yml file and run the 'playwright' service, exiting when the containers stop
docker-compose up playwright --abort-on-container-exit

# Stop and remove the Docker containers specified in the docker-compose.yml file
docker-compose down
