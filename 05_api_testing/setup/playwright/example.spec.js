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

test('should call a third API endpoint', async ({ request }) => {
  const response = await request.post('/api/third-endpoint', {
    data: {
      username: 'testuser',
      password: 'testpassword'
    }
  });
  expect(response.ok()).toBeTruthy();
  expect(response.status()).toEqual(201);
});
