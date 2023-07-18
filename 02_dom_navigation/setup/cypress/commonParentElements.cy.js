describe('launch test page', () => {
  beforeEach(() => {
    cy.visit('/');
  })

  it("should add selected items to the list of purchased items", () => {
    /*
       Using the cy.contains("Orange") command, which searches for an element containing the text "Orange".
       Once the element is located, it traverses up the DOM hierarchy using the parentsUntil("tbody") command,
       finding the parent row of the matching text. From there, it narrows down the search by finding the
       button element with the class .buy-button within that row, using the find(".buy-button") command.
   */

    // Ensure the list of purchased items is initially empty
    cy.get("#purchased-items").should("be.empty");

    // Click on the "Buy" button for the Orange item
    cy.contains("Orange")
      .parentsUntil("tbody")
      .find(".buy-button")
      .click();

    // Verify that the Orange item is displayed in the list of purchased items
    cy.get("#purchased-items")
      .should("contain", "Orange")
      .and("be.visible");
  });

})
