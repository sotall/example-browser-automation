describe('Login Form', () => {
    it('Logs in successfully', () => {
      // Visit the login page
      cy.visit('http://localhost/');

      // Type the username and password
      cy.get('#username').type('foo');
      cy.get('#password').type('bar');

      // Submit the login form
      cy.get('#loginForm').submit();

      // Assert that the login was successful
      cy.url().should('include', '/success.html');
      cy.contains('Login successful!');
    });
  });
