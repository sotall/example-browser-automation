# Base image from Docker Hub
FROM cypress/included:latest

# Copy files from the host to the container
COPY . /example-cypress

# Set the working directory
WORKDIR /example-cypress

# Install dependencies
RUN npm update

# Run tests
ENTRYPOINT ["cypress", "run"]
