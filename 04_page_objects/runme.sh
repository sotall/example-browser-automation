#!/bin/bash

# Start the Docker containers specified in the docker-compose.yml file and run the 'cypress' service, exiting when the containers stop
docker-compose up cypress --abort-on-container-exit

# Start the Docker containers specified in the docker-compose.yml file and run the 'playwright' service, exiting when the containers stop
docker-compose up playwright --abort-on-container-exit

# Stop and remove the Docker containers specified in the docker-compose.yml file
docker-compose down
