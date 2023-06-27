# Install and Run Cypress

## Description

-   This project demonstrates how to install and run Cypress the first time.

## Prerequisites

-   Node.js 14 or higher installed [link](https://nodejs.org/en/download/)

## Project Structure

-   The project consists of the following files:

## Usage

1. Option 1: Run Manually
    - `npm install cypress --save-dev`
    - `npx cypress open`
        1. Cypress GUI should open with **Welcome to Cypress** message.
        2. Select "_E2E Testing_"
        3. **Configuration files** message should appear creating the following files:
            - cypress.config.json
            - cypress/support.e2e.js
            - cypress/support/commands.js
            - cypress/fixtures/example.json
        4. Select "_Continue_" button
        5. Choose a browser and select "_Start E2e Testing in \<Browser_Name\>_" button.
        6. Your browser should open with a New Cypress UI.
        7. **Create your first spec** message should displayed in center, with option "_Scaffold example specs_" or "_Create new spec_" buttons.
        8. Select "_Scaffold example specs_" button
        9. You should see a list of new example specs
        10. Select "_Okay, I got it!_" button
        11. "_Specs_" from the left menu should be in focus, with a list of example specs displayed in the center.
        12. Select any spec to run it and see the results
        13. To stop you can `ctrl + c` from terminal or "_Close_" button from the first Cypress GUI window.
2. Option 2: Run the bash script
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

## Acknowledgements

-

<br>
<br>
<br>
Thank you for using and contributing to this project. Happy coding!
