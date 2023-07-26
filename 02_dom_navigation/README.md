# Document Object Model (DOM) Navigation

This section demonstrates several examples of how to navigate the Document Object Model (DOM) using the following automation tools:

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
│   ├── cypress                             # Location for Cypress tests
│   │   ├── commonParentElements.cy.js      #
│   │   ├── intermittentElement.cy.js       #
│   ├── playwright                          # Location for Playwright tests
│   │   ├── commonParentElements.spec.js    #
│   │   ├── intermittentElement.spec.js     #
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
