#!/bin/bash

# Start the 'playwright' service defined in the 'docker-compose.yml' file and wait for it to exit
# The '--abort-on-container-exit' flag stops all containers after the 'playwright' container exits
docker-compose up playwright --abort-on-container-exit
