# Installation and First Run

This section demonstrates how to install and run for the following automation tools:

- [Cypress](https://www.cypress.io/) - 12.x.x
- [Playwright](https://playwright.dev/) - 1.x.x

## Folder Structure

The project consists of the following files/folders:

```
.
├── installs                      #
│   └── ...                       # Temporary location for installation files
├── setup                         #
│   ├── cypress                   #
│   │   ├── cypress.config.js     # Cypress configuration file
│   │   ├── Dockerfile            # Used to build the Cypress Docker image
│   │   ├── todo.cy.js            # Sample Cypress test file
│   │   └── runme.sh              # Bash script to install and run Cypress
│   ├── playwright                #
│   │   ├── Dockerfile            # Used to build the Playwright Docker image
│   │   ├── example.spec.js       # Sample Playwright test file
│   │   ├── playwright.config.js  # Playwright configuration file
│   │   └── runme.sh              # Bash script to install and run Playwright
│   ├── puppeteer                 #
│   │   └── TODO                  # TODO: Puppeteer setup files
│   └── selenium                  #
│       └── TODO                  # TODO: Selenium setup files
├── readme.md                     #
└── runme.sh                      # Bash script to run all examples
```

## Usage - Cypress

#### Option 1: Run one of the provided bash scripts
  - To install and run Cypress, copy and execute the following command from the root folder of this section:
  ```
  ./setup/cypress/runme.sh
  ```
  - Alternatively, run the script from the root folder of this section to execute all frameworks.
  ```
  ./runme.sh
  ```

#### Option 2: Manually Install and Run
Follow the steps below in order to install and run Cypress. The later steps require the earlier steps to be completed.
1. Create a new installation directory, navigate into it, and ensure to delete any previous installations that may exist.
    ```
      rm -rf installs/example-cypress && mkdir -p installs/example-cypress && cd installs/example-cypress
    ```
    1. we should be in the following directory:
    ```
      ../installs/example-cypress
    ```
2. install cypress
    ```
      npm install cypress@^12.0.0 --save-dev
    ```
3. Cypress GUI
    1. start interactive cypress GUI
    ```
      npx cypress open
    ```
    2. Select `E2E` in the cypress test runner
    3. Select `Continue` button (this will generate cypress configuration files)
    4. Choose a browser to run the tests in, then click `Start E2E Testing in ...` button
    5. Select `Scaffold example specs` to generate a sample test files,
    6. Select `Okay, I got it!` to confirm the creation of the files.
    7. Select any test spec to start running in the browser.
    8. To exit, close out of the Cypres UI app, or `CTRL+C` in the terminal.
4. Cypress CLI
    1. run the tests with the CLI option
    ```
      npx cypress run --spec "*/**/todo.cy.js"
    ```
5. Cypress Docker
    1. run your tests inside a docker container
    ```
      docker run -it --rm --name my-cypress-container -v "$PWD":/e2e -w /e2e cypress/included:latest --spec "*/**/todo.cy.js"
    ```

## Usage - Playwright

#### Option 1: Run one of the provided bash scripts
  - To install and run Playwright, copy and execute the following command from the root folder of this section:
  ```
  ./setup/playwright/runme.sh
  ```
  - Alternatively run all examples from the root folder of this section.
  ```
  ./runme.sh
  ```

#### Option 2: Install Manually
1. Create a new installation directory, navigate into it, and ensure to delete any previous installations that may exist.
    ```
      rm -rf installs/example-playwright && mkdir -p installs/example-playwright && cd installs/example-playwright
    ```
2. install playwright (press enter when prompted to accept the defaults.)
    ```
      npm init playwright@^1.0.0 -y
    ```
3. Playwright GUI
    1. run the following command to start the Playwright GUI
    ```
      npx playwright test --ui
    ```
    2. Select play button next to the desired test on left menu to execute.
    3. To exit, close out of the Playwright UI app, or `CTRL+C` in the terminal.
4. Playwright CLI
    1. run tests with the CLI option
    ```
      npx playwright test --reporter=list
    ```
5. Playwright Docker
    1. run your tests inside a docker container
    ```
      docker run -it --rm --ipc=host --name my-playwright-container -v "$PWD":/e2e -w /e2e mcr.microsoft.com/playwright:latest npx playwright test --reporter=list
    ```
