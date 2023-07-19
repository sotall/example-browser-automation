# Use the latest version of the Node.js 14 image from Docker Hub
FROM node:14

# Install the dependencies specified in the package.json file using npm
RUN npm install express

# Expose port 3000 to allow incoming connections to the container
EXPOSE 3000

# Specify the command to be run when the container is started
CMD [ "node", "server.js" ]
