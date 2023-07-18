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

## Usage

1. Option: Install Manually
    1. create the install folder and navigate to it
        ```
        rm -rf installs/example-cypress && mkdir -p installs/example-cypress && cd installs/example-cypress
        ```
    2. install cypress
        ```
        npm install cypress@^12.0.0 --save-dev
        ```
    3. run cypress (opens the cypress test runner)
        ```
        npm cypress open
        ```
    4. Select `E2E` in the cypress test runner
    5. Select `Continue` button (this will generate cypress configuration files)
    6. Choose a browser to run the tests in, then click `Start E2E Testing` button
    7. Select `Scaffold example specs` to generate a sample test files, confirm the creation of the files.
    8. Select any test spec to start it running in the browser.
    9. Now close out of the Cypres UI, or `CTRL+C` in the terminal.
    9. Create a docker image.
        remove any existing image with same name and build the new image
        ```
        docker image rm example-cypress 2>/dev/null && docker build -f ../../setup/cypress/Dockerfile -t example-cypress .
        ```
    10. Run the docker image
        ```
        docker run -it --rm --name my-cypress-container example-cypress
        ```
    9. OR, `CTRL+C` in the terminal and run the tests with the CLI option
        ```
        npx cypress run
        ```
    10.

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



## Results

## Notes

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
