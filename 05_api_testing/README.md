# API Testing

In this section, we demonstrate API testing using JavaScript and TypeScript frameworks to verify the functionality and correctness of various API endpoints provided by a backend service.

- The first test checks the main API endpoint (/api) and expects the response body to contain the message 'Hello from the backend API!'

- The second test verifies the accessibility of another API endpoint (/api/another-endpoint) by checking its response status code, ensuring it is equal to 200.

- The third test examines a third API endpoint (/api/login) that requires valid credentials for a successful response. It sends a POST request with the username 'admin' and password 'password' and checks if the response status is 201, indicating successful login.

- The fourth test checks the behavior of the same login endpoint when provided with invalid credentials, expecting a response status of 401, indicating an 'Unauthorized' error.

- Lastly, the fifth test evaluates the endpoint's handling of missing usernames or passwords by sending an incomplete request body and expecting a response status of 400, representing a 'Bad Request' error.

In summary, these tests collectively ensure the proper functioning and security aspects of the backend API endpoints.

## Test Frameworks

- [Cypress](https://www.cypress.io/)
- [Playwright](https://playwright.dev/)

## Folder Structure

The project comprises the subsequent files/folders:

```
.
├── app                                     # Test app written in HTML used for automation testing
│   └── ...                                 #
├── setup                                   #
│   ├── cypress                             # Location for Cypress tests & page object sample
│   │   ├── example.cy.js                   #
│   │   └── pageObject.js                   #
│   ├── playwright                          # Location for Playwright tests & page object sample
│   │   ├── example.spec.js                 #
│   │   └── pageObject.ts                   #
│   ├── puppeteer                           # TODO:
│   └── selenium                            # TODO:
├── docker-compose.yml                      # Configuration file that launches Docker images
├── README.md                               # This file
└── runme.sh                                # Bash script to run all examples
```

## Usage

#### Option 1: Bash script
  - Run all frameworks by executing the script from the root folder of this section:
  ```
    ./runme.sh
  ```

#### Option 2: Manually Run
- To initiate the tests, execute one of the following commands from the root folder of this section:
    ```
      docker-compose up cypress --abort-on-container-exit
    ```
    Or
    ```
      docker-compose up playwright --abort-on-container-exit
    ```
- After the tests are completed, run the following command to stop the containers used during the tests:
    ```
      docker-compose down
    ```