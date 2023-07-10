#!/bin/bash

# Remove any previous Docker images with the same name
docker image rm example-login-app

# Finnally, build the Docker image
docker build -t example-login-app .

docker-compose up cypress --abort-on-container-exit
docker-compose up playwright --abort-on-container-exit
docker-compose down
