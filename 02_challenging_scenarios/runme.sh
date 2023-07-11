#!/bin/bash

# Start the 'cypress' service defined in the 'docker-compose.yml' file and wait for it to exit
# The '--abort-on-container-exit' flag stops all containers after the 'cypress' container exits
docker-compose up cypress --abort-on-container-exit

# Start the 'playwright' service defined in the 'docker-compose.yml' file and wait for it to exit
# The '--abort-on-container-exit' flag stops all containers after the 'playwright' container exits
docker-compose up playwright --abort-on-container-exit

# Stop and remove the containers, networks, and volumes defined in the 'docker-compose.yml' file
docker-compose down
