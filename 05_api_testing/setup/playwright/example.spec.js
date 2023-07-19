// const { chromium } = require('playwright');

// describe('API Tests', () => {
//   let browser;
//   let page;

//   beforeAll(async () => {
//     browser = await chromium.launch();
//     page = await browser.newPage();
//   });

//   afterAll(async () => {
//     await browser.close();
//   });

//   beforeEach(async () => {
//     await page.goto('http://localhost');
//   });

//   it('should call the backend API', async () => {
//     const response = await page.evaluate(() => {
//       return fetch('/api').then(response => response.json());
//     });

//     expect(response).toEqual({ message: 'Hello from the backend API!' });
//   });

//   it('should call another API endpoint', async () => {
//     const response = await page.evaluate(() => {
//       return fetch('/api/another-endpoint').then(response => response.status);
//     });

//     expect(response).toBe(200);
//   });

//   it('should call a third API endpoint', async () => {
//     const response = await page.evaluate(() => {
//       return fetch('/api/third-endpoint', {
//         method: 'POST',
//         headers: { 'Content-Type': 'application/json' },
//         body: JSON.stringify({
//           username: 'testuser',
//           password: 'testpassword'
//         })
//       }).then(response => response.status);
//     });

//     expect(response).toBe(201);
//   });
// });
