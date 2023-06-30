describe('Test Page for Cypress prevUntil', () => {
    beforeEach(() => {
        cy.visit('http://web:80');
    })

    it('should select items and display them at the top', () => {
        cy.get('#purchased-items').should('be.empty');

        cy.contains('Orange')
            .parentsUntil('tbody')
            .find('.buy-button')
            .click()

        cy.get('#purchased-items')
            .should('contain', 'Orange')
            .and('be.visible');
    });
})
