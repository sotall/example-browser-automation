describe('launch test page', () => {
  beforeEach(() => {
    cy.visit('/');
  })

  it("should display the correct heading text when the header is present or not", () => {
    /*
      This test focuses on two specific situations to demonstrate potential flaky tests:

      1. When the header is present: It verifies that the displayed text in the header matches the expected
          value. Note that the test may occasionally fail due to randomly changing header text, which is intentionally
          implemented in the addEventListener() function in the index.html file.

      2. When checking whether an element exists: It ensures that the page does not contain an h1 element, indicating
          the absence of a header. While this part of the test is not expected to fail, it relies on a flaky testing
          approach and should generally be avoided in favor of more reliable assertions.

      Note: Testing logic that relies on an element sometimes existing at runtime can lead to flaky tests.
      Flaky tests produce inconsistent results and make it difficult to identify genuine issues. It is essential to
      write tests with clear and deterministic conditions, relying on stable and predictable elements or properties
      for assertions.
    */

    // Check if the header element is present in the body
    cy.get("body").then(($body) => {
      if ($body.find("#header-title").length > 0) {
        // If the header is present, verify that the heading text is correct
        cy.get("#header-title").should("be.visible").and("have.text", "Fresh Produce Emporium");
      } else {
        // If the header is not present, assert that the h1 element doesn't exist
        cy.get("h1").should("not.exist");
      }
    });
  });

})
