describe('Login Form', () => {

    BeforeEach(() => {
        cy.visit('/');
    });

    it('Logs in successfully', () => {
        cy.get('#username').type('foo');
        cy.get('#password').type('bar');
        cy.get('#button').click();
        cy.url().should('include', '/success');
        cy.contains('Login Successful!');
    });
});
