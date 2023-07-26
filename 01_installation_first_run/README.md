# Installation and First Run

This section demonstrates how to install and run for the following automation tools:

## Test Frameworks

- [Cypress](https://www.cypress.io/)
- [Playwright](https://playwright.dev/)

## Folder Structure

The project comprises the subsequent files/folders:

```
.
├── installs                      #
│   └── ...                       # Temporary location for installation files
├── setup                         #
│   ├── cypress                   #
│   │   ├── cypress.config.js     # Cypress configuration file
│   │   ├── Dockerfile            # Used to build the Cypress Docker image
│   │   ├── todo.cy.js            # Cypress sample test file
│   │   └── runme.sh              # Bash script to install and run Cypress
│   ├── playwright                #
│   │   ├── Dockerfile            # Used to build the Playwright Docker image
│   │   ├── example.spec.js       # Playwright sample test file
│   │   ├── playwright.config.js  # Playwright configuration file
│   │   └── runme.sh              # Bash script to install and run Playwright
│   ├── puppeteer                 # TODO:
│   └── selenium                  # TODO:
├── README.md                     # This file
└── runme.sh                      # Bash script to run all examples
```

## Usage - Cypress

The following steps will be performed when running the Framework using the provided bash script:

1. Frameworks will be installed and run locally first via a temporary folder '/installs.' This folder will be deleted and recreated each time the script is executed.

2. Next, we will map a volume to the container to execute the tests inside the container. This will allow us to run the tests in the container while the test files are located on the local machine. The benefit of this approach is that we can edit the test files on the local machine, and the changes will be reflected in the container. Additionally, we don't need to create or modify any files in the container, enabling us to quickly switch to the latest version of Cypress without having to rebuild the container. We are relying on the official images provided by the respective frameworks.

3. Finally, all necessary files will be copied into a Docker image, and a new Docker container will be initiated. The Docker image will be built using the provided Dockerfile, which will install the necessary dependencies and run the tests. Once the tests are completed, the Docker container will be removed, while the Docker image will remain on the local machine. The benefit of this approach is that we can rely on an image that is already built and ready to go, and we don't need to install any dependencies on the local machine.

#### Option 1: Run one of the provided bash scripts

- To install and run Cypress, copy and execute the following command from the root folder of this section:

```bash
./setup/cypress/runme.sh
```

- Alternatively, run the script from the root folder of this section to execute all frameworks.

```bash
./runme.sh
```

#### Option 2: Manually Install and Run

Follow the steps below in order to install and run Cypress. The later steps require the earlier steps to be completed.

1. Create a new installation directory, navigate into it, and ensure to delete any previous installations that may exist.
   ```bash
     rm -rf installs/example-cypress && mkdir -p installs/example-cypress && cd installs/example-cypress
   ```
   1. we should be in the following directory:
   ```bash
     ../installs/example-cypress
   ```
2. install cypress
   ```bash
     npm install cypress@^12.0.0 --save-dev
   ```
3. Cypress GUI
   1. start interactive cypress GUI
   ```bash
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
   ```bash
     npx cypress run --spec "*/**/todo.cy.js"
   ```
5. Cypress Docker
   1. run your tests inside a docker container
   ```bash
     docker run -it --rm --name my-cypress-container -v "$PWD":/e2e -w /e2e cypress/included:latest --spec "*/**/todo.cy.js"
   ```

## Usage - Playwright

#### Option 1: Run one of the provided bash scripts

- To install and run Playwright, copy and execute the following command from the root folder of this section:

```bash
./setup/playwright/runme.sh
```

- Alternatively run all examples from the root folder of this section.

```bash
./runme.sh
```

#### Option 2: Install Manually

1. Create a new installation directory, navigate into it, and ensure to delete any previous installations that may exist.
   ```bash
     rm -rf installs/example-playwright && mkdir -p installs/example-playwright && cd installs/example-playwright
   ```
2. install playwright (press enter when prompted to accept the defaults.)
   ```bash
     npm init playwright@^1.0.0 -y
   ```
3. Playwright GUI
   1. run the following command to start the Playwright GUI
   ```bash
     npx playwright test --ui
   ```
   2. Select play button next to the desired test on left menu to execute.
   3. To exit, close out of the Playwright UI app, or `CTRL+C` in the terminal.
4. Playwright CLI
   1. run tests with the CLI option
   ```bash
     npx playwright test --reporter=list
   ```
5. Playwright Docker
   1. run your tests inside a docker container
   ```bash
     docker run -it --rm --ipc=host --name my-playwright-container -v "$PWD":/e2e -w /e2e mcr.microsoft.com/playwright:latest npx playwright test --reporter=list
   ```
