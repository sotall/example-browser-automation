#!/bin/bash

# Start the 'cypress' service defined in the 'docker-compose.yml' file and wait for it to exit
# The '--abort-on-container-exit' flag stops all containers after the 'cypress' container exits
docker-compose up cypress --abort-on-container-exit
