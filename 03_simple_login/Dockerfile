# Use the latest version of the Node.js 14 image from Docker Hub
FROM node:14

# Set the working directory within the container to /usr/src/app
WORKDIR /usr/src/app

# Copy the package.json and package-lock.json files from the local machine to the working directory in the container
COPY login-app/package*.json ./

# Install the dependencies specified in the package.json file using npm
RUN npm install express body-parser jsonwebtoken cookie-parser

# Copy the files from the local machine to the working directory in the container
COPY login-app/server.js ./
COPY login-app/users.json ./
COPY login-app/html/public/index.html ./public/
COPY login-app/html/private/success.html ./private/

# Expose port 3000 to allow incoming connections to the container
EXPOSE 3000

# Specify the command to be run when the container is started
CMD [ "node", "server.js" ]
