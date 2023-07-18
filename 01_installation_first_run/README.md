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
│   │   ├── example.cy.js         # Simple Cypress test file
│   │   └── runme.sh              # Bash script to install and run Cypress
│   ├── playwright                #
│   │   ├── Dockerfile            # Used to build the Playwright Docker image
│   │   ├── example.spec.js       # Simple Playwright test file
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

Option 1: Install Manually - Follow the steps below in order to install and run Cypress. The later steps require the earlier steps to be completed.
  1. create the install folder and navigate to it, also remove any existing install
      ```
        rm -rf installs/example-cypress && mkdir -p installs/example-cypress && cd installs/example-cypress
      ```
  2. install cypress
      ```
        npm install cypress@^12.0.0 --save-dev
      ```
  3. Cypress GUI (this creates our example tests and configuration files, also required for steps 4 and 5)
      1. start interactive cypress GUI
      ```
        npx cypress open
      ```
      1. Select `E2E` in the cypress test runner
      2. Select `Continue` button (this will generate cypress configuration files)
      3. Choose a browser to run the tests in, then click `Start E2E Testing in ...` button
      4. Select `Scaffold example specs` to generate a sample test files,
      5. Select `Okay, I got it!` to confirm the creation of the files.
      5. Select any test spec to start running in the browser.
      6. To exit, close out of the Cypres UI app, or `CTRL+C` in the terminal.
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
  <!-- 10. Run the docker image
      ```
      docker run -it --rm --name my-cypress-container example-cypress
      ```
  9. OR, `CTRL+C` in the terminal and run the tests with the CLI option
      ```
      npx cypress run
      ```
  10. -->

2. Option: Run one of the provided bash scripts
    - To run the example for a specific framework, navigate to the framework folder and execute the corresponding script.
    ```
    ./setup/cypress/runme.sh
    ./setup/playwright/runme.sh
    ```
    - Alternatively, run the script from the root folder of this section to execute all examples.
    ```
    ./runme.sh
    ```

## Usage - Playwright




## File Breakdown

---

### Dockerfile

The

```

```

1.

---

### runme.sh

The `runme.sh`

```

```

1.

---
