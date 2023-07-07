#!/bin/bash

# docker-compose up --abort-on-container-exit --exit-code-from playwright
# docker-compose down

# Remove logs from previous runs
rm -rf ./logs && mkdir -p ./logs

# Start the containers
docker-compose up -d

# Wait for Cypress tests to complete
docker-compose logs -f cypress | tee ./logs/cypress_logs.txt | grep -m 1 "All specs passed!"
echo "Cypress tests completed successfully."

# Wait for Playwright tests to complete
docker-compose logs -f playwright | tee ./logs/playwright_logs.txt | grep -m 1 "All tests passed"
echo "Playwright tests completed successfully."

# Output the logs after test completion
echo "Cypress Container Logs:"
cat ./logs/cypress_logs.txt

echo "Playwright Container Logs:"
cat ./logs/playwright_logs.txt

# Stop the containers
docker-compose down
