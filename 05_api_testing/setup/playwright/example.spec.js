import { test, expect } from '@playwright/test';

test('should call the backend API', async ({ request }) => {
  const response = await request.get('/api');
  expect(response.ok()).toBeTruthy();
  const responseBody = await response.json();
  expect(responseBody).toEqual({ message: 'Hello from the backend API!' });
});

test('should call another API endpoint', async ({ request }) => {
  const response = await request.get('/api/another-endpoint');
  expect(response.ok()).toBeTruthy();
  expect(response.status()).toEqual(200);
});

test('should call a third API endpoint with valid credentials', async ({ request }) => {
  const response = await request.post('/api/login', {
    data: {
      username: 'admin',
      password: 'password'
    }
  });
  expect(response.ok()).toBeTruthy();
  expect(response.status()).toEqual(201);
});

test('should return 401 Unauthorized for invalid credentials', async ({ request }) => {
  const response = await request.post('/api/login', {
    data: {
      username: 'admin',
      password: 'wrong_password'
    },
    failOnStatusCode: false
  });
  expect(response.ok()).toBeFalsy();
  expect(response.status()).toEqual(401);
});

test('should return 400 Bad Request for missing username or password', async ({ request }) => {
  const response = await request.post('/api/login', {
    data: {
      // Omitting username and password intentionally
    },
    failOnStatusCode: false
  });
  expect(response.ok()).toBeFalsy();
  expect(response.status()).toEqual(400);
});
