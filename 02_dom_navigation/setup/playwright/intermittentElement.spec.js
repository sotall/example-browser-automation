const { test, expect } = require('@playwright/test');

test.describe('launch test page', () => {
  test.beforeEach(async ({ page }) => {
    await page.goto(process.env.BASE_URL);
  });

  test('should display the correct heading text when the header is present or not', async ({ page }) => {

  });
});
