# Browser Automation

This repository contains an array of examples for browser automation testing frameworks. The content is structured into distinct sections, each focusing on a potential issue that might be encountered during testing. Moreover, it provides clear and uncomplicated solutions to these challenges. To ensure straightforward comparison, each testing framework is designed to test the same scenario, all of which can be found in the corresponding sections.

The dual purpose of this repository is to offer valuable resources and enable learning. It provides guidance through the different aspects of each tool, with a focus on clear, straightforward explanations and demonstrations. It's important to note that while the included examples cover various scenarios, they don't capture every possible circumstance. They are designed to act as a catalyst for the development of unique project-specific solutions.

## Prerequisites

- Node.js: 14.x - [link](https://nodejs.org/en/download/)
- Docker Desktop: 4.x or Docker Engine 23.x - [link](https://www.docker.com/products/docker-desktop/)
## Folder Structure

The project has the following folder structure:

```
.
├── 01_installation_first_run   # Install and run automation testing frameworks.
├── 02_dom_navigation           # Handle challenging test scenarios.
├── 03_simple_auth_login        # Handle simple login scenario.
├── 04_page_objects             # Use page object model.
└── 05_api_testing              # TODO: API testing.
```

Each folder contains a README file with detailed instructions on how to run the example.

## Pros and Cons

### Cypress:

    Pros:
        - Runs tests in the same event loop as the application under test, making tests more reliable and less flaky.
        - Has extensive documentation and community support, making it easier to use for beginners.
        - Supports JavaScript.

    Cons:
        - Limited to a single browser per test run.
        - More suitable for unit testing and single-page applications.

### Playwright:

    Pros:
        - Can test across multiple browsers and devices simultaneously.
        - Works with any test runner and supports TypeScript, Java, Python, .NET, and C#.
        - Designed for end-to-end testing and can handle multiple pages and domains.
        - Developed by Microsoft and offers more features like network capture and video recording.

    Cons:
        - More technical tool that works closer to the browser and has precise commands.
        - Uses a different process for each browser, which can make tests slower.

## Usage

To run an example, navigate to the respective example folder and follow the instructions provided in the readme.md file. Additionally, you can use the runme script in each directory to quickly test the project. Simply execute `./runme.sh` within the desired example folder, and it will run the example based on the predefined configuration.

Feel free to explore each framework folder, read the individual readme.md files, and experiment with the automation testing frameworks provided.

## Contributing

If you find any issues with the project or would like to contribute to its development, please feel free to open an issue or submit a pull request.

<br>
<br>
<br>
Thank you for using and contributing to this project. Happy coding!
