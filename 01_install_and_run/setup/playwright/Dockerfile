# Base image from Docker Hub
FROM mcr.microsoft.com/playwright:latest

# Copy files from the host to the container
COPY . /example-playwright

# Set the working directory
WORKDIR /example-playwright

# Resolve npm version update message
RUN npm update

# Run tests
ENTRYPOINT ["npx", "playwright", "test", "--browser=all", "--reporter=list"]
