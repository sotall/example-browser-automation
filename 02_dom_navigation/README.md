# Document Object Model (DOM) Navigation

This section demonstrates several examples of how to navigate the Document Object Model (DOM) using the following automation tools:

- [Cypress](https://www.cypress.io/) - 12.x.x
- [Playwright](https://playwright.dev/) - 1.x.x
## Folder Structure

The project consists of the following files/folders:

```
.
├── html                                    #
│   └── index.html                          # HTML file used for testing
├── setup                                   #
│   ├── cypress                             # Location for Cypress tests
│   │   ├── commonParentElements.cy.js      #
│   │   ├── intermittentElement.cy.js       #
│   │   └── runme.sh                        # Bash script to install and run Cypress
│   ├── playwright                          # Location for Playwright tests
│   │   ├── commonParentElements.spec.js    #
│   │   ├── intermittentElement.spec.js     #
│   │   └── runme.sh                        # Bash script to install and run Cypress
│   ├── puppeteer                           #
│   │   └── TODO                            #
│   └── selenium                            #
│       └── TODO                            #
├── docker-compose.yml                      # Configuration file that launches Docker images
├── readme.md                               #
└── runme.sh                                # Bash script to run all examples
```

## Usage - Cypress

#### Option 1: Run one of the provided bash scripts
  - To run Cypress tests, copy and execute the following command from the root folder of this section:
  ```
    ./setup/cypress/runme.sh
  ```
  - Alternatively, run the script from the root folder of this section to execute all frameworks.
  ```
    ./runme.sh
  ```


#### Option 2: Manually Run

1. Run the Cypress tests using docker-compose
    1. This command will start the Cypress tests and any dependencies in the background.
    ```
      docker-compose up cypress --abort-on-container-exit
    ```
    2. This command will stop and remove the containers used for running the Cypress tests.
    ```
      docker-compose down
    ```

## Usage - Playwright

#### Option 1: Run one of the provided bash scripts
  - To run Playwright tests, copy and execute the following command from the root folder of this section:
  ```
    ./setup/playwright/runme.sh
  ```
  - Alternatively, run the script from the root folder of this section to execute all frameworks.
  ```
    ./runme.sh
  ```


#### Option 2: Manually Run

1. Run the Playwright tests using docker-compose
    1. This command will start the Playwright tests and any dependencies in the background.
    ```
      docker-compose up playwright --abort-on-container-exit
    ```
    2. This command will stop and remove the containers used for running the Playwright tests.
    ```
      docker-compose down
    ```
