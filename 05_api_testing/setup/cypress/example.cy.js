describe('API Tests', () => {
  it('should call the backend API', () => {
    cy.request('/api')
      .its('body')
      .should('deep.equal', { message: 'Hello from the backend API!' });
  });

  it('should call another API endpoint', () => {
    cy.request('/api/another-endpoint')
      .its('status')
      .should('equal', 200);
  });

  it('should call a third API endpoint', () => {
    cy.request({
      method: 'POST',
      url: '/api/login',
      body: {
        username: 'testuser',
        password: 'testpassword'
      }
    })
    .its('status')
    .should('equal', 201);
  });
});
