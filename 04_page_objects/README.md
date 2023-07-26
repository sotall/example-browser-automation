# Page Objects

In this project, we demonstrate the implementation of a simple Page Object within our testing framework. By employing the Page Object design pattern, we encapsulate the elements, actions, and verifications of a specific page or screen into a dedicated class. This approach enhances the readability and maintainability of our test code by providing a clear abstraction layer that hides the implementation details of the user interface. By utilizing a simple Page Object, we can achieve modularity, reusability, and improved test script organization, thereby facilitating efficient and effective automated testing.

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