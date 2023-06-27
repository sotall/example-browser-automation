#!/bin/bash

docker run -it --rm --name web -p 8082:80 -v ./html:/usr/share/nginx/html nginx:alpine
