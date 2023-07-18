# Use the latest version of the Playwright image from the Microsoft Container Registry
FROM mcr.microsoft.com/playwright:latest

# Copy the current directory (context) into the '/example-playwright' directory in the container
COPY . /example-playwright

# Set the working directory to '/example-playwright' in the container
WORKDIR /example-playwright

# Set the entrypoint command for the container
# When the container starts, it will execute the Playwright test command
# The '--browser=all' flag specifies to run tests in all available browsers
# The '--reporter=list' flag specifies to output test results in a list format
ENTRYPOINT ["npx", "playwright", "test", "--browser=all", "--reporter=list"]
