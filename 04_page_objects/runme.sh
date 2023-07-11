#!/bin/bash

# Run frontend tests
docker-compose up cypress --abort-on-container-exit
docker-compose up playwright --abort-on-container-exit
docker-compose down

# docker-compose up cypress
