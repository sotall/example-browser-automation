# Use the latest version of the Cypress image from Docker Hub
FROM cypress/included:latest

# Copy the current directory (context) into the '/example-cypress' directory in the container
COPY . /example-cypress

# Set the working directory to '/example-cypress' in the container
WORKDIR /example-cypress

# Set the entrypoint command for the container
# When the container starts, it will execute the Cypress test command
ENTRYPOINT ["cypress", "run"]
