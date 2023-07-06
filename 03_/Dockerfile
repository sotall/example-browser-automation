# Use official node image as the base image
FROM node:14

# Set the working directory
WORKDIR /usr/src/app

# Copy package.json and package-lock.json
COPY login-app/package*.json ./

# Install dependencies
RUN npm install express body-parser jsonwebtoken cookie-parser

# Copy the server script and static files
COPY login-app/server.js ./
COPY login-app/users.json ./
COPY login-app/html/public/index.html ./public/
COPY login-app/html/private/success.html ./private/

# Expose the port the app runs on
EXPOSE 3000

# Start the application
CMD [ "node", "server.js" ]
