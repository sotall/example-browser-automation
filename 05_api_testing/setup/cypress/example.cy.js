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

  it('should call a third API endpoint with valid credentials', () => {
    cy.request({
      method: 'POST',
      url: '/api/login',
      body: {
        username: 'admin',
        password: 'password'
      }
    })
    .its('status')
    .should('equal', 201);
  });

  it('should return 401 Unauthorized for invalid credentials', () => {
    cy.request({
      method: 'POST',
      url: '/api/login',
      body: {
        username: 'admin',
        password: 'wrong_password'
      },
      failOnStatusCode: false // Allow the request to fail with non-2xx status code
    })
    .its('status')
    .should('equal', 401);
  });

  it('should return 400 Bad Request for missing username or password', () => {
    cy.request({
      method: 'POST',
      url: '/api/login',
      body: {
        // Omitting username and password intentionally
      },
      failOnStatusCode: false
    })
    .its('status')
    .should('equal', 400);
  });
});
