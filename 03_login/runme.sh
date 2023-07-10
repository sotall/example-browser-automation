#!/bin/bash

# docker run -it --rm --name web -p 8082:80 -v ./html:/usr/share/nginx/html nginx:alpine server.js



# docker build -t login-app-image .

# # docker run -p 8085:80 login-app-image
# # docker run --it -p 8085:80 --entrypoint /bin/bash login-app-image
# docker run -it --rm --name web -p 8086:80 login-app-image

# Remove any previous Docker images with the same name
docker image rm example-login

# Finnally, build the Docker image
docker build -t example-login .

docker-compose up cypress --abort-on-container-exit
docker-compose up playwright --abort-on-container-exit
docker-compose down

# docker-compose -f docker-compose.yml build
# docker-compose -f docker-compose.yml up




