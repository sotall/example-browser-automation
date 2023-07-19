# Simple Auth Login

This section implements a straightforward authentication login page that utilizes JSON Web Token (JWT) authentication. The login page is designed to facilitate testing with frameworks such as Cypress and Playwright, allowing users to enter their username and password for authentication. If the provided credentials are valid, the user is redirected to a page that confirms a successful login. In the case of invalid credentials, the user is prompted to try again.


- [Cypress](https://www.cypress.io/) - 12.x.x
- [Playwright](https://playwright.dev/) - 1.x.x
## Folder Structure

The project consists of the following files/folders:

```
.
├── html-test-app                           # Test app written in HTML used for automation testing
│   └── ...                                 #
├── setup                                   #
│   ├── cypress                             # Location for Cypress tests
│   │   └── login.cy.js                     #
│   ├── playwright                          # Location for Playwright tests
│   │   └── login.spec.js                   #
│   ├── puppeteer                           # TODO:
│   └── selenium                            # TODO:
├── docker-compose.yml                      # Configuration file that launches Docker images
├── Dockerfile                              # Dockerfile for building the image
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
- First build our login-app used for testing:
  ```
    docker image rm example-login-app 2>/dev/null && docker build -t example-login-app .
  ```
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