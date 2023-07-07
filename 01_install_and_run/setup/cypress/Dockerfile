# Base image from Docker Hub
FROM cypress/included:latest

# Copy files from the host to the container
COPY . /cypress-demo

# Set the working directory
WORKDIR /cypress-demo

# Install dependencies
RUN npm update

# Run tests
ENTRYPOINT ["cypress", "run"]
